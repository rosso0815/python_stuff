#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Wed Oct  8 11:48:28 DFT 2003
## Aufruf   : 
## Funktion : testen von mysql
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Wed Oct  8 11:48:28 DFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

use DBI;
use Data::Dumper;

my $DB= DBI->connect( "DBI:mysql:dokumenta:caxws14",'pfistera' , 'andreas');

if (not $DB){
	print "\n Server konnte nicht ermittelt werden";
	exit(1);}

my $query = 'select path from dokument';
my @ar= $DB->selectrow_array($query);

print 'Dumper', Dumper( @ar);
print 'VAR = ', $ar[0];

# 
my $ausgabe = $DB->prepare($query);
my $i=0;
$ausgabe->execute;
while ( @row = $ausgabe->fetchrow_array ) {
	print "Zeile $i: @row\n";
	$i++;
	}

$DB->disconnect;
