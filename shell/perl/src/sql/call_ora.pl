#!/usr/bin/perl -w

# creator     : A.Pfister
# date        : 25.01.2002
# call        : manual 
# description : Anzeige von Oracle-Test Scott Tiger aus table emp
# version     : 001


#BEGIN {
#  unless ( $ENV{'OrAcLePeRl'} ){
#    $ENV{'OrAcLePeRl'} = "1";
#		$ENV{'DYLD_LIBRARY_PATH'} = '/Users/pfistera/bin/sqlplus/' ; 
#		exec "/usr/bin/perl", $0, @ARGV;
#    }
#}

use strict;
use warnings;
use feature ':5.10';
use DBI;
#use Data::Dumper;
#use Getopt::Std;
#
#my %opts;
#getopt( 'is:', \%opts);
#print Dumper( %opts ) ;
#print "s = ".$opts{'s'}."\n";
#exit(0);
#
#foreach (sort keys %ENV) { 
#  print "$_=$ENV{$_}\n"; 
#}

say '### START ###';

my $db = DBI->connect( "DBI:Oracle:host=centos7;port=1521;sid=XE", "grails", "grails");

if (not $db){
	print "\n Server konnte nicht ermittelt werden";
   exit(1);
}
#
my $q = "select * from hr.jobs";
my $jobs = $db->selectall_hashref( $q , 'JOB_ID');

foreach my $job_id (keys %$jobs) {
   say "TITLE = $jobs->{$job_id}{JOB_TITLE}";
}
#
$db->disconnect;

say '### ENDE ###';

