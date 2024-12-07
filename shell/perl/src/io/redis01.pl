#!/usr/bin/env perl
#

use warnings;
use Redis;
use Data::Dumper;

my $redis = Redis->new;

my $t=$redis->hget('pfistera.play.Item:1','name');

print Dumper( $t );

# my @keys = $redis->keys( '*' );
# print Dumper( @keys );
