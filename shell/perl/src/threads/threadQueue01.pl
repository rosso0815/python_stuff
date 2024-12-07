#! /usr/bin/env perl

use strict;
use warnings;
use threads;
use Thread::Queue;

my $queue = Thread::Queue->new();

sub doWork {
  while (defined(my $item = $queue->dequeue())) {
    printf("item=".$item." tid=" . threads->self()->tid()."\n");
    sleep 5;
  } 
}

my $worker1 = threads->create( \&doWork) ;
my $worker2 = threads->create( \&doWork) ;

$queue->enqueue(5);
$queue->enqueue(7);
$queue->enqueue(9);
$queue->enqueue(1);

$queue->end();

$worker1->join();
$worker2->join();

my $left = $queue->pending();

# Non-blocking dequeue
#if (defined(my $item = $q->dequeue_nb())) {
# Work on $item
#}
# Blocking dequeue with 5-second timeout
#if (defined(my $item = $q->dequeue_timed(5))) {
# Work on $item
#}
# Set a size for a queue
#$q->limit = 5;
# Get the second item in the queue without dequeuing anything
#my $item = $q->peek(1);
# Insert two items into the queue just behind the head
#$q->insert(1, $item1, $item2);
# Extract the last two items on the queue
#my ($item1, $item2) = $q->extract(-2, 2);
