#!/bin/perl 

use warnings;
use strict;

use Thread;

my @list = qw(abc1 abc2 abc3 abc4 abc5);
my @threadlist = ();

for my $lst (@list) {
  my $t = Thread->new(\&thread_exec , $lst);
  print "Wating for thread for $lst\n";
  push @threadlist, $t;
}

for my $thd (@threadlist) {
  print "Wating for thread to join\n";
  $thd->join;
}

sub thread_exec {
  my $info = shift;
  print "INFO = $info\n";
}
