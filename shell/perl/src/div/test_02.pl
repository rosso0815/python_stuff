require ("test.pm");

print "**prg anfang**\n";

sub echo{
	print " subroutine echo\n";
}

echo;
test::test;
print "**prg ende**\n";