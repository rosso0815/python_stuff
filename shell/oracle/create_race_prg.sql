


echo "set termout off" > tmp.sql
echo "set pagesize 0" >> tmp.sql
echo "set head off"   >> tmp.sql
echo "set verify off" >> tmp.sql
echo "set feed off"   >> tmp.sql
echo "set echo off"   >> tmp.sql
echo "spool liste_prg.txt;" >> tmp.sql

echo "SELECT B3PROGRAMID FROM ADMM31A.B3PRGRM order by B3PROGRAMID asc;" >> tmp.sql

echo "spool off;" >> tmp.sql
echo "exit;" >> tmp.sql

sqlplus monitor/monitor@raceplm0 @tmp.sql 


vi liste_prg.txt
entferne spaces
tausche spaces in name aus
%s/ *$//g
%s/ /^/g


./Do_create_LP_LoadFile.sh R321load_prg_rules.dmp `cat liste_prg.txt`
