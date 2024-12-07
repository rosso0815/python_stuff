#!/usr/bin/perl -w

use Net::SMTP;

/*
$smtp = Net::SMTP->new('CHWIDA-HUB01', Timeout=>30, Debug=>1); # connect to an SMTP server
$smtp->mail( 'andreas.pfister@ubs.com' );     # use the sender's address
$smtp->to('andreas.pfister@ubs.com');        # recipient's address
$smtp->data();                      # Start the mail

# Send the header.
$smtp->datasend("To: PfisterAndreas\n");
$smtp->datasend("From: PfisterAndreas\n");
$smtp->datasend("Subject: Hallo Andreas\n");
$smtp->datasend("\r\n");
$smtp->datasend("Hallo Andreas, alles klar ?\n");
$smtp->dataend();
$smtp->quit();
*/