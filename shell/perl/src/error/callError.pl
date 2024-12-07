#! /usr/bin/env perl

use Carp;

$SIG{__WARN__} = sub { Carp::cluck(@_) };

sub wrong {
    print "wrong\n";
    #confess "i m not there\n";
    warn "warning";
    return 0;
}

print "hallo andreas\n";

wrong;
