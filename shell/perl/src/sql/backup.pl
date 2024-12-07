#!/opt/service/bin/perl -w

#===============================================================================
#         FILE:  backup.pl
#        USAGE:  ./backup.pl
#  DESCRIPTION:
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:   (), <>
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  07.03.2006 17:42:02 CET
#     REVISION:  ---
#===============================================================================

use strict;
use DBI;
use IPC::Open2;
use Data::Dumper;
use Getopt::Long;
use Net::SMTP;
use Sys::Hostname;
use Shell;
use English;
use Time::Local;
use Log::Log4perl qw(:easy);

#===============================================================================

Log::Log4perl->easy_init( $ERROR);

my $FILE_ORATAB = '/var/opt/oracle/oratab';
my $PATH_BACKUP = '/backup/oracle';
my $DEL_ARCHIVE_FILES = 14;
my $MAIL;
my $OPTIONS;

$MAIL->{recipient} = 'andreas.pfister@rieterauto.com';
$MAIL->{host}      = 'mail1.rieterauto.com';
$MAIL->{LOGGER}    = "REPORT OF BACKUP.PL ";

#===============================================================================

# lets start
$OPTIONS = check_options();

open( INPUT, $FILE_ORATAB ) or die "\nERROR: unable to open file $FILE_ORATAB";
INFO("open oratab-file");

while ( my $line = <INPUT> ) {
    chomp $line;

    # check if line has a sid entry
    if ( $line =~ m/^([A-Za-z0-9]*):(.*):([NnYy])/ ) {
        my $sid        = $1;
        my $orahome    = $2;
        my $db_running = uc($3);
		INFO("found SID = $sid in oratab-file");

        if ( ( defined( $OPTIONS->{SID} ) ) && ( $OPTIONS->{SID} eq $sid ) )
			{
            INFO("backup single SID = $OPTIONS->{SID}");
			INFO("ora_home= $orahome ");

            my $DB_INFO;
            $DB_INFO->{ORACLE_SID}  = $sid;
            $DB_INFO->{ORACLE_HOME} = $orahome;

            getinfo_db($DB_INFO);
			shutdown_db($DB_INFO);
			backup_db($DB_INFO);
			startup_db($DB_INFO);
			send_email( 0, $DB_INFO, $MAIL );
			exit 0;
        }

		# save ALL databases
		elsif ( (defined( $OPTIONS->{ORATAB})) && ( "$db_running" eq "Y" ) )
		{
			INFO("backup all database, now $sid");
			my $DB_INFO;
            $DB_INFO->{ORACLE_SID}  = $sid;
            $DB_INFO->{ORACLE_HOME} = $orahome;

			getinfo_db( $DB_INFO);
			shutdown_db($DB_INFO);
			backup_db($DB_INFO);
			## startup_db($DB_INFO);
			check_archive_files( $DB_INFO);
			send_email( 0, $DB_INFO, $MAIL );
        }
    }
}

#===  FUNCTION  ================================================================
#         NAME:  check_options
#  DESCRIPTION:  check input parameter
# PARAMETER  1:  ---
#      CREATED:  2005-05-06 16:45:53 CEST  /  AUTHOR:
#===============================================================================
sub check_options {
    INFO("@@@ ", ( caller(0) )[1], " ", ( caller(0) )[3] );

    my $help;
    my $options;

    GetOptions(
        'sid=s'  => \$$options{SID},
        'oratab' => \$$options{ORATAB},
        'h'      => \$help,
        'help'   => \$help,
    );

    if ( ($help) or ( ( !$options->{ORATAB} ) and ( !$options->{SID} ) ) ) {
        print "\thelp for oracle backup\n";
        print "\t-oratab    = make backup from ALL RUNNING db's in the oratab file\n";
        print "\t-sid=<SID> = make a backup for this ORACLE_SID\n";
        exit 0;
    }

    return $options;
}

