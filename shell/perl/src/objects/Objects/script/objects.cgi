#!/usr/bin/perl -w

BEGIN { $ENV{CATALYST_ENGINE} ||= 'CGI' }


use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Objects;

$ENV{ORACLE_HOME} = '/home/oracle/p10r2';

Objects->run;

1;