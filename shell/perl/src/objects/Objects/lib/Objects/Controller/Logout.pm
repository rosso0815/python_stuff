package Objects::Controller::Logout;

use strict;
use warnings;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = 'logout';

sub index : Private {
   my ($self, $c) = @_;
    
        # Clear the user's state
        $c->logout;
    
        # Send the user to the starting point
        $c->response->redirect($c->uri_for('/login'));
}

1;
