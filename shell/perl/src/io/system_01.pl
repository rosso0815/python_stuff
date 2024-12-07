#!/opt/service/bin/perl -w

#
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : von Web-CGI
# Funktion : Anzeige der aktuellen FlexLM-Lizenzen auf buserv01
# Keyword  :
# Version  :
# History  :
#    

use strict;

use Log::Log4perl qw(:easy);
use Data::Dumper;
Log::Log4perl->easy_init($DEBUG);

my $log = get_logger();

my $Output = system("ls -ltr>/dev/null");
#my @Output = `ls -l`;

#print Dumper @Output;
$log->info("START");
$log->info( $Output);
$log->info("ENDE");
