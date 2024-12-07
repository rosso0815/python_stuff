#!/usr/bin/perl

# Erzeuger : pfistera
# Datum    : Mon Mai 12 19:33:03 CEST 2003
# Aufruf   : 
# Funktion : 
# Version  : 001
#          : 002 01.01.2016 
# Keyword  : wir testen regulare ausdrücke

use 5.010;
use strict;
use warnings;

BEGIN{
    say "BEGIN";
}

END{
    say "END";
}

sub hi {
    my $v1=shift;
    my $v2=shift;
    my $out="";
    
    if ( defined $v1){
        $out=$out."v1=$v1";           
    }
    if (defined $v2){
        $out=$out." v2=$v2";
    }
    say "Hi $out";
}

foreach ( @ARGV ){

}

say "\$0=$0, ARGS: @ARGV";
hi ;
hi 'andreas';
hi 'andreas','pfister';
exit;

my $textstring = " Andreas Pfister Oberengstringen ZH";
my $regex = "^\\s+(Peter|Andreas)\\s*(Muller|Meier|Pfister)";

if ($textstring =~ m/$regex/im) {
    say "1=$1" if defined $1;
    say "2=$2" if defined $2;
}

#------------------------------------------------------------------------------
