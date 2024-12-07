#!/bin/bash
##############################################################
# program: OptimiseDB.sh
#
# note: Optimize_mode should be enabled in the database before running this 
#
# history:
# 
# 22.07.04 dak created
# 06.10.06 apf fix for a defined user
#
##############################################################

# set -x 

displayArgs () {
	echo "usage: OptimiseDB.sh -d <database> -u <user>"
	exit 1
}

if [[ $# < 1 ]];then
	echo "error: no arguments"
	exit
fi

while getopts ":u:d:h" options; do
  case $options in
    u ) username=$OPTARG;;
    d ) database=$OPTARG;;
    h ) displayArgs;;
    * ) displayArgs
          exit 1;;

  esac
done

echo "Optimising of database=$database for user=$username; starting at `date`...."

ORACLE_SID=$database;export ORACLE_SID

sqlplus -s /nolog <<EOF
connect / as sysdba;
EXECUTE dbms_stats.gather_schema_stats( ownname=>'$username', estimate_percent=>10 , cascade=>TRUE);
exit
EOF

echo "Optimisation complete at `date`...."
