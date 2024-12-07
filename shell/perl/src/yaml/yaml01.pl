#!/usr/bin/env perl

use strict;
use warnings;

use YAML;
use Data::Dumper;

print "start\n";

# step 1: open file
open my $fh, '<', 'config.yml' 
  or die "can't open config file: $!";

# step 2: convert YAML file to perl hash ref
my $config = YAML::LoadFile($fh);

print "@@@ YAML::Dump \n", YAML::Dump($config), "\n";#

#print Dumper( $config ) ;

#print Dumper( $config->{'product'} ) ;

print "done\n";
