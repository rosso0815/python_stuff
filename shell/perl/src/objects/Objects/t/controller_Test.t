use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Objects' }
BEGIN { use_ok 'Objects::Controller::Test' }

ok( request('/test')->is_success, 'Request should succeed' );


