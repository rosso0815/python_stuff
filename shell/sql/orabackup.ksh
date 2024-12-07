#!/bin/ksh

set -x

#
# Description: Script to perform both HOT and COLD backup on #
# - Database should be up and running although -f option can be used #
# to force backup operation #
# - Must be run as SYSDBA or SYSOPER when running COLD #
# backup process #
# - does NOT backup redo logs, not necessary #
# #
# Requirement: oratab must exist #
# gnu awk #
# $ORACLE_HOME must be set (any version) #
# #
# Variables: 
#
# saved_sid -> saves current $ORACLE_SID #
# am_i_dba -> checks if I am in DBA group #
# awk -> sets awk version, default - gnu awk #
# backup -> backup type, default - HOT #
# dba_group -> sets dba group name, default - dba (can also be oinstall) #
# dir -> directory to store the backup files #
# tmpdir -> directory to store temporary files, deleted at the end of process #
# archive_log_files -> file which stores archive log file names to be backed up #
# control_files -> file which stores control file names to be backed up #
# db_files -> file which stores datafile names to be backed up #
# tmp1 -> file which stores archive logs path (variable log_archive_dest_n) #
# tmp2 -> file which stores last archived log name ($current_archive_log) #
# tmp3 -> file which stores old archive logs #
# logfile -> backup process log, default - /dev/null #
# option -> force backup option, default - NO #
# restore_script -> generated script to restore the backup #
# sid -> $ORACLE_SID which will be backed up #
# tabsp2 -> tablespace name to be backed up (used in single tablespace #
# backup), default - null #
# type -> hot backup type, can be FULL or #
# TABLESPACE, default - FULL #
# userid -> database user to run the #
# backup process #
# #
# Usage: orabackup.ksh -b hot -d /tmp -l /tmp/backup.log -v #
# orabackup.ksh -b hot -d /tmp -l /tmp/backup.log -t tablespace -n system -v #
# orabackup.ksh -b cold -d /tmp -l /tmp/backup.log -v #
# orabackup.ksh -b cold -d /tmp -l /tmp/backup.log -f -v #
# #
# #
# Error codes: #
# 0 -> Operation finished successfully #
# 101 -> ORA-xxxxx error encountered in SQL*PLUS #
# 102 -> Operating System error encountered in SQL*PLUS #
# 103 -> Not enough freespace to perform backup #
# 104 -> Not in DBA Group #
# 105 -> Database not shutdown #
# 106 -> Database is not running #
# 107 -> Wrong backup option -b #
# 108 -> Bad backup directory permissions -d #
# 109 -> Invalid Oracle instance identifier (SID) -i #
# 110 -> Invalid -t option #
# 111 -> Missing -n option when use -t #
# 112 -> Invalid tablespace name when use -n #
# 113 -> Bad log directory permissions -l #
# 114 -> PL/SQL error encountered in SQL*PLUS #
# 115 -> Invalid script option #
# 116 -> Error obtaining log_archive_log_dest_n #
# 117 -> Error obtaining current archive log name #
# 118 -> Database archiver process not started or not in archive log mode #
# required to perform hot backup #
# 119 -> Single tablespace backups only works for hot backups #
# 120 -> Invalid -f option #
# 121 -> -n option cannot be used if -t FULL is specified #
# 122 -> oratab does not exist #
# 123 -> sid does not exist in oratab #
# 124 -> no ORACLE_HOME set #
# 200 -> Process aborted (Signal 1 2 3 15) #
# #
# 2002 July, LS Cheng #
# #
#######################################################################################################

saved_sid=$ORACLE_SID

am_i_dba=""
awk=/bin/gawk
backup="HOT"
dba_group="dba"
dir="/tmp"
tmpdir=/tmp
archive_log_files="${tmpdir}/lsc_archive_log_files_$$.log"
control_files="${tmpdir}/lsc_control_files_$$.log"
db_files="${tmpdir}/lsc_db_files_$$.log"
tmp1="${tmpdir}/lsc_tmp1_$$.log"
tmp2="${tmpdir}/lsc_tmp2_$$.log"
tmp3="${tmpdir}/lsc_tmp3_$$.log"
logfile="/dev/null"
option="NO"
oratab="/etc/oratab"
sid="undefined"
tabsp2=""
type="FULL"
userid="/ as sysdba"

