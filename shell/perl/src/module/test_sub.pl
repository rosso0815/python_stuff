#!/usr/bin/perl

use warnings;
use strict;

sub test {
    my $var1 = shift @_;
    my $var2 = shift @_;
    #my $var3 = shift @_;
    print "\nstart test";
    print "\n`var1 = ", $var1, " | var2 = ", $var2;
}

print "\nSTART";

test( "test1", "test2") ;

print("\nENDE");

#-------------------------------------------------------------------------------#
