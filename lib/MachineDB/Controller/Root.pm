package MachineDB::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MachineDB::Controller::Root - Root Controller for MachineDB

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( 'Welcome to Ariba MachineDB' );
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head2 list

List out all MachineDB hosts

=cut

sub list :Local {
    my ( $self, $c ) = @_;

    $c->stash( hosts => [$c->model('DB::Machine')->all] );
    $c->stash( num_entries => $c->model('DB::Machine')->count );

    my $log = $c->log;
    $log->debug( "Entered /list/ handler" );

    $c->stash(template => 'src/machines/list.tt' );
}

=head2 import_flatfiles

List out all MachineDB hosts

=cut

sub import_flatfiles :Local {
    my ( $self, $c ) = @_;

    use MachineDB::Controller::ImportFlatfiles;

    $c->response->body( "Entered import_flatfiles" );
    MachineDB::Controller::ImportFlatfiles->import_flatfiles($c);
#    $c->stash( hosts => [$c->model('DB::Machine')->all]);

#    $c->stash(template => 'src/machines/list.tt');
}

=head1 AUTHOR

marc kandel, 011658

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
