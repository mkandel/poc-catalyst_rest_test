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
    'AssetTag'                   => 'asset_tag',
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
    'snmpVersion'                => 'snmp_vers',
    'monitoringDatacenter'       => 'mon_datacenter',
    'service'                    => 'service',
    'useSsh'                     => 'use_ssh',
    'etherChannel1Ports'         => 'ether_channel_1_ports',
    'etherChannel2Ports'         => 'ether_channel_2_ports',
    'iloAPLicense'               => 'ilo_ap_license',
    'veritasClusterRole'         => 'veritas_cluster_role',
);

sub import_flatfiles {
    my ( $self, $c ) = @_;
    my $success = 1;

    use Data::Dumper;
    use Sys::Hostname;
    use File::Find::Rule;
    my $host = hostname;

    ## Hand rolling a file logger for very specific reasons:
    my $logfile = '/var/log/ariba/machinedb/import.log';
    open my $LOG, '>>', $logfile or die "Couldn't open '$logfile' for write: $!\n";
    print $LOG "#######################################################################\n";
    print $LOG "Import run starting\n";

    unless ( $host =~ m/^mkandel-/ ){
        $c->response->body( 'Called import_flatfiles on non-development machine, ignoring!!' );
        return;
    }

    my $log = $c->log;

    my $dir;
    if ( $host =~ m/mkandel-rh/ ){
        $dir    = '/home/mkandel/ariba/services/operations/machinedb';
    } else { ## mkandel-mac
        $dir    = '/Users/mkandel/ariba/services/operations/machinedb';
    }
    my @files  = File::Find::Rule->file()->in( $dir );
    print $LOG "File::Find::Rule found ", scalar @files, " machinedb files\n";

    ## Not sure why/what/how to get this to work ...
    #my $prefix = 'machine.';
    my $prefix = '';
    my $field  = 'hostname';
    my $printed_filename;
    my $dumped = 0;

    FILE:
    foreach my $file ( @files ){
        open my $IN, '<', $file or die "Couldn't open '$file' for read: $!\n";
        my $new;
        $printed_filename = 0;
#        print $LOG "** Processing '$file' ... **\n";
        LINE:
        while ( my $line = <$IN> ){
            next LINE if $line =~ m/^\s*$/; ## Ignore blank lines
            next LINE if $line =~ m/^#$/;   ## Ignore comments?
            next LINE unless $column_for_field{ $field };
            my ( $field, $val ) = split /:/, $line;
            chomp $val if $val;
            $val =~ s/\s*//g if $val;   ## Remove whitespace
            if ( ( $field =~ m/lastUpdated/i ) && ( $val !~ m/\d+/ ) ){
                ## If we have a lastUpdated use it, otherwise use default
                next LINE;
            }
#            print $LOG "\t** '$field': '$val' **\n";
            if ( $column_for_field{ $field } ){
                $new->{ "$prefix$column_for_field{ $field }" } = $val;
            } else {
                print $LOG "** '$file' ... **\n";
                $printed_filename = 1;
                print $LOG "*** '$field' has no entry in mapping!!! ***\n";
#                $log->debug( "*** '$field' has no entry in mapping!!! ***" );
            }
        }
        close $IN or die "Error closing '$file' after read: $!\n";

        ## alert about any files that don't have a hostname
        unless ( $new->{ "$prefix$field" } ){
            unless ( $printed_filename = 1 ){
                print $LOG "** '$file' ... **\n";
                $printed_filename = 1;
            }
            print $LOG "'$file' has no hostname!!!\n";
#            $log->debug( "*** '$file' has no hostname!!! ***" );
            next FILE;
        }

        ## Set datetime in MySQL format:
#        use Date::Format;
#        my @lt = localtime(time);
#        ## 0000-00-00 00:00:00
#        my $template = "%Y-%m-%d %H:%M:%S";
#        $new->{ 'record_created' } = strftime($template, @lt);

#        print $LOG "Creating DB entry for '", $new->{ "$prefix$field" }, "'\n";
        ## This is dying, lets's ignore that :-)
        if ( !$dumped ){
            my $d = Data::Dumper->new( [$new] );
            print $LOG $d->Dump;
            $dumped++;
        }
            
        my $result;
        #my $result = $c->model( 'DB::Machine' )->create( $new );
        eval{
            $result = $c->model( 'DB::Machine' )->create( $new );
        };
        if ( $@ ){
            if ( $@ =~ m/DBIx::Class::ResultSet::create(): DBI Exception: DBD::mysql::st execute failed: Duplicate entry/ ){
                next FILE;
            }
            unless ( $printed_filename = 1 ){
                print $LOG "** '$file' ... **\n";
            }
            print $LOG "inserting '", $new->{ "$prefix$field" }, "' failed:\n\t$@\n";
#            $log->debug( "** inserting '", $new->{ "$prefix$field" }, "' failed **:\n\t$@\n";
        }

        ## Not sure what I'm getting back but this should be OK?? ...
        #if ( !$result ){ $success = 0; }
    }

    if ( $success ){
        $c->response->body( 'Import completed successfully!' );
    } else {
        $c->response->body( 'Import failed!' );
    }
    close $LOG or die "Error closing '$logfile' after write: $!\n";
}

=head1 AUTHOR

marc kandel, 011658

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
