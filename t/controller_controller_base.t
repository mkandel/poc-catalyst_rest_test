use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MachineDB';
use MachineDB::Controller::API::REST;

ok( request('/api/rest')->is_success, 'Request should succeed' );
done_testing();
