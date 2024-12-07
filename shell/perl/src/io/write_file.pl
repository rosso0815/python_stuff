#!/usr/bin/perl -w


# Schreiben von neuem Userenv.dcls
open(OUTPUT,">USRENV.dcls") or
	die "Kann Datei Test.txt nicht oeffnen";
print OUTPUT "hallo";
close(OUTPUT);




