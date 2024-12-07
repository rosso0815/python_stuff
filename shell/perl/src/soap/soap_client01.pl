#!/usr/bin/perl

use strict;
use SOAP::Lite;

my $service = SOAP::Lite->service('http://localhost:6980/MathServiceInterface?wsdl');

print "result=", $service->add( 1 , 2), "\n";
