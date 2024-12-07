#!/usr/bin/perl -w

#===================================================================================
#
#         FILE:  sub_01.pl
#        USAGE:  ./sub_01.pl 
#  DESCRIPTION:  aufruf einer function mit hash-parameter => bessere Ubersicht !
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  26.12.2003 08:59:21 CET
#     REVISION:  ---
#===================================================================================

use strict;
use Data::Dumper;

my $DEBUG_ON = 1;

show_param( name => 'hans');
show_param( name => 'hans', vorname => 'meier' );

#===  FUNCTION  ====================================================================
sub show_param
{
# for debugging
print "DBG ", (caller(0))[1]," ", (caller(0))[3], "\n" if $DEBUG_ON;

# hash mit standartwerten anlegen und ueberschreiben
my %arg = (
	name => 'undef',
	vorname => 'undef',
	@_
	);

print "name    => $arg{'name'}\n";
print "vorname => $arg{'vorname'}\n";
}
