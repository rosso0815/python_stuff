#!/usr/bin/env bash

# user    :
# comment :
# version :
#

# source $HOME/lib/b.lib.sh

SQLFILE=/tmp/runsql_$$.sql

echo generate sql
cat > $SQLFILE << _EOF
connect grails/grails@'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SID=XE)))'
SET TERMOUT OFF
set colsep ,
set pagesize 0
set trimspool on
set headsep off
set linesize 150
spool /tmp/sql.txt
select sysdate from dual;
spool off
exit;
_EOF

# cat $SQLFILE

export DYLD_LIBRARY_PATH=/Users/pfistera/bin/sqlplus/
$DYLD_LIBRARY_PATH/sqlplus -s /nolog @$SQLFILE
if [[ "$?" -ne "0" ]] ; then
	echo Error sqlplus $?
fi
echo show /tmp/sql.txt

cat /tmp/sql.txt

rm /tmp/sql.txt

rm /tmp/runsql_$$.sql


