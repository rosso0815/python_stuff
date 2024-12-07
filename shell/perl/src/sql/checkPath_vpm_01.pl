#!/usr/local/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Wed Jan 14 13:59:46 NFT 2004
## Aufruf   : shell
## Funktion : prueft path in db und filesystem und erstellt report
## Keyword  : dma slq vpm
## Version  : 001
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Wed Jan 14 13:59:46 NFT 2004      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

use DBI;
use Env;
use Data::Dumper;

my $input = check_input(1,"Partnummer");

my $DB= DBI->connect( "DBI:Oracle:DMA12_CATIASV01", "DMAGS1", "DMAGS1");

if (not $DB)
	{
        print "\n Server konnte nicht ermittelt werden";
        exit(1); 
	}

my $query="
select  p.S_PART_NUMBER nummer,
        p.S_VERSION version,
        c.S_REVISION revision,
	c.C_LASTMOD,
	replace(SUBSTR(DUMP(e.\"\$CUR_ACC_MET_DATA\",17), 16), ',',null)
from    \"\$EXT_LF\" e,
        part_list p,
        catia_model c
where   e.\"\$COID\" = p.\"\$COID\"
        and
        p.s_part_number like '%$input%'
        and
        e.\"\$COMPID_FATHER\" IN c.\"\$COMPID\"";

my $ary_ref = $DB->selectall_arrayref($query);

my $anzahl = @$ary_ref;
print "\nanzahl=", $anzahl;

foreach $i ( @$ary_ref)
	{
	print "\npfad = ", $i->[4];
	print "\n\tpartnummer = ", $i->[0];
	print "\n\tversion    = ", $i->[1];
	print "\n\trevision   = ", $i->[2];
	print "\n\tlastmod    = ", $i->[3];
	}

$DB->disconnect;
printf("\n### ENDE ###\n");

#-----------------------------------------------------------------------
sub check_input
{
my $anzahl_soll = shift;
my $frage_text  = shift;

my $anzahl = @ARGV;                                                                          
if ( $anzahl == 0 )
	{
	print "$frage_text ? ";
	my $rs = <STDIN>;
	chop($rs);
	print("Die Eingabe fuer $frage_text = $rs");
	return $rs;
        }
elsif ( $anzahl == 1)
	{
	print "Die Eingabe fuer $frage_text = $ARGV[0]";
	return $ARGV[0];
	}
else
	{
	print "Zuviele Argumente eingegeben\nERROR und EXIT\n";
	exit 1;
	}
}
#-----------------------------------------------------------------------
