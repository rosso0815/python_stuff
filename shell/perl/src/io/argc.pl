#!/opt/service/bin/perl -w
#===============================================================================
#         FILE:  argc.pl
#        USAGE:  ./argc.pl 
#  DESCRIPTION:  
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  12/16/05 10:31:09 AM CET
#     REVISION:  ---
#===============================================================================

use strict;
use English;

my $app_path;

# handling application name
print "Scriptname ", $0;

#( $app_path = $0 ) =~ m/(.*\/)(.*)/;
$0 =~ m/(.*\/)(.*)/;

print "\n\npfad=$app_path\n\tonly_pfad=$1\n\tonly_datei=$2";


my $anzahl = @ARGV;

if ($anzahl == 0){ 
	print "\nKeine Argumente uebergeben\n";
	exit;}

print "\nARG 1 = ", $ARGV[0],"\n" ;
for (@ARGV) { 
	print "var ", $_; }

