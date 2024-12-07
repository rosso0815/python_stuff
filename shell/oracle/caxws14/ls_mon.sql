col sid form 999 heading "SID"
col serial# form 99999 heading "Serial"
col program form a28 heading "Program"
col username form a12 heading "Username"
col resource_consumer_group form a22 heading "Consumer Group"
col name form a12 heading "Name"
col active_sessions form 99999 head "Active"
col consumed_cpu_time form 99999999 heading "Con CPU"
col sessions_queued form 99999 heading "Queued" 

spool monrsrc.lst

select sid,serial#,username,program,resource_consumer_group 
from v$session
/

select name,active_sessions,consumed_cpu_time
       ,requests,cpu_wait_time,cpu_waits, sessions_queued
from v$rsrc_consumer_group
/


spool off