trap "rm -f "${tmpdir}"/lsc_archive_log_files_$$.log \
"${tmpdir}"/lsc_control_files_$$.log \
"${tmpdir}"/lsc_db_files_$$.log "${tmpdir}"/lsc_tmp1_$$.log \
"${tmpdir}"/lsc_tmp2_$$.log >/dev/null 2>&1 "${tmpdir}"/lsc_tmp3_$$.log >/dev/null 2>&1" 0
trap "echo Backup process aborted >> "$logfile" 2>&1 \
exit 200" 1 2 3 15

#======================================================================================================
# Function -> Usage #
#======================================================================================================
# Description: prints a small how-to about this script #
# triggers when invalid options are used #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function usage {
[ "$1" ] && echo "\nOrabackup: $*"
cat << !
usage: orabackup [ -b backup ] [ -d directory ] [ -i instance ]
[ -t type ] [ -n tablespace_name ]
[ -v ] [ -l logfile ]

options: -b backup : Type of backup, (Default = HOT)
HOT - Online
COLD - Offline, shuts down the database
-d directory : The name of the directory to contain
the backed up database files.
(Default = /tmp)
-f option : Force backup operation even when database
is not up (Default = NO)
NO - do not force backup
YES - perform backup even when the
database is down
-i instance : The Oracle SID (database) to be backed up. If omitted, the current
value of $ORACLE_SID will be used. If that's not set, the value of
$ORACLE_SID set by the user's .profile will be used. If that's
not set, an error will be returned.
-l logfile : The name of a logfile to record successful file backups. If omitted
then no log is kept
-t type : Type of backup in HOT backup. (Default = FULL)
FULL - full database backup
TABLESPACE - single tablespace backup
-n tablespace : Name of tablespace to be backed up if the
"-t TABLESPACE" option is used. (No default).
-v : Verbose.
!
exit 115
}

while getopts b:d:f:i:l:n:u:t:v OPT
do
case $OPT in
"b" ) backup=$(echo "${OPTARG}" | tr 'a-z' 'A-Z') ;;
"d" ) dir="${OPTARG}" ;;
"f" ) option=$(echo "${OPTARG}" | tr 'a-z' 'A-Z') ;;
"i" ) sid="${OPTARG}" ;;
"n" ) tabsp2=$(echo "${OPTARG}" | tr 'a-z' 'A-Z') ;;
"u" ) userid="$OPTARG" ;;
"t" ) type=$(echo "${OPTARG}" | tr 'a-z' 'A-Z') ;;
"v" ) verbose="true" ;;
"l" ) logfile="${OPTARG}" ;;
"?" ) usage "Invalid option: -"${OPTARG}" "
exit 115;;
":" ) usage "Mandatory parameter missing for -"${OPTARG}" option" ;;
esac
done
shift $(($OPTIND - 1))

if [ ! -s "${oratab}" ]; then
echo "LSC-122: ${oratab} not found" > "${logfile}"
exit 122
fi

#======================================================================================================
# Function -> Verbose #
#======================================================================================================
# Description: Prints function messages to stdout and logfile #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function verbose {
[ "$verbose" ] && echo "\n$*" | tee -a "${logfile}"
}

