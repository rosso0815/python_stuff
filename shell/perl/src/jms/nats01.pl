#! /usr/bin/env perl

use warnings;
use strict;

use Net::NATS::Client;
use MIME::Base64 ();

print "start 0=$ARGV[0]\n";

if ( $ARGV[0] eq "send" ) {
   print "found start\n";
} elsif ( $ARGV[0] eq "receive" )
{
   print "do receive\n";
}else{
   print "wadde hadde?\n";
   exit 1;

}

my $client = Net::NATS::Client->new(uri => 'nats://localhost:4222');
$client->connect() or die $!;

print "subscribe\n";
# Simple Async Subscriber
#my $subscription = $client->subscribe('foo', sub {
#      my ($message) = @_;
#      printf("Received a message: %s\n", $message->data);
#   });


# Simple Publisher
print "publish\n";
$client->publish('foo', 'Hello, World!');

#print "1 wait\n";
# Process one message from the server. Could be a PING message.
# Must call at least one per ping-timout (default is 120s).
#$client->wait_for_op(10);

#print "2 wait\n";
# Process pending operations, with a timeout (in seconds).
# A timeout of 0 is polling.
#$client->wait_for_op(3.14);

#print "unsubscribe\n";
# Unsubscribe
#$subscription->unsubscribe();

# Close connection
$client->close();
