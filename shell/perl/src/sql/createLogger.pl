#!/opt/service/bin/perl -w
#===============================================================================
#         FILE:  createLogger.pl
#        USAGE:  ./createLogger.pl 
#  DESCRIPTION:  
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:  
#      VERSION:  1.0
#      CREATED:  06/09/06 07:48:48 AM CEST
#     REVISION:  ---
#===============================================================================

use strict;
use DBI;
use Log::Log4perl qw(:easy);
use Getopt::Std;
use Data::Dumper;
use Template;

Log::Log4perl->easy_init($DEBUG);

$main::VERSION = "0.1";
my $oraUsr;
my $oraPw;
my $oraSid;

#--------- MAIN ----------------------------------------------------------------
checkOptions();

my @schemaArray = createArrayFromSchema();
createTrigger( \@schemaArray);
exit 0;

#--------------------------------------------------------------------------------
sub checkOptions{
	INFO "@@@ checkOptions";
	my %opts;
	$Getopt::Std::STANDARD_HELP_VERSION = 1;
	getopts('u:p:s:', \%opts);
	if ( (! $opts{u}) or (!$opts{p}) or (!$opts{s}) ){
		INFO "check options again";
		HELP_MESSAGE();
		exit 1;
	}
	$oraUsr = $opts{u};
	$oraPw  = $opts{p};
	$oraSid = $opts{s};
}
#--------------------------------------------------------------------------------
sub HELP_MESSAGE{ 
	INFO "@@@ HELP_MESSAGE";
	ERROR "ERROR: please define -u -p -s";
	ERROR "-u = username";
	ERROR "-p = password";
	ERROR "-s = oracle-sid\n";
	exit 1;
}

#--------------------------------------------------------------------------------
sub createArrayFromSchema{
	INFO "@@@ createArrayFromSchema";
	
	my $db= DBI->connect( "DBI:Oracle:$oraSid", $oraUsr, $oraPw);
	if (not $db){
        print "\n Server konnte nicht ermittelt werden";
        exit(1);
	}

	my $query = 'select TABLE_NAME from user_tables';
	my $ary_ref  = $db->selectall_arrayref($query);
	my @array;

	INFO "anzahl=".scalar( @$ary_ref);
	foreach my $obj (@$ary_ref){
        INFO "table ".$obj->[0];
		push @array, $obj->[0];
	}
	
	$db->disconnect;
	return @array;
}
#--------------------------------------------------------------------------------
sub createTrigger {
	my $schema = shift @_;
	my $tt = Template->new;

	INFO "@@@ createTrigger";
	#INFO Dumper( $schema);
	my $vars;
	my $output;
	my $tmpfile="temp.sql";
	
	$vars->{oraSid} = $oraSid;
	$vars->{schema} = $schema;

	$tt->process(\*DATA, $vars, \$output ) || die $tt->error(), "\n";

	INFO("output=".$output);
	open(TMPFILE,">$tmpfile");
	print(TMPFILE $output);
	close(TMPFILE);
	
	my $texec = $oraUsr."/".$oraPw."\@".$oraSid." \@".$tmpfile;
	INFO("ORA_HOME=".$ENV{ORACLE_HOME}." execstring=".$texec);
	system( $ENV{ORACLE_HOME}."/bin/sqlplus -s ".$texec);
}
#--------------------------------------------------------------------------------
# We use OraSid = [% oraSid %]
# DUMP=>[% #Dumper.dump(schema) %]
# -------------------------------------------------------------------------------
 __END__
[% USE Dumper %]

set serveroutput on;

[% FOREACH variable = schema %] 
create or replace trigger log_[% variable %]
    after insert or update or delete on [% variable %]
    for each row
declare
    v_user varchar(255);
    v_action varchar(255);
    v_tabelle varchar(255);
    v_remark  varchar(255);
begin
    v_user   := USER ;
	v_remark := 'RID_N=' || :new.rowid || ' RID_O=' || :old.rowid ;
 
	if inserting then
		v_action := v_action ||'inserting';
	elsif updating then
		v_action := v_action ||'updating';
	elsif deleting then
		v_action := v_action ||'deleting';
	else
		v_action := v_action ||'unknown';
	end if;
    	
	insert into monitor.logger(time, schema, tablename,action,remark)
		values( sysdate, v_user, '[% variable %]',v_action,v_remark);
end logger;
/
[% END %]
exit;
