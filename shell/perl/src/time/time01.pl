#!/usr/bin/perl -w
#===============================================================================
#         FILE:  time01.pl
#        USAGE:  ./time01.pl 
#  DESCRIPTION:  
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  08/03/05 11:15:44 AM CEST
#     REVISION:  ---
#===============================================================================

use strict;

print "START TIME";

my @Monatsnamen = ("","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
my ($Sekunden, $Minuten, $Stunden, $Monatstag, $Monat,
    $Jahr, $Wochentag, $Jahrestag, $Sommerzeit) = localtime(time);

my $MyDate=sprintf ("%s/%s/%s", $Monatstag, $Monatsnamen[$Monat], $Jahr-100);

printf ("\nDate=%s; time=%s.%s;", $MyDate, $Stunden, $Minuten);


print"\nEND TIME";