#===  FUNCTION  ================================================================
#         NAME:  getinfo_db
#  DESCRIPTION:  open the db and calls all necessary infos from the OPEN db
# PARAMETER  1:  ---
#      CREATED:  2005-05-06 17:55:39 CEST  /  AUTHOR:
#===============================================================================
sub getinfo_db {
    INFO("@@@", ( caller(0) )[1], " ", ( caller(0) )[3]);

    # select name from sys.v_$datafile;
    # select member from sys.v_$logfile;
    # select name from sys.v_$controlfile;
    # select name from v$tempfile;
	# select value from v$parameter where name like 'log_archive_dest%' and value like 'LOCATION%';
    
	my $dbinfo = shift @_;
    my $dbh    = DBI->connect( "DBI:Oracle:$dbinfo->{ORACLE_SID}", "monitor", "monitor", { PrintError => 1 } );

    if ($DBI::errstr) {
        ERROR ( "error db connect ##$DBI::errstr##");
		ERROR ( $dbinfo );
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . $DBI::errstr;
        exit 1;
    }

    $dbinfo->{datafiles} = $dbh->selectall_hashref( 'select name from v$datafile', 'NAME' );
    if ($DBI::errstr) {
        ERROR ("error db select datafile##$DBI::errstr##");
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . $DBI::errstr;
		exit 1;
    }

    $dbinfo->{"logfiles"}     = $dbh->selectall_hashref( 'select member from v$logfile', 'MEMBER' );
    $dbinfo->{"controlfiles"} = $dbh->selectall_hashref( 'select name from v$controlfile', 'NAME' );
    $dbinfo->{"tempfiles"}    = $dbh->selectall_hashref( 'select name from v$tempfile', 'NAME' );
	$dbinfo->{"archfiles"}    = $dbh->selectall_arrayref( 
		'select value from v$parameter where name like \'log_archive_dest%\' and value like \'LOCATION%\'');
	
    $dbh->disconnect;
}

#===  FUNCTION  ================================================================
#         NAME:
#  DESCRIPTION:
# PARAMETER  1:
#      CREATED:  2005-05-06 17:57:16 CEST  /  AUTHOR:
#===============================================================================
sub shutdown_db {
    my $dbinfo  = shift @_;
    
	INFO("@@@", ( caller(0) )[1], " ", ( caller(0) )[3]);
	INFO("shutdown of $dbinfo->{ORACLE_SID}");
	
	my $old_orahome = $ENV{ORACLE_HOME};
	my $old_orasid  = $ENV{ORACLE_SID};
    my $old_path    = $ENV{PATH};
	$ENV{ORACLE_HOME} = $dbinfo->{ORACLE_HOME};
	$ENV{ORACLE_SID}  = $dbinfo->{ORACLE_SID};
	$ENV{PATH}        = $dbinfo->{ORACLE_HOME}."/bin:".$ENV{PATH};

    local ( *READ4P, *WRITE2P );
    my ($pid);
    $pid = open2( *READ4P, *WRITE2P, "$dbinfo->{ORACLE_HOME}/bin/sqlplus /nolog" );
	print WRITE2P ("connect / as sysdba;\n");
	print WRITE2P ("alter system checkpoint;\n");
	print WRITE2P ("shutdown abort;\n");
	print WRITE2P ("startup restrict;\n");
	print WRITE2P ("shutdown immediate;\n");
	print WRITE2P ("exit;\n");

    while (<READ4P>) {
        INFO("\n\toutput=$_");
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . $_;
    }
    close(READ4P);
    close(WRITE2P);
    INFO("Status=$?#");
	
	$ENV{ORACLE_HOME} = $old_orahome;
	$ENV{ORACLE_SID}  = $old_orasid;
	$ENV{PATH}        = $old_path;
}

#===  FUNCTION  ================================================================
#         NAME: startup_db
#  DESCRIPTION: start up db, make connection and check availabilty
# PARAMETER  1:
#      CREATED:  2005-05-06 20:43:53 CEST  /  AUTHOR:
#===============================================================================
sub startup_db {
    my $dbinfo  = shift @_;
    
	INFO("@@@", ( caller(0) )[1], " ", ( caller(0) )[3] );

	my $old_orahome = $ENV{ORACLE_HOME};
	my $old_orasid  = $ENV{ORACLE_SID};
    my $old_path    = $ENV{PATH};
	
	$ENV{ORACLE_HOME} = $dbinfo->{ORACLE_HOME};
	$ENV{ORACLE_SID}  = $dbinfo->{ORACLE_SID};
	$ENV{PATH}        = $dbinfo->{ORACLE_HOME}."/bin:".$ENV{PATH};

    local ( *READ4P, *WRITE2P );
    my ($pid);
    $pid = open2( *READ4P, *WRITE2P, "$ENV{'ORACLE_HOME'}/bin/sqlplus /nolog" );
    print WRITE2P ("connect / as sysdba;\n");
    print WRITE2P ("startup;\n");
	print WRITE2P ("exit;\n");
    while (<READ4P>) {
        INFO( "output=$_");
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . $_;
    }

    close(READ4P);
    close(WRITE2P);
	
	$ENV{ORACLE_HOME} = $old_orahome;
	$ENV{ORACLE_SID}  = $old_orasid;
	$ENV{PATH}        = $old_path;

}

