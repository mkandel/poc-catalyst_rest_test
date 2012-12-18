#!/usr/bin/perl -w
# $Id:$
# $HeadURL:$
use strict;
use warnings;

use Carp;
use Getopt::Long;
Getopt::Long::Configure qw/bundling no_ignore_case/;
use Data::Dumper;
# Some Data::Dumper settings:
local $Data::Dumper::Useqq  = 1;
local $Data::Dumper::Indent = 3;
use Pod::Usage;

my $mydebug = 0;
my $dryrun  = 0;
my $infile  = './db_schema_fields';
my $outfile = '../db/create_sqlite_db';

GetOptions(
    "help|h"         => sub { pod2usage( 1 ); },
    "debug|d"        => \$mydebug,
    "dryrun|n"       => \$dryrun,
    "infile|i=s"     => \$infile,
);

my $prog = $0;
$prog =~ s/^.*\///;

open my $IN, '<', $infile or die "Couln't open '$infile' for read: $!\n";
close $IN or die "Couln't close '$infile' after read: $!\n";

__END__
