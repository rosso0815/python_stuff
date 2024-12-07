package Objects::Controller::Login;

use strict;
use warnings;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = 'login';

sub index : Private {    
	my ( $self, $c ) = @_;
	$c->log->info('@@@ Login');

	# Get the username and password from form
	my $username = $c->request->params->{username} || "";
	my $password = $c->request->params->{password} || "";

	# If the username and password values were found in form
	if ( $username && $password ) {

		# Attempt to log the user in
		#my $user->supported_features(qw/password clear/);
		$c->log->info('will do login');
		if ( $c->login( $username, $password ) ) {
			$c->log->info('login successfull');
			# If successful, then let them use the application
			$c->response->redirect( $c->uri_for('/kunden/list') );
			return;
		}
		else {
			$c->log->info('login NOT successfull');
			# Set an error message
			$c->stash->{error_msg} = "Bad username or password.";
		}
	}

	# If either of above don't work out, send to the login page
	$c->log->info('login hmmmm');
	$c->stash->{template} = 'login.tt2';
}

sub end : ActionClass('RenderView') {
}

1;
