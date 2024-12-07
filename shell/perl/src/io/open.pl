#!/opt/freeware/bin/perl -w
#
# Erzeuger : A.Pfister
# Datum    : 15.08.02
# Aufruf   : von WWW-CGI
# Funktion : Testen von IO/Fileoperationen
# Version  : 001
# History  : keine
#

my @output;

open(OUTPUT, "test.txt") or die "Kann Datei Test.txt nicht oeffnen";
while ($line = <OUTPUT>)
	{
        push @output,$line;
        }
close(OUTPUT);

foreach $line (@output)
        {
        print 'OUTPUT = ', $line;
        }

print "Vorname = $output[0]";
