
rem Script Description: This script automates hot backups (only available when 
rem                     the archivelog mode is on). It creates a script called hotback.sql, 
rem                     that will automatically back up tablespaces and control files. 
rem
rem
rem Output file:        hotbackups.sql
rem
rem Prepared By:        Oracle Resource Stop
rem
rem Usage Information:  SQLPLUS SYS/pswd
rem                     @autohotbackups.sql  {target directory}
rem

set serveroutput on
set heading off
set feedback off

spool hotbackups.sql

declare
fname  varchar2(80);
tname  varchar2(80);
tname1  varchar2(80);

cursor cur1 is
      select tablespace_name,file_name
       from v$datafile,sys.dba_data_files
       where enabled like '%WRITE%'
         and file# = file_id
       order by 1;

begin
  dbms_output.enable(32000);
  dbms_output.put_line('spool hotbackups');

  if cur1%ISOPEN
  then
     close cur1;
  end if;

  open cur1;

  fetch cur1 into tname,fname;

  tname1 := tname;
  dbms_output.put_line('alter tablespace '||tname||' begin backup;');

  while cur1%FOUND loop

        if tname1 != tname then
           dbms_output.put_line('alter tablespace '||tname1||' end backup;');
           dbms_output.put_line('alter tablespace '||tname||' begin backup;');
           tname1 := tname;
        end if;        

        dbms_output.put_line('!cp '||fname||' &&target_directory');

        fetch cur1 into tname,fname;

  end loop;
  dbms_output.put_line('alter tablespace '||tname1||' end backup;');

  close cur1;

  dbms_output.put_line('alter database backup controlfile to trace;');

  dbms_output.put_line('alter database backup controlfile to '||''''||
                       ' &&target_directory'||'/control.'||
                       to_char(sysdate,'DDMMYYYYHH24MISS')||''''||';');
  dbms_output.put_line('spool off');
end;
/
spool off
set heading on
set feedback on
set serveroutput off

-- Unremark/Uncomment the following line to run the script
-- or can be run from the sqlplus prompt.
-- @hotbackups

