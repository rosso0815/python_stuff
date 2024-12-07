
open SPOOLER, "ls |";

while (<SPOOLER>){
	$t = $_;
	print "T=",$t;}

close SPOOLER;
