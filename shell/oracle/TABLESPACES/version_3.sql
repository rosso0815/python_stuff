clear columns
set pagesize 80 linesize 90 feedback off 
column tablespace_name heading Tablespace format a19
column object_count heading 'Objects|(#)' format 999990
column mb heading Mb format 9990
column sum(frags) heading 'Frags|(#)' format 9999
column avail heading 'Max|(Mb)' format 9999.99
column free heading 'Free|(%)' format 999.9
column bytesize heading 'Size|(Mb)' format 99999
column byteused heading 'Used|(Mb)' format 99990
column bytefree heading 'Free|(Mb)' format 9999
column init_ext heading 'Initial|(K)' format 999999
column next_ext heading 'Next|(K)' format 999999
break on report
compute sum of object_count bytesize byteused bytefree on report

select tablespace_name,
sum(obj_cnt) object_count,
sum(ini_ext) init_ext,
sum(nex_ext) next_ext,
sum(byte)/1048576 bytesize, 
(sum(byte)/1048576)- (sum(fbyte)/1048576) byteused,
sum(fbyte)/1048576 bytefree, 
sum(frags), 
sum(largest)/1048576 avail,
(sum(fbyte)/sum(byte))*100 free 
from
(select tablespace_name,
0 obj_cnt,
0 ini_ext,
0 nex_ext, 
0 byte, 
sum(bytes) fbyte, 
count(*) frags, 
max(bytes) largest
from dba_free_space 
group by tablespace_name
union
select tablespace_name,
0, 0, 0, sum(bytes), 0, 0, 0
from dba_data_files 
group by tablespace_name
union
select tablespace_name, 0,
initial_extent/1024 ini_ext,
next_extent/1024 nex_ext,
0,0,0,0
from dba_tablespaces
union
select tablespace_name,
count(*) obj_cnt,
0, 0, 0, 0, 0, 0
from dba_segments
group by tablespace_name)
group by tablespace_name;
set pagesize 24 feedback on verify on
