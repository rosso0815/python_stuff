#
# files for coldbackup
#

select name from v$datafile;
NAME
--------------------------------------------------------------------------------
/u01/apps/oracle/oradata/RACEB0/system01.dbf
/u03/apps/oracle/oradata/RACEB0/undotbs01.dbf
/u01/apps/oracle/oradata/RACEB0/drsys01.dbf
/u02/apps/oracle/oradata/RACEB0/indx01.dbf
/u01/apps/oracle/oradata/RACEB0/tools01.dbf
/u03/apps/oracle/oradata/RACEB0/users01.dbf
/u03/apps/oracle/oradata/RACEB0/xdb01.dbf
/u03/apps/oracle/oradata/RACEB0/sum31aspace.dbf
/u02/apps/oracle/oradata/RACEB0/keym31aspace.dbf
/u01/apps/oracle/oradata/RACEB0/admm31aspace.dbf

select name from v$controlfile;
NAME
--------------------------------------------------------------------------------
/u01/apps/oracle/oradata/RACEB0/control01.ctl
/u02/apps/oracle/oradata/RACEB0/control02.ctl
/u03/apps/oracle/oradata/RACEB0/control03.ctl

select member from V$logfile;
MEMBER
--------------------------------------------------------------------------------
/u01/apps/oracle/oradata/RACEB0/redo01.log
/u02/apps/oracle/oradata/RACEB0/redo02.log
/u03/apps/oracle/oradata/RACEB0/redo03.log

#-------------------------------------------------------------------------------
# windsw00:RACE000
select name from v$datafile;
/u01/apps/oracle/oradata/RACEPLM0/system01.dbf
/u03/apps/oracle/oradata/RACEPLM0/undotbs01.dbf
/u01/apps/oracle/oradata/RACEPLM0/drsys01.dbf
/u02/apps/oracle/oradata/RACEPLM0/indx01.dbf
/u01/apps/oracle/oradata/RACEPLM0/tools01.dbf
/u03/apps/oracle/oradata/RACEPLM0/users01.dbf
/u03/apps/oracle/oradata/RACEPLM0/xdb01.dbf
/u01/apps/oracle/oradata/RACEPLM0/admm31aspace.dbf
/u02/apps/oracle/oradata/RACEPLM0/keym31aspace.dbf
/u03/apps/oracle/oradata/RACEPLM0/sum31a.dbf
/u02/apps/oracle/oradata/RACEPLM0/idx_sum31aspace.dbf
/u02/apps/oracle/oradata/RACEPLM0/idx_admm31aspace.dbf
/u02/apps/oracle/oradata/RACEPLM0/idx_keym31aspace.dbf

select name from v$controlfile;
/u01/apps/oracle/oradata/RACEPLM0/control01.ctl
/u02/apps/oracle/oradata/RACEPLM0/control02.ctl
/u03/apps/oracle/oradata/RACEPLM0/control03.ctl

select member from V$logfile;
/u01/apps/oracle/oradata/RACEPLM0/redo01.log
/u02/apps/oracle/oradata/RACEPLM0/redo02.log
/u03/apps/oracle/oradata/RACEPLM0/redo03.log

#----------------------------------------------------------------------------------











