# TreeElement.pm: interface to Texinfo tree element.
#
# Copyright 2025-2026 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# The new() method of this module should be used for each creation
# of a Texinfo tree element.

package Texinfo::TreeElement;

use 5.006;
use strict;
use warnings;

our $VERSION = '7.3dev';

# Texinfo::Common depends on this module in code outside of functions,
# so it will be good not to depend on Texinfo::Common here.

# check that autovivification do not happen incorrectly.
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck);

sub new($) {
  my $element = shift;

  bless $element;
  return $element;
}

1;
__END__

=head1 NAME

Texinfo::TreeElement - Texinfo tree element interface

=head1 SYNOPSIS

  my $element = Texinfo::TreeElement::new({});

=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

Note that this module could be removed at any time.

=head1 DESCRIPTION

C<Texinfo::TreeElement::new> should be called on every Perl tree
elements created.

=head1 METHODS

=over

=item $element = new($element_hash)
X<C<new>>

Turns the I<$element_hash> element hash into a C<Texinfo::TreeElement> object.

This function is called on all the tree elements created in Texinfo modules
codes.  The call to C<new> is mainly cosmetic, to mark where a new element is
created.  It also allows to distinguish a Texinfo tree element from a hash.

=back

=head1 SEE ALSO

L<Texinfo::Parser/TEXINFO TREE>.

=head1 AUTHOR

Patrice Dumas.

=head1 COPYRIGHT AND LICENSE

Copyright 2025- Free Software Foundation, Inc.  See the source file for
all copyright years.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

=cut
