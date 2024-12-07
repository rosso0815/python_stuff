#!/usr/bin/perl

$output = `dir`;
print "\nRW = $?";

$output =~ s/DIR/DRECTORI/g;

print "\nOutput\n******\n$output";



#$t_out=<STDOUT>;
#print "STDOUT = $t_out";
#open (input,"dir |");
#while (<input>){print ;}
#my $rw = system('dir');
#close( STDOUT);
#print "\nReturncode = $rw";
