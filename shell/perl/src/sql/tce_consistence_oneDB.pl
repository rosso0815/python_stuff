#!/opt/service/bin/perl -w

#===============================================================================
#         FILE:  
#        USAGE:  ./ 
#  DESCRIPTION:  
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  06/06/05 02:50:09 PM CEST
#     REVISION:  ---
#===============================================================================

use strict;
use DBI;
use Env;
use List::Compare;
use Data::Dumper;

$ENV{'ORACLE_HOME'}='/opt/apps/oracle/product/9.2.04';

my ($ar_adm, $ar_key, $ar_su, $lc, @LorRonly);

if (! $ARGV[0])
{
	die "please input SID";
}

my $dbh= DBI->connect( "DBI:Oracle:$ARGV[0]", "monitor", "monitor");

if (not $dbh)
	{
        print "\n Server konnte nicht ermittelt werden";
        exit(1);
	}

listTables( \@$ar_adm, 'ADMM31A');
listTables( \@$ar_key, 'KEYM31A');
listTables( \@$ar_su,  'SUM31A');
	
print"\nSCHEMA ADMM31A tabellen=", scalar(@$ar_adm);
print"\nSCHEMA KEYM31A tabellen=", scalar(@$ar_key);
print"\nSCHEMA SUM31A  tabellen=", scalar(@$ar_su);

diffTables( "ADMM31A and SUM31A" , \@$ar_adm, \@$ar_su);
diffTables( "ADMM31A and KEYM31A", \@$ar_adm, \@$ar_key);
diffTables( "SUM31A  and KEYM31A", \@$ar_su,  \@$ar_key);

listColumns( \@$ar_adm, 'ADMM31A');
listColumns( \@$ar_key, 'KEYM31A');
listColumns( \@$ar_su , 'SUM31A');

print"\nSCHEMA ADMM31A columns=", scalar(@$ar_adm);
print"\nSCHEMA KEYM31A columns=", scalar(@$ar_key);
print"\nSCHEMA SUM31A  columns=", scalar(@$ar_su);
diffTables( "ADMM31A and SUM31A" , \@$ar_adm, \@$ar_su);
diffTables( "ADMM31A and KEYM31A", \@$ar_adm, \@$ar_key);
diffTables( "SUM31A  and KEYM31A", \@$ar_su,  \@$ar_key);




$dbh->disconnect;
print "\nEND\n";
exit 0;


#===  FUNCTION  ================================================================
#         NAME:  
#  DESCRIPTION:  
# PARAMETER  1:  
#      CREATED:  06/07/05 08:25:30 AM CEST  /  AUTHOR:  
#===============================================================================
sub listTables
{	
	my $ar     = shift @_;
	my $schema = shift @_;
	
	#print "\nlistTables schema=$schema";
	
	my $t_ar = $dbh->selectall_arrayref("select TABLE_NAME from dba_tables 
		where OWNER like '$schema'");

	for my $t1 ( 0 .. $#$t_ar)
	{
		my $t_ar_e=$t_ar->[$t1];
		for my $t2 ( 0 .. $#$t_ar_e)
		{
			push( @$ar,  $t_ar_e->[$t2]);
		}
	}
}
#===  FUNCTION  ================================================================
#         NAME:  
#  DESCRIPTION:  
# PARAMETER  1:  
#      CREATED:  06/07/05 09:06:15 AM CEST  /  AUTHOR:  
#===============================================================================
sub diffTables
{
	my $text = shift @_;
	my $ar1  = shift @_;
	my $ar2  = shift @_;

	print "\n\ndiffTables from $text";
	
	my $lc = List::Compare->new( \@$ar1, \@$ar2);
	print "\n\tonly in table 1";
	my @result = $lc->get_unique;
	foreach my $t ( @result)
	{
		print "\n\ttabelle $t"
	}
	
	print "\n\tonly in table 2";
	@result = $lc->get_complement;
	foreach my $t ( @result)
	{
		print "\n\ttabelle $t"
	}
}

#===  FUNCTION  ================================================================
#         NAME:  
#  DESCRIPTION:  
# PARAMETER  1:  
#      CREATED:  06/07/05 08:25:30 AM CEST  /  AUTHOR:  
#===============================================================================
sub listColumns
{	
	my $ar     = shift @_;
	my $schema = shift @_;
	
	#print "\nlistColumns schema=$schema";
	
	my $t_ar = $dbh->selectall_arrayref("
		select TABLE_NAME,COLUMN_NAME 
		from dba_tab_columns 
		where OWNER like '$schema'");

	for my $t1 ( 0 .. $#$t_ar)
	{
		my $t_ar_e=$t_ar->[$t1];
		my $t_string="$t_ar_e->[0]::$t_ar_e->[1]";
		#print "\nDBGstring=$t_string";
		push( @$ar,  $t_string);
	}
}

