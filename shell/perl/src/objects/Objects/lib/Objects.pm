package Objects;

use strict;
use warnings;

use Catalyst::Runtime '5.70';

use Catalyst qw/
		-Debug 
		
		ConfigLoader
		
		Static::Simple
		
		Authentication
		Authentication::Credential::Password
     	Authentication::Store::DBIC
     			
		Session
      	Session::Store::FastMmap
      	Session::State::Cookie
      	Redirect Static::Simple
      	/;
      	
__PACKAGE__->config( file => 'objects.yml' );

__PACKAGE__->setup;

1;
