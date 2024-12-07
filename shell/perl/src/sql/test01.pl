#!/usr/bin/perl -w

# Verbindung zum Oracle-Server Tabelle adresse located in test kontaktieren

use DBI;

my $mydb= DBI->connect( "DBI:mysql:buchhaltung", "pfistera", "andreas");

if (not $mydb){
	print "\n Server konnte nicht ermittelt werden";
	exit(1);}

my $query = 'select * from firma';
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;

#my ($t1, $t2, $t3);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);

print "\n","**** Listenanfang ****","\n";

while ($ausgabe->fetch){
	print "T1 = $t1 T2 = $t2 T3 = $t3","\n";}

print "**** Ende der Liste ****","\n";

$mydb->disconnect;
