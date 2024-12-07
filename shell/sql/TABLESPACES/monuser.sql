set verify off

spool monuser.lst

column name form a60
column sid form 999
column serial# form 999999 Heading "Serial"
column logon_time format a15
column program format a22
column username format a12
column idle_mins format 99999 Heading "Idle"
column object format a30

PROMPT
PROMPT Displaying All non background sessions
PROMPT

select sid,serial#,username,program,status
,to_char(logon_time,'DD-MON-RR hh24:mi') logon_time
,trunc(last_call_et/60) idle_mins
from v$session
where username is not null;

ACCEPT user PROMPT 'Enter Value for username > '

PROMPT 
PROMPT User is running the following queries
select oc.sid, t.sql_text 
from v$open_cursor oc, v$sqltext t
where t.hash_value = oc.hash_value and t.address=oc.address
and oc.user_name=UPPER('&user') 
order by oc.sid, t.address, t.hash_value, t.piece
/

ACCEPT sid PROMPT 'Enter sid to refine (return for all) :'
ACCEPT stat PROMPT 'Filter on statistics (return for all) :'
select s.sid, sn.name, s.value
from v$sesstat s, v$statname sn, v$session sess
where s.sid=sess.sid
and s.statistic# = sn.statistic#
and sess.username= UPPER('&user')
and s.sid LIKE '&sid%'
and sn.name like '&stat%'
and s.value != 0
order by s.sid, sn.name
/                      

spool off
