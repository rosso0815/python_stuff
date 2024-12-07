#!/usr/bin/env perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : kraanp9
## Datum    : Wed Jan 14 13:37:35 NFT 2004
## Aufruf   : 
## Funktion : testen von dbi mit mysql
## Keyword  : 
## Version  : 
##
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date                          Version         Description
## Wed Jan 14 13:37:35 NFT 2004      1.0             Init
########## ######### ######### ######### ######### ######### ######### #########
use strict;
use warnings;

use DBI;

my $mydb= DBI->connect( "DBI:mysql:database=owl;host=caxws14", 
	"pfistera", "andreas");

if (not $mydb){
	print "\n Server konnte nicht ermittelt werden";
	exit(1);}

my $query = 'select id,username,name from users';
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;

#my ($t1, $t2, $t3);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);

print "\n","**** Listenanfang ****","\n";

while ($ausgabe->fetch)
	{
	print "T1 = $t1 T2 = $t2 T3 = $t3","\n";
	}

print "**** Ende der Liste ****","\n";

$mydb->disconnect;"\n"; 
