#!/usr/bin/perl -w

# Einlesen einer CONFIG-Datei

$a="a";
$b="b";
$c="c";

#-------------------------------------------------------------------------
sub test1
	{
	printf "Hallo Andreas";
	}
#--------------------------------------------------------------------------

open (CONFIG, "config.txt") or die "cannot open config.txt";
while( $line = <CONFIG>)
	{
	print $line;
	eval $line;
	}
printf "a=$a\nb=$b\nc=$c\n";
&test;
