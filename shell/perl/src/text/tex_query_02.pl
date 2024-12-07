#!/usr/bin/perl 
#          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001
#

use Text::Query::Simple;

my $line="Andreas Pfister sagt hello 
hello to this world";

my $q=new Text::Query::Simple('+hello') or die "bad query expression" if not defined $q;
print "\nCOUNT = ", $q->match($line);
 
print "\nENDE\n";
