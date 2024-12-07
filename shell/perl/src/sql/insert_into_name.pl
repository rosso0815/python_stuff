#!/usr/bin/perl -w
#          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001
#

use DBI;

my $mydb= DBI->connect( "DBI:mysql:Dokumenta", "root", "password") or die "\n Server konnte nicht ermittelt werden";

# SQL = insert into TABELLE ( name,vorname,strasse,plz,ort) values ('pfister'.....)
# Wir erzeugen 10000 Datensatze
# mittels rand
for ($i=0; $i < 10000; $i++) 
	{
	$name = int(rand 10000) + 1;
	$vorname = int(rand 10000) + 1;
	$strasse = int(rand 10000) + 1;
	$plz = int(rand 1000) + 1;
	$ort = int(rand 10000) + 1;
	$query = "insert into user (name,vorname,strasse,plz,ortschaft) values (" 
		. $name . "," . $vorname . "," . $strasse . "," . $plz . "," . $ort . " );" ;
	print "QUERY = ", $query, "\n";
	$mydb->do($query);
	# <STDIN>;
	}

$mydb->disconnect;
