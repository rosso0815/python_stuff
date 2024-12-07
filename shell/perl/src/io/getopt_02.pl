#!/usr/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Wed Aug 20 13:52:00 DFT 2003
## Aufruf   : command-line
## Funktion : test funktion getopt
## Keyword  : getopt
## Version  : 001
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Wed Aug 20 13:52:00 DFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

use Getopt::Long;

GetOptions ('tag=s' => \$tag);

if ( defined( $tag) )
	{
	print "\ntag=$tag";
	}
print "\n";
