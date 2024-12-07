spool gents.lst
set serveroutput on size 1000000
DECLARE

  CURSOR get_ts IS SELECT * FROM dba_tablespaces
                   WHERE tablespace_name != 'SYSTEM';

  CURSOR get_df (p_ts VARCHAR2) IS
                   SELECT * from dba_data_files
                   WHERE tablespace_name = p_ts;

  l_str VARCHAR2(10);

BEGIN

FOR ts_rec IN get_ts LOOP

  dbms_output.put_line ('CREATE TABLESPACE '||ts_rec.tablespace_name);

  -- For each tablespace loop through the datafiles
  FOR df_rec IN get_df (ts_rec.tablespace_name) LOOP

    IF get_df%ROWCOUNT = 1 THEN
       l_str := 'DATAFILE';
    ELSE
       l_str := ',';
    END IF;

    dbms_output.put_line (l_str||' '
                ||chr(39)||df_rec.file_name||chr(39)
                ||' SIZE '||df_rec.bytes||' REUSE ');

    if df_rec.autoextensible = 'YES' then

       dbms_output.put_line (' AUTOEXTEND ON'
                             ||' NEXT '||df_rec.increment_by );

       if df_rec.maxbytes = 68719443968 then
          dbms_output.put_line (' MAXSIZE UNLIMITED');
       else
          dbms_output.put_line (' MAXSIZE '||df_rec.maxbytes);
       end if;

    end if;

  END LOOP;

/* Extent Management Clause */

   dbms_output.put_line  ('EXTENT MANAGEMENT ' ||ts_rec.extent_management );

   if ts_rec.extent_management = 'LOCAL' then

      if ts_rec.allocation_type = 'SYSTEM' then

         dbms_output.put_line (' AUTOALLOCATE ');

      else

         dbms_output.put_line (' UNIFORM SIZE '||ts_rec.initial_extent);

      end if;
 
   end if;

   if ts_rec.extent_management = 'DICTIONARY' then

     dbms_output.put_line ('DEFAULT STORAGE (INITIAL '||ts_rec.initial_extent
        ||' NEXT '||ts_rec.next_extent
        ||' MINEXTENTS '||ts_rec.min_extents
        ||' MAXEXTENTS '||ts_rec.max_extents
        ||' PCTINCREASE '||ts_rec.pct_increase||' ) ');

   end if;

   dbms_output.put_line  (' ONLINE;');
   dbms_output.new_line;

END LOOP;

END;
/ 
spool off

ine  (' ONLINE;'); 
   dbms_output.new_line; 
 
END LOOP; 
 
END; 
/  
spool off 
