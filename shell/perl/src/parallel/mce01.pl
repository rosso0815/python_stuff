#!/usr/bin/env perl
#
use MCE::Flow max_workers => 10;

 mce_flow sub {
    my ($mce) = @_;
    MCE->say("Hello from " . MCE->wid);
 };
