package MachineDB::Controller::API::REST::Machine;

use strict;
use warnings;
use JSON::XS;

use parent qw/MachineDB::ControllerBase::REST/;

__PACKAGE__->config(
    # Define parent chain action and partpath
    action                  =>  { setup => { PathPart => 'machine', Chained => '/api/rest/rest_base' } },
    # DBIC result class
    class                   =>  'DB::Machine',
    # Columns required to create
    create_requires         =>  [qw/datacenter hostname ip_addr/],
    # Additional non-required columns that create allows
    create_allows           =>  [qw/asset_tag cage_num console_server comments console_hostname console_mac console_port cpu_count cpu_speed default_route dns_domain hardware_arch hardware_type hardware_vendor ip_addr_secondary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size monserver netmask os os_patch_level os_version owner owner_tmid product provides_services rack_num rack_ports rack_pos serial_num service status switch switch_2 switch_2_port switch_port/],
    # Columns that update allows
    update_allows           =>  [qw/datacenter hostname ip_addr asset_tag cage_num console_server comments console_hostname console_mac console_port cpu_count cpu_speed default_route dns_domain hardware_arch hardware_type hardware_vendor ip_addr_secondary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size monserver netmask os os_patch_level os_version owner owner_tmid product provides_services rack_num rack_ports rack_pos serial_num service status switch switch_2 switch_2_port switch_port/],
    # Columns that list returns
    list_returns            =>  [qw/id hostname datacenter ip_addr service product asset_tag comments console_hostname console_mac console_server console_port cpu_speed cpu_count default_route dns_domain hardware_type hardware_arch hardware_vendor ip_addr_secondary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size monserver netmask switch switch_2 switch_port switch_2_port os os_patch_level os_version owner owner_tmid provides_services rack_num rack_ports rack_pos serial_num cage_num status/],


    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id hostname datacenter ip_addr service product asset_tag comments console_hostname console_mac console_server console_port cpu_speed cpu_count default_route dns_domain hardware_type hardware_arch hardware_vendor ip_addr_secondary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size monserver netmask switch switch_2 switch_port switch_2_port os os_patch_level os_version owner owner_tmid provides_services rack_num rack_ports rack_pos serial_num cage_num status/,
        
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class machine

=head1 AUTHOR

marc kandel, 011658

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
