#!/usr/bin/perl -w
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
my $infile1 = 'schema_map';
my $infile2 = 'schema_map_sql';
my $outfile = 'schema_map_merged';

GetOptions(
    "help|h"         => sub { pod2usage( 1 ); },
    "debug|d"        => \$mydebug,
    "dryrun|n"       => \$dryrun,
);

my $prog = $0;
$prog =~ s/^.*\///;

open my $SM,  '<', $infile1 or die "Couldn't open '$infile1' for read: $!\n";
open my $SMS, '<', $infile2 or die "Couldn't open '$infile2' for read: $!\n";
open my $OUT, '>', $outfile or die "Couldn't open '$outfile' for write: $!\n";


close $SM  or die "Error closing '$infile1' after read: $!\n";
close $SMS or die "Error closing '$infile1' after read: $!\n";
close $OUT or die "Error closing '$outfile' after write: $!\n";

__END__
