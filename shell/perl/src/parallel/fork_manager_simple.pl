#! /usr/bin/env perl

use strict;
use warnings;
use 5.010;

use Parallel::ForkManager;
use Data::Dumper qw(Dumper);

my $forks = shift or die "Usage: $0 N\n";

my @list = ( 2 , 1, 7, 9, 1, 10 );

my %results;

print "Forking up to $forks at a time\n";
my $pm = Parallel::ForkManager->new( $forks );

$pm->run_on_finish( sub{
    my $retrieved =@_;
    print "got ", $retrieved, "\n";
});

foreach my $i (@list) {

  my $pid = $pm->start_child(  sub { doSomething( $i ) } );

  #$pm->finish(0, { result => $res, input => $q });
}

#$pm->finish;

$pm->wait_all_children;

#print Dumper \%results;

#-----------------------------------------------------------------------------
# doSomething 
#-----------------------------------------------------------------------------
sub doSomething {
  my $sleepTime = shift @_;
  say "doSomething sleepTime=".$sleepTime;
  sleep $sleepTime;
  return 0;
}
