#!/usr/opt/freeware/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 06.01.03
# Aufruf   : manual 
# Funktion : Anzeige und Aendern von Status maturity in DMAGS1.2
# Version  : 001

use DBI;
use Env;

# check startup
if (@ARGV == 0){
        print "\nKein Partname angegeben\n";
        exit;}

my $part_name=$ARGV[0];

#Datenbank-Connection
my $mydb= DBI->connect( "DBI:Oracle:DMA12", "DMAGS1", "DMAGS1");

if (not $mydb)
	{
	print "\n Server konnte nicht ermittelt werden";
	exit(1);
	}


# SELECT PARTNUMMER,VERSION,TYPE-REP,REVISION fuer eindeutigkeit
# c."$COMPID" ist eindeutiger bezeichner von catia_model
my $query = "select p.s_part_number, p.s_version, c.s_type_rep,c.s_revision, c.\"\$COMPID\"
 from part_list p, catia_model c
 where p.\"\$COID\" = c.\"\$COID\"
 AND
 p.s_part_number like '%$part_name%'
 AND
 p.C_ORG_RESPONSIBLE like 'NEU'";

my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;
my ($t1, $t2, $t3, $t4);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);
$ausgabe->bind_col( 4, \$t4, undef);
$ausgabe->bind_col( 5, \$t5, undef);

print "\n***********************************************************************************";
printf "\n%-25s%-10s%-15s%-15s%-20s","PARTNUMMER","VERSION","TYPE-REP","REVISION","COMPID" ;
print "\n***********************************************************************************";

while ($ausgabe->fetch) {
	printf("\n%-25s%-10s%-15s%-15s%-20s",$t1, $t2, $t3, $t4, $t5); }

# Werte einlesen
print "\n\n Bitte die Werte eingeben";
print "\n => COMPID ? = ";
my $compid = <STDIN>;
chop($compid);
print " => REP-TYPE[ MASTER DRAWING DRAFT ] ?  = ";
my $reptype= <STDIN>;
chop($reptype);

# Datenbankeintraege aendern
# zuerst nach eindeutigkeit schauen
$query = "select count(*)
	from catia_model
	where
	catia_model.\"\$COMPID\" = '$compid'";
	
$ausgabe->finish();
$ausgabe = $mydb->prepare($query);
$ausgabe->execute;
my $anzahl = $ausgabe->fetch->[0];
$ausgabe->finish();
if ($anzahl != 1) {
	print "\n** Anzahl gefundener Werte = ", $anzahl;
	print "\n** Nicht eindeutige Definition, Programm wird abgebrochen ! ***\n";
	exit;}

# und eintrag aendern
# mit Index-unique update
$query = "select  \"\$COID\", S_NEXT, S_REVISION, S_TYPE_REP
 from catia_model 
 where \"\$COMPID\" ='$compid'";
$ausgabe = $mydb->prepare($query);
$ausgabe->execute;
$ausgabe->bind_col( 1, \$t1, undef);                                            
$ausgabe->bind_col( 2, \$t2, undef);                                            
$ausgabe->bind_col( 3, \$t3, undef);
$ausgabe->bind_col( 4, \$t4, undef);
$anzahl=0;
while ( $ausgabe->fetch){ $anzahl=$anzahl+1;}
print "FETCH/ANZAHL = ", $anzahl, " t1 ", $t1, " t2 ", $t2," t3 ", $t3, "\n";

$query = "update catia_model set s_type_rep = '$reptype'
	where
	\"\$COID\" = '$t1'
	AND
	S_NEXT = '$t2'
	AND
	S_REVISION = '$t3'
	AND
	S_TYPE_REP = '$t4'";

print "\nQUERY= ", $query;
$ausgabe = $mydb->prepare($query);
$ausgabe->execute;
$ausgabe->finish();
# 
# und tschuess mit SQL
$ausgabe->finish();
$mydb->disconnect;
printf("\n");
