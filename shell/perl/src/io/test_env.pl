#!/usr/bin/perl -w

# Programmname : A.Pfister
# Ersteller    :
# Datum        :
# Revision     :
# Keywords     :
# Funktion     :


use Env;

$ENV{TEST_01}='hallo uiui';

print "Hallo Andreas\nDein Alter bitte ? =";

$ALTER = <STDIN>;

print "\nDeinAlter = $ALTER \n";

open ( INPUT, '|') or die 'ERROR bei PC';
while ( <INPUT>)
	{
	print "ENV=";
	print $_;
	}
