#! /usr/bin/env perl

use Jenkins::API;
use Data::Dumper;

my $jenkins = Jenkins::API->new({
        base_url => 'http://localhost:10100/jenkins',
        api_key => 'pfistera',
        api_pass => 'a02266cf14117ad807280d67cb1bb3d6',
    });

my $status = $jenkins->current_status();

print Dumper( $status );

#------------------------------------------------------------------------------

