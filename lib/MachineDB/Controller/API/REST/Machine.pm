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
    create_allows           =>  [qw/asset_tag cage_num comments console_hostname console_ip_addr console_mac console_port console_server cpu_count cpu_speed default_route dns_domain ether_channel_1_ports ether_channel_2_ports hardware_arch hardware_type hardware_vendor ilo_ap_license ip_addr_quadrary ip_addr_secondary ip_addr_standby_inside ip_addr_ternary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size mon_datacenter monserver netmask os os_patch_level os_version owner owner_tmid product provides_services rack_num rack_ports rack_pos serial_num service snmp_community snmp_vers status switch switch_2 switch_2_port switch_3_port switch_port use_ssh veritas_cluster_role/],
    # Columns that update allows
    update_allows           =>  [qw/datacenter hostname ip_addr asset_tag cage_num comments console_hostname console_ip_addr console_mac console_port console_server cpu_count cpu_speed default_route dns_domain ether_channel_1_ports ether_channel_2_ports hardware_arch hardware_type hardware_vendor ilo_ap_license ip_addr_quadrary ip_addr_secondary ip_addr_standby_inside ip_addr_ternary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size mon_datacenter monserver netmask os os_patch_level os_version owner owner_tmid product provides_services rack_num rack_ports rack_pos serial_num service snmp_community snmp_vers status switch switch_2 switch_2_port switch_3_port switch_port use_ssh veritas_cluster_role/],
    # Columns that list returns
    list_returns            =>  [qw/id hostname datacenter ip_addr service product asset_tag comments console_hostname console_mac console_server console_port cpu_speed cpu_count default_route dns_domain hardware_type hardware_arch hardware_vendor ip_addr_secondary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size monserver netmask switch switch_2 switch_port switch_2_port os os_patch_level os_version owner owner_tmid provides_services rack_num rack_ports rack_pos serial_num cage_num status snmp_vers mon_datacenter use_ssh ip_addr_ternary ip_addr_standby_inside snmp_community ether_channel_1_ports ilo_ap_license ether_channel_2_ports console_ip_addr ip_addr_quadrary veritas_cluster_role switch_3_port/],


    # Order of generated list
    list_ordered_by         => [qw/id/],
    # columns that can be searched on via list
    list_search_exposes     => [
        qw/id hostname datacenter ip_addr service product asset_tag comments console_hostname console_mac console_server console_port cpu_speed cpu_count default_route dns_domain hardware_type hardware_arch hardware_vendor ip_addr_secondary last_updated mac_addr mac_addr_2 mac_addr_3 mac_addr_4 maintenance memory_size monserver netmask switch switch_2 switch_port switch_2_port os os_patch_level os_version owner owner_tmid provides_services rack_num rack_ports rack_pos serial_num cage_num status snmp_vers mon_datacenter use_ssh ip_addr_ternary ip_addr_standby_inside snmp_community ether_channel_1_ports ilo_ap_license ether_channel_2_ports console_ip_addr ip_addr_quadrary veritas_cluster_role switch_3_port/,
        
    ],);

=head1 NAME

 - REST Controller for 

=head1 DESCRIPTION

REST Methods to access the DBIC Result Class machine

=head1 AUTHOR

Marc Kandel

=head1 SEE ALSO

L<Catalyst::Controller::DBIC::API>
L<Catalyst::Controller::DBIC::API::REST>
L<Catalyst::Controller::DBIC::API::RPC>

=head1 LICENSE



=cut

1;
