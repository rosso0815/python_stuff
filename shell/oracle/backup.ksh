#!/bin/ksh

#
# db_cold_backup.ksh(1) - Cold tape backup script.
#


# USAGE
#
# db_cold_backup
#
# e.g.: db_cold_backup mydb \
# /dev/rmt/0hn \
# ~oracle/admin/mydb/backup/mydb_files_for_backup
#
# Note: must be non-rewinding (filename should end with 'n').


cpio_out_opts="-ocB"
dd_out_opts="bs=10240k"
ufs_out_opts="0f"
sep="------------------------------------------------------------------------"


# Functions.

run()
# Run the supplied command. A message, with the current time, is printed
# before and after command execution.
{
r_command="$*"

echo "$prog `date`: start: $r_command"
$*
echo "$prog `date`: end: $r_command"
}


# Validate environment.

# Check the Oracle 'dbhome' script can be found.
if type dbhome >/dev/null; then
:
else
echo "$prog: Oracle script 'dbhome' not in PATH" >&2
echo "$prog: plese correct PATH environment variable setting" >&2
exit 1
fi

# Find the Oracle home directory.
ora_home=`dbhome
`


# Check command usage.

prog="`basename $0`"
usage="usage: $prog "
num_args=3

command="$prog $*"

if [ $# -ne $num_args ]; then
echo "$prog: expected $num_args arguments; $# were supplied" >&2
echo "$usage" >&2
exit 1
fi

ora_sid=$1
db_file_list_file=$2
tape_dev=$3


# Validate arguments.

if dbhome $ora_sid >/dev/null; then
:
else
echo "$prog: database \"$ora_sid\" does not exist (i.e. not in 'oratab' file)" >&2
echo "$usage" >&2
exit 1
fi

if [ ! -r $db_file_list_file ]; then
echo "$prog: cannot read database file list file \"$db_file_list_file\"" >&2
echo "$usage" >&2
exit 1
fi

if [ ! -c $tape_dev ]; then
echo "$prog: \"$tape_dev\" is not a tape device" >&2
echo "$usage" >&2
exit 1
fi

if [ ! -r $tape_dev ]; then
echo "$prog: cannot read from tape device \"$tape_dev\"" >&2
echo "$usage" >&2
exit 1
fi

if [ ! -w $tape_dev ]; then
echo "$prog: cannot write to tape device \"$tape_dev\"" >&2
echo "$usage" >&2
exit 1
fi


# Check database is shutdown.

if ps -ef|grep -v grep|grep ora_pmon_$ora_sid >/dev/null; then
echo "$prog: database \"$ora_sid\" is not shutdown" >&2
exit 1
fi


# Setup logging.

# This directory should exist if the site is OFA compliant.
log_dir_base=$ora_home/admin/$ora_sid/udump

if [ ! -d $log_dir_base ]; then
echo "$prog: directory \"$log_dir_base\" for log of backup does not exist" >&2
exit 1
fi

log_dir=${log_dir_base}/${prog}.log

if [ ! -d $log_dir ]; then
mkdir $log_dir || exit 1
fi

log_file="${log_dir}/$prog.${ora_sid}.`date '+%Y%m%d'`.$$.log"

# Create a pipe and have tee(1) duplicate the output to the log file.
log_pipe=/tmp/${prog}.pipe.$$
mknod $log_pipe p || exit 1
tee -a $log_file <$log_pipe &
exec >>$log_pipe 2>&1


# Names for working files.

db_filesystem_file_list_file=/tmp/${prog}.fs.$$
db_raw_file_list_file=/tmp/${prog}.raw.$$
ufs_list_file=/tmp/${prog}.ufs.$$
tape_directory_file=/tmp/${prog}.tapedir.$$


# Exit function; cleans up temporary files.

local_exit()
{
# Rewind & eject the tape to prevent it being inadvertantly erased.
run mt -f $tape_dev offline
echo "$prog `date`: end: $command"
rm -f $log_pipe \
$db_filesystem_file_list_file \
$db_raw_file_list_file \
$tape_directory_file
exit $1
}


# Startup.

echo "$prog `date`: start $command"


# Check all files in the database file list are readable.

exec 3<$db_file_list_file # open $db_file_list_file for reading

while read db_file <&3; do
if [ ! -r $db_file ]; then
echo "$prog: database file \"$db_file\" cannot be read" >&2
echo "$prog: backup aborted"
local_exit 1
fi
done

exec 3<&- # close $db_file_list_file


# Classify files into filesystem and raw files.

exec 3<$db_file_list_file
exec 4>$db_filesystem_file_list_file
exec 5>$db_raw_file_list_file
exec 6>$ufs_list_file

while read db_file <&3; do
if [ -f "$db_file" ]; then
# Filesystem file.
echo "$db_file" >&4
elif [ -c "$db_file" ]; then
# Raw file or Filesystem
egrep -s "$db_file[ ]" /etc/vfstab
if [ $? -ne 0 ]; then
# Raw file
echo "$db_file" >&5
else
# Filesystem
echo "$db_file" >&6
fi
else
echo "$prog: database file \"$db_file\" is not a raw or filesystem file"
echo "$prog: backup aborted"
local_exit 1
fi
done

exec 3<&- # close $db_file_list_file
exec 4<&- # close $db_filesystem_file_list_file
exec 5<&- # close $db_raw_file_list_file
exec 6<&- # close $ufs_list_file


# Compose file directory to be written to start of tape.

exec 3>$tape_directory_file
let file_no=0

# Tape directory - header.
echo "$prog: tape directory" >&3
echo "" >&3
echo "cold database backup created using command: " >&3
echo "\t$command" >&3
echo "" >&3
echo "host: `hostname`" >&3
echo "database: $ora_sid" >&3
echo "date: `date`" >&3
echo "" >&3
echo "[file ${file_no}]\ttape directory (this file) in cpio ${cpio_out_opts} format" >&3

# Tape directory - filesystem files.
if [ -s $db_filesystem_file_list_file ]; then
# filesystem file list not empty
let file_no=file_no+1
echo "[file ${file_no}]\tcpio ${cpio_out_opts} archive containing the filesystem files:" >&3

# list filesystem files
exec 4<$db_filesystem_file_list_file
while read db_file <&4; do
echo "\t\t\t$db_file" >&3
done
exec 4<&- # close $db_filesystem_file_list_file
fi

# Tape directory - raw files.
if [ -s $db_raw_file_list_file ]; then
# raw file list not empty
exec 4<$db_raw_file_list_file
while read db_file <&4; do
let file_no=file_no+1
echo "[file ${file_no}]\tdd $dd_out_opts of $db_file" >&3
done
exec 4<&- # close $db_raw_file_list_file
fi

# UFS direcotry - ufs filesystem.
if [ -s $ufs_list_file ]; then
# ufs list not empty
exec 4<$ufs_list_file
while read ufs_file <&4; do
let file_no=file_no+1
echo "[file ${file_no}]\tufsdump $ufs_out_opts of $ufs_file" >&3
done
exec 4<&- # close $ufs_list_file
fi

# Tape directory - backup log.
let file_no=file_no+1
echo "[file ${file_no}]\tbackup log in cpio ${cpio_out_opts} format" >&3

exec 3<&- # close $tape_directory_file

# Print tape directory.
echo $sep
cat $tape_directory_file
echo $sep


# Ensure tape is rewound.

echo "$prog: Do you want to rewind tape(y/n)?"
#run mt -f $tape_dev rewind

read ans

case "$ans" in
y|Y)
run mt -f $tape_dev rewind ;;
n|N)
;;
*)
echo " Please type y or n"
esac

