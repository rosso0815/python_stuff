#!/usr/local/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Mon Jan 19 16:40:34 NFT 2004
## Aufruf   : shell plus input_file
## Funktion : 
## Keyword  : csv regulare ausrdruck re
## Version  : 001
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Mon Jan 19 16:40:34 NFT 2004      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

open( INPUT, "$ARGV[0]") 
	or die "\nERROR cannot open $ARGV[0]";

open( OUTPUT,">result.csv")
	or die "\nERROR cannot open result.csv";

while (<INPUT>)
	{
	my $zeile1=$_;
	chomp( $zeile1);
	if ( $zeile1 =~ s/^(\/dat\/[a-zA_Z0-9\/]*).*$/$1/)#zeilenanfang mit pfad /dat erkannt
		{
		# $zeile1 =~ s/\s.*$//;# ab dem ersten space bis zum schluss delete
		my $zeile2=<INPUT>;
		chomp( $zeile2);
		$zeile2=~ s/^\s+//; # leerzeichen am anfang entfernen
		$zeile2=~ s/\s.*$//;
		print "\n$zeile1;$zeile2";
		print OUTPUT "\n$zeile1;$zeile2";
		}
	}
close INPUT;

