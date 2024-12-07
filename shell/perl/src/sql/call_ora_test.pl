#!/usr/local/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual 
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use DBI;
use Env;

my $db= DBI->connect( "DBI:Oracle:test_caxws14", "pfistera", "andreas");

if (not $db){
        print "\n Server konnte nicht ermittelt werden";
        exit(1); }

my $query = 'select empno, ename from emp';
my $ausgabe = $db->prepare($query);
$ausgabe->execute;
my ($t1, $t2);
$ausgabe->bind_col( 1, \$t1, undef);
$ausgabe->bind_col( 2, \$t2, undef);

while ($ausgabe->fetch)
	{
        # my %h1 = ( NAME => $t1, JOB => $t2);
	printf("\nEMPNO= %s, NAME= %s",$t1, $t2);
	# printf("\nEMPNO= %s", $t1);
	# printf("\nENAME= %s", $t2);
        }
# und tschuess mit MySQL
$db->disconnect;
