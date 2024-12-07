#!/bin/ksh

export PATH=/usr/local/bin:$PATH

# Locate oratab file, exit if we can't find it
if [ -f /etc/oratab ]; then
  ORATAB="/etc/oratab" ;
elif [ -f /var/opt/oracle/oratab ]; then
  ORATAB="/var/opt/oracle/oratab" ;
else
  echo
  echo "ERROR: Unable to locate oratab file"
  exit 1 ;
fi

for i in `egrep '^[a-zA-Z].*:.*:.*$' $ORATAB | awk -F: '{ print $1}' | sort -u `
do
  
   export ORACLE_SID=$i
   export ORAENV_ASK=NO
   . oraenv 2>/dev/null

   sqlplus -s "/ as sysdba" << EOF 2>/dev/null
compute sum of Mb on report
break on report
col Mb form 999,999
select name, 'DataFiles', sum(df.bytes)/1024/1024 Mb 
from dba_data_files df, v\$database
group by name
union
select name, 'TempFiles', sum(tf.bytes)/1024/1024 Mb 
from dba_temp_files tf, v\$database
group by name;
exit
EOF

done
