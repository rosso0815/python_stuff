#! /usr/bin/env perl

# use lib '.';
# perl -I . test02.pl
use strict;
use warnings;
use Data::Dumper;
use Carp;
use Carp 'verbose';

local $SIG{__WARN__} = sub {
        my $msg = shift(@_);
        chomp $msg;
        print "[WARNING] $msg done\n";
    };

local $SIG{__DIE__} = sub {
        my $msg = shift(@_);
        chomp $msg;
        print "[ERROR] $msg done\n";
        #print "[ERROR] $msg done\n";
        exit 1;
    };

use mybase qw( b_info);

print "start\n";

b_info("hallo");

print "done\n";

exit 0;

#use v5.10.0;
#use strict;
#use warnings;
#use Carp;
#use POSIX qw(strftime);
#use feature qw/say/;
#use autodie;

#--- DEFINITIONS --------------------------------------------------------------

#my $logFile = "log.txt";

#--- INIT ---------------------------------------------------------------------

#BEGIN {
#
#    sub logEntry {
#        my $time = strftime "%m-%d-%Y %H:%M:%S", ( localtime(time) );
#        my $error_code = shift(@_);
##        chomp(@_);
#        print "$time $error_code: @_\n";
#    }
#
##    $SIG{INT} = sub {
#        print "Caught a sigint $!" ;
#        exit 1;
#        };
#
#    $SIG{__WARN__} = sub {
#        my $message = shift;
#        logEntry( "WARNING", $message );
#    };

#    $SIG{__DIE__} = sub {
#        my $message = shift;
#        logEntry( "DIE", $message );
#    };
#}

#------------------------------------------------------------------------------

#--- MAIN ---------------------------------------------------------------------

#sleep 20;
#warn "this is a warning";
#carp "this is a carp";
#die "this is a die";
#croak "gone";

# open filehandle log.txt
#open( my $LOG, '>>', 'log.txt' );

# select new filehandle
#select $LOG;
#print `ls`;

#logEntry "do_something";

#say 'This should be logged.';

# restore STDOUT
#select STDOUT;

#print `ls`;
#say 'This should show in the terminal';
#print "ende";

#------------------------------------------------------------------------------
