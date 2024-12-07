#!/usr/bin/env perl

use strict;
use warnings;
use 5.10.0;

use Redis;

say "start";

my $r = Redis->new;

my $t1 = $r->get("T1");

if ( defined( $t1 )){
    say "T1".$t1;
}else{
    say "T1 is undefined";
}
