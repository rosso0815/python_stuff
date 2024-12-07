#!/usr/bin/perl 
#          
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001
#

use Text::Query::Simple;
my $line="Andreas Pfister sagt hello to this world";

my $q=new Text::Query('hello',
                        -parse => 'Text::Query::ParseAdvanced',
                        -solve => 'Text::Query::SolveAdvancedString',
                        -build => 'Text::Query::BuildAdvancedString');
  die "bad query expression" if not defined $q;
print if $q->match($line);
 
$q->prepare('hello or adios or ta ta', -litspace => 1, -case => 1);
print if $q->match($line);
#requires single space between the two ta's
#if($q->match($line)) {}
#doesn't match "Goodbye"
$q->prepare('"and" or "or"');
print if $q->match($line);
#quoting operators for literal match
$q->prepare('\\bintegrate\\b', -regexp => 1);
print if $q->match($line);
#won't match "disintegrated"
