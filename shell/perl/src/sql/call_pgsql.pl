#!/usr/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual 
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use strict;
use DBI;
use Env;
use Data::Dumper;

my $db= DBI->connect( "DBI:Pg:dbname=pfistera" );

if ( not $db) {
    print "\n Server konnte nicht ermittelt werden";
    exit(1); 
}

my $query = 'select count(*) from employees';
my $ausgabe = $db->prepare($query);
my $rv=$ausgabe->execute;
#print "\nRV=", $rv;
#print "\nTables = ", $mydb->listtables;
my ($t1, $auskunft );
$ausgabe->bind_col( 1, \$t1);
#$auskunft = $mydb->type_info_all;
#print "\nINFO=", $auskunft;
#print Dumper( $auskunft);
while ($ausgabe->fetch)	{
    print "\nWert = ", $t1;
    #print "\nDUMPER ", Dumper( $t1);	
}
$db->disconnect;
printf("\n### ENDE ###\n");
