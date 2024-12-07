#!/bin/ksh

set -x

#####################################################################
# PROGRAM NAME:coldbackup_ux

# PURPOSE:Performs cold backup of the database. Database

#should be online when you start
# the script. It will shutdown and take a cold backup and brings 
# the database up again


# USAGE:$coldbackup_ux SID OWNER

# INPUT PARAMETERS: SID(Instance name), OWNER(Owner of instance)

#####################################################################

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_verify(): Verify that database is online        
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
funct_verify(){
 STATUS=´ps -fu ${ORA_OWNER} |grep -v grep| grep ora_pmon_${ORA_SID}´
 funct_chk_ux_cmd_stat "Database is down for given SID($ORA_SID),
Owner($ORA_OWNER). Can't generate files to be backed up"
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_verify_shutdown(): Verify that database is down
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
funct_verify_shutdown(){
 STATUS=´ps -fu ${ORA_OWNER} |grep -v grep| grep ora_pmon_${ORA_SID}´
if [ $? = 0 ]; then
  echo "´date´" >> $LOGFILE
  echo "COLDBACKUP_FAIL: ${ORA_SID}, Database is up, can't make 
coldbackup if the database is online."|tee -a ${BACKUPLOGFILE} >> $LOGFILE
  exit 1
fi
}


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_shutdown_i(): Shutdown database in Immediate mode
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
funct_shutdown_i(){
${ORACLE_HOME}/bin/sqlplus -s << EOF
 / as sysdba
shutdown immediate;
exit
EOF
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_shutdown_n(): Shutdown database in Normal mode
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_shutdown_n(){
${ORACLE_HOME}/bin/sqlplus -s << EOF
 / as sysdba
shutdown normal;
exit
EOF
}


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_startup_r(): Startup database in restricted mode
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_startup_r(){
${ORACLE_HOME}/bin/sqlplus -s << EOF
 / as sysdba
startup restrict;
exit
EOF
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_startup_n(): Startup database in normal mode
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
funct_startup_n(){
${ORACLE_HOME}/bin/sqlplus -s << EOF
/ as sysdba
startup; 
exit
EOF
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_build_dynfiles(): Identify the files to backup   
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_build_dynfiles(){
# Build datafile list
echo "Building datafile list ." >> ${BACKUPLOGFILE}
datafile_list=´${ORACLE_HOME}/bin/sqlplus -s <<EOF 
/ as sysdba
set heading off  feedback off
select file_name from dba_data_files order by tablespace_name;
exit
EOF´

echo "############### SQL for Temp Files " >> ${RESTOREFILE}
${ORACLE_HOME}/bin/sqlplus -s <<EOF >> ${RESTOREFILE} 
/ as sysdba
set heading off  feedback off
select 'alter tablespace '||tablespace_name||' add tempfile '||''||
file_name||''||' reuse'||';'
from dba_temp_files;
exit
EOF

echo "Backingup controlfile and trace to trace file" >>${BACKUPLOGFILE}
${ORACLE_HOME}/bin/sqlplus -s <<EOF
/ as sysdba
set heading off  feedback off
alter database backup controlfile to '${CONTROLFILE_DIR}/backup_control.ctl';
alter database backup controlfile to trace;
exit
EOF


# Backup trace of control file
CONTROL=´ls -t ${udump_dest}/*.trc |head -1´
if [ ! -z "$CONTROL" ]; then
 grep 'CONTROL' ${CONTROL} 1> /dev/null
 if test $? -eq 0; then
   cp ${CONTROL} ${CONTROLFILE_DIR}/backup_control.sql
 fi
fi 
} 
# Prepare restore file for control file
echo "###### Control File  " >> ${RESTOREFILE}
echo "# Use your own discretion to copy control file, not advised unless 
required..." >> ${RESTOREFILE}
echo " End of backup of control file" >> ${BACKUPLOGFILE}


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_cold_backup(): Perform cold backup 
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_cold_backup(){

#Copy datafiles to backup location
echo "############### Data Files " >> ${RESTOREFILE}
for datafile in ´echo $datafile_list´
do
     echo "Copying datafile ${datafile} ..." >> ${BACKUPLOGFILE}
     #Prepare a restore file to restore coldbackup in case a 
restore is necessary
     echo cp -p ${DATAFILE_DIR}/´echo $datafile|awk -F"/" '{print $NF}'´
$datafile >> ${RESTOREFILE}
     cp -p ${datafile} ${DATAFILE_DIR} 
     funct_chk_ux_cmd_stat "Failed to copy datafile file to 
backup location"
done

#Copy current init<SID>.ora file to backup directory
echo " Copying current init.ora file" >> ${BACKUPLOGFILE}
cp -p ${init_file} ${INITFILE_DIR}/init${ORA_SID}.ora
funct_chk_ux_cmd_stat "Failed to copy init.ora file to backup location"

echo "################ Init.ora File " >> ${RESTOREFILE}
echo cp -p ${INITFILE_DIR}/init${ORA_SID}.ora ${init_file} 
>> ${RESTOREFILE}
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_chk_parm(): Check for input parameters
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_chk_parm() {
if [ ${NARG} -ne 2 ]; then
   echo "COLDBACKUP_FAIL: ${ORA_SID}, Not enough arguments passed"
   exit 1
fi
}


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_chk_bkup_dir(): Create backup directories if not already existing
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_chk_bkup_dir() {

 RESTOREFILE_DIR="${BACKUPDIR}/restorefile_dir"
 BACKUPLOG_DIR="${BACKUPDIR}/backuplog_dir"
 DATAFILE_DIR="${BACKUPDIR}/datafile_dir"
 CONTROLFILE_DIR="${BACKUPDIR}/controlfile_dir"
 REDOLOG_DIR="${BACKUPDIR}/redolog_dir"
 ARCLOG_DIR="${BACKUPDIR}/arclog_dir"
 INITFILE_DIR="${BACKUPDIR}/initfile_dir"

 BACKUPLOGFILE="${BACKUPLOG_DIR}/backup_log_${ORA_SID}"
 RESTOREFILE="${RESTOREFILE_DIR}/restorefile_${ORA_SID}"
 LOGFILE="${LOGDIR}/${ORA_SID}.log"

 if [ ! -d ${RESTOREFILE_DIR} ]; then mkdir -p ${RESTOREFILE_DIR}; fi
 if [ ! -d ${BACKUPLOG_DIR} ]; then mkdir -p ${BACKUPLOG_DIR}; fi
 if [ ! -d ${DATAFILE_DIR} ]; then mkdir -p ${DATAFILE_DIR}; fi
 if [ ! -d ${CONTROLFILE_DIR} ]; then mkdir -p ${CONTROLFILE_DIR}; fi
 if [ ! -d ${REDOLOG_DIR} ]; then mkdir -p ${REDOLOG_DIR}; fi
 if [ ! -d ${ARCLOG_DIR} ]; then mkdir -p ${ARCLOG_DIR}; fi
 if [ ! -d ${INITFILE_DIR} ]; then mkdir -p ${INITFILE_DIR}; fi

 if [ ! -d ${DYN_DIR} ]; then mkdir -p ${DYN_DIR}; fi
 if [ ! -d ${LOGDIR} ]; then mkdir -p ${LOGDIR}; fi

# Remove old backup
rm -f ${RESTOREFILE_DIR}/*
rm -f ${BACKUPLOG_DIR}/*
rm -f ${DATAFILE_DIR}/*
rm -f ${CONTROLFILE_DIR}/*
rm -f ${REDOLOG_DIR}/*
rm -f ${ARCLOG_DIR}/*
rm -f ${INITFILE_DIR}/*

echo "${JOBNAME}: coldbackup of ${ORA_SID} begun on ´date +\"%c\"´" > ${BACKUPLOGFILE}
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_get_vars(): Get environment variables
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_get_vars(){

ORA_HOME=´sed /#/d ${ORATABDIR}|grep -i ${ORA_SID}|nawk -F ":" '{print $2}'´
ORA_BASE=´echo ${ORA_HOME}|nawk -F "/" '{for (i=2; i<=NF-2; i++) print 
"/"$i}'´
ORACLE_BASE=´echo $ORA_BASE|tr -d " "´
init_file=$ORA_HOME/dbs/init$ORA_SID.ora
#log_arch_dest1=´sed /#/d $init_file|grep -i log_archive_dest|
nawk -F "=" '{print $2}'´
#log_arch_dest=´echo $log_arch_dest1|tr -d "'"|tr -d '"'´

udump_dest=´${ORACLE_HOME}/bin/sqlplus -s <<EOF
/ as sysdba
set heading off  feedback off
select value from v\\$parameter
where name='user_dump_dest';
exit
EOF´

if [ x$ORA_HOME = 'x' ]; then
  echo "COLDBACKUP_FAIL: Can't get ORACLE_HOME from oratab file 
for $ORA_SID"|tee -a ${BACKUPLOGFILE} >> ${LOGFILE}
  exit 1
fi

if [ ! -f $init_file ]; then
  echo "COLDBACKUP_FAIL: init$ORA_SID.ora does not exist in 
ORACLE_HOME/dbs"|tee -a ${BACKUPLOGFILE} >> ${LOGFILE}
  exit 1
fi

if [ x$udump_dest = 'x' ]; then
  echo "COLDBACKUP_FAIL: user_dump_dest not defined in init$ORA_SID.ora"|
tee -a ${BACKUPLOGFILE} >> ${LOGFILE}
  exit 1
fi

ORACLE_HOME=${ORA_HOME}; export ORACLE_HOME
ORACLE_SID=${ORA_SID}; export ORACLE_SID
} 


#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# funct_chk_ux_cmd_stat(): Check the exit status of Unix command
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

funct_chk_ux_cmd_stat() {
 if [ $? != 0 ]; then
      echo "´date´" |tee -a ${BACKUPLOGFILE} >> ${LOGFILE}
      echo "COLDBACKUP_FAIL: ${1} "| tee -a ${BACKUPLOGFILE}
>> ${LOGFILE}
      exit 1
 fi
} 


############################################################
#   MAIN
############################################################

NARG=$#
ORA_SID=$1
ORA_OWNER=$2

# Set environment variables 
BACKUPDIR="/BACKUP/${ORA_SID}/cold" 
ORATABDIR=/etc/oratab
TOOLS="/u01/oracomn/admin/my_dba"

DYN_DIR="${TOOLS}/DYN_FILES"
LOGDIR="${TOOLS}/localog"
JOBNAME="dbcoldbackup"

echo " Starting coldbackup of ${ORA_SID} "

    funct_chk_parm
    funct_chk_bkup_dir
    funct_get_vars
    funct_verify
    funct_build_dynfiles
    funct_shutdown_i
    funct_startup_r
    funct_shutdown_n
    funct_verify_shutdown
    funct_cold_backup
    funct_startup_n

echo "${ORA_SID}, Coldbackup Completed successfully on ´date +\"%c\"´" |tee -a ${BACKUPLOGFILE} >> ${LOGFILE}
########    END MAIN ##########################
