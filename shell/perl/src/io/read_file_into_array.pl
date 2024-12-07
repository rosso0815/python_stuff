#!/usr/local/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 20.02.2003
## Aufruf   : command-line
## Function : dursuchen div. directories und ausgabe der hader infos
## Keyword  : 
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date          Version         Description
## 
########## ######### ######### ######### ######### ######### ######### #########

$datei="usertool.conf";

print "\nlese header von ", $datei;
$inhalt="";
open( INPUT, "$datei");
	$inhalt = join($inhalt,<INPUT>);
close INPUT;

print "\n# datei =", $inhalt,"ENDE";
exit;

# und nach etwas suchen
foreach $suchstring( 'erzeuger','datum','aufruf','keyword')
	{
	$_=$inhalt;
	if ( m/(^.*$suchstring.*):(.*$)/im )
		{
		#print "\n$suchstring";
		#print "\nSuchstring        =", $&;
		#print "\nSuchstring 1      =", $1;
		print "\n$suchstring = ", $2;
		}
	}
#------------------------------------------------------------------------------
# db dokumenta
#
# Tabellenstruktur für Tabelle `datei`
# CREATE TABLE datei (
#   id int(11) NOT NULL default '0',
#   name varchar(255) NOT NULL default '',
#   pfad varchar(255) NOT NULL default '',
#   keyword text NOT NULL,
#   PRIMARY KEY  (id),
#   FULLTEXT KEY keyword (keyword)
#   ) TYPE=MyISAM;
#             
sub insert_dokumenta
{
my $mydb= DBI->connect( 'DBI:mysql:Logfiles:catiasv01', 'mysql', 'alstom');                         
                                                                                                    
if (not $mydb){                                                                                     
		        print "\n Server konnte nicht ermittelt werden";                                            
				        exit(1); }    
}
