set termout off
set pagesize 0
set head off
spool liste_prg.txt;
SELECT B3PROGRAMID FROM ADMM31A.B3PRGRM order by B3PROGRAMID asc;
spool off;
exit;
