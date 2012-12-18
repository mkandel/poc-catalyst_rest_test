package MachineDB::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die => 1,
);

=head1 NAME

MachineDB::View::HTML - TT View for MachineDB

=head1 DESCRIPTION

TT View for MachineDB.

=head1 SEE ALSO

L<MachineDB>

=head1 AUTHOR

marc kandel, 011658

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