#===  FUNCTION  ================================================================
#         NAME:  BACKUP_DB
#  DESCRIPTION:  copy the file to the backup destination
# PARAMETER  1:  ----
#      CREATED:  2005-05-06 17:46:27 CEST  /  AUTHOR:
#===============================================================================
sub backup_db {
    INFO("@@@", ( caller(0) )[1], " ", ( caller(0) )[3]);

    my $dbinfo = shift @_;

    mkdir $PATH_BACKUP;
    mkdir $PATH_BACKUP . '/' . $dbinfo->{ORACLE_SID};

    if ( !-d $PATH_BACKUP . '/' . $dbinfo->{"ORACLE_SID"} ) {
        ERROR("ERROR cannot create backup-directory");
        exit 1;
    }

    foreach my $name ( keys %{ $dbinfo->{datafiles} } ) {
		INFO("datafile =$dbinfo->{datafiles}->{$name}->{NAME}");
        
		copy_file( $dbinfo->{datafiles}->{$name}->{NAME}, "$PATH_BACKUP/$dbinfo->{ORACLE_SID}");

        ( my $filename = $dbinfo->{datafiles}->{$name}->{NAME} ) =~ s/^.*\///g;

        my $pid = open( PH, 
			"$dbinfo->{ORACLE_HOME}/bin/dbv blocksize=8192 file=$PATH_BACKUP/$dbinfo->{ORACLE_SID}/$filename 2>&1 |");
        while (<PH>) {
            $MAIL->{LOGGER} = $MAIL->{LOGGER} . $_;
        }
    }

    foreach my $name ( keys %{ $dbinfo->{controlfiles} } ) {
        INFO("controlfile = $dbinfo->{controlfiles}->{$name}->{NAME}");
        copy_file( $dbinfo->{controlfiles}->{$name}->{NAME}, "$PATH_BACKUP/$dbinfo->{ORACLE_SID}");
    }

    foreach my $name ( keys %{ $dbinfo->{logfiles} } ) {
        INFO("logfiles = $dbinfo->{logfiles}->{$name}->{MEMBER}");
        copy_file( $dbinfo->{logfiles}->{$name}->{MEMBER}, "$PATH_BACKUP/$dbinfo->{ORACLE_SID}"
        );
    }

    foreach my $name ( keys %{ $dbinfo->{tempfiles} } ) {
        INFO("tempfiles = $dbinfo->{tempfiles}->{$name}->{NAME}");
        copy_file( $dbinfo->{tempfiles}->{$name}->{NAME}, "$PATH_BACKUP/$dbinfo->{ORACLE_SID}"
        );
    }

    if ( !-l "$dbinfo->{ORACLE_HOME}/dbs/spfile$dbinfo->{ORACLE_SID}.ora" ) {
        copy_file( "$dbinfo->{ORACLE_HOME}/dbs/spfile$dbinfo->{ORACLE_SID}.ora", "$PATH_BACKUP/$dbinfo->{ORACLE_SID}" );
    }

    # create restore.txt
    open( OUTPUT, ">$PATH_BACKUP/$dbinfo->{ORACLE_SID}/restore.txt" )
      or die 'ERROR cannot open restore.txt';

    my ( $MIN, $HOUR, $DAY, $MONTH, $YEAR ) = (localtime)[ 1, 2, 3, 4, 5 ];
    printf OUTPUT "\n##################################################";
    printf OUTPUT "\n# use for restore";
    printf OUTPUT "\n# created at %s:%s %s.%s.%s", $HOUR, $MIN, $DAY, $MONTH + 1, $YEAR + 1900;
    printf OUTPUT "\n##################################################";
    printf OUTPUT "\n";

    $MAIL->{LOGGER} = $MAIL->{LOGGER} . "\n#### restore.txt ####\n";
    foreach my $name ( keys %{ $dbinfo->{datafiles} } ) {
        $name =~ m/(.*\/)(.*)/;
        print OUTPUT "cp $2 $dbinfo->{datafiles}->{$name}->{NAME}\n";
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . "$dbinfo->{datafiles}->{$name}->{NAME}\n";
    }

    foreach my $name ( keys %{ $dbinfo->{controlfiles} } ) {
        $name =~ m/(.*\/)(.*)/;
        print OUTPUT "cp $2 $dbinfo->{controlfiles}->{$name}->{NAME}\n";
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . "$dbinfo->{controlfiles}->{$name}->{NAME}\n";
    }

    foreach my $name ( keys %{ $dbinfo->{logfiles} } ) {
        $name =~ m/(.*\/)(.*)/;
        print OUTPUT "cp $2 $dbinfo->{logfiles}->{$name}->{MEMBER}\n";
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . "$dbinfo->{logfiles}->{$name}->{MEMBER}\n";
    }

    foreach my $name ( keys %{ $dbinfo->{tempfiles} } ) {
        $name =~ m/(.*\/)(.*)/;
        print OUTPUT "cp $2 $dbinfo->{tempfiles}->{$name}->{NAME}\n";
        $MAIL->{LOGGER} = $MAIL->{LOGGER} . "$dbinfo->{tempfiles}->{$name}->{NAME}\n";
    }

    print OUTPUT "cp spfile$ENV{'ORACLE_SID'}.ora $ENV{'ORACLE_HOME'}/dbs/spfile$ENV{'ORACLE_SID'}.ora\n";
    $MAIL->{LOGGER} = $MAIL->{LOGGER} . "$ENV{'ORACLE_HOME'}/dbs/spfile$ENV{'ORACLE_SID'}.ora\n";
    close(OUTPUT);
}

