use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Objects' }
BEGIN { use_ok 'Objects::Controller::Logout' }

ok( request('/logout')->is_success, 'Request should succeed' );


