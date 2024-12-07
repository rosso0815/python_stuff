#!/usr/bin/perl -w

use Net::SMTP;

$smtp = Net::SMTP->new('smtp.hotmail.com', Timeout=>30, Debug=>1); # connect to an SMTP server
$smtp->mail( 'andreas_pfister@hotmail.com' );     # use the sender's address

# $smtp->to('PfisterAndreas@web.de');        # recipient's address
$smtp->to('andreas_pfister@hotmail.com');
$smtp->data();                      # Start the mail

# Send the header.
# $smtp->datasend("To: andreas_pfister@hotmail.com\n");

$smtp->datasend("To: PfisterAndreas\n");
$smtp->datasend("From: PfisterAndreas\n");
$smtp->datasend("Subject: Hallo\n");
$smtp->datasend("Hallo von Oberengstringen");
$smtp->dataend();
$smtp->quit();
