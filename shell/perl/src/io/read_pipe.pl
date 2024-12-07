#!/usr/local/bin/perl -w
#===============================================================================
#         FILE:  read_pipe.pl
#        USAGE:  ./read_pipe.pl 
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
my ($pid);
$pid = open(PH, "ls -l 2>&1 |"); # with an open pipe
while (<PH>)
{
	print $_;
}                               # plus a read


