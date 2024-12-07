package Objects::Controller::Root;

use strict;
use warnings;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = '';

sub default : Private {
	my ( $self, $c ) = @_;
	$c->forward('/testing/index');

	#$c->redirect( 'http://www.google.ch/' );
	die $c->error if $c->error;
}

# Note that 'auto' runs after 'begin' but before your actions and that
sub auto : Private {
	my ( $self, $c ) = @_;
	if ( $c->controller eq $c->controller('login') ) {
		return 1;
	}

	# If a user doesn't exist, force login
	if ( !$c->user_exists ) {

		# Dump a log message to the development server debug output
		$c->log->debug('***Root::auto User not found, forwarding to /Login');

		# Redirect the user to the login page
		$c->response->redirect( $c->uri_for('/login') );

		# Return 0 to cancel 'post-auto' processing and prevent use of application
		return 0;
	}    
	     # User found, so return 1 to continue with processing after this 'auto'
	return 1;
}

sub end : ActionClass('RenderView') {
}

1;
