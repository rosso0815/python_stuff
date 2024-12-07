#! /usr/bin/env perl

use strict;
use warnings;

my $old_warn_handler = $SIG{__WARN__};

$SIG{__WARN__} = sub {

    die "[ERROR] =", @_;
    
    #print "received warn @_ \n";
    #$old_warn_handler->(@_) if $old_warn_handler;
};

my $v1="22";
my $v2;





warn "I m too old";

#print "v1=$v1;
#v2=$v2";