#======================================================================================================
# Function -> Chk_error_status #
#======================================================================================================
# Description: Generic error checking function to catch exit codes and corresponding treatment #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_error_status {
return_code=$1
function_name=$2
case ${return_code} in
0) if [ "${function_name}" != "" ]; then
echo "${function_name}: finished successfully" >> "${logfile}" 2>&1
return ${return_code}
fi
;;
101) echo "LSC-101: ${function_name}. ORA-xxxxx error encountered in SQL*PLUS" >> "${logfile}" 2>&1
exit ${return_code}
;;
102) echo "LSC-102: ${function_name}. Operating System error encountered in SQL*PLUS" >> "${logfile}" 2>&1
exit ${return_code}
;;
103) echo "LSC-103: ${function_name}. Not enough space to perform the backup operation" >> "${logfile}" 2>&1
exit ${return_code}
;;
104) echo "LSC-104: ${function_name}. Not in DBA group" >> "${logfile}" 2>&1
exit ${return_code}
;;
105) echo "LSC-105: ${function_name}. Database not shutdown" >> "${logfile}" 2>&1
exit ${return_code}
;;
106) echo "LSC-106: Database is not running" >> "${logfile}" 2>&1
exit ${return_code}
;;
107) echo "LSC-107: Wrong backup option -b" >> "${logfile}" 2>&1
exit ${return_code}
;;
108) echo "LSC-108: Bad backup directory permissions -d " >> "${logfile}" 2>&1
exit ${return_code}
;;
109) echo "LSC-109: Invalid Oracle instance identifier (SID) -i " >> "${logfile}" 2>&1
exit ${return_code}
;;
110) echo "LSC-110: Invalid -t option" >> "${logfile}" 2>&1
exit ${return_code}
;;
111) echo "LSC-111: Missing -n option when use -t" >> "${logfile}" 2>&1
exit ${return_code}
;;
112) echo "LSC-112: Invalid tablespace name when use -n" >> "${logfile}" 2>&1
exit ${return_code}
;;
113) echo "LSC-113: Bad log directory permissions -l" >> "${logfile}" 2>&1
exit ${return_code}
;;
114) echo "LSC-114: ${function_name}. PL/SQL error encountered in SQL*PLUS" >> "${logfile}" 2>&1
exit ${return_code}
;;
115) echo "LSC-115: ${function_name}. Invalid script option" >> "${logfile}" 2>&1
exit ${return_code}
;;
116) echo "LSC-116: ${function_name}. Error obtaining log_archive_log_dest_n" >> "${logfile}" 2>&1
exit ${return_code}
;;
117) echo "LSC-117: ${function_name}. Error obtaining current archive log name" >> "${logfile}" 2>&1
exit ${return_code}
;;
118) echo "LSC-118: ${function_name}. Archiver not started or database not in archive log mode" >> "${logfile}" 2>&1
exit ${return_code}
;;
119) echo "LSC-119: Single tablespace backups only works for hot backups" >> "${logfile}" 2>&1
exit ${return_code}
;;
120) echo "LSC-120: Incorrect -f option used, must be YES or NO" >> "${logfile}" 2>&1
exit ${return_code}
;;
121) echo "LSC-121: -n option cannot be used if -t FULL is specified" >> "${logfile}" 2>&1
exit ${return_code}
;;
123) echo "LSC-123: ${sid} does not exist in ${oratab} " >> "${logfil}" 2>&1
exit ${return_code}
;;
124) echo "LSC-124: no ORACLE_HOME set" >> "${logfile}" 2>&1
exit ${return_code}
;;
*) echo "LSC-999: Undefined error executing ${function_name}, return code is ${return_code}" >> "${logfile}" 2>&1
exit ${return_code}
;;
esac
}

#======================================================================================================
# Function -> Chk_dba_group #
#======================================================================================================
# Description: Checks if you are in dba group, by default it checks for dba #
# if you are using oinstall group modify the variable "dba_group" #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_dba_group {
verbose "$(date) - Executing chk_dba_group"
am_i_dba=$(echo $(id) | "${awk}" -v mygroup="${dba_group}" '$0 ~ mygroup { print $0 }')
if [ ! "${am_i_dba}" ]; then
exit_code=104
chk_error_status ${exit_code} $0
else
exit_code=0
chk_error_status ${exit_code} $0
fi
}

#======================================================================================================
# Function -> Chk_free_space #
#======================================================================================================
# Description: Checks if there are enough freespace in chosen backup dirctory #
# to store the backup files #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_free_space {
verbose "$(date) - Checking freespace..."
freespace=$(($(df -k "$dir" | "${awk}" '{ print $4 }' | sed 's/Available//g') / 1024 ))
neededspace=$(tail -1 "${db_files}" | "${awk}" '{ print $4 }')
if [ "$neededspace" -gt "${freespace}" ]; then
exit_code=103
chk_error_status ${exit_code} $0
else
exit_code=0
chk_error_status ${exit_code} $0
fi
}

