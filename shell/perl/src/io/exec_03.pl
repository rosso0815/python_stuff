#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Fri Nov 14 11:48:00 NFT 2003
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Fri Nov 14 11:48:00 NFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########

# @args=("rsh","caxws06",
# "/usr/opt/freeware/bin/sudo", 
# "/test_service/usertool/bin/show_config.sh");

open APIO, "./01_exec.ksh |" or die "Cannot create process";
while ($line=<APIO>)                                                        
        {
	print $line;
        }                                                                       
close(APIO);
$RC=$?/256;
print "RQ = $RC";
