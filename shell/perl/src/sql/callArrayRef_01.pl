#!/opt/service/bin/perl -w

# Erzeuger : A.Pfister
# Datum    : 25.01.2002
# Aufruf   : manual 
# Funktion : Anzeige von Oracle-Test Scott Tiger aus table emp
# Version  : 001

use strict;

use DBI;
use Env;
use Data::Dumper;

$ENV{ORACLE_HOME}="/opt/apps/oracle/product/9.2.04";

my $db= DBI->connect( "DBI:Oracle:aptc5", "pfistera", "andreas");

if (not $db){
        print "\n Server konnte nicht ermittelt werden";
        exit(1); }
	
showEmp();
updateSal();
showEmp();
$db->disconnect;

#-----------------------------------------------------------------------------------------
sub updateSal {
	print "\nupgrade salaray > 6000";

	$db->{AutoCommit} = 0;  # enable transactions, if possible
	$db->{RaiseError} = 1;
	
	eval {
      changeSal(4000);        # do lots of work here
      $db->commit;   # commit the changes if we get this far
  };

  if ($@) {
      warn "Transaction aborted because $@";
      # now rollback to undo the incomplete changes
      # but do it in an eval{} as it may also fail
      eval { $db->rollback };
      # add other application on-error-clean-up code here
	}
}
#-----------------------------------------------------------------------------------------
sub changeSal{
	my $sal = shift @_;
	print "\n@@@ changeSal";

	my $sql = 'select count(*) from emp where sal > '.$sal;
	my ($count) = $db->selectrow_array( $sql );
	print "\ndo count(*) =$count";

	my $query = 'select count(*) from emp where sal > '.$sal;
	my $ary_ref  = $db->selectall_arrayref($query);
	print Dumper( $ary_ref->[0]->[0]);

	if ( $ary_ref->[0]->[0] <= 1 ) { 
		print "found ".$ary_ref->[0]->[0]." objects for update";
		$db->do('update emp set sal = 7000 where sal > '.$sal);
		$db->rollback();
	}
}

#-----------------------------------------------------------------------------------------
sub showEmp {
my $query = 'select empno, ename ,sal from emp';
my $ary_ref  = $db->selectall_arrayref($query);

print "\nanzahl=".scalar( @$ary_ref);
my $i=0;
foreach my $obj (@$ary_ref){
	#print "\nline ".$i."=".Dumper($obj)."\n 0 =".$obj->[0];
	print "\nline ".$i." # empno =".$obj->[0]." ename=".$obj->[1]." sal=".$obj->[2];
	$i++;
}

}
#-----------------------------------------------------------------------------------------
