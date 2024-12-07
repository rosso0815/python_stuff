#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Wed Aug 20 13:52:00 DFT 2003
## Aufruf   : command-line
## Funktion : archivieren von tiff-dateien
## Keyword  : tiff archiv log 
## Version  : 001
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Wed Aug 20 13:52:00 DFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

use Env;
use Cwd;
use Log::Log4perl qw(get_logger); 
use Getopt::Std;
use Data::Dumper;
use Shell qw( tiffcp tiffsplit cp smbclient rm );

my (%opt, $filename, $logger, $file_id, $file_version, $file_blattnr);

my $tiffpfad='/tiffcache';

$check_in_user=$ENV{'SUDO_USER'};
$server = '//chkra-0001-a028/itc';
$server.= ' 8856Tuggen -U kraanp9';
$server.= ' -W CHKRA-0001 -c';
$server_ziel = ' CHIE/CHIEC/CAX-TEAM/MEMBERS/kraanp9';

#print "\n USER         = ", $ENV{'USER'};
#print "\n SUDO_COMMAND = ", $ENV{'SUDO_COMMAND'};
#print "\n SUDO_USER    = ", $ENV{'SUDO_USER'};

&init;
&check_filename;
&move_2archiv;

##################################################################################
sub init
{
# logger definieren
my $conf = q(
	log4perl.category.Bar.Twix         = WARN, Logfile
	log4perl.appender.Logfile          = Log::Log4perl::Appender::File
	log4perl.appender.Logfile.filename = /tiffcache/bin/tiff2archiv.log
	log4perl.appender.Logfile.layout   = Log::Log4perl::Layout::PatternLayout
	log4perl.appender.Logfile.layout.ConversionPattern = %d %F{1} %L> %m %n  
	);

#print "\nCONF=$conf";

Log::Log4perl::init(\$conf);
$logger = get_logger("Bar::Twix");

# optionen auswerten
getopts('oif:', \%opt )
	or die "falsche parameter ! zulassig oif\n";
if (! %opt)
	{
	print "keine parameter definiert => exit\n";
	exit;
	}
	
$filename = $opt{'f'};
if (! -s $filename)
	{
	print "Datei $filename inexistent oder size 0\n";
	exit 1;
	}

$logger->error("INIT User=>$check_in_user dateiname=$filename");
}
#################################################################################
sub check_filename
{
# datei nach regeln checken
# output = 1234567-000-01-01.mtif
# -000- = fuer SAP

print "##check_filename";
# pfad vor dateiname entfernen

# dateiname checken
if (! ( $filename =~ m/^.?\/?(\d{7})-(\d{2})-(\d{1}).tif$/smi ))
	{
	print "\nERROR, Datei $filename enspricht nicht REGEL\n";
	exit;
	}

$file_id      = $1;
$file_version = $2;
$file_blattnr = $3;

print "\nFILENAME    = $filename";
print "\nFILEID      = $file_id" ;
print "\nVERSION     = $file_version";
print "\nBLATTNUMMER = $file_blattnr";
$logger->warn("CHECK_FILENAME = $file_id,$file_version,$file_blattnr OK");
}
#################################################################################
sub move_2archiv
{
my $tiff_files;

print "\n## move_2archiv";

if ( -e "$tiffpfad/$filename")
	{
	print "\nfile $filename already in $tiffpfad";	
	}
# verschiebe datei in den cache
# splitte tiff-datei, erste datei ( xaa.tif) ist aktuelle datei
# suche alle dateien der gleichen fileid und version
# erstelle multitiff datei
# 
call_shell( "cp '$filename', '$tiffpfad'");
chdir $tiffpfad;

# extrahiere erste datei aus tiff-file => BUG
call_shell( "tiffsplit '$filename'");
call_shell( "cp 'xaa.tif', '$filename'") ;

# suchen von anderen dateien
while ( glob("$file_id-$file_version-?.tif"))
	{
	print "\nfound = ", $_;
	$tiff_files = $tiff_files . " " . $_
	}
#print "\ntiff_files = " , $tiff_files; 

#my $mtiff = $file_id . "-m.tif";
my $mtiff = $file_id . '-000-' . $file_version . '.tif';
if ( -e $mtiff)
	{
	call_shell( "rm '$mtiff'" );
	}

call_shell( "tiffcp '$tiff_files', '$mtiff'" );

# und copiere in die Windows-Welt
# smbclient //chkra-0001-a028/itc password -U userlogin -W CHKRA-0001
# cd \CHIE\CHIEC\CAX-TEAM

print "\nKopieren nach Windows";

$server .= "\"cd $server_ziel;put $mtiff \"";

$out = call_shell( "smbclient '$server'");

# Fehlerhandling SMBClient
if ( $out =~ m/putting/smi)
	{
	print "\nDatei $mtiff verschoben";
	$logger->warn("MOVE_2_ARCHIVE $mtiff kopiert");
	}
else
	{
	print "\nERROR bei verschieben ins Archiv", $out;
	$logger->error("MOVE_2_ARCHIVE ERROR $out");
	}

print "\nENDE\n";
}

#-------------------------------------------------------------------------------#
sub call_shell
{
use Shell qw( ls );

my $cmd = shift @_;
my $evalstring;

#print "\nFUNC=call_shell";
#print "\ncmd = $cmd";

$evalstring = eval $cmd;

if ( $@ ||  $? != 0)
        {       
        print "\nERROR = $cmd";
        print "\nERROR = ", $@, ' RW = ', $?;
        exit;   
        } 

return $evalstring;
}
#-------------------------------------------------------------------------------#
