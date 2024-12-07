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

use strict;
#use Env;
#use Cwd;
#use Log::Log4perl qw(get_logger); 

use vars qw( $opt_o $opt_i $opt_f);

use Getopt::Std;

#use Data::Dumper;

#-------------------------------------------------------------------------------#
# optionen auswerten
getopts('oif:');
my $switchDefined = 0;

if (defined $opt_o){
	print "\nSchalter o = ", $opt_o;
}
	
if (defined $opt_i){
	print "\nSchalter i = ", $opt_i;
}
	
if (defined $opt_f){
	print "\nSchalter f = ", $opt_f;
}

if ( $switchDefined){
	print "Swich defindet";
}
	
	
		
print "\ncmd=$0;arg=@ARGV";
print "\nEND\n";
#-------------------------------------------------------------------------------#
