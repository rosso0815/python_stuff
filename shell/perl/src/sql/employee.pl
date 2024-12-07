#!/usr/local/bin/perl

use strict;
use warnings;

use DBI;
use JSON;
use Data::Dumper;

my $dbh = DBI->connect( 
  "DBI:mysql:database=employees;host=localhost", 
  "reader", 
  "reader");

if ( not $dbh ){
  print "Server konnte nicht ermittelt werden\n";
  exit(1);
}

my $sql = 'SELECT emp_no , birth_date , first_name , last_name FROM employees WHERE emp_no >= ? AND emp_no < ?';
my $sth = $dbh->prepare($sql);

$sth->execute(10000, 10050);

my $data = $sth->fetchall_hashref( 'emp_no' );

print Dumper( $data );

$dbh->disconnect;
