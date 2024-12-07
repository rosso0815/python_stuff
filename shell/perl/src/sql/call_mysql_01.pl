#!/usr/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual 
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use DBI;
use Env;
use Data::Table;
use Data::Dumper;

my $dbh= DBI->connect( "DBI:mysql:dokumenta:localhost", "pfistera", "andreas");

if (not $dbh)
	{
        print "\n Server konnte nicht ermittelt werden";
        exit(1);
	}

#my $minAge = 10;
#$t = Data::Table::fromSQL($dbh, "select * from mytable where age >= ?", [$minAge]);

$t = Data::Table::fromSQL($dbh, "select owner, size, keywords from dokument");
	# where keywords like 'test' ");

# Construct a table form an SQL 
# database query.
print $t->html( ['#D4D4BF','#ECECE4','#CCCC99'], {border => '0'});
