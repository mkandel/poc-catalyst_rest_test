use utf8;
package MachineDB::Schema::Result::Machine;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MachineDB::Schema::Result::Machine

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<machine>

=cut

__PACKAGE__->table("machine");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

                    

=head2 hostname

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 datacenter

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 ip_addr

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 service

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 product

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 asset_tag

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 comments

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 console_hostname

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 console_mac

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 console_server

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 console_port

  data_type: 'integer'
  is_nullable: 1

=head2 cpu_speed

  data_type: 'integer'
  is_nullable: 1

=head2 cpu_count

  data_type: 'integer'
  is_nullable: 1

=head2 default_route

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 dns_domain

  data_type: 'varchar'
  default_value: 'ariba.com'
  is_nullable: 1
  size: 45

=head2 hardware_type

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 hardware_arch

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 hardware_vendor

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 ip_addr_secondary

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 last_updated

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 mac_addr

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 mac_addr_2

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 mac_addr_3

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 mac_addr_4

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 maintenance

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 memory_size

  data_type: 'integer'
  is_nullable: 1

=head2 monserver

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 netmask

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 switch

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 switch_2

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 switch_port

  data_type: 'integer'
  is_nullable: 1

=head2 switch_2_port

  data_type: 'integer'
  is_nullable: 1

=head2 os

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 os_patch_level

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 os_version

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 owner

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 owner_tmid

  data_type: 'integer'
  is_nullable: 1

=head2 provides_services

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 rack_num

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 rack_ports

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 rack_pos

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 serial_num

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 cage_num

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 status

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "hostname",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "datacenter",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "ip_addr",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "service",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "product",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "asset_tag",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "comments",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "console_hostname",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "console_mac",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "console_server",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "console_port",
  { data_type => "integer", is_nullable => 1 },
  "cpu_speed",
  { data_type => "integer", is_nullable => 1 },
  "cpu_count",
  { data_type => "integer", is_nullable => 1 },
  "default_route",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "dns_domain",
  {
    data_type => "varchar",
    default_value => "ariba.com",
    is_nullable => 1,
    size => 45,
  },
  "hardware_type",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "hardware_arch",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "hardware_vendor",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "ip_addr_secondary",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "last_updated",
  {
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "mac_addr",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "mac_addr_2",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "mac_addr_3",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "mac_addr_4",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "maintenance",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "memory_size",
  { data_type => "integer", is_nullable => 1 },
  "monserver",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "netmask",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "switch",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "switch_2",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "switch_port",
  { data_type => "integer", is_nullable => 1 },
  "switch_2_port",
  { data_type => "integer", is_nullable => 1 },
  "os",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "os_patch_level",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "os_version",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "owner",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "owner_tmid",
  { data_type => "integer", is_nullable => 1 },
  "provides_services",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "rack_num",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "rack_ports",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "rack_pos",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "serial_num",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "cage_num",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "status",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07033 @ 2012-12-14 14:18:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:y2YLWK+y70oI+XllYi6TVw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
