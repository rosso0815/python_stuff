#!/usr/opt/freeware/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 06.01.03
# Aufruf   : manual 
# Funktion : Anzeige und Aendern von Status maturity in DMAGS1.2
# Version  : 001

use DBI;
use Env;

#my $mydb= DBI->connect( "DBI:Oracle:DMA12_catiasv01", "DMAGS1", "DMAGS1");
my $mydb= DBI->connect( "DBI:Oracle:DMA12_caxws14", "DMAGS1", "DMAGS1");

if (not $mydb)
	{
	print "\n Server konnte nicht ermittelt werden";
	exit(1);
	}

my $query = "select p.s_part_number SNUMBER, p.s_version, p.c_maturity
	from part_list p
	where 
	p.c_maturity like 'DEL'
	AND 
	p.C_ORG_RESPONSIBLE like 'NEU'"; 

my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;
my ($t1, $t2, $t3);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);
print "\n***********************************************";
print "\nPARTNUMMER\tVERSION\tSTATUS";
print "\n***********************************************";

while ($ausgabe->fetch)
	{
	printf("\n%-15s\t%s\t%s",$t1, $t2, $t3);
	}
# Werte einlesen
print "\n\n Bitte die Werte eingeben";
print "\n => PARTNUMMER ? = ";
my $partnummer = <STDIN>;
chop($partnummer);
print " => VERSION ? = ";
my $version = <STDIN>;
chop($version);
# print "\nPARTNUMMER= ", $partnummer, " VERSION = ", $version ;

# Datenbankeintraege aendern
# zuerst nach eindeutigkeit schauen
$query = "select count(*)
	from part_list p
	where
	p.s_part_number like '$partnummer'
	AND
	p.s_version = '$version'";
	
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
$query = "update part_list set c_maturity = 'WIP'
	where s_part_number like $partnummer
	AND
	s_version = '$version'"; 

# print "\nQUERY= ", $query;
$ausgabe = $mydb->prepare($query);
$anzahl = $ausgabe->execute;
$ausgabe->finish();
print "\nANZAHL geaendert = ", $anzahl;
print "\nPART ", $partnummer, " VERSION ", $version, " STATUS = WIP";

# 
# und tschuess mit SQL
$ausgabe->finish();
$mydb->disconnect;
printf("\n");
