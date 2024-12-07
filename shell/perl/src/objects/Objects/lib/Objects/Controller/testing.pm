package Objects::Controller::testing;

use strict;
use warnings;
use Data::Dumper;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = 'testing';

sub index : Local {
    my ( $self, $c ) = @_;
    $c->log->info('@@@ testing::index');
    $c->stash->{message} = 'testing-index';
    $c->stash->{template} = 'info.tt2';
}

sub andreas : Local {
    my ( $self, $c ) = @_;
    $c->log->info('@@@ testing::andreas');
    $c->log->info('config='.Dumper( $c->config ));
    
    $c->stash->{info} = 'greetings from Andy';
    $c->stash->{template} = 'info.tt2';
}

sub cdbi_list : Local {
    my ( $self, $c ) = @_;
    $c->log->info('@@@ testing::cdbi');
    $c->stash->{liste} = [Objects::Model::CDBI::Kunden->retrieve_all()];
    $c->stash->{template} = 'cdbi_list.tt2';
}

sub cdbi_input : Local {
    my ( $self, $c ) = @_;
    $c->log->info('@@@ testing::cdbi');
    $c->stash->{liste} = [Objects::Model::CDBI::Kunden->retrieve_all()];
    $c->stash->{template} = 'cdbi_input.tt2';
}

sub mk_new : Local {
    my ( $self, $c ) = @_;
    $c->log->info('@@@ testing::mk_new');
	# Objects::Model::CDBI::Kunden->retrieve_all
    $c->stash->{message} = ' Name='.$c->req->params->{'name'};
    $c->stash->{template} = 'message.tt2';
}

sub end : ActionClass('RenderView') {}

1;
