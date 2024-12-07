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

my $DEBUG_ON = 0;
my ( $DB_LOG );
my $starttime = [gettimeofday];


print "\nstart=", tv_interval( $starttime) if $DEBUG_ON;

readFromDB();
check_db2file();
check_file2db();

print "\n### ENDE ###\n" if $DEBUG_ON;

exit;

#-----------------------------------------------------------------------
sub check_file2db
{
print "\ncheck_file2db" if $DEBUG_ON;


find(\&wanted, '/DMAVPM');

sub wanted 
	{
	print "\nchecke file=$File::Find::name" if $DEBUG_ON;
	print "\ntime=", tv_interval( $starttime) if $DEBUG_ON;

	# kein ordner checken
	if (  -d $File::Find::name )
		{
		print "\nchecke Folder ", $File::Find::name if $DEBUG_ON;
		return ;
		}
	# suche von nfs-datei in db-dump-array
	if (! defined($DB_LOG{"$File::Find::name"}) )
		{
		print "\nfile_not_in_db ", $File::Find::name;
		}
	}
}
#-----------------------------------------------------------------------
sub check_db2file
{
# verifizieren der db gegenueber nfs-files
print "\ncheck_db2file" if $DEBUG_ON;

while (($key, $value) = each %DB_LOG)
	{
	#print "\n$key -> $value";
	# datei ist nicht existent
	if ( ! -e $key )
		{
		$value=$value;
		print "\nfile_not_on_nfs $key";
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
	print "\n", $entry->[0] if $DEBUG_ON;
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
