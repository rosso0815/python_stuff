#!/usr/bin/perl -w

# Programmname : test_03.pl
# Ersteller    : A.Pfister
# Datum        : 20.08.2002
# Revision     : 002
# Funktion     : wir testen regulare ausdrücke 2.Teil

use Shell qw(clear);

clear;


$_="Hallo Andreas Pfister
	Hönggerstr. 11
	8102:Oberengstringen";

print "\n** START ***\n", $_,"\n";

# s/(8102|pfister)/Muller/igms ;
# s/(e{2,})/e/gms;
s/(andreas) +(pfister)/$2 $1/igms;

print "\n** GEANDERT **\n", $_,"\n";

# s/e{1,}/x/g; print "\n* ersetze e mit x *\n", $_;
# s/^.*(8)/8/is; print "\n* cut bis 8102 x *\n", $_;

print "** ENDE **\n";
