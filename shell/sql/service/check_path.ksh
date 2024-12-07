#!/usr/bin/perl -w
#===================================================================================
#
#         FILE:  check_path.ksh
#
#        USAGE:  ./check_path.ksh 
#
#  DESCRIPTION:  
#
#        FILES:  ---
#        NOTES:  ---
#       AUTHOR:    <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  01/12/04 09:32:14 NFT
#     REVISION:  ---
#===================================================================================

use strict;


#!/bin/ksh

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Fri Jan  9 12:57:08 NFT 2004
## Aufruf   : ./check_path.ksh "system/manager@vpmdma" "DMAGS1"
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Fri Jan  9 12:57:08 NFT 2004      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

#set -x

export OUTPUT=/tmp/output.txt
export REPORT=/tmp/report.txt
export DB_CONNECT=$1
export VPM_ENV=$2

rm $OUTPUT
rm $REPORT

sqlplus -s $DB_CONNECT <<EOF > $OUTPUT
set pagesize 0
set pause off
set heading off
set feedback 0
select replace(SUBSTR(DUMP( "\$CUR_ACC_MET_DATA",17), 16), ',','') from $VPM_ENV."\$EXT_LF";
exit
EOF

# uberprufe files
while read -r file
do
	if [[ ! -a $file ]];then
		echo "datei existiert nicht" >> $REPORT
		echo "$file\n" >> $REPORT
	fi
done < $OUTPUT
rm $OUTPUT

# und reverse
find /DMAVPM -type f > $OUTPUT

rm  /tmp/sql_error.txt

while read -u6 -r file
do
	echo "check datei=$file"

#	sqlplus -s $DB_CONNECT <<EOF > /tmp/sql_error.txt
#	set pagesize 0
#	set pause off
#	set heading off
#	set feedback 0
#	select 
#		count(*)
#	from $VPM_ENV."\$EXT_LF"
#	where
#		replace(SUBSTR(DUMP( "\$CUR_ACC_MET_DATA",17), 16),',','')
#	like 
#	'%$file%';
#	exit;
#EOF
#	if grep 0  /tmp/sql_error.txt;then
#		echo "datei $file nicht in db vorhanden" >> $REPORT
#	fi
	grep $file $OUPUT
	if $0 ; then
		echo "nfs-datei $file"
	fi
	
done 6< $OUTPUT
