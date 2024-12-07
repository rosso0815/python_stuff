#! /usr/bin/env perl

use strict;
use warnings;

use Net::NATS::Client;

my $SSL_ERROR='undefined';


$client = Net::NATS::Client->new(uri => 'nat://localhost:4222');

$client->connect() or die $!;

# Simple Publisher
#$client->publish('foo', 'Hello, World!');

# Simple Async Subscriber
#$subscription = $client->subscribe('foo', sub {
#    my ($message) = @_;
#    printf("Received a message: %s\n", $message->data);
#  });

# Process one message from the server. Could be a PING message.
# Must call at least one per ping-timout (default is 120s).
#$client->wait_for_op();

# Process pending operations, with a timeout (in seconds).
# A timeout of 0 is polling.
#$client->wait_for_op(3.14);

# Unsubscribe
#$subscription->unsubscribe();

# Close connection
#$client->close();
