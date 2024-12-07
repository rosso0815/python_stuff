#!/usr/bin/perl -w

# Erzeuger : pfistera
# Datum    : 2003.9.5
# Aufruf   : 
# Funktion : testen von internen mysql funktionen
# Version  : 001
# Keyword  : mysql test

use DBI;
#use DBD::mysql;
use Data::Dumper;

my $mydb= DBI->connect( "DBI:mysql:dokumenta", "pfistera", "andreas");

if (not $mydb){
	print "\n Server konnte nicht ermittelt werden";
	exit(1);}

#my $query = 'select path, owner, size from dokument';
my $ausgabe = $mydb->prepare('describe dokument');
#my $ausgabe = $mydb->prepare('select path, owner, size from dokument');

$ausgabe->execute;
my $ar = $ausgabe->fetchall_arrayref();
my ($iline, $yline);

print "\n","**** Listenanfang ****","\n";
foreach  $iline (@$ar){
	foreach $yline ( @$iline) {
		if ( $yline){
			print "\nAusgabe : ", $yline;}
		}
	print "\n";
	}
print "**** Ende der Liste ****","\n";

#print Dumper( $ar);
$mydb->disconnect;
