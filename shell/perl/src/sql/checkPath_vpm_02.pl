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
use File::Find;
use Data::Dumper;
use DB_File;
use Time::HiRes qw( gettimeofday tv_interval );

my ( $DB_LOG );
my $starttime = [gettimeofday];


print "\nstart=", tv_interval( $starttime);
readFromDB();

#check_db2file();
check_file2db();

printf("\n### ENDE ###\n");
exit;

#-----------------------------------------------------------------------

sub check_file2db
{
print "\ncheck_file2db";

find(\&wanted, '/DMAVPM');

sub wanted 
	{
	# kein ordner checken
	if (  -d $File::Find::name )
		{
		print "\checke Folder ", $File::Find::name;
		return ;
		}
		
	
	# print $File::Find::name;
	# suche von nfs-datei in db-dump-array

	#my @result_ary = grep { $_->[3] =~ /$File::Find::name/i; } @$ary_ref;
	#my $anzahl = @result_ary;
	
	if (! $DB_LOG{"$File::Find::name"} )
		{
		print "\nfile not in db = ", $File::Find::name;
		}
	}
}

#-----------------------------------------------------------------------

sub check_db2file
{
# verifizieren der db gegenueber nfs-files

#my @result_ary = grep { print "\ngrep $_->[3]"; $_->[3] =~ /003/i; } @$ary_ref;
#my $anzahl = @result_ary;
#print Dumper(  $ary_ref); 

print "\ncheck_db2file";
#my $anzahl = @$ary_ref;
#print "\n\tanzahl=$anzahl";

foreach $i ( @$ary_ref)
	{

	# datei ist nicht existent
	if ( ! -e $i->[3] )
		{
		print "\nDatei $i->[3] nicht existent";
		}
	}
}

#-----------------------------------------------------------------------

sub readFromDB
{
my $DB= DBI->connect( "DBI:Oracle:VPMDMA_CAXWS14", "DMAGS1", "DMAGS1");

if (not $DB)
	{
        print "\n Server konnte nicht ermittelt werden";
        exit(1); 
	}

my $query="
select  replace(SUBSTR(DUMP(e.\"\$CUR_ACC_MET_DATA\",17), 16), ',',null)
from    \"\$EXT_LF\" e,
        part_list p,
        catia_model c
where   e.\"\$COID\" = p.\"\$COID\"
        and
        e.\"\$COMPID_FATHER\" IN c.\"\$COMPID\"";

my $ary_ref = $DB->selectall_arrayref($query);
$DB->disconnect;

# und in db schreiben
unlink "checkFile.db" ;

tie %DB_LOG, "DB_File", "checkFile.db", O_RDWR|O_CREAT, 0666, $DB_HASH
        or die "Cannot open file 'checkFile.db': $!\n";

foreach $entry ( @$ary_ref )
	{
	$DB_LOG{"$entry->[0]"} = 1;
	print "\n", $entry->[0];
	}
}

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
