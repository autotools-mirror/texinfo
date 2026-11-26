# OutputUnitsNonXS.pm: setup and manage Texinfo document output units
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
#
# ALTIMP perl/XSTexinfo/parser_document/OutputUnits.xs
# ALTIMP C/main/output_unit.c

package Texinfo::OutputUnits;

use 5.006;

# See comment at start of HTML.pm
use if $] >= 5.012, feature => 'unicode_strings';

# stop \s from matching non-ASCII spaces, etc.  \p{...} can still be
# used to match Unicode character classes.
use if $] >= 5.014, re => '/a';

use strict;
use warnings;

# Can be used to check that there is no incorrect autovivfication
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck confess);

use Texinfo::ManipulateTree;

# remove the association with document units
# NOTE not documented, but is internally used for tests only.
sub unsplit($) {
  my $document = shift;

  my $root = $document->tree();
  if (!exists($root->{'contents'})) {
    return 0;
  }

  my $unsplit_needed = 0;
  foreach my $content (@{$root->{'contents'}}) {
    if (exists($content->{'associated_unit'})) {
      delete $content->{'associated_unit'};
      $unsplit_needed = 1;
    }
  }
  return $unsplit_needed;
}



# used in tests, not documented on purpose, mainly to allow for overriding
# with XS.
# $UNITS_SPLIT_TYPE: 1 if units are split at node, 0 if units are split
#                    at sectioning commands.  No output units if undef.
sub do_units_directions_pages($$;$$) {
  my ($document, $units_split_type, $split_pages, $debug) = @_;

  return undef if (!defined($document) or !defined($units_split_type));

  my $output_units;
  if ($units_split_type == 1) {
    $output_units = split_by_node($document);
  } elsif ($units_split_type == 0) {
    $output_units = split_by_section($document);
  }
  my $nodes_list = $document->nodes_list();
  if (defined($output_units)) {
    my $identifier_target = $document->labels_information();
    units_directions($identifier_target, $nodes_list,
                     $output_units, $debug);
  }
  if (defined($split_pages)) {
    split_pages($output_units, $nodes_list, $split_pages);
  }

  return $output_units;
}



sub print_output_units_tree_details($$;$$) {
  my ($output_units, $tree, $fname_encoding, $use_filename) = @_;

  my $current_nr = 0;
  #$current_nr
  #  = Texinfo::ManipulateTree::set_element_tree_numbers($tree, $current_nr);

  my $output_unit_result;
  ($current_nr, $output_unit_result)
    = print_output_units_details($output_units, $current_nr,
                                 $fname_encoding, $use_filename);

  #Texinfo::ManipulateTree::remove_element_tree_numbers($tree);

  return $output_unit_result;
}

1;
