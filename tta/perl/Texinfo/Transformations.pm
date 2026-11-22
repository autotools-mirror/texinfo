# Transformations.pm: load transformations modules and functions not in
#                     the XS interface
#
# Copyright 2010-2026 Free Software Foundation, Inc.
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
#
# Original author: Patrice Dumas <pertusus@free.fr>
# Parts (also from Patrice Dumas) come from texi2html.pl.
#
# ALTIMP C/structuring_transfo/transformations.c

package Texinfo::Transformations;

use 5.006;
use strict;
use warnings;

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);


use Carp qw(cluck confess);

use Texinfo::XSLoader;

use Texinfo::Commands;

use Texinfo::TreeElement;

use Texinfo::Common;

use Texinfo::ManipulateTree;

require Exporter;
our @ISA = qw(Exporter);

our $VERSION = '7.3dev';

our @EXPORT_OK = qw(
protect_hashchar_at_line_beginning
);

BEGIN {
  Texinfo::XSLoader::init (
    "Texinfo::Transformations",
    "Texinfo::TransformationsNonXS",
    'TransformationsXS',
    undef,
    ['texinfo', 'texinfoxs'],
  );
}

# modify the menu tree to put description and menu comment content
# together directly in the menu.  Put the menu_entry in a preformatted.
# last merge preformatted.
sub menu_to_simple_menu($);

# Not used
sub menu_to_simple_menu($) {
  my $menu = shift;

  my @contents;
  foreach my $content (@{$menu->{'contents'}}) {
    if (exists($content->{'type'}) and $content->{'type'} eq 'menu_comment') {
      push @contents, @{$content->{'contents'}};
    } elsif (exists($content->{'type'})
             and $content->{'type'} eq 'menu_entry') {
      my $preformatted = {'type' => 'preformatted', 'contents' => [$content]};
      push @contents, $preformatted;
      $content->{'parent'} = $preformatted;

      my $in_description;
      my @args = @{$content->{'contents'}};
      @{$content->{'contents'}} = ();
      while (@args) {
        if (exists($args[0]->{'type'})
            and $args[0]->{'type'} eq 'menu_entry_description') {
          my $description = shift @args;
          push @contents, @{$description->{'contents'}};
          push @contents, @args;
          last;
        } else {
          my $arg = shift @args;
          push @{$content->{'contents'}}, $arg;
        }
      }
    } elsif (exists($content->{'cmdname'})
   and exists($Texinfo::Commands::block_commands{$content->{'cmdname'}})
  and $Texinfo::Commands::block_commands{$content->{'cmdname'}} eq 'menu') {
      menu_to_simple_menu($content);
      push @contents, $content;
    } else {
      push @contents, $content;
    }
  }

  # reset parent, put in menu and merge preformatted.
  @{$menu->{'contents'}} = ();
  my $current_preformatted;
  foreach my $content (@contents) {
    $content->{'parent'} = $menu;
    if (exists($content->{'type'}) and $content->{'type'} eq 'preformatted') {
      if (!defined($current_preformatted)) {
        $current_preformatted = $content;
        push @{$menu->{'contents'}}, $content;
      } else {
        foreach my $preformatted_content (@{$content->{'contents'}}) {
          push @{$current_preformatted->{'contents'}}, $preformatted_content;
          $preformatted_content->{'parent'} = $current_preformatted;
        }
      }
    } else {
      $current_preformatted = undef;
      push @{$menu->{'contents'}}, $content;
    }
  }
}

sub _protect_hashchar_at_line_beginning($$$) {
  my ($type, $parent, $argument) = @_;

  my $document = $argument;

  return undef if (exists($parent->{'text'})
                   or !exists($parent->{'contents'}));

  my $parent_contents_nr = scalar(@{$parent->{'contents'}});
  for (my $i = 0; $i < $parent_contents_nr; $i++) {
    my $current = $parent->{'contents'}->[$i];
    if (exists($current->{'text'}) and
      $current->{'text'} =~ /^\s*#\s*(line)? (\d+)(( "([^"]+)")(\s+\d+)*)?\s*$/) {
      # protect if first in container, or if after a newline
      if ($i == 0
          or ($i == 1 and exists($parent->{'contents'}->[0]->{'type'})
              and ($parent->{'contents'}->[0]->{'type'} eq 'arguments_line'
                  # for example @quotation # line 100 "toto"
                  # but it is not clear if it is correct
                   or $parent->{'contents'}->[0]->{'type'}
                             eq 'spaces_before_argument'))
          or (exists($parent->{'contents'}->[$i-1]->{'text'})
              and $parent->{'contents'}->[$i-1]->{'text'} =~ /\n$/)) {
        # do not actually protect in raw block command, but warn
        if (exists($current->{'type'}) and $current->{'type'} eq 'raw') {
          my $parent_for_warn = $parent;
          while ($parent_for_warn) {
            if (exists($parent_for_warn->{'cmdname'})
                and exists($parent_for_warn->{'source_info'})) {
              if (defined($document)) {
                $document->document_line_warn(sprintf(__(
                    "could not protect hash character in \@%s"),
                         $parent_for_warn->{'cmdname'}),
                                   $parent_for_warn->{'source_info'}, 0);
              }
              last;
            }
            $parent_for_warn = $parent_for_warn->{'parent'};
          }
        } else {
          my $remaining_source_marks;
          my $current_position = 0;
          if (exists($current->{'source_marks'})) {
            $remaining_source_marks = [@{$current->{'source_marks'}}];
            delete $current->{'source_marks'};
          }

          $current->{'text'} =~ s/^(\s*)#//;

          my $e = Texinfo::TreeElement::new({'text' => $1,
                                             'type' => 'normal_text'});
          $current_position = Texinfo::Common::relocate_source_marks(
                                      $remaining_source_marks, $e,
                                      $current_position, length($1));
          if ($e->{'text'} ne '' or $e->{'source_marks'}) {
            splice @{$parent->{'contents'}}, $i, 0, $e;
            $i++;
            $parent_contents_nr++;
          }

          $e = Texinfo::TreeElement::new({'cmdname' => 'hashchar',
                                          'parent' => $parent});
          my $arg = Texinfo::TreeElement::new({'type' => 'brace_container',
                                               'parent' => $e});
          $e->{'contents'} = [$arg];
          $current_position = Texinfo::Common::relocate_source_marks(
                                        $remaining_source_marks, $e,
                                        $current_position, 1);
          splice @{$parent->{'contents'}}, $i, 0, $e;
          $i++;
          $parent_contents_nr++;

          $current_position = Texinfo::Common::relocate_source_marks(
                                        $remaining_source_marks, $current,
                                        $current_position,
                                        length($current->{'text'}));
        }
      }
    }
  }
  return undef;
}

