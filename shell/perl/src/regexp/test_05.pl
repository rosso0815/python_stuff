#!/usr/bin/perl -w
#          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001
#
# wir testen regulare ausdrücke

$_="# Andreas Pfister
test:test
test:hallo";

if (m/#/)
	{
	print "Gefunden";
	}
exit;

$_="Hallo:Andreeeeeas:Pfister";


print $_,"\n";
s/e{1,}/x/g;
print $_;

@felder = split /:/, $_;
$felder = @felder;

print "\n\nWir splitten Anzahl = ", $felder;
foreach $var ( @felder)
	{
	print "\n", $var;
	}
