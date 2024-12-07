#! /usr/bin/env perl

use strict;
use warnings;
use 5.010;
 
say "PID $$";
my $pid = fork();
die if not defined $pid;
say "PID $$ ($pid)";