sub protect_hashchar_at_line_beginning($;$) {
  my ($tree, $document) = @_;

  return Texinfo::ManipulateTree::modify_tree($tree,
                     \&_protect_hashchar_at_line_beginning,
                      $document);
}

sub _protect_first_parenthesis_in_targets($$$) {
  my ($type, $current, $argument) = @_;

  my $label_element = Texinfo::Common::get_label_element($current);
  if (defined($label_element)) {
    Texinfo::ManipulateTree::protect_first_parenthesis($label_element);
  }
  return undef;
}

# Used in Pod::Simple::Texinfo
# TODO document
sub protect_first_parenthesis_in_targets($) {
  my $tree = shift;

  Texinfo::ManipulateTree::modify_tree($tree,
                           \&_protect_first_parenthesis_in_targets);
}

1;

__END__

=head1 NAME

Texinfo::Transformations - transformations of Texinfo tree

=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

Includes miscellaneous methods such as C<complete_tree_nodes_menus_in_document>
and C<complete_tree_nodes_missing_menu> that completes the node menus based on
the sectioning tree.

Methods for copying and modifying the Texinfo tree used for default
conversion to output formats are in L<Texinfo::ManipulateTree>.

=head1 METHODS

No method is exported in the default case.

=over

=item complete_tree_nodes_menus_in_document($document, $add_section_names_in_entries)
X<C<complete_tree_nodes_menus_in_document>>

Add menu entries or whole menus for nodes associated with sections,
based on the sectioning tree.  If the optional
C<$add_section_names_in_entries> argument is set, a menu entry
name is added using the section name.  This function should be
called after L<sectioning_structure|Texinfo::Structuring/sectioning_structure($document)>.

=item complete_tree_nodes_missing_menu($document, $use_section_names_in_entries)
X<C<complete_tree_nodes_missing_menu>>

Add whole menus for nodes associated with sections and without menu,
based on the I<$document> sectioning tree.
If the optional I<$add_section_names_in_entries> argument is set, a menu entry
name is added using the section name.  This function should be
called after L<sectioning_structure|Texinfo::Structuring/sectioning_structure($document)>.

=item fill_gaps_in_sectioning_in_document($document, $commands_heading_texi)
X<C<fill_gaps_in_sectioning_in_document>>

This function adds empty C<@unnumbered> and similar commands in a
I<$document> tree to fill gaps in sectioning.  This may be used, for example,
when converting from a format that can handle gaps in sectioning.

In the default case, the added sectioning commands headings are empty.  It is
possible to use instead the I<$commands_heading_texi> Texinfo code, whose
parsed tree is copied into the added sectioning commands.

If the sectioning commands are lowered or raised (with C<@raisesections>,
C<@lowersection>) the tree may be modified with C<@raisesections> or
C<@lowersection> added to some tree elements.

=item menu_to_simple_menu($menu)
X<C<menu_to_simple_menu>>

C<menu_to_simple_menu> transforms the tree of a menu tree element.

A simple menu has no I<menu_comment>, I<menu_entry> or I<menu_entry_description>
container anymore, their content are merged directly in the menu in
I<preformatted> container.

Note that this kind of tree is not supported by other codes, so this
transformation should be avoided unless one knows exactly what to expect.

=item protect_hashchar_at_line_beginning($tree, $document)
X<C<protect_hashchar_at_line_beginning>>

Protect hash (#) character at the beginning of line such that they would not be
considered as lines to be processed by the CPP processor.  The I<$document>
argument is optional.  If defined, the I<$document> is used for error reporting
in case an hash character could not be protected because it appeared in a raw
formatted environment (C<@tex>, C<@html>...).

=item regenerate_master_menu($document, $use_sections)
X<C<regenerate_master_menu>>

Regenerate the I<$document> Top node master menu, replacing the first
detailmenu in Top node menus or appending at the end of the Top node menu.

I<$use_sections> is an optional argument.  If set, sections associated with
nodes are used as labels in the generated master menu.

=back

=head1 SEE ALSO

L<Texinfo manual|http://www.gnu.org/s/texinfo/manual/texinfo/>,
L<Texinfo::Parser>, L<Texinfo::ManipulateTree>.

=head1 AUTHOR

Patrice Dumas, E<lt>bug-texinfo@gnu.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010- Free Software Foundation, Inc.  See the source file for
all copyright years.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

=cut
