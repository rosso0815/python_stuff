#!/usr/bin/perl -w

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
use GD::Graph::points;
$header = ["name", "age"];
$data = [
        ["John", 20],
	    ["Kate", 18],
	    ["Mike", 23]
        ];

$t = new Data::Table($data, $header, 0);

print $t->csv;

$graph = GD::Graph::points->new(400, 300);

$gd = $graph->plot($t->colRefs([0,2]));

open(IMG, '>mygraph.png') or die $!;
binmode IMG;
print IMG $gd->png;
close IMG;
