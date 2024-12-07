#!/usr/bin/perl -w

# Verbindung zum Oracle-Server Tabelle adresse located in test kontaktieren

use DBI;

my $mydb= DBI->connect( "DBI:mysql:Dokumenta", "root", "password");

if (not $mydb){
	print "\n Server konnte nicht ermittelt werden";
	exit(1);}

my $query = 'select id,name,vorname,strasse from user';
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;

#my ($t1, $t2, $t3);
#$ausgabe->bind_col( 1, \$t1, undef);
#$ausgabe->bind_col( 2, \$t2, undef);
#$ausgabe->bind_col( 3, \$t3, undef);

print "\n","**** Listenanfang ****","\n";
my $daten  = $ausgabe->fetchall_arrayref();
my $zeilen = $ausgabe->rows();

print "Anzahl Zeilen = ", $zeilen, "\n";
for ( $i=0; $i < $zeilen; $i++)
	{
	print "Daten = ", $daten->[$i][1], " ",$daten->[$i][2], " ", $daten->[$i][3], "\n";
	}
print "*§*** Ende der Liste ****","\n";


$mydb->disconnect;
