CLEAR
SET HEAD ON
SET VERIFY OFF
SET PAGES 2000

PROMPT 
ACCEPT tablespace_name PROMPT 'Enter Value Tablespace (Return For all) : ' 

spool dfile.lst

col rank form 99 
col file_id form 9999 heading "F ID"
col tspace form a20 Heading "Tablespace"
col tot_ts_size form 99999999999999 Heading "Size (Mb)"
col free_ts_size form 99999999999999 Heading "Free (Mb)"
col used_ts_size form 99999999999999 Heading "Used (Mb)"

break on report
compute sum of tot_ts_size on report
compute sum of free_ts_size on report

select rownum as rank, a.*
from (
   select df.tablespace_name tspace, 
       df.file_id,
       df.bytes/(1024*1024) tot_ts_size,
       sum(fs.bytes)/(1024*1024) free_ts_size,
       (df.bytes-sum(fs.bytes))/(1024*1024) used_ts_size
   from dba_free_space fs, (select tablespace_name,file_id, sum(bytes) bytes
                                 from dba_data_files
                                 group by tablespace_name,file_id ) df          
   where fs.tablespace_name = df.tablespace_name
   and fs.file_id = df.file_id
   and df.tablespace_name like UPPER('%&tablespace_name%')
   group by df.tablespace_name, df.file_id, df.bytes
   ORDER BY free_ts_size DESC) a
where rownum < 11
/

spool off 
