#!/usr/bin/perl -w

#
# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : von Web-CGI
# Funktion : Anzeige der aktuellen FlexLM-Lizenzen auf buserv01
# Keyword  :
# Version  :
# History  :
#    

@LoL=(
	["andreas","pfister"],
	["joerg","mueller"],
	["peter","fritschi","Zurich"]
	);


print "Element anzeigen", $LoL[0][0];
$anzahl = @LoL ;

print "\nAnzahl Elemente", $anzahl;

for $array_ref ( @LoL )
	{
	$anzahl = @$array_ref;
	print "\t [ @$array_ref], \n";
	print "\t [ $anzahl], \n";
	}

print "\n";
