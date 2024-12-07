#!/usr/bin/perl -w

use Mail::POP3Client;
use Net::SMTP;

$pop = new Mail::POP3Client( USER     => "PfisterAndreas",
			     PASSWORD => "andreas",
			     HOST     => "pop3.hispeed.ch" );
for( $i = 1; $i <= $pop->Count(); $i++ ) 
	{
	foreach( $pop->Head( $i ) )
		{
		/^(From|Subject):\s+/i && print $_, "\n";
    		}
	}
$pop->Close();
# OR
#	$pop2 = new Mail::POP3Client( HOST  => "pop3.otherdo.main" );
#  $pop2->User( "somebody" );
#  $pop2->Pass( "doublesecret" );
#  $pop2->Connect() || die $pop2->Message();
#  $pop2->Close();

$smtp = Net::SMTP->new('smtp.hispeed.ch', Timeout=>30, Debug=>1); # connect to an SMTP server
$smtp->mail( 'pfister_andreas@hispeed.ch' );     # use the sender's address

# $smtp->to('PfisterAndreas@web.de');        # recipient's address
$smtp->to('pfister_andreas@hispeed.ch');
$smtp->data();                      # Start the mail

# Send the header.
# $smtp->datasend("To: andreas_pfister@hotmail.com\n");

$smtp->datasend("To: PfisterAndreas\n");
$smtp->datasend("From: PfisterAndreas\n");
$smtp->datasend("Subject: Hallo\n");
$smtp->datasend("Hallo von Oberengstringen");
$smtp->dataend();
$smtp->quit();

