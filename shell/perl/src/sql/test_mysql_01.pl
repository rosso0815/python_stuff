#!/usr/bin/env perl

#c comment: test of mysql against perl dbi

# modules we using
use DBI;
use Data::Dumper;

#c connect to database
my $db = DBI->connect( "DBI:mysql:", "reader", "reader" );
if ( !$db ) {
    print "\n Server konnte nicht ermittelt werden";
    exit 1;
}

#c prepare and execute the sql
$sth = $db->prepare("SELECT * FROM employees.employees where emp_no < 10020");
$sth->execute();

#c output
while ( my $r = $sth->fetchrow_hashref() ) {
    print $r->{emp_no} . " "
        . $r->{first_name} . " "
        . $r->{last_name} . "\n";
}

#c bye
$db->disconnect();

#c eof

#------------------------------------------------------------------------------
