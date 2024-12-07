#!/usr/local/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual 
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use DBI;
use Env;

# Suchtext einlesen und Zeilenvorschub entfernen
print "Bitte Teiltext von Partnummer eingeben : ";
$suchtext=<STDIN>;
chop($suchtext);

# DB bearbeiten
my $mydb= DBI->connect( "DBI:Oracle:DMA12_CATIASV01", "DMAGS1", "DMAGS1");

if (not $mydb){
        print "\n Server konnte nicht ermittelt werden";
        exit(1); }

my $query = "select
	p.s_part_number, c.\"\$COMPID\", replace(dump( ex.\"\$CUR_ACC_MET_DATA\", 17),',',null)
	from
	part_list p, catia_model c, \"\$EXT_LF\" ex
	where
	p.s_part_number like '%$suchtext%'
	AND p.\"\$COID\" = c.\"\$COID\"
	AND c.\"\$COMPID\" = ex.\"\$COMPID_FATHER\"" ;

	
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;
my ($t1, $t2, $t3 );
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);

print "######################################";

while ($ausgabe->fetch)
	{
	printf("\npart_number= %s,\ns_version= %s,\npfad= %s",$t1, $t2, $t3);
	($t4 = $t3) =~ s/^(.*\/)//;
	# printf("\npath = %s",$t3);
	printf("\nNummer: %s\nPath  : %s\n\n",$t1, $t4);
        }
	
# und tschuess mit SQL
$mydb->disconnect;
printf("\n### ENDE ###\n");
