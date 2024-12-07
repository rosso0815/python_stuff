use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Objects' }
BEGIN { use_ok 'Objects::Controller::testing' }

ok( request('/testing')->is_success, 'Request should succeed' );


