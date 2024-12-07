#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Tue Nov 11 13:18:13 NFT 2003
## Aufruf   : 
## Funktion : ersetzen mit sed in datei 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Tue Nov 11 13:18:13 NFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

$file="rep01.txt";

open (INPUT, "< $file") or
	die "Cannot open $file";
	
open( OUTPUT, "> $file.new") or
	die "cannot open $file.new ";
	
while ($line = <INPUT>)
	{
	if ($line =~s/Andreas/Peter/)
		{
		print "gefunden";
		print OUTPUT $line;
		}
	else
		{
		print OUTPUT $line;
		}
	}
	
close( INPUT);
close( OUTPUT);
unlink( $file);
rename ( "$file.new", $file);




