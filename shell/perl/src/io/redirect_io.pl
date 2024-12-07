#!/usr/bin/perl -w

# Erzeuger : pfistera
# Datum    : Son Mai 18 18:24:55 CEST 2003
# Aufruf   : 
# Funktion : 
# Version  : 001
# Keyword  : 

use Shell qw( ls);

my $datei   = "/home/pfistera/tmp/test.txt";
my $command = 'print'. "'Hallo Andreas'";
my $output  = '';

print "\nSTART";
local *SAVEOUT=STDOUT
open ( STDOUT, ">logfile") or die "\nkann datei nicht oeffnen";
print ls('*');
eval ($command);
close ( STDOUT);

open ( INPUT, '<logfile') or die "\nkann datei nicht oeffnen";
while (<INPUT>){
	$output .= "output" , $_ ;
	}
	
close(INPUT);
print "\nOUTPUT = ", $output;

print "\nENDE\n";