#===  FUNCTION  ================================================================
#         NAME:  copy_file
#  DESCRIPTION:  copy the file
# PARAMETER  1:
#      CREATED:  2005-05-08 11:44:52 CEST  /  AUTHOR:
#===============================================================================
sub copy_file {
    INFO("@@@", ( caller(0) )[1], " ", ( caller(0) )[3]);
    
	my $source = shift @_;
    my $target = shift @_;
    my ( $filename, $text );
    ( $filename = $source ) =~ s/^.*\///g;
    $text = `cp $source $target`; #!!!
    INFO("source=$source;target=$target");
    INFO("copy = $text");
}


#===  FUNCTION  ================================================================
#         NAME:  check archive files
#  DESCRIPTION: clean up the archive_dest with files older then 2 weeks
#===============================================================================
sub check_archive_files{
	INFO("@@@", ( caller(0) )[1], " ", ( caller(0) )[3]);
	my $dbinfo = shift @_;

	foreach my $obj ( @{$dbinfo->{archfiles}}  ){
		my $dest;
		my $file;
		( $dest = $obj->[0]) =~ s/LOCATION=//g;
		INFO("archive_dest=".$dest);
		
		opendir(DIR, $dest) or die "can't opendir $dest";
		while (defined($file = readdir(DIR))){
			if ( -s "$dest/$file" ) {
				INFO("found file=$dest/$file");

				my ($READTIME, $WRITETIME) = (stat("$dest/$file"))[8,9];
				my $days = ( time - $WRITETIME ) / ( 3600 * 24 );
				INFO ( "file is $days days old");
				if ( $days > $DEL_ARCHIVE_FILES ){
					INFO("@ delete file $dest/$file");
					system( "rm", "-f", "$dest/$file");
				}
			}
		}
		closedir(DIR);	
	}
}


#===  FUNCTION  ================================================================
#         NAME:   send_email
#  DESCRIPTION:
# PARAMETER  1:  ---
#      CREATED:  05/11/05 02:10:25 PM CEST  /  AUTHOR:
#===============================================================================
sub send_email {
    my $error  = shift @_;
	my $dbinfo = shift @_;
	my $mail   = shift @_;
    my $subject;
	
    INFO( "@@@", ( caller(0) )[1], " ", ( caller(0) )[3]);

    if ($error) {
        $subject =
            "Subject: ERROR Oracle-Backup Host:"
          . hostname()
          . " SID:$dbinfo->{ORACLE_SID}";
    }
    else {
        $subject =
            "Subject: OK Oracle-Backup Host:"
          . hostname()
          . " SID:$dbinfo->{ORACLE_SID}";
    }
    
	my $smtp = Net::SMTP->new( $MAIL->{host}, Timeout => 30 ) or die "ERROR SMTP";
    $smtp->mail( $MAIL->{recipient} );
    $smtp->to( $MAIL->{recipient} );
    $smtp->data();
    $smtp->datasend("To: OracleBackup\n");
    $smtp->datasend("From: OracleBackup\n");
    $smtp->datasend( $subject . "\n" );
    $smtp->datasend("\r\n");
    $smtp->datasend( $MAIL->{LOGGER} );
    $smtp->dataend();
    $smtp->quit();

    if ($error) {
        exit 1;
    }
}
