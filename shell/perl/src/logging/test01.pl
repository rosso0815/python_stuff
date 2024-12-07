#!/usr/bin/env perl -w

#===============================================================================
#         FILE:  test01.pl
#        USAGE:  ./test01.pl
#  DESCRIPTION:
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  05/10/06 10:08:48 AM CEST
#     REVISION:  ---
#===============================================================================
# LOG-LEVEL = FATAL, ERROR, WARN, INFO and DEBUG
use strict;
use Log::Log4perl qw(:easy);
use Log::Dispatch::Screen;

#------------------------------------------------------------------------------
Log::Log4perl->easy_init($DEBUG);
my $logger = get_logger();

#my $screen = Log::Dispatch::Screen->new( name      => 'screen',
#                                           min_level => 'debug',
#                                           stderr    => 1 );
#
# Appenders
my $appender = Log::Log4perl::Appender->new(
    "Log::Dispatch::File",
    filename  => "test.log",
    mode      => "append",
    min_level => 'error',
);

# Layouts
my $layout =
  Log::Log4perl::Layout::PatternLayout->new("%d %p> %F{1}:%L %M - %m%n");
$appender->layout($layout);
$logger->add_appender($appender);

#--------------------------------------------------------------------------------
drink();
drink("Soda");
exit(0);

#--------------------------------------------------------------------------------
sub drink {
    my ($what) = @_;
    if ( defined $what ) {
        $logger->info( "Drinking ", $what );
    }
    else {
        $logger->error("No drink defined");
    }
}

#--------------------------------------------------------------------------------
