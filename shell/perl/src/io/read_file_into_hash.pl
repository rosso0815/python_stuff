#!/opt/freeware/bin/perl -w

########## ######### ######### ######### ######### ######### ######### #########
##
## Erzeuger : A.Pfister
## Datum    : 20.02.2003
## Aufruf   : command-line
## Function : dursuchen div. directories und ausgabe der hader infos
## Keyword  : 
########## ######### ######### ######### ######### ######### ######### #########
## Modifications: 
## Date          Version         Description
## 
########## ######### ######### ######### ######### ######### ######### #########

use Data::Dumper;
$datei="hash.conf";

my $hr;

open( INPUT, "$datei");
while(<INPUT>)
	{
	print "Input = $_";
	chomp;
	( $v1, $v2) = split(/\s*=\s*/, $_, 2);
        #my $info{ $var} = $value;
	#eval "$INH{$var} = $value";
	#print "value is : $INH{$value}\n";
	$hr->{$v1} = $v2;
	print "DATA=", Dumper( $hr),"\n";
	print "\ntest1=", $hr->{'test1'};
	while( my ($k, $v) = each %$hr )
       		{
		print "key: $k, value: $v.\n"; 
		}
	}
close INPUT;
