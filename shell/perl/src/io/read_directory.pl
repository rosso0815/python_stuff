#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Tue Nov 11 15:01:47 NFT 2003
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Tue Nov 11 15:01:47 NFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

opendir(DIRHANDLE, ".") or die "Konnte Verzeichniss nicht lesen";

while ( defined( $filename = readdir(DIRHANDLE)))
	{
	#print "\nes existiert $filename";
	if ( -f $filename)
		{
		#print "\n DATEI=$filename";
		}
	elsif(( -d $filename) && ( $filename !~ m/^\./ ))
		{
		#$filename=s
		print "\n VERZEICHNIS=$filename";
		
		}
	}
	
closedir( DIRHANDLE);
