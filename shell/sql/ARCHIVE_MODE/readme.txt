#insert data into emp

insert into emp (empno, ename) values (9999,'pfister01');
commit;

select empno,ename from emp;

#-------------------------------------------------------
select name, log_mode from v$database;

select value from v$parameter where name like 'log_archive%';


alter system  archive log current;

#-------------------------------------------------------

startup mount

recover database until time '2006:07:10:10:00:00' 
using backup controlfile;

recover datafile '/opt/apps/oracle/oradata/APTC5/system01.dbf';

alter database open resetlogs; #!!!! be carefull !!!!
				# copy a old system.dbf into oradata ??
  
alter database open;