echo "$prog: tape status"
run mt -f $tape_dev status

# Write out the tape directory.

echo "$prog: writing out tape directory"
echo "$prog `date`: start: echo $tape_directory_file | cpio $cpio_out_opts >$tape_dev"
echo $tape_directory_file | cpio $cpio_out_opts >$tape_dev
status=$?
echo "$prog `date`: end: echo $tape_directory_file | cpio $cpio_out_opts >$tape_dev"
if [ $status -ne 0 ]; then
echo "$prog: ERROR: cpio (errno=$status)" >&2
echo "$prog: backup aborted" >&2
local_exit 1
fi

run mt -f $tape_dev status


# Write out the filesystem files.

if [ -s $db_filesystem_file_list_file ]; then
echo "$prog: writing out filesystem files"
echo "$prog `date`: start: cpio $cpio_out_opts >$tape_dev <$db_filesystem_file_list_file"
cpio $cpio_out_opts >$tape_dev <$db_filesystem_file_list_file
status=$?
echo "$prog `date`: end: cpio $cpio_out_opts >$tape_dev <$db_filesystem_file_list_file"
if [ $status -ne 0 ]; then
echo "$prog: ERROR: cpio (errno=$status)" >&2
echo "$prog: backup aborted" >&2
local_exit 1
fi
run mt -f $tape_dev status
fi


