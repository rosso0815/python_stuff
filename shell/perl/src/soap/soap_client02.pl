#!/usr/bin/perl

use strict;
use SOAP::Lite;

my $soap = SOAP::Lite
    -> uri('http://localhost:8080/C2FService')
    -> proxy('http://localhost:8080/C2FService');

print "@@@@".$soap-> c2f(37.5)-> result;
