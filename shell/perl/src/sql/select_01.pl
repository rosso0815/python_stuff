#!/usr/bin/perl -w
          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use DBI;

print "\nDRIVERS =", DBI->available_drivers, "\n";

my $mydb= DBI->connect( "DBI:mysql:Dokumenta", "root", "password") or die "\nERROR => ", $DBI::errstr;

my $query = 'select id,name,vorname,bemerkung from user';
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;

my ($t1, $t2, $t3, $t4);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);
$ausgabe->bind_col( 4, \$t4, undef);


print "\n**** Listenanfang ****\n";

while ($ausgabe->fetch)
	{
	print "\n$t1\t$t2 $t3 $t4";
	#<STDIN>;
	}

print "**** Ende der Liste ****","\n";

$mydb->disconnect;
