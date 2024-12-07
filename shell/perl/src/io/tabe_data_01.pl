#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Tue Jul  8 14:52:57 DFT 2003
## Aufruf   : 
## Funktion : 
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Tue Jul  8 14:52:57 DFT 2003      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########
#

use Data::Table;
$header = ["name", "age"];
$data = [
        ["John", 20],
	    ["Kate", 18],
	    ["Mike", 23]
        ];

$t = new Data::Table($data, $header, 0);

print $t->csv;
