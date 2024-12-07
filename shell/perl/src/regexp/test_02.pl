#!/usr/bin/perl -w

# Programmname : test_02.pl
# Ersteller    : A.Pfister
# Datum        : 20.08.2002
# Revision     : 002
# Funktion     : wir testen regulare ausdrücke

$zeile="   Hallo Andreeeeeas Pfister
	Hönggerstr. 11
	8102 Oberengstringen";

#---------------------------------------------------
print "\nsuche erstes wort";
if ( $zeile =~ /(\w+)(.*)/ism)
	{
	print "\nmatch ok\n\tv1=$1\n\tv2=$2";
	}

#---------------------------------------------------
print "\n\nsuche 1 zahl";

if ( $zeile =~ /(\d+)(.*)/ism)
        {
	print "\nmatch ok\n\tv1=$1\n\tv2=$2";
	}
	
#--------------------------------------------------
print "\n\nsuche 4stellige zahl";

if ( $zeile =~ /(\d{4})(.*)/ism)
        {
	print "\nmatch ok\n\tv1=$1\n\tv2=$2";
	}
exit;

#s/e{1,}/x/g;
print "\n* ersetze e mit x *\n", $_;


s/^.*(8)/8/is;

print "\n* cut bis 8102 x *\n", $_;

@felder = split /:/, $_;
$felder = @felder;

print "\n\nWir splitten Anzahl = ", $felder;
foreach $var ( @felder)
	{
	print "\n", $var;
	}

print "** ENDE **\n";
