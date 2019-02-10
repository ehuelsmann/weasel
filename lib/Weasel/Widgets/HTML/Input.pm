
=head1 NAME

Weasel::Widgets::HTML::Input - Parent of the INPUT, OPTION, TEXTAREA and BUTTON wrappers

=head1 VERSION

0.02

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

=head1 DEPENDENCIES

This module wraps L<Selenium::Remote::Driver>, version 2.

=cut

package Weasel::Widgets::HTML::Input;


use strict;
use warnings;

use Moose;
use Weasel::Element;
use Weasel::WidgetHandlers qw/ register_widget_handler /;
extends 'Weasel::Element';
use namespace::autoclean;

register_widget_handler(
    __PACKAGE__, 'HTML',
    tag_name => 'input',
    attributes => {
        type => $_,
    })
    for (qw/ text password hidden /);

register_widget_handler(
    __PACKAGE__, 'HTML',
    tag_name => 'input',
    attributes => {
        type => undef, # default input type == 'text'
    });

register_widget_handler(
    __PACKAGE__, 'HTML',
    tag_name => 'textarea',
    attributes => {
    });


=head1 SUBROUTINES/METHODS

=over

=item clear()

=cut

sub clear {
    my ($self) = @_;

    return $self->session->clear($self);
}

=item value([$value])

Gets the 'value' attribute; if C<$value> is provided, it is used to set the
attribute value.

=cut

sub value {
    my ($self, $value) = @_;

    $self->session->set_attribute($self, 'value', $value)
        if defined $value;

    return $self->session->get_attribute($self, 'value');
}

=back

=head1 AUTHOR

Erik Huelsmann

=head1 CONTRIBUTORS

Erik Huelsmann
Yves Lavoie

=head1 MAINTAINERS

Erik Huelsmann

=head1 BUGS AND LIMITATIONS

Bugs can be filed in the GitHub issue tracker for the Weasel project:
 https://github.com/perl-weasel/weasel/issues

=head1 SOURCE

The source code repository for Weasel is at
 https://github.com/perl-weasel/weasel

=head1 SUPPORT

Community support is available through
L<perl-weasel@googlegroups.com|mailto:perl-weasel@googlegroups.com>.

=head1 LICENSE AND COPYRIGHT

 (C) 2016-2019  Erik Huelsmann

Licensed under the same terms as Perl.

=cut

__PACKAGE__->meta->make_immutable;

1;

