set trimspool on
set feed off
set head off
set echo off
set verify off
set termout off
set pages 200
set pagesize 0
set linesize 1000
spool tmp.txt

PROMPT
PROMPT rem LETS GO
PROMPT

select 'alter table dev3db.' || TABLE_NAME || ' storage(maxextents 10000);' 
	from all_tables where TABLESPACE_NAME like 'DEV3DBSPACE'
/

spool off
exit

