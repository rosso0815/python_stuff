#!/usr/bin/ksh
set -x

# tabelle klein
sqlplus pfistera/andreas@test02<<EOF
drop table klein;
create table klein(k integer);
exit;
EOF

outputfile=/tmp/run.sql
rm -f $outputfile

i=0
while (( $i < 100000 ))
	do
	echo "insert into klein (k) values ($i);" >> $outputfile
	((i=$i+1))
	done
echo "exit;" >> $outputfile
	
sqlplus pfistera/andreas@test02 @$outputfile

sqlplus pfistera/andreas@test02<<EOF
create index ix_klein on klein(k);
exit;
EOF


# und zweite tabelle
sqlplus pfistera/andreas@test02<<EOF
drop table gross;
create table gross(g integer);
exit;
EOF

outputfile=/tmp/run.sql
rm -f $outputfile

i=0
while (( $i < 100000 ))
        do
        echo "insert into gross (g) values ($i);" >> $outputfile
        ((i=$i+1))
        done
echo "exit;" >> $outputfile

sqlplus pfistera/andreas@test02 @$outputfile

sqlplus pfistera/andreas@test02<<EOF
create index ix_gross on gross(g);
exit;
EOF

# mittel
sqlplus pfistera/andreas@test02<<EOF
drop table mittel;
create table mittel(m integer);
exit;
EOF

outputfile=/tmp/run.sql
rm -f $outputfile

i=0
while (( $i < 100000 ))
        do
        echo "insert into mittel (m) values ($i);" >> $outputfile
        ((i=$i+1))
        done
echo "exit;" >> $outputfile

sqlplus pfistera/andreas@test02 @$outputfile

sqlplus pfistera/andreas@test02<<EOF
create index ix_mittel on mittel(m);
exit;
EOF

#alter table
ALTER TABLE GROSS
	ADD ( text VARCHAR2(25) NULL );

# und tabelle updaten
outputfile=/tmp/run.sql
rm -f $outputfile

i=0
while (( $i < 100000 ))
        do
        echo "update gross set text = '$RANDOM'  where g = '$i';" >> $outputfile
        ((i=$i+1))
        done
echo "exit;" >> $outputfile

sqlplus pfistera/andreas@test02 @$outputfile

						
