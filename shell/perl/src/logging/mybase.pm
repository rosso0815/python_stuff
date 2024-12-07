package mybase;

#use v5.10.0;
use warnings;
use strict;
use Carp;

use Log::Log4perl;

use Exporter qw(import);
our @EXPORT_OK = qw(b_info);

my $log;

BEGIN {
    #$SIG{'__DIE__'} = sub { confess(@_) };

    my $default_conf = q(
        log4perl.rootLogger              = DEBUG, LOG1, SCREEN
        log4perl.appender.SCREEN         = Log::Log4perl::Appender::Screen
        log4perl.appender.SCREEN.stderr  = 1
        log4perl.appender.SCREEN.layout  = Log::Log4perl::Layout::PatternLayout
        log4perl.appender.SCREEN.layout.ConversionPattern = %p %d %p %m %n
        log4perl.appender.LOG1           = Log::Log4perl::Appender::File
        log4perl.appender.LOG1.filename  = mylog.log
        log4perl.appender.LOG1.mode      = append
        log4perl.appender.LOG1.layout    = Log::Log4perl::Layout::PatternLayout
        log4perl.appender.LOG1.layout.ConversionPattern = %d %p %m %n
    );

    Log::Log4perl::init( \$default_conf );

    #Log::Log4perl->easy_init($INFO);
    #INFO "log4perl debug";
    #ERROR "log4perl-error";
    $log = Log::Log4perl->get_logger("mybase");
    $log->error('log4-fatal');
    $log->info('log4-info');

    #Log::Log4perl::init( "logger.cfg" );
    # Log::Log4perl->init("log.conf");
}

#sub logger {
#    Log::Log4perl->get_logger('Root');
#    }

sub b_info {
    print "Base::b_info = ", @_,"\n";
    carp "warning";
    croak "error-1";
    

    #my $log = Log::Log4perl->get_logger("My::MegaPackage");
    #$log->error("log4perl");
}

#sub import {
#    say "MODULE BASE";
#    warnings->import;
#    strict->import;
#    feature->import(':5.10');
#
#    # get the importing package name
#    my $caller = caller(0);
#
#    do {
##        no strict 'refs';
#        *{"$caller\:\:Dumper"} = *{"Data\:\:Dumper\:\:Dumper"};
#        *{"$caller\:\:logger"} = *{"MyBase\:\:logger"};
#    };
#}

1;
