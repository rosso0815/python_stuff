package Objects::Controller::Kunden;

use strict;
use warnings;
use Data::Dumper;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = 'kunden';

#---------------------------------------------------------------------------------------------------
sub delete : Local {
	my ( $self, $c, $id ) = @_;
	$c->log->info('@@@ Kunden::delete');
	if ( $c->request->param('yes') ) {
		$c->model('DBIC::Kunden')->search({id => $c->session->{kunden_id}})->delete_all;
		$c->stash->{info}     = 'delete kundenid ' . $c->session->{kunden_id};
		$c->stash->{template} = 'info.tt2';
	}
	elsif ( $c->request->param('no') ) {
		$c->stash->{info}     = 'no delete kundenid ' . $c->session->{kunden_id};
		$c->stash->{template} = 'info.tt2';
	}
	else {
		$c->session->{kunden_id} = $id;
		$c->session->{kunden_op} = 'delete';
		$c->stash->{question}    = 'should we delete kundenid ' . $id;
		$c->stash->{template}    = 'question.tt2';
	}
}

#---------------------------------------------------------------------------------------------------

sub do_delete : Local {
	my ( $self, $c, $id ) = @_;
	$c->log->info('@@@ Kunden::mk_delete');
	$c->stash->{info}     = 'mk_delete';
	$c->stash->{template} = 'info.tt2';
}

#---------------------------------------------------------------------------------------------------

sub view : Local {
	my ( $self, $c, $id ) = @_;
	$c->log->info('@@@ Kunden::view');
	if ( $c->request->param('list_id') ) {
		$c->stash->{liste} = [ Objects::Model::CDBI::Kunden->retrieve( $c->request->param('list_id') ) ];
	}
	else {
		$c->stash->{liste} = [ Objects::Model::CDBI::Kunden->retrieve_all() ];
	}
	$c->stash->{template} = 'list.tt2';
}

#---------------------------------------------------------------------------------------------------

sub list : Local {
	my ( $self, $c ) = @_;
	$c->log->info('@@@ Kunden::List');
	$c->stash->{form} = Objects::Schema::KundenDB::Kunden->getList();
	
	if ( $c->request->param('list_id') ) {
		$c->stash->{content} = [ $c->model('DBIC::Kunden')->search({ id => $c->request->param('list_id') }) ];
	}
	else {	
		$c->stash->{content} = [ $c->model('DBIC::Kunden')->all ];
	}
	$c->stash->{template} = 'list.tt2';
}

#---------------------------------------------------------------------------------------------------

sub input : Local {
	my ( $self, $c ) = @_;
	$c->log->info('@@@ kunden::input');
	$c->stash->{form} = Objects::Schema::KundenDB::Kunden->getForm();
	$c->stash->{template} = 'input.tt2';
}

#---------------------------------------------------------------------------------------------------

sub mk_new : Local {
	my ( $self, $c ) = @_;
	$c->log->info('@@@ kunden::mk_new');

	my $kunde=$c->model('DBIC::Kunden')->create(
		{
			name    => $c->req->params->{'name'},
			vorname => $c->req->params->{'vorname'},
			remark  => 'undef',
		}
	);
	$c->log->info('create kunden with id = '.$kunde->id) ;
	$c->response->redirect( $c->uri_for( 'list', { list_id => $kunde->id } ) );
}

#---------------------------------------------------------------------------------------------------

sub end : ActionClass('RenderView') {
}

#---------------------------------------------------------------------------------------------------

1;

#---------------------------------------------------------------------------------------------------