#======================================================================================================
# Function -> Generate_restore_script #
#======================================================================================================
# Description: Generates a script to restore the backup from backup directory #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function generate_restore_script {
for i in $(cat ${db_files} 2>> "${logfile}" | cut -d" " -f2)
do
filename=$(basename "${i}")
echo "cp ${dir}/${filename} $i" >> "${restore_script}"
done
exit_code=$?
chk_error_status ${exit_code} $0
if [ "${backup}" = "HOT" ]; then
for i in $(cat ${archive_log_files} 2>> "${logfile}" | cut -d" " -f2)
do
filename=$(basename "${i}")
echo "cp ${dir}/${filename} $i" >> "${restore_script}"
done
exit_code=$?
chk_error_status ${exit_code} $0
fi
echo "# only copy control files from backup if you have lost them or restoring a cold backup" >> "${restore_script}"
for i in $(cat ${control_files} 2>> "${logfile}" | cut -d" " -f2)
do
filename=$(basename "${i}")
echo "# cp ${dir}/${filename} $i" >> "${restore_script}"
done
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> run_sqlplus #
#======================================================================================================
# Description: Generates a script to restore the backup from backup directory #
# Parameters: $1 -> logfile #
# $2 -> sql or pl/sql code #
# Syntax: N/A #
#======================================================================================================

function run_sqlplus {
sqlplus -s /nolog <<- ! >> $1

whenever sqlerror exit 101
whenever oserror exit 102
connect ${userid}
set feed off line 140 pagesize 0 trimspool on
set serverout on size 1000000
variable return number
exec :return := 0
$2
exit :return
!
}

#======================================================================================================
# Function -> Chk_database_up #
#======================================================================================================
# Description: Checks if database up by looking at pmon process #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_database_up {
verbose "$(date) - Checking if database is up..."
if $(ps -ef | grep pmon | grep ${sid} | grep -v grep >/dev/null 2>&1); then
return 0
else
return 1
fi
}

#======================================================================================================
# Function -> Startup_database #
#======================================================================================================
# Description: Starts the database #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function startup_database {
verbose "$(date) - Starting up database..."
sqlplus -s /nolog <<- ! >> "${logfile}"

whenever sqlerror exit 101
whenever oserror exit 102
connect ${userid}
startup
exit 0
!
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Shutdown_database #
#======================================================================================================
# Description: Shuts down the database #
# 1. we force a checkpoint by switching the logfile #
# 2. we force another checkpoint by altering the system #
# 3. sleeps 20 seconds so dbwr can flush the dirty buffers to disk #
# 4. shutdown the database with abort option #
# 5. startup the database in restrict mode #
# 6. shudown the database with immediate option (graceful shutdown) #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function shutdown_database {
verbose "$(date) - Shutting down database..."
run_sqlplus "${logfile}" "
alter system switch logfile;
alter system checkpoint;
exec dbms_lock.sleep(20);
shutdown abort
startup restrict
shutdown immediate"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> leave_database_as_before #
#======================================================================================================
# Description: Checks if database needs to be stopped because it was stopped #
# when backup proces started #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function leave_database_as_before {
if [ "${stop_database}" = "YES" ]; then
echo "Database was not up so going to shut it down and leave it as before" >> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
shutdown_database
fi
}

