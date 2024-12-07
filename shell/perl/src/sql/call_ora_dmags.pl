#!/usr/local/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual 
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use DBI;
use Env;

my $mydb= DBI->connect( "DBI:Oracle:catiasv01_dma12", "DMAGS1", "DMAGS1");

if (not $mydb){
        print "\n Server konnte nicht ermittelt werden";
        exit(1); }

my $query = 'select s_part_number, s_version from part_list';
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;
my ($t1, $t2);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);

while ($ausgabe->fetch)
	{
	printf("\npart_number= %s, s_version= %s",$t1, $t2);
        }
# und tschuess mit MySQL
$mydb->disconnect;
printf("\n### ENDE ###\n");
