rem =========================================================================
rem 
rem                     hotbackup.sql
rem 
rem     Copyright (C) Oriole Software, 1998
rem 
rem     Downloaded from http://www.oriolecorp.com
rem 
rem     This script for Oracle database administration is free software; you
rem     can redistribute it and/or modify it under the terms of the GNU General
rem     Public License as published by the Free Software Foundation; either
rem     version 2 of the License, or any later version.
rem 
rem     This script is distributed in the hope that it will be useful,
rem     but WITHOUT ANY WARRANTY; without even the implied warranty of
rem     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem     GNU General Public License for more details.
rem 
rem     You should have received a copy of the GNU General Public License
rem     along with this program; if not, write to the Free Software
rem     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
rem 
rem     Successfully tested on Oracle 7.3.4 and Oracle 8.0.5
rem 
rem     Modification history :
rem        06/29/1999      scan off added - Comments are scanned !
rem                        missing / added after PL/SQL block
rem                        substitute $ORACLE_HOME to ? in path
rem
rem =========================================================================
rem
rem   This script (which most obviously must be run by a DBA) automates
rem   hot-backups. 
rem   It assumes :
rem       - An underlying UNIX system
rem       - The use of the 'cp' command to backup the files to a special
rem         backup directory the name of which is prompted for in the
rem         script
rem   The script can easily be modified to take other assumptions into
rem   account.
rem
rem   Because of the high importance of backup procedures, due care is 
rem   given to the handling of errors. Any SQL or operating system error
rem   will cause the script to exit and return a non-0 value to the operating
rem   system. 
rem
rem   IT IS EXTREMELY IMPORTANT IN SUCH A CASE TO RUN THE ASSOCIATED
rem   cancel_hotbackup.sql (ALSO AVAILABLE ON www.oriolecorp.com) AS SOON AS
rem   POSSIBLE TO CANCEL THE POSSIBLE 'BACKUP' STATE OF A TABLESPACE.
rem
set linesize 600
set pause off
set pagesize 0
set echo off
set feedback off
--
--  Hot-backup requires our running in ARCHIVELOG mode.
--  This is tested from the outset. 
--
whenever sqlerror exit sql.sqlcode
declare
   dummy char(1);
begin
   select 'x'
   into dummy
   from v$database
   where log_mode = 'ARCHIVELOG';
exception
   when no_data_found then
      raise_application_error(-20000, 'Database not in ARCHIVELOG mode !');
end;
/
set scan off
--
--   Interactively input the name of the directory (or device)
--   where to backup. This kind of dialogue is likely to prove
--   a hindrance in automated, daily operations.
--   You can either hard-code the directory name by using
--      define backup_dir = ...
--   or suppose it is passed as an argument to the current
--   script, in which case you should replace &&backup_dir by
--   &1 everywhere in this script and comment the following
--   'accept' command
--
accept backup_dir prompt 'Backup directory : '
--
set recsep off
set scan on
set verify off
--
--   You must absolutely check that everything goes according
--   to plans! If the backup fails because of, say, a
--   'file system full' error, the script must exit with a
--   non-0 return code.
--
whenever sqlerror exit sql.sqlcode
whenever oserror exit 99
--
--    To be certain we have a consistent set of files which
--    we shall be able to recover, we also want to backup
--    all the redo log files generated during the backup,
--    and the final state of the control file.
--    Note that when recovering you normally must use the
--    current (i.e. at crash time) control file. However,
--    we want to be ready for the worst case scenario and
--    be able to use the current backup as if it were a
--    cold backup.
--    In order to know which redo log files have been generated
--    during the backup, we first identify which is, before
--    backup, the (current - 1) redo log file.
--
variable last_log varchar2(255)
begin
  --
  --   Format %S and %T (left-padded with zeros)
  --   are not supported because length is OS-dependent.
  --   Easy to support for a specific machine
  --
  select replace(pd.value, '?', '$ORACLE_HOME') ||
      replace(replace(pf.value, '%s', rtrim(to_char(l.sequence#))),
                  '%t', rtrim(to_char(l.thread#)))
  into :last_log
  from v$parameter pd,
       v$parameter pf,
       v$log l
  where pd.name = 'log_archive_dest'
    and pf.name = 'log_archive_format'
    and l.sequence# = (select max(sequence#)
                       from v$log
                       where status != 'CURRENT');
end;
/
--
--    Generate the backup script
--
--    online$ = 3 means a tablespace which once
--    existed but was dropped.
--
column dummy noprint
spool do_hbu.sql
select ts# dummy,
       1 dummy,
       'alter tablespace ' || name || ' begin backup;'
from sys.ts$
where online$ != 3
union
select f.ts#,
       2,
       'host cp ' || d.name || ' &&backup_dir'
from sys.file$ f,
     v$datafile d
where f.file# = d.file#
union
select ts#,
       3,
       'alter tablespace ' || name || ' end backup;'
from sys.ts$
where online$ != 3
order by 1, 2
/
spool off
--
--   Run the backup script just generated
--
set echo on
set feedback on
@do_hbu
--
--   Take a backup of the control file for the worst-case scenario
--   Do not worry, parameter replacement is not echoed but done.
--
alter database backup controlfile to '&&backup_dir./control.ctl' reuse;
--
--   Trigger a redo log switch to close the current redo log file
--
alter system switch logfile;
set echo off
--
--   Force the archival of all the redo log files
--
declare
  Stmt                  varchar2(100);
  cid                   number;
  dummy                 number;
  nothing_to_archive    exception;
  PRAGMA EXCEPTION_INIT(nothing_to_archive, -271);
begin
  Stmt := 'alter system archive log all';
  cid := dbms_sql.open_cursor;
  begin
    dbms_sql.parse(cid, Stmt, dbms_sql.native);
    dummy := dbms_sql.execute(cid);
  exception
    when nothing_to_archive then
          null;
    --
    --   Unexpected errors
    --
    when others then
        if (dbms_sql.is_open(cid))
        then
          dbms_sql.close_cursor(cid);
        end if;
        raise_application_error(-20000, Stmt || chr(10) || SQLERRM);
  end;
  dbms_sql.close_cursor(cid);
end;
/   
set feedback off
--
--   Backup all the redo log files generated during  hot backup
--
spool backup_log.sql
select 'host find '
       || replace(substr(p.value, 1, instr(p.value, '/', -1) - 1),
                  '?', '$ORACLE_HOME')
       || ' -type f -newer ' || :last_log || ' -exec cp {} &&backup_dir \;'
from v$parameter p
where p.name = 'log_archive_dest'
/
spool off
set echo on
@backup_log
--
-- That's all folks.
--
exit 0



