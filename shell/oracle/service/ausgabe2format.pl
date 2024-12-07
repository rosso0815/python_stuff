#!/usr/bin/perl -w

open (AUSGABE, "sqlausgabe.tmp") or die "Kann ausgabe.txt nicht oeffnen;\nexit\n";
open (FORMAT, ">ausgabe.txt") or die "Kann ausgabe2.txt nicht oeffnen;\nexit\n";

while(<AUSGABE>){
	$_ = pack "H*", "$_";
	if ( m/^BIN/ ) {
		s/BIN PATH //g;
		print FORMAT "\n", $_;
		}
	}