# Write out the raw files.

if [ -s $db_raw_file_list_file ]; then

echo "$prog: writing out raw files"

exec 3<$db_raw_file_list_file

while read db_file <&3; do
echo "$prog `date`: start: dd $dd_out_opts if=$db_file of=$tape_dev"
dd $dd_out_opts if=$db_file of=$tape_dev
status=$?
echo "$prog `date`: end: dd $dd_out_opts if=$db_file of=$tape_dev"
if [ $status -ne 0 ]; then
echo "$prog: ERROR: dd (errno=$status)" >&2
echo "$prog: rewinding and ejecting tape" >&2
run mt -f $tape_dev offline
echo "$prog: insert a new tape and press [enter] to continue"
read dummy
run mt -f $tape_dev rewind
if [ $? -ne 0 ]; then
echo "$prog: ERROR: mt (errno=$status)" >&2
echo "$prog: backup aborted" >&2
local_exit 1
fi
echo "$prog `date`: start: dd $dd_out_opts if=$db_file of=$tape_dev"
dd $dd_out_opts if=$db_file of=$tape_dev
status=$?
echo "$prog `date`: end: dd $dd_out_opts if=$db_file of=$tape_dev"
fi
run mt -f $tape_dev status
done

exec 3<&- # close $db_raw_file_list_file
fi


# Write out the ufs filesystems.

if [ -s $ufs_list_file ]; then

echo "$prog: writing out ufs filesystems"

exec 3<$ufs_list_file

while read ufs_file <&3; do
echo "$prog `date`: start: /usr/sbin/ufsdump $ufs_out_opts $tape_dev $ufs_file"
/usr/sbin/ufsdump $ufs_out_opts $tape_dev $ufs_file
status=$?
echo "$prog `date`: end: ufsdump $ufs_out_opts $tape_dev $ufs_file"
if [ $status -ne 0 ]; then
echo "$prog: ERROR: ufsdump (errno=$status)" >&2
echo "$prog: backup aborted" >&2
local_exit 1
fi
run mt -f $tape_dev status
done

exec 3<&- # close $ufs_list_file
fi

# Write out tape backup log.

echo "$prog: writing out tape backup log"
cd `dirname $log_file`
echo "$prog `date`: start: echo `basename $log_file` | cpio $cpio_out_opts >$tape_dev"
echo `basename $log_file` | cpio $cpio_out_opts >$tape_dev
status=$?
echo "$prog `date`: end: echo `basename $log_file` | cpio $cpio_out_opts >$tape_dev"
if [ $status -ne 0 ]; then
echo "$prog: ERROR: cpio (errno=$status)" >&2
echo "$prog: backup aborted" >&2
local_exit 1
fi

run mt -f $tape_dev status


# Cleanup.

echo "$prog: backup complete"

local_exit 0
