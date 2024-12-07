#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 17.04.2003
## Aufruf   : Shell
## Funktion : aendern des namens eines parts mit status DEL 
##            name wird mit einem dxxxxxxx versehen
## Keyword  : dmags oracle status 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date          Version         Description
## 17.04.2003    1.0             Init
## 06.05.2003    1.1             Im Batch alle WIP-Dateien mit dxxxx versehen
##
########## ######### ######### ######### ######### ######### ######### #########

use Env;
use DBI;
use Data::Dumper;

#evtl setzen
#$ENV{'ORACLE_HOME'}='/oracle/p817';


my $db= DBI->connect( "DBI:Oracle:DMA12_catiasv01", "DMAGS1", "DMAGS1");
#my $db= DBI->connect( "DBI:Oracle:DMA12_caxws14", "DMAGS1", "DMAGS1");

if (not $db)
	{
	print "\n Server konnte nicht ermittelt werden";
	exit(1);
	}

# suche nach model mit status DEL besitzer neuhausen und name ist nicht d%
my $query = "select s_part_number,s_version, c_maturity from part_list
			 where
	          c_maturity like 'DEL'
	         and
		      c_org_resPONSIBLE like 'NEU'
		     and
			  lower( s_part_number) not like 'd%'";

my $arrayref = $db->selectall_arrayref( $query);

foreach $i ( @$arrayref)
	{
	# partnumber darf max 18char sein !!
	# partnumber und version sind unique => zuerst verifizieren
	print "\nlaenge = ", length $i->[0];
	my $newpartnumber = $i->[0];
	if ( length( $newpartnumber) > 17)
		{
	    $newpartnumber = substr($i->[0],0,17);
		}
	$query = "update part_list set s_part_number = 'd$newpartnumber' 
		where s_part_number = '$i->[0]' 
		AND s_version = '$i->[1]'";
	print "\nQUERY =", $query;
	$anzahl=$db->do( $query);
	print "\nanzahl geandert = ", $anzahl;
	}
$db->disconnect;
printf("\n");
