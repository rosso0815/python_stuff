spool sqlausgabe.tmp ;
set heading off;
set pagesize 0;
set linesize 200;

SELECT "$CUR_ACC_MET_DATA", "$CUR_ACC_MET" FROM PILOT1."$EXT_LF" ;

spool off;
exit;
