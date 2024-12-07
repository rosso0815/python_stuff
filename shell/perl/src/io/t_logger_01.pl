#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Fri Aug 22 07:13:36 DFT 2003
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Fri Aug 22 07:13:36 DFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########
use Log::Log4perl qw(get_logger);
           
 my $conf = q(
   log4perl.category.Bar.Twix         = WARN, Logfile
   log4perl.appender.Logfile          = Log::Log4perl::Appender::File
   log4perl.appender.Logfile.filename = test.log
   log4perl.appender.Logfile.layout = \
   Log::Log4perl::Layout::PatternLayout
   log4perl.appender.Logfile.layout.ConversionPattern = %d %F{1} %L> %n  
       );
			       
Log::Log4perl::init(\$conf);
					              
my $logger = get_logger("Bar::Twix");
$logger->error("Blah");
$logger->error("balabala");
&test;

sub test
{
	$logger->error("balabala");
}
