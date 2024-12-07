------------------ SQLPLUS PARAMETERS ----------------
COL tablespace       FOR A12 HEAD "TABLESPACE"          TRUNC
COL volume   FOR 999,999,999 HEAD "SIZE|in Ko" 
COL volume_occupe FOR 999,999,999 head "SIZE|BUSY|in Ko"
COL volume_restant FOR 999,999,999 head "SIZE|FREE|in Ko"
COL taux_remplissage      FOR 999 HEAD "RATE| %" TRUNC
clear break
clear computes
break on report
compute sum of volume volume_occupe volume_restant on report

------------------ BEGIN ------------------------

SELECT  t.tablespace_name tablespace    ,
        t.status STATUT,
        SUM(f.blocks)*p.value  * COUNT(DISTINCT(f.file_name)) / (COUNT(*) * 1024)  volume,
        decode(  SUM(s.blocks)*p.value/(1024*
                COUNT(DISTINCT(f.file_name))) ,null,0,
               SUM(s.blocks)*
                p.value
              /(1024         *
                COUNT(DISTINCT(f.file_name))) )                volume_occupe
                ,
                decode(
                SUM(f.blocks)*
                p.value  *
                COUNT(DISTINCT(f.file_name))
              /(COUNT(*)     *
                1024         )
             - (SUM(s.blocks)*
                p.value
              /(1024         *
                COUNT(DISTINCT(f.file_name))))  ,null,
                SUM(f.blocks)*
                p.value  *
                COUNT(DISTINCT(f.file_name))
              /(COUNT(*)     *
                1024         ),
                SUM(f.blocks)*
                p.value  *
                COUNT(DISTINCT(f.file_name))
              /(COUNT(*)     *
                1024         )
             - (SUM(s.blocks)*
                p.value
              /(1024         *
                COUNT(DISTINCT(f.file_name)))))         volume_restant,
      decode( CEIL (((SUM  (s.blocks)*
               COUNT(*))
            / (SUM  (f.blocks)*
               POWER(COUNT(DISTINCT(f.file_name)),2)))
              *100) ,null,0,
                  CEIL (((SUM  (s.blocks)*
               COUNT(*))
            / (SUM  (f.blocks)*
               POWER(COUNT(DISTINCT(f.file_name)),2)))
              *100))                taux_remplissage
FROM   sys.dba_segments   s,
       sys.dba_tablespaces t,
       sys.dba_data_files f,
       v$parameter p
WHERE  s.tablespace_name(+)       = t.tablespace_name
  AND  f.tablespace_name          = t.tablespace_name
  and  p.name = 'db_block_size'
GROUP BY
       t.tablespace_name         ,
       p.value,t.status
ORDER BY
       1;
------------------ END ------------------------
