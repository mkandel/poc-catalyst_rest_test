package MachineDB::Controller::ImportFlatfiles;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

local $| = 1; ## Unbuffered output

=head1 NAME

MachineDB::Controller::ImportFlatfiles - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

## Data structure mapping flatfile fields to DB columns
my %column_for_field = (
    'assetTag'                   => 'asset_tag',
    'cageNumber'                 => 'cage_num',
    'consoleServer'              => 'console_server',
    'comments'                   => 'comments',
    'consoleHostName'            => 'console_hostname',
    'consoleIpAddr'              => 'console_ip_addr',
    'consoleServer'              => 'console_server',
    'consoleServerPort'          => 'console_port',
    'cpuCount'                   => 'cpu_count',
    'cpuSpeed'                   => 'cpu_speed',
    'datacenter'                 => 'datacenter',
    'defaultRoute'               => 'default_route',
    'dnsDomain'                  => 'dns_domain',
    'arch'                       => 'hardware_arch',
    'hardwareType'               => 'hardware_type',
    'hardwareVendor'             => 'hardware_vendor',
    'hostname'                   => 'hostname',
    'id'                         => 'id',
    'ipAddr'                     => 'ip_addr',
    'ipAddrSecondary'            => 'ip_addr_secondary',
    'ipAddrTernary'              => 'ip_addr_ternary',
    'ipAddrQuadrary'             => 'ip_addr_quadrary',
    'ipAddrStandbyInside'        => 'ip_addr_standby_inside',
    'lastUpdated'                => 'last_updated',
    'macAddr'                    => 'mac_addr',
    'macAddrSecondary'           => 'mac_addr_2',
    'macAddrTernary'             => 'mac_addr_3',
    'macAddrQuadrary'            => 'mac_addr_4',
    'maintenance'                => 'maintenance',
    'memorySize'                 => 'memory_size',
    'monserverForDatacenter'     => 'monserver',
    'netmask'                    => 'netmask',
    'os'                         => 'os',
    'osPatchLevel'               => 'os_patch_level',
    'osVersion'                  => 'os_version',
    'owner'                      => 'owner',
    'ownerTMID'                  => 'owner_tmid',
    'providesServices'           => 'provides_services',
    'rackNumber'                 => 'rack_num',
    'rackPorts'                  => 'rack_ports',
    'rackPosition'               => 'rack_pos',
    'serialNumber'               => 'serial_num',
    'status'                     => 'status',
    'networkSwitch'              => 'switch',
    'networkSwitchSecondary'     => 'switch_2',
    'networkSwitchTernary'       => 'switch_3',
    'networkSwitchPort'          => 'switch_port',
    'networkSwitchPortSecondary' => 'switch_2_port',
    'networkSwitchPortTernary'   => 'switch_3_port',
    'macAddrConsole'             => 'console_mac',
    'snmpCommunity'              => 'snmp_community',
    'snmpVersion'                => 'snmp_version',
    'monitoringDatacenter'       => 'mon_datacenter',
    'service'                    => 'service',
    'useSsh'                     => 'use_ssh',
    'etherChannel1Ports'         => 'ether_ehannel_1_ports',
    'etherChannel2Ports'         => 'ether_ehannel_2_ports',
    'iloAPLicense'               => 'ilo_ap_license',
    'veritasClusterRole'         => 'veritas_cluster_role',
);

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MachineDB::Controller::ImportFlatfiles in ImportFlatfiles.');
}

sub import_flatfiles {
    my ( $self, $c ) = @_;
    my $success = 0;

    use Data::Dumper;
    use Sys::Hostname;
    use File::Find::Rule;
    my $host = hostname;

    unless ( $host =~ m/^mkandel-rh/ ){
        $c->response->body( 'Called import_flatfiles on non-development machine, ignoring!!' );
        return;
    }

    my $dir = '/home/mkandel/ariba/services/operations/machinedb';
    my @files = File::Find::Rule->file()->in( $dir );

    FILE:
    foreach my $file ( @files ){
        open my $IN, '<', $file or die "Couldn't open '$file' for read: $!\n";
        my %new;
#        print STDERR "** Processing '$file' ... **\n";
        while ( my $line = <$IN> ){
            next if $line =~ m/^\s*$/; ## Ignore blank lines
            next if $line =~ m/^#$/;   ## Ignore comments?
            my ( $field, $val ) = split /:/, $line;
            chomp $val if $val;
            $val =~ s/\s*//g if $val;   ## Remove whitespace
#            print STDERR "\t** '$field': '$val' **\n";
            if ( $column_for_field{ $field } ){
                $new{ "machine.$column_for_field{ $field }" } = $val;
            }
        }
        close $IN or die "Error closing '$file' after read: $!\n";
        #my $dumper = Data::Dumper->new( \%new );
        #my $stuff = $dumper->dump();
        #print STDERR $stuff;
        #print Dumper \%new;
        next FILE unless $new{ 'machine.hostname' };
        if ( $new{ '' } ){
            print STDERR "** Creating DB entry for '$new{ 'machine.hostname' }' **\n";
            my $result = $c->model( 'DB::Machine' )->create( \%new );
        }
    }

    if ( $success ){
        $c->response->body( 'Import completed successfully!' );
    } else {
        $c->response->body( 'Import failed!' );
    }
}

=head1 AUTHOR

marc kandel, 011658

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
