#!/usr/local/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Wed Jan 14 13:59:46 NFT 2004
## Aufruf   : shell
## Funktion : check path auf leerzeichen
## Keyword  : dma slq vpm
##
########## ######### ######### ######### ######### ######### ######### #########
## $Log: modifyPathVPM.pl,v $
## Revision 1.4  2004/06/07 09:11:31  kraanp9
## basicly working and able to modifiy SQL-PATH
##
## Revision 1.3  2004/06/04 09:44:28  kraanp9
## version mit perl pack...
##
## Revision 1.2  2004/06/04 08:19:11  kraanp9
## version mit sql(dump..)
##
## Revision 1.1  2004/06/04 07:14:45  kraanp9
## init version
##
########## ######### ######### ######### ######### ######### ######### #########

use DBI;
use Env;
use File::Find;
use Data::Dumper;
use DB_File;
use Time::HiRes qw( gettimeofday tv_interval );

my $tns    = "vpmcax20_crt00";
my $vpmenv = "CRT00";

my $DEBUG_ON = 0;
my ( $DB_LOG, $dbArray );
my $starttime = [gettimeofday];

readFromDB();
check_path();
write2DB();
exit;

#------------------------------------------------------------------------------
# function: schreibt daten in DB zurueck
#
sub write2DB
{
#my $DEBUG_ON = 1;
printf "\n#\nDEBUG %s %s", (caller(0))[1], (caller(0))[3] if $DEBUG_ON;

my $DB= DBI->connect( "DBI:Oracle:$tns", "system", "manager");

if (not $DB){
        print "\n Server konnte nicht ermittelt werden";
        exit(1);
	}

$anzahl = @$dbArray;

for ( $i=0 ; $i<$anzahl ; $i++ )
	{
	my $rowid  = $dbArray->[$i][0];
	my $path   = $dbArray->[$i][1];
	my $sql="update $vpmenv.\"\$EXT_LF\" 
		set  \"\$CUR_ACC_MET_DATA\" = '$path' 
		where rowid = '$rowid'";
	
	print "\n\tSQL=$sql" if $DEBUG_ON;
	$DB->do( $sql);
	}

$DB->disconnect;

print "\nENDE SUBROUTINE zeit subroutine    = ", tv_interval( $starttime) if $DEBUG_ON;
}

#------------------------------------------------------------------------------
# function: #
sub check_path
{
#my $DEBUG_ON = 1;
printf "\n#\nDEBUG %s %s", (caller(0))[1], (caller(0))[3] if $DEBUG_ON;
# ausgabe von $dbArray

$anzahl = @$dbArray;
print "\n\tanzahl element in DB= $anzahl";
#print "\n\tpack=",pack('H*',$dbArray->[0][1]);

$anzahl_leerzeichen=0;
$anzahl_disk=0;

# leerzeichen entfernen
for ( $i=0 ; $i<$anzahl ; $i++ )
	{
	#print "\n\telement[$i][1] = ", $dbArray->[$i][1];
	$string=pack('H*',$dbArray->[$i][1]);
	
	# pruefe auf leerzeichen am schluss
	if ( $string =~ m/(^.*000000)\s+$/i)
                {
		#print "\n\tleerzeichen = ", $dbArray->[$i][1],"#";
		
		$string =$1;
		$anzahl_leerzeichen++;
		}
		
	# pruefe auf disk in path
	if ( $string =~ m/(.*)\/disk\d\/(.*)/i)
                {
		#print "\n\tstring org =", $string;
		#print "\n\tstring neu=",$1."/".$2;
		#exit;
		
		$string = $1.'/'.$2;
		$anzahl_disk++;
		}
		
	# TEST= ersetze CRT00 durch PRD11
	#if ( $string =~ m/(.*)PRD(.*)/i)
	#	{ my $ts = $1 . "CRT" . $2; print "\nts=$ts"; $string = $ts; }

	# und geaenderten string zurueckschreiben
	$dbArray->[$i][1]=unpack('H*', $string);
	}
	
print "\n\tanzahl leerzeichen = ", $anzahl_leerzeichen;
print "\n\tanzahl disk        = ", $anzahl_disk;
print "\nENDE SUBROUTINE time = ", tv_interval( $starttime) if $DEBUG_ON;
}
#-----------------------------------------------------------------------
# function: #
sub readFromDB
{
#my $DEBUG_ON = 1;
printf "\n#\nDEBUG %s %s", (caller(0))[1], (caller(0))[3] if $DEBUG_ON;

my $DB= DBI->connect( "DBI:Oracle:$tns", "system", "manager");

if (not $DB)
	{
        print "\n Server konnte nicht ermittelt werden";
        exit(1); 
	}

my $query=" select 
	rowid, \"\$CUR_ACC_MET_DATA\"
       	from $vpmenv.\"\$EXT_LF\" ";

$dbArray = $DB->selectall_arrayref($query);
$DB->disconnect;
print "\nENDE SUBROUTINE time = ", tv_interval( $starttime) if $DEBUG_ON;
}
#-----------------------------------------------------------------------
