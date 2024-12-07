#!/usr/bin/perl -w
#===============================================================================
#         FILE:  read_file.pl
#        USAGE:  ./read_file.pl 
#  DESCRIPTION:  
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  apfister
#      COMPANY:  rieter automotive ag
#      VERSION:  1.0
#      CREATED:  05/11/05 09:32:49 AM CEST
#     REVISION:  ---
#===============================================================================

use strict;

my $file="logfile";
my $line;
my $file_done = 0;

open( INPUT, $file ) or die "\nERROR: unable to open file $file";
	while ( defined(( $line = <INPUT> )) && (! $file_done))
	{
		chomp $line;
		printf "line=$line\n";
		$file_done=1;
	}
close INPUT;