#!/usr/bin/perl

use SOAP::Transport::HTTP;

SOAP::Transport::HTTP::Daemon
		-> new (LocalAddr => 'localhost', LocalPort => 8080)
		->dispatch_to('C2FService')
      	->handle;

    BEGIN {
      package C2FService;
      use vars qw(@ISA);
      @ISA = qw(Exporter SOAP::Server::Parameters);
      use SOAP::Lite;
		
      sub c2f {
        my $self = shift;
        my $envelope = pop;
        my $temp = $envelope->dataof("//c2f/temperature");
		print "\nHALLO";
        return SOAP::Data->name('convertedTemp' => (((9/5)*($temp->value)) + 32));
      }
    }