#======================================================================================================
# Function -> Chk_archive_log #
#======================================================================================================
# Description: Checks if archiver process is started and if database is in archive log mode #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_archive_log {
verbose "$(date) - Checking archive log mode and archiver process..."
run_sqlplus "${logfile}" "
declare
l_archiver varchar2(7);
l_log_mode varchar2(12);
begin
select archiver
into l_archiver
from v\$instance;
select log_mode
into l_log_mode
from v\$database;
if l_archiver != 'STARTED' or l_log_mode != 'ARCHIVELOG' then
:return := 118;
end if;
exception
when others then
dbms_output.put_line('Error checking archive log mode and archiver process');
:return := 114;
end;
/"
exit_code=$?
chk_error_status ${exit_code} $0
}
#======================================================================================================
# Function -> Chk_dupe_files #
#======================================================================================================
# Description: Detects if there are duplicate files in database, if there are aborts backup process #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_dupe_files {
run_sqlplus "${logfile}" "
declare
numfich number;
numdistinctfich number;
fichduplicado exception;
procedure dupecheck as
begin
if numdistinctfich != numfich
then
raise fichduplicado;
end if;
end;
begin
select count(*)
into numfich
from dba_data_files;
select count(distinct substr(file_name, instr(file_name, '/', -1, 1)+1))
into numdistinctfich
from dba_data_files;
dupecheck;
exception
when fichduplicado then
dbms_output.put_line('Duplicate filename detected');
:return := 114;
end;
/"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Chk_backup_status #
#======================================================================================================
# Description: Checks if there are any tablespace in backup state #
# If there are it´s switched to normal state #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function chk_backup_status {
verbose "$(date) - Checking datafiles backup status..."
run_sqlplus "${logfile}" "
begin
for i in (select file_name, file#, b.status status, tablespace_name,
to_char(b.time, 'YYYYMMDD HH24:MI:SS') time
from dba_data_files a, v\$backup b
where a.file_id = b.file#)
loop
if i.status = 'ACTIVE'
then
execute immediate 'alter tablespace ' || i.tablespace_name || ' end backup';
dbms_output.put_line('Tablespace ' || i.tablespace_name || ' in fuzzy state since ' || i.time);
end if;
end loop;
exception
when others then
dbms_output.put_line('Error checking tablespace backup status, ' || sqlcode );
:return := 114;
end;
/"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Obtain_control_files #
#======================================================================================================
# Description: Query v$controlfile to obtain the name of the control files and spools to a text file #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function obtain_control_files {
verbose "$(date) - Getting control files names..."
run_sqlplus "${logfile}" "
spool $control_files
select name
from v\$controlfile;
spool off"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Obtain_data_files #
#======================================================================================================
# Description: Query dba_data_files to obtain the name of the datafiles and spools to a text file #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function obtain_data_files {
verbose "$(date) - Getting datafiles names..."
run_sqlplus "${logfile}" "
spool $db_files
select tablespace_name || ' ' || file_name || ' ' ||
to_char(bytes/1024/1024,'999999') || ' ' ||
b.total_size
from dba_data_files, (select sum(bytes/(1024*1024)) TOTAL_SIZE from dba_data_files) b
order by tablespace_name,file_name;
spool off"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Backup_database #
#======================================================================================================
# Description: Performs a cold backup #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function backup_database {
verbose "$(date) - Performing cold backup..."
if ! chk_database_up; then
cat "${db_files}" |
while read tabsp3 filename size totalsize
do
file_name=${filename##/*/}
cp "${filename}" "${dir}"/"${file_name}"
done
exit_code=$?
chk_error_status ${exit_code} $0
else
exit_code=105
chk_error_status ${exit_code} $0
fi
}

#======================================================================================================
# Function -> Backup_tablespace #
#======================================================================================================
# Description: Performs a tablespace hot backup #
# 1. put the tablespace in backup state #
# 2. copy the datafiles #
# 3. put the tablespace back to normal state #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function backup_tablespace {
tabsp="$1"
verbose "====================================================================================="
verbose "$(date) - Putting tablespace $tabsp in hot backup state"
run_sqlplus "${logfile}" "
alter tablespace "${tabsp}" begin backup;"
exit_code=$?
chk_error_status ${exit_code}
sleep 5
grep -w "${tabsp}" "${db_files}" 2>> "${logfile}" |
while read tabsp3 filename size totalsize
do
file_name=${filename##/*/}
cp "${filename}" "${dir}"/"${file_name}"
done
exit_code=$?
chk_error_status ${exit_code}
sleep 5
verbose "$(date) - Putting tablespace $tabsp back to normal state"
run_sqlplus "${logfile}" "
alter tablespace "${tabsp}" end backup;"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Backup_control_files #
#======================================================================================================
# Description: Copy the control files in binary format #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function backup_control_files {
verbose "$(date) - Backing up control files (BINARY)"
cat "${control_files}" 2>> "${logfile}" |
while read control_file
do
file_name=${control_file##/*/}
cp "${control_file}" "${dir}"/"${file_name}"
done
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Backup_ascii_control_files #
#======================================================================================================
# Description: Backup the control file in text format #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function backup_ascii_control_file {
verbose "$(date) - Backing up control files (ASCII)"
run_sqlplus "${logfile}" "
column trace_file_name new_value trace_name
select
d.value || '/' || i.instance_name || '_ora_' || p.spid || '.trc' trace_file_name
from
(select p.spid
from v\$mystat m,
v\$session s,
v\$process p
where m.statistic# = 1
and s.sid = m.sid
and p.addr = s.paddr ) p,
(select value
from v\$parameter
where name = 'user_dump_dest' ) d,
(select instance_name
from v\$instance) i;
alter database backup controlfile to trace;
!cp &trace_name ${dir}/control_file_${sid}.txt"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Get_current_archive_log #
#======================================================================================================
# Description: First obtain log_archive_dest_n path and store in variable log_archive_dest_n #
# Secondly switch the logfile and store the current archive log name in #
# variable current_archive_log #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function get_current_archive_log {
verbose "$(date) - Getting log_archive_dest_n path..."
run_sqlplus "${tmp1}" "
select substr(value, instr(value, '=', 1) + 1) log_archive_dest_n
from (select name, value, row_number() over (order by name) numrow
from v\$parameter
where name like 'log_archive_dest%'
and name not like 'log_archive_dest_state%'
and upper(value) not like 'SERVICE%'
and value is not null) a
where numrow = 1;"
exit_code=$?
chk_error_status ${exit_code} $0
if [ $(cat ${tmp1} | wc -l) -gt 2 ]; then
exit_code=116
chk_error_status ${exit_code} $0
else
log_archive_dest_n=$(tail -1 ${tmp1})
find "${log_archive_dest_n}" -type f > "${tmp3}" 2>> "${logfile}"
fi
verbose "$(date) - Archive current log by switching the logfile..."
run_sqlplus "${tmp2}" "
alter system switch logfile;
spool "${tmp2}"
set escape /
declare
l_max_archive_log varchar2(2000);
l_max_sequence_number number;
begin
select trim(replace(replace(value, '/%s', sequence#), '/%t', thread#)), sequence#
into l_max_archive_log, l_max_sequence_number
from (select thread#, max(sequence#) sequence#
from v\$log_history
group by thread#) a,
v\$parameter b
where b.name='log_archive_format';
dbms_output.put_line(l_max_archive_log||' '||l_max_sequence_number);
exception
when others then
dbms_output.put_line('Error obtaining current archive log name and maximum archive log sequence, ' || sqlcode );
:return := 114;
end;
/
spool off"
exit_code=$?
chk_error_status ${exit_code} $0
if [ $(cat ${tmp2} | wc -l) -gt 2 ]; then
exit_code=117
chk_error_status ${exit_code} $0
else
current_archive_log=$(tail -1 "${tmp2}" | "${awk}" '{ print $1 }')
# max_sequence_number not used right now, storing it just in case...
max_sequence_number=$(tail -1 "${tmp2}" | "${awk}" '{ print $2 }')
fi
}

#======================================================================================================
# Function -> Copy_archive_logs #
#======================================================================================================
# Description: Copy archive logs to backup directory and remove them from log_archive_log_dest_n #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function copy_archive_logs {
verbose "$(date) - Copying archive logs name..."
find "${log_archive_dest_n}" -type f -newer "${log_archive_dest_n}"/"${current_archive_log}" | \
sort -r > "${archive_log_files}" 2>> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
echo "${log_archive_dest_n}"/"${current_archive_log}" >> "${archive_log_files}"
number_of_archive_logs=$(cat "${archive_log_files}" | wc -l)
cat "${archive_log_files}" >> "${tmp3}" 2>> "${logfile}"
cat "${tmp3}" 2>> "${logfile}" |
while read archive_log_file
do
file_name=${archive_log_file##/*/}
cp "${archive_log_file}" "${dir}"/"${file_name}" 2>> "${logfile}"
rm "${archive_log_file}" 2>> "${logfile}"
done
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# Function -> Copy_config_files #
#======================================================================================================
# Description: Copy database configuration files: #
# init$ORACLE_SID.ora #
# orapw$ORACLE_SID #
# listener.ora #
# sqlnet.ora #
# tnsnames.ora #
# Parameters: None, used internally #
# Syntax: N/A #
#======================================================================================================

function copy_config_files {
cp "${ORACLE_HOME}"/dbs/init"${sid}".ora "${dir}"/init"${sid}".ora 2>> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
if [ $(grep -i "remote_login_passwordfile" "${ORACLE_HOME}"/dbs/init"${sid}".ora | \
grep -v "#" | "${awk}" -F"=" '{ print toupper($2) }') = "EXCLUSIVE" ]; then
cp "${ORACLE_HOME}"/dbs/orapw"${sid}" "${dir}"/orapw"${sid}" 2>> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
fi
cp "${ORACLE_HOME}"/network/admin/listener.ora "${dir}"/listener.ora 2>> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
cp "${ORACLE_HOME}"/network/admin/sqlnet.ora "${dir}"/sqlnet.ora 2>> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
cp "${ORACLE_HOME}"/network/admin/tnsnames.ora "${dir}"/tnsnames.ora 2>> "${logfile}"
exit_code=$?
chk_error_status ${exit_code} $0
}

#======================================================================================================
# MAIN Processing #
#======================================================================================================

# Check the backup options
# ---------------------------
if [ "${backup}" != "COLD" ] && [ "${backup}" != "HOT" ]; then
usage "-b option must be COLD or HOT"
exit_code=107
chk_error_status ${exit_code} $0
fi

# Check directory permissions
# ---------------------------
if [ ! -d "${dir}" ] || [ ! -r "${dir}" ] || [ ! -w "${dir}" ]; then
usage "check directory permissions"
exit_code=108
chk_error_status ${exit_code} $0
fi

# Check the force options
# ---------------------------
if [ "${option}" != "NO" ] && [ "${option}" != "YES" ]; then
usage "-f option must be YES or NO"
exit_code=120
chk_error_status ${exit_code} $0
fi

# Check the Oracle SID ...
# --------------------
# If no -i parameter was specified, use the (saved) value of the $ORACLE_SID
# on entry to this script ...
if [ "${sid}" = "undefined" ]; then
[ "${saved_sid}" ] && sid="${saved_sid}"
fi

# If there wasn't a defined, saved value of $ORACLE_SID on entry to the script
# use the value of $ORACLE_SID set in the .profile ...
if [ "${sid}" = "undefined" ]; then
[ "${ORACLE_SID}" ] && sid="${ORACLE_SID}"
fi

# If $sid is still undefined, report an error ...
if [ "${sid}" = "undefined" ]; then
usage "No valid Oracle SID (database identifier) specified."
exit_code=109
chk_error_status ${exit_code} $0
fi

# check if $ORACLE_HOME is set
[ ! "${ORACLE_HOME}" ] && exit_code=124 && chk_error_status ${exit_code} $0

# check if sid is in oratab
if grep -v "#" "${oratab}" | grep -w "${sid}" >/dev/null 2>&1; then
	OLDHOME=$ORACLE_HOME
	export ORACLE_HOME=$(grep -w "${sid}" "${oratab}" | "${awk}" -F":" '{ print $2 }')
	export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data
	export LD_LIBRARY_PATH=$ORACLE_HOME/lib
	export ORACLE_SID="${sid}"
	export PATH=$(echo $PATH | sed "s;$OLDHOME/bin;$ORACLE_HOME/bin;g")
else
	exit_code=123
	chk_error_status ${exit_code} $0
fi

# Check the -n and -t options
# ---------------------------
if [ "${type}" != "TABLESPACE" ] && [ "${type}" != "FULL" ]; then
usage "-t option must be FULL or TABLESPACE"
exit_code=110
chk_error_status ${exit_code} $0
fi

if [ "${type}" = "TABLESPACE" ] && [ "${backup}" = "HOT" ]; then
# A tablespace name must be specified if "-t TABLESPACE" is used...
if [ "$tabsp2" = "" ]; then
usage "-n option must be used if -t TABLESPACE is specified"
exit_code=111
chk_error_status ${exit_code} $0
fi
elif [ "${type}" = "FULL" ] && [ "${backup}" = "HOT" ]; then
# Tablespace name not allowed if we are making FULL hot backup...
if [ "$tabsp2" ]; then
usage "-n option cannot be used if -t FULL is specified"
exit_code=121
chk_error_status ${exit_code} $0
fi
elif [ "${type}" = "FULL" ] && [ "${backup}" = "COLD" ]; then
# Tablespace name not allowed if we are making FULL cold backup...
if [ "$tabsp2" ]; then
usage "-n option cannot be used if -t FULL is specified"
exit_code=121
chk_error_status ${exit_code} $0
fi
else
usage "-t -n option can only be used for hot backups and tablespace backups"
exit_code=119
chk_error_status ${exit_code} $0
fi

# Check log directory permissions
# -------------------------------
if [ "${logfile}" != "/dev/null" ]; then
logdir=$(dirname ${logfile})
if [ ! -r "$logdir" ] || [ ! -w "$logdir" ]; then
usage "Check log directory permissions"
exit_code=113
chk_error_status ${exit_code} $0
fi
fi

restore_script="${dir}/restore_${sid}_$$.ksh"

cat << ! >> "${logfile}"
=====================================================================================
=
= #### ##### ## ##### #####
= # # # # # # #
= #### # # # # # #
= # # ###### ##### #
= # # # # # # # #
= #### # # # # # #
=
= Starting ${sid} database backup process
= located at server $(uname -n) $(date)
=
=====================================================================================
!

# Check if I am in DBA group
# ---------------------------
chk_dba_group

if chk_database_up; then
chk_dupe_files
obtain_control_files
obtain_data_files
chk_free_space
chk_backup_status
elif [ "${option}" = "YES" ]; then
echo "Database is not up but -f option is used!" >> "${logfile}"
stop_database="YES"
startup_database
chk_dupe_files
obtain_control_files
obtain_data_files
chk_free_space
chk_backup_status
else
exit_code=106
chk_error_status ${exit_code}
fi

if [ "$backup" = "COLD" ] && chk_database_up; then
shutdown_database
backup_database
backup_control_files
startup_database
backup_ascii_control_file
generate_restore_script
else
# Check if database meets the conditions to take hot backup
chk_archive_log
# Archive current log and get the last archived log file name
get_current_archive_log
sleep 5
if [ "$type" = "FULL" ]; then
"${awk}" '{print $1}' "${db_files}" | \
while read tabsp2
do
backup_tablespace "${tabsp2}"
done
exit_code=$?
chk_error_status ${exit_code}
fi
if [ "$type" = "TABLESPACE" ]; then
if ! grep -w "${tabsp2}" "${db_files}" > /dev/null 2>&1; then
exit_code=112
chk_error_status ${exit_code}
fi
# Single tablespace backup
# ------------------------
backup_tablespace "${tabsp2}"
fi
backup_control_files
# Finally archive the current redo log again and create a backup controlfile (ASCII)...
# --------------------------------------------------------------------------------------
verbose "$(date) - Archiving current redo log and creating backup control file\n"
run_sqlplus "${logfile}" "
alter system switch logfile;"
exit_code=$?
chk_error_status ${exit_code}
sleep 120
copy_archive_logs
backup_ascii_control_file
generate_restore_script
fi

chk_backup_status
leave_database_as_before
copy_config_files

cat << ! >> "${logfile}"
=====================================================================================
=
= ###### # # # # #### # # ###### #####
= # # ## # # # # # # # #
= ##### # # # # # #### ###### ##### # #
= # # # # # # # # # # # #
= # # # ## # # # # # # # #
= # # # # # #### # # ###### #####
=
= Finished ${sid} database backup process
= located at server $(uname -n) $(date)
=
=====================================================================================
!

exit $?
