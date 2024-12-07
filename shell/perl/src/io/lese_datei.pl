#!/usr/bin/perl -w

# Erzeuger : pfistera
# Datum    : Son Mai 18 18:24:55 CEST 2003
# Aufruf   : 
# Funktion : 
# Version  : 001
# Keyword  : 

my $datei = "/home/pfistera/perl/test/list_dir_file_02.pl";

open ( INPUT, "$datei") or die "\nkann datei nicht oeffnen";
#my $i=0; while (( $line = <INPUT>) && ( $i < 20)) { print "NR", $i , $line; $i++; }
for ( $i=0; $i < 20; $i++)
	{
	my $line = <INPUT>;
	print "\nNR:", $i, $line;
	}
close INPUT;
