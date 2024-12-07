#!/usr/bin/perl -w

print "Regulaere Ausdruecke in Perl\n";

goto pfad;
#$t1 = "Andreas Pfister Tuggen";

#printf "%s\n", $t1;

#$t1 =~ s/*[e]/-E-/;

# Autausch der ersten zwei Woerter
#$t1 =~ s/^([^ ]+) +([^ ]+)/$2 $1/;
#printf "%s\n", $t1;


#$t1 =~ s/^(.*?e)//;
#printf "%s\n", $t1;

#$t1 =~ s/^(.*?\w)/XX$1XX/g;
#printf "%s\n", $t1;

pfad:
	print "\nPfadanalyse";
	my $pfad = "/test/test/001/test.txt";
	my $datei= "";
	
	print "\n\npfad=$pfad\ndatei=$datei";
	($datei = $pfad) =~ s/.*\/(.*)/$1/g;
	print "\npfad=$pfad\ndatei=$datei";

	$pfad =~ m/(.*\/)(.*)/;
	print "\n\npfad=$pfad\n\tonly_pfad=$1\n\tonly_datei=$2";
	goto ende;

ende:
print "\nENDE\n";
read