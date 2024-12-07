#!/usr/bin/perl -w
#===============================================================================
#         FILE:  testLink.pl
#        USAGE:  ./testLink.pl 
#  DESCRIPTION:  
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  08/03/05 09:29:30 AM CEST
#     REVISION:  ---
#===============================================================================

use strict;

my $linkfile='testlogfile';

print "Testen von Files und Links";

if ( -e $linkfile )
{
	print "\nfile $linkfile existiert";
}
else
{
	die "Datei $linkfile existriert nicht !! EXIT";
}

if ( -f $linkfile )
{
	print "\nfile $linkfile ist eine normale Datei";
}

if ( -l $linkfile )
{
	print "\nfile $linkfile ist ein link";
}
	
if ( -z $linkfile )
{
	print "\nfile $linkfile hat Grösse 0";
}

print "\nENDE\n";
