#!/opt/service/bin/perl  -w

use DBI;

my $mydb= DBI->connect( "DBI:Oracle:TCE500", "apfister", "andreas");

if (not $mydb)
	{
	print "\n Server konnte nicht ermittelt werden";
	exit(1);
	}

my $query = 'select empno, ename, job from emp';
my $ausgabe = $mydb->prepare($query);
$ausgabe->execute;

$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);
$ausgabe->bind_col( 3, \$t3, undef);

print "\n","**** Listenanfang ****","\n";

while ($ausgabe->fetch){
	print "T1 = $t1 T2 = $t2 T3 = $t3","\n";}

print "**** Ende der Liste ****","\n";

$mydb->disconnect;
