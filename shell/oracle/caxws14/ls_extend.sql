col owner form a8
col segment_type for a7
col segment_name form a25
col tablespace_name form a15
col req form 9999999990 heading "Req (Mb)"
col next_extent form 99990 heading "Req (Mb)"
col maxfree form 99990 heading "Free (Mb)"

set pause off
set pages 1000
set lines 80

compute sum of req on tablespace_name
break on tablespace_name skip 1

spool nextext.lst

select s.owner
,s.segment_type
,s.segment_name
,s.tablespace_name
,s.next_extent/1024/1024 req
,maxtspace.max/1024/1024 maxfree
from dba_segments s, (select tablespace_name,max(fsu.bytes) max
			from dba_free_space fsu
			group by tablespace_name) maxtspace
where s.tablespace_name = maxtspace.tablespace_name
and segment_type IN ('TABLE','INDEX','CLUSTER','TABLE PARTITION','INDEX PARTITION')
and next_extent > maxtspace.max
/ 
spool off
