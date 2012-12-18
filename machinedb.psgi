use strict;
use warnings;

use MachineDB;

my $app = MachineDB->apply_default_middlewares(MachineDB->psgi_app);
$app;

