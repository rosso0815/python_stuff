#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

use Net::Stomp;
use JSON;

my $student = {
    name => 'Foo Bar',
    email => 'foo@bar.com',
};
 
say "start STOMP01";

#my $student_json = encode_json $student;

#say "will send " . $student_json;

my $stomp = Net::Stomp->new({ hostname => "localhost", port => 61613 });

$stomp->connect();

#$stomp->send({ destination => "/POSTFACH", body => $student_json });
$stomp->send({ destination => "/POSTFACH", body => 'Hallo from StompyPerl' });

$stomp->disconnect();

say "done";

