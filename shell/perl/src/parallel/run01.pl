#!/usr/bin/env perl
#
use strict;
use warnings;

use Parallel::ForkManager;

my $pm = Parallel::ForkManager->new(1);

LINKS:
for my $t (@ARGV) {
	$pm->start and next LINKS;
	#print "Getting $t\n";
	sleep 5;
};

$pm->finish;
