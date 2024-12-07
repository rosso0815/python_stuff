#!/usr/bin/env perl

$hostname=`hostname`;
$user = `whoami`;

print "Hallo $user\n host = $hostname \n";