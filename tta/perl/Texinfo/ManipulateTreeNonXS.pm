# ManipulateTreeNonXS.pm: common Texinfo tree manipulation
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

# functions useful for Texinfo tree transformations
# and some tree transformations functions, mostly those
# used in conversion to main output formats.  In general,
# tree transformations functions are documented in the POD section.

# Some helper functions defined here are used in other
# modules but are not generally useful in converters
# and therefore not considered "public" and not documented in POD.

# ALTIMP XSTexinfo/parser_document/ManipulateTreeXS.xs
# ALTIMP C/main/manipulate_tree.c
# ALTIMP C/structuring_transfo/transformations.c

package Texinfo::ManipulateTree;

# stop \s from matching non-ASCII spaces, etc.  \p{...} can still be
# used to match Unicode character classes.
use if $] >= 5.014, re => '/a';

use strict;
use warnings;

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);

# debugging
use Carp qw(cluck confess);

# Do not use Devel::Peek, instead implement SvREFCNT as Devel::Peek
# cannot be loaded in an eval
#use Devel::Peek;
# SvREFCNT counts are wrong if loaded through eval?
#eval { require Devel::Peek; Devel::Peek->import(); };

use Texinfo::Common;

sub copy_tree_root($) {
  my $root = shift;

  return copy_element_tree($root);
}



# Devel::Peek is not present on all the platforms, and we cannot load it
# in an eval, so we reimplement trivially SvREFCNT

# The XS override returns the SvREFCNT value.
#   $EXPECTED_COUNT should be set to the reference count expected, for
#   instance the reference count expected in a test that follows the
#   call to SvREFCNT.
sub SvREFCNT($;$) {
  # If there is no XS, return the expected count instead of showing the
  # true reference count.
  my ($variable, $expected_count) = @_;

  return $expected_count;
}



# No reference to other elements in extra information currently
# (no extra element, content, direction), therefore no need for
# element numbers to refer to.
# The calls to set_element_tree_numbers and remove_element_tree_numbers
# are thus commented out.
sub tree_print_details($;$$) {
  my ($tree, $fname_encoding, $use_filename) = @_;

  my $result;

  my $current_nr = 0;
  #$current_nr = set_element_tree_numbers($tree, 0);

  ($current_nr, $result) = print_tree_details($tree, 0, undef, $current_nr,
                                             $fname_encoding, $use_filename);

  #remove_element_tree_numbers($tree);

  return $result;
}



# Texinfo tree transformations used in main output formats conversion.

# Has an XS override. Defined to be able to test Perl and XS. Undocumented
# on purpose.
sub protect_comma_in_document($) {
  my $document = shift;

  protect_comma_in_tree($document->tree());
  return;
}

# Has an XS override. Defined to be able to test Perl and XS. Undocumented
# on purpose.
sub protect_colon_in_document($) {
  my $document = shift;

  protect_colon_in_tree($document->tree());
  return;
}

# Has an XS override. Defined to be able to test Perl and XS. Undocumented
# on purpose.
sub protect_node_after_label_in_document($) {
  my $document = shift;

  protect_node_after_label_in_tree($document->tree());
  return;
}

sub _move_selected_element_index_entries_after_items($) {
  # enumerate or itemize
  my $current = shift;

  return unless (exists($current->{'contents'}));

  my $previous;
  foreach my $item (@{$current->{'contents'}}) {
    #print STDERR "Before proceeding: $previous $item->{'cmdname'} (@{$previous->{'contents'}})\n" if ($previous and $previous->{'contents'});
    if (defined($previous) and exists($item->{'cmdname'})
        and $item->{'cmdname'} eq 'item'
        and exists($previous->{'contents'})) {

      my $previous_ending_container;
      if (exists($previous->{'contents'}->[-1]->{'type'})
          and ($previous->{'contents'}->[-1]->{'type'} eq 'paragraph'
               or $previous->{'contents'}->[-1]->{'type'} eq 'preformatted')) {
        # for preformatted, happens if in @itemize/enumerate in @example
        # or similar.
        # for paragraph happens if there is a paragraph at the end
        # of the previous item, and it could be possible for this
        # paragraph to end with an inline index command.
        $previous_ending_container = $previous->{'contents'}->[-1];
      } else {
        # possible index commands out of paragraph
        $previous_ending_container = $previous;
      }

      my $contents_nr = scalar(@{$previous_ending_container->{'contents'}});

      # find the last index entry, with possibly comments after
      my $last_entry_idx = -1;
      for (my $i = $contents_nr -1; $i >= 0; $i--) {
        my $content = $previous_ending_container->{'contents'}->[$i];
        if (exists($content->{'type'})
            and $content->{'type'} eq 'index_entry_command') {
          $last_entry_idx = $i;
        } elsif (not (exists($content->{'cmdname'})
                      and ($content->{'cmdname'} eq 'c'
                           or $content->{'cmdname'} eq 'comment'))) {
          last;
        }
      }

      if ($last_entry_idx >= 0) {
        my $item_container;
        if (exists($item->{'contents'})
            and exists($item->{'contents'}->[0]->{'type'})
            and $item->{'contents'}->[0]->{'type'} eq 'preformatted') {
          $item_container = $item->{'contents'}->[0];
        } else {
          $item_container = $item;
        }

        for (my $i = $last_entry_idx; $i < $contents_nr; $i++) {
          # can only be index_entry_command or comment as gathered just above
          my $content = $previous_ending_container->{'contents'}->[$i];
          $content->{'parent'} = $item_container;
        }

        my $insertion_idx = 0;
        if (exists($item_container->{'contents'})
            and exists($item_container->{'contents'}->[0]->{'type'})
            and $item_container->{'contents'}->[0]->{'type'}
                                eq 'ignorable_spaces_after_command') {
          # insert after leading spaces, and add an end of line if there
          # is none
          $insertion_idx = 1;
          $item_container->{'contents'}->[0]->{'text'} .= "\n"
            if ($item_container->{'contents'}->[0]->{'text'} !~ /\n$/);
        }
        # first part of the splice is the insertion in $item_container
        splice (@{$item_container->{'contents'}},
                $insertion_idx, 0,
                    # this splice removes from the previous container starting
                    # at $last_entry_idx and returns the contents to be inserted
                    splice (@{$previous_ending_container->{'contents'}},
                            $last_entry_idx, $contents_nr - $last_entry_idx));
        delete $previous_ending_container->{'contents'}
          if (!scalar(@{$previous_ending_container->{'contents'}}));
      }
    }
    $previous = $item;
  }
}

sub _move_index_entries_after_items($$) {
  my ($type, $current) = @_;

  if (exists($current->{'cmdname'})
      and ($current->{'cmdname'} eq 'enumerate'
           or $current->{'cmdname'} eq 'itemize')) {
    _move_selected_element_index_entries_after_items($current);
  }
  return undef;
}

# For @itemize/@enumerate
sub move_index_entries_after_items_in_document($) {
  my $document = shift;

  my $tree = $document->tree();
  modify_tree($tree, \&_move_index_entries_after_items);
}

sub _relate_index_entries_to_table_items_in($$) {
  my ($table, $indices_information) = @_;

  return unless(exists($table->{'contents'}));

  foreach my $table_entry (@{$table->{'contents'}}) {
    next unless(exists($table_entry->{'contents'})
                and exists($table_entry->{'type'})
                and $table_entry->{'type'} eq 'table_entry');

    my $term = $table_entry->{'contents'}->[0];
    my $definition;
    my $item;

    # Move any index entries from the start of a 'table_definition' to
    # the 'table_term'.
    if (defined($table_entry->{'contents'}->[1])
        and exists($table_entry->{'contents'}->[1]->{'type'})
        and $table_entry->{'contents'}->[1]->{'type'} eq 'table_definition') {
      $definition = $table_entry->{'contents'}->[1];
      my $nr_index_entry_command = 0;
      foreach my $child (@{$definition->{'contents'}}) {
        if (exists($child->{'type'})
            and $child->{'type'} eq 'index_entry_command') {
          $child->{'parent'} = $term;
          $nr_index_entry_command++;
        } else {
          last;
        }
      }
      if ($nr_index_entry_command > 0) {
        unshift @{$term->{'contents'}},
          splice (@{$definition->{'contents'}}, 0, $nr_index_entry_command);
      }
    }

    if (exists($term->{'type'}) and $term->{'type'} eq 'table_term') {
      # Relate the first index_entry_command in the 'table_term' to
      # the term itself.

      my $index_entry;
      my $index_element;
      foreach my $content (@{$term->{'contents'}}) {
        if (exists($content->{'type'})
            and $content->{'type'} eq 'index_entry_command') {
          if (!$index_entry) {
            my $index_info;
            $index_element = $content;
            ($index_entry, $index_info)
              = Texinfo::Common::lookup_index_entry(
                              $content->{'extra'}->{'index_entry'},
                              $indices_information);
          }
        } elsif (exists($content->{'cmdname'})
                 and $content->{'cmdname'} eq 'item') {
          $item = $content unless $item;
        }
        if ($item and $index_entry) {
          # This is better than overwriting 'entry_element', which
          # holds important information.
          $index_entry->{'entry_associated_element'} = $item;
          # also add a reference from element to index entry in index
          $item->{'extra'} = {} if (!exists($item->{'extra'}));
          $item->{'extra'}->{'associated_index_entry'}
             = [@{$index_element->{'extra'}->{'index_entry'}}];
          last;
        }
      }
    }
  }
}

# Locate all @tables in the tree, and relate index entries to
# the @item that immediately follows or precedes them.
sub _relate_index_entries_to_table_items($$$) {
  my ($type, $current, $indices_information) = @_;

  if (exists($current->{'cmdname'}) and $current->{'cmdname'} eq 'table') {
    _relate_index_entries_to_table_items_in($current, $indices_information);
  }
  return undef;
}

sub relate_index_entries_to_table_items_in_document($) {
  my $document = shift;

  my $tree = $document->tree();
  my $indices_information = $document->indices_information();

  modify_tree($tree, \&_relate_index_entries_to_table_items,
              $indices_information);
}

# reassociate a tree element to the new node, from previous node
sub _reassociate_to_node($$$) {
  my ($type, $current, $argument) = @_;
  my ($new_node_relations, $previous_node_relations) = @{$argument};

  if (exists($current->{'cmdname'}) and $current->{'cmdname'} eq 'menu') {
    if (defined($previous_node_relations)) {
      if (!exists($previous_node_relations->{'menus'})
          or not scalar(@{$previous_node_relations->{'menus'}})
          or not (grep {$current eq $_} @{$previous_node_relations->{'menus'}})) {
        print STDERR
           "BUG: menu $current not in previous node $previous_node_relations->{'element'}\n";
      } else {
        @{$previous_node_relations->{'menus'}}
          = grep {$_ ne $current} @{$previous_node_relations->{'menus'}};
        delete $previous_node_relations->{'menus'}
          if (!scalar(@{$previous_node_relations->{'menus'}}));
      }
    }
    push @{$new_node_relations->{'menus'}}, $current;
  } elsif (exists($current->{'extra'})
           and exists($current->{'extra'}->{'element_node'})) {
    if (defined($previous_node_relations)) {
      my $previous_node = $previous_node_relations->{'element'};
      if ($current->{'extra'}->{'element_node'}
          ne $previous_node->{'extra'}->{'identifier'}) {
        print STDERR "Bug: element $current not in previous node $previous_node; "
          .Texinfo::Common::debug_print_element($current)."\n";
        print STDERR "  previous node: "
        .Texinfo::Convert::Texinfo::root_heading_command_to_texinfo($previous_node)."\n";
        print STDERR "  current node identifier: ".
                          $current->{'extra'}->{'element_node'}."\n";
      }
    }
    $current->{'extra'}->{'element_node'}
      = $new_node_relations->{'element'}->{'extra'}->{'identifier'};
  } elsif (exists($current->{'cmdname'})
           and $current->{'cmdname'} eq 'nodedescription') {
    if (!exists($new_node_relations->{'node_descriptions'})) {
      $new_node_relations->{'node_descriptions'} = [];
    }
    push @{$new_node_relations->{'node_descriptions'}}, $current;
    if (defined($previous_node_relations)
        and exists($previous_node_relations->{'node_descriptions'})) {
      my $index = 0;
      $index++ until ($previous_node_relations->{'node_descriptions'}->[$index]
                         eq $current);
      splice(@{$previous_node_relations->{'node_descriptions'}}, $index, 1);
      if (scalar(@{$previous_node_relations->{'node_descriptions'}}) == 0) {
        delete $previous_node_relations->{'node_descriptions'};
      }
    }
  } elsif (exists($current->{'cmdname'})
           and $current->{'cmdname'} eq 'nodedescriptionblock') {
    if (!exists($new_node_relations->{'node_long_descriptions'})) {
      $new_node_relations->{'node_long_descriptions'} = [];
    }
    push @{$new_node_relations->{'node_long_descriptions'}}, $current;
    if (defined($previous_node_relations)
        and exists($previous_node_relations->{'node_long_descriptions'})) {
      my $index = 0;
      $index++
       until ($previous_node_relations->{'node_long_descriptions'}->[$index]
                         eq $current);
      splice(@{$previous_node_relations->{'node_long_descriptions'}}, $index, 1);
      if (scalar(@{$previous_node_relations->{'node_long_descriptions'}}) == 0) {
        delete $previous_node_relations->{'node_long_descriptions'};
      }
    }
  }
  return undef;
}

# prepare and add a new node as a possible cross reference targets
# modifies $document

# The $DOCUMENT error_messages is used to register error messages.
# Does not matter much, as the code checks that the new node target label does
# not exist already, therefore there cannot be any error.
sub _new_node($$;$$) {
  my ($node_tree, $document, $associated_command, $starting_appended) = @_;

  # We protect for all the contexts, as the node name should be
  # the same in the different contexts, even if some protections
  # are not needed for the parsing.  Also, this way the node tree
  # can be directly reused in the menus for example, without
  # additional protection, some parts could be double protected
  # otherwise, those that are protected with @asis.
  #
  # needed in nodes lines, @*ref and in menus with a label
  $node_tree = protect_comma_in_tree($node_tree);
  # always
  protect_first_parenthesis($node_tree);
  # in menu entry without label
  $node_tree = protect_colon_in_tree($node_tree);
  # in menu entry with label
  $node_tree = protect_node_after_label_in_tree($node_tree);
  $node_tree = reference_to_arg_in_tree($node_tree, $document);

  my $tree_space_before;

  my $empty_node = 0;
  if (!exists($node_tree->{'contents'})) {
    $node_tree->{'contents'} = [Texinfo::TreeElement::new({'text' => '',
                                                 'type' => 'normal_text'})];
    $empty_node = 1;
  } elsif (exists($node_tree->{'contents'}->[0]->{'type'})
           and $node_tree->{'contents'}->[0]->{'type'}
                                           eq 'spaces_before_argument') {
    $tree_space_before = shift(@{$node_tree->{'contents'}});
  }

  my $comment_at_end;
  if (exists($node_tree->{'contents'}->[-1]->{'cmdname'})
      and ($node_tree->{'contents'}->[-1]->{'cmdname'} eq 'c'
           or $node_tree->{'contents'}->[-1]->{'cmdname'} eq 'comment')) {
    $comment_at_end = pop @{$node_tree->{'contents'}};
  }
  my $spaces_after_text = '';
  my $tree_space_after;
  if (exists($node_tree->{'contents'}->[-1]->{'type'})
      and $node_tree->{'contents'}->[-1]->{'type'}
                                        eq 'spaces_after_argument') {
    $tree_space_after = pop @{$node_tree->{'contents'}};
  } elsif (scalar(@{$node_tree->{'contents'}}) > 0
             and $node_tree->{'contents'}->[-1]->{'text'}
             and $node_tree->{'contents'}->[-1]->{'text'} =~ s/(\s+)$//) {
    $spaces_after_text = $1;
  }
  $spaces_after_text .= "\n" unless ($spaces_after_text =~ /\n/
                                         or $comment_at_end);

  my $appended_number = 0;
  if (defined($starting_appended)) {
    $appended_number += $starting_appended;
  } elsif ($empty_node) {
    $appended_number += $empty_node;
  }
  my ($node, $normalized, $normalized_reference);

  my $identifier_target = $document->labels_information();
  while (!defined($node)
         or (defined($identifier_target)
             and $identifier_target->{$normalized})) {

    if (defined($node)) {
      # remove cycles to release the previous node, which will not be used
      # and does not appear in the tree.
      tree_remove_parents($node);
    }

    $node = Texinfo::TreeElement::new({'cmdname' => 'node', 'extra' => {}});

    # In general there is a source info for the associated command, there
    # may be none for generated sectioning commands, for example for fill
    # gaps in sectioning.
    # Using the source information of the associated command for the node
    # is not perfect, but it is better than no source info.
    if (defined($associated_command->{'source_info'})) {
      $node->{'source_info'} = { %{$associated_command->{'source_info'}} };
    }

    my $arguments_line
      = Texinfo::TreeElement::new({'type' => 'arguments_line',
                                   'parent' => $node});
    $node->{'contents'} = [$arguments_line];

    my $node_line_arg
      = Texinfo::TreeElement::new({'type' => 'line_arg',
                                   'parent' => $arguments_line});
    $arguments_line->{'contents'} = [$node_line_arg];

    my $space_after;
    my $space_before;
    if (defined($tree_space_after)) {
      $space_after = $tree_space_after;
    } else {
      $space_after
         = Texinfo::TreeElement::new({'text' => $spaces_after_text,
                                      'type' => 'spaces_after_argument'});
    }
    if (defined($tree_space_before)) {
      $space_before = $tree_space_before;
    } else {
      $space_before
        = Texinfo::TreeElement::new({'text' => ' ',
                                     'type' => 'spaces_before_argument'});
    }

    @{$node_line_arg->{'contents'}} = ($space_before,
                                       @{$node_tree->{'contents'}});

    if ($appended_number) {
      push @{$node_line_arg->{'contents'}},
            Texinfo::TreeElement::new({'text' => " [+$appended_number+]",
                                       'type' => 'normal_text'});
    }
    foreach my $content (@{$node_line_arg->{'contents'}}) {
      $content->{'parent'} = $node_line_arg if (exists($content->{'parent'}));
    }
    push @{$node_line_arg->{'contents'}}, $space_after;
    push @{$node_line_arg->{'contents'}}, $comment_at_end
      if (defined($comment_at_end));

    $normalized
       = Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
           Texinfo::TreeElement::new(
                       { 'contents' => $node_line_arg->{'contents'} }));
    if (!$appended_number) {
      $normalized_reference = $normalized;
    }

    if ($normalized !~ /[^-]/) {
      if ($appended_number) {
        warn "BUG: spaces only node name even with [+$appended_number+]\n";
        return undef;
      } else {
        # remove cycles to release this empty node, which is discarded
        # and does not appear in the tree.
        tree_remove_parents($node);
        $node = undef;
      }
    }
    $appended_number++;
  }
  $node->{'extra'}->{'identifier'} = $normalized;
  $node->{'extra'}->{'added'} = 1;

  if (defined($associated_command) and defined($normalized_reference)
      and $normalized_reference ne $normalized
      and defined($identifier_target)) {
    my $existing_target = $identifier_target->{$normalized_reference};
    if (defined($existing_target)
        and $existing_target->{'extra'}->{'added'}) {
      my $nodes_list = $document->nodes_list();
      my $existing_node_relations
         = $nodes_list->[$existing_target->{'extra'}->{'node_number'} -1];
      my $existing_section
         = $existing_node_relations->{'associated_section'}->{'element'};
      my $debug = $document->get_conf('DEBUG');
      my $error_messages = $document->{'error_messages'};
      my $registered_section_label
       = Texinfo::Common::get_label_element($associated_command);
      my $registered_section_texinfo
        = Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                                  $registered_section_label);
      push @$error_messages, Texinfo::Report::line_warn(
                        sprintf(__("\@%s `%s' already added node"),
                                $associated_command->{'cmdname'},
                                $registered_section_texinfo),
                          $associated_command->{'source_info'}, 0,
                                       $debug);
      push @$error_messages, Texinfo::Report::line_warn(
                         sprintf(__("added for \@%s"),
                            $existing_section->{'cmdname'}),
                             $existing_section->{'source_info'}, 1, $debug);
    }
  }

  Texinfo::Document::register_label_element($document, $node,
                                            $document->{'error_messages'},
                                            $document->get_conf('DEBUG'));

  return $node;
}

# determine node found through section directions, usually
# from section_directions.  It could also be from
# toplevel_directions if going through parts, except for @top
# prev and next.
# TODO document?
sub section_direction_associated_node($$) {
  my ($section_relations, $direction) = @_;

  foreach my $direction_base ('section', 'toplevel') {
    if (exists($section_relations->{$direction_base.'_directions'})
        and exists($section_relations->{$direction_base.'_directions'}
                                                             ->{$direction})
        and ($direction_base ne 'toplevel'
             or $direction eq 'up'
             or $section_relations->{$direction_base.'_directions'}->{$direction}
                                          ->{'element'}->{'cmdname'} ne 'top')) {
       my $direction_relation
         = $section_relations->{$direction_base.'_directions'}->{$direction};
       if (exists($direction_relation->{'associated_node'})) {
        return $direction_relation->{'associated_node'};
      }
    }
  }
  return undef;
}

sub insert_nodes_for_sectioning_commands($;$) {
  my ($document, $warn_duplicated) = @_;

  my $root = $document->tree();
  my $nodes_list = $document->nodes_list();
  my $sections_list = $document->sections_list();
  my $identifier_target;
  if ($warn_duplicated) {
    $identifier_target = $document->labels_information();
  }

  my %first_normalized;
  my $previous_node_relations;
  # associate normalized reference added name to the number of
  # section commands with such a normalized name
  my %normalized_nr;
  my $contents_nr = scalar(@{$root->{'contents'}});
  my $node_idx = 0;
  # cache information to avoid redoing the computations and avoid
  # duplicating code.
  my %elements_with_added;
  # First determine the number of sections for a given normalized name
  # to know which one are ambiguous
  for (my $idx = 0; $idx < $contents_nr; $idx++) {
    my $content = $root->{'contents'}->[$idx];
    if (exists($content->{'cmdname'}) and $content->{'cmdname'} ne 'node'
        and $content->{'cmdname'} ne 'part'
        and exists($Texinfo::Commands::root_commands{$content->{'cmdname'}})) {
      my $section_relations
        = $sections_list->[$content->{'extra'}->{'section_number'} -1];
      if ($section_relations->{'associated_node'}) {
        next;
      }
      my $new_node_tree;
      if ($content->{'cmdname'} eq 'top') {
        $new_node_tree
         = Texinfo::TreeElement::new({'contents' => [
                      Texinfo::TreeElement::new({'text' => 'Top',
                                                 'type' => 'normal_text'})]});
      } else {
        my $arguments_line = $content->{'contents'}->[0];
        my $line_arg = $arguments_line->{'contents'}->[0];
        $new_node_tree = copy_contents($line_arg);
      }
      my $normalized =
       Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
           $new_node_tree);
      if (!exists($normalized_nr{$normalized})) {
        $normalized_nr{$normalized} = 1;
        if ($warn_duplicated and !exists($identifier_target->{$normalized})) {
          $first_normalized{$normalized} = $content;
        }
      } else {
        $normalized_nr{$normalized}++;
        if (exists($first_normalized{$normalized})) {
          my $debug = $document->get_conf('DEBUG');
          my $error_messages = $document->{'error_messages'};

          my $existing_target = $first_normalized{$normalized};
          my $section_texinfo
      = Texinfo::Convert::Texinfo::convert_contents_to_texinfo($new_node_tree);
          # section argument missing
          $section_texinfo = '' if (!defined($section_texinfo));
          push @$error_messages, Texinfo::Report::line_warn(
                        sprintf(__("\@%s `%s' already found target"),
                           $content->{'cmdname'}, $section_texinfo),
                           $content->{'source_info'}, 0, $debug);
          push @$error_messages, Texinfo::Report::line_warn(
                               sprintf(__("found \@%s"),
                                  $existing_target->{'cmdname'}),
                          $existing_target->{'source_info'}, 1, $debug);
        }
      }
      $elements_with_added{$content} = [$content, $new_node_tree,
                                        $section_relations,
                                        \$normalized_nr{$normalized}];
    }
  }

  # add the nodes
  for (my $idx = 0; $idx < $contents_nr; $idx++) {
    my $content = $root->{'contents'}->[$idx];
    if (exists($elements_with_added{$content})) {
      my ($content, $new_node_tree, $section_relations, $normalized_nr_ref)
        = @{$elements_with_added{$content}};
      my $new_node = _new_node($new_node_tree, $document, $content,
                               ($$normalized_nr_ref > 1) ? 1 : undef);
      if (defined($new_node)) {
        # insert before $content
        splice(@{$root->{'contents'}}, $idx, 0, $new_node);
        $idx++;
        $contents_nr++;
        # insert in nodes list
        my $new_node_relations = {'element' => $new_node,
                                  'associated_section' => $section_relations};
        splice(@{$nodes_list}, $node_idx, 0, $new_node_relations);
        $node_idx++;
        $new_node->{'extra'}->{'node_number'} = $node_idx;
        $section_relations->{'associated_node'} = $new_node_relations;
        if (exists($section_relations->{'associated_anchor_command'})) {
          my $section_texinfo
      = Texinfo::Convert::Texinfo::convert_contents_to_texinfo($new_node_tree);
          # section argument missing
          $section_texinfo = '' if (!defined($section_texinfo));
          print STDERR "BUG? unexpected anchor_command without associated node"
                       ." for $section_texinfo\n";
        } else {
          $section_relations->{'associated_anchor_command'}
            = $new_node_relations;
          $new_node_relations->{'associated_title_command'} = $content;
        }
        $new_node->{'parent'} = $content->{'parent'}
          if (exists($content->{'parent'}));
        # reassociate index entries and menus
        modify_tree($content, \&_reassociate_to_node,
                    [$new_node_relations, $previous_node_relations]);

        # if the up node of the new node do not have a menu and has automatic
        # direction, the new node will not appear in any menu.  In that case,
        # remove the up node automatic directions to get a correct automatic
        # menu.
        my $up_node_relations
          = section_direction_associated_node($section_relations, 'up');
        if (defined($up_node_relations)) {
          my $up_node = $up_node_relations->{'element'};
          if (!exists($up_node_relations->{'menus'})) {
            my $up_node_arguments_line = $up_node->{'contents'}->[0];
            if (scalar(@{$up_node_arguments_line->{'contents'}}) > 1) {
              my $debug = $document->get_conf('DEBUG');
              my $error_messages = $document->{'error_messages'};

              my $section_texinfo
      = Texinfo::Convert::Texinfo::convert_contents_to_texinfo($new_node_tree);
              # section argument missing
              $section_texinfo = '' if (!defined($section_texinfo));
              my $node_name_arg = $up_node_arguments_line->{'contents'}->[0];
              my $up_node_texinfo
                = Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                                            $node_name_arg);
              push @$error_messages, Texinfo::Report::line_warn(
          sprintf(__("modifying node relations of `%s' to reference `%s'"),
                           $up_node_texinfo, $section_texinfo),
                           $content->{'source_info'}, 0, $debug);

              # remove explicit directions
              foreach my $removed_e (
                    splice(@{$up_node_arguments_line->{'contents'}}, 1)) {
                # remove cycles to release the removed elements
                tree_remove_parents($removed_e);
              }
              # readd end of line
              push @{$node_name_arg->{'contents'}},
                Texinfo::TreeElement::new({'text' => "\n",
                                           'type' => 'spaces_after_argument'});
            }
          }
        } elsif (exists($section_relations->{'section_directions'})
             and exists($section_relations->{'section_directions'}->{'up'})) {
          my $section_relation_up
            = $section_relations->{'section_directions'}->{'up'};
          print STDERR "BUG: Unexpected up section without associated node: "
              . Texinfo::Convert::Texinfo::root_heading_command_to_texinfo(
                      $section_relation_up->{'element'})."\n";
        }
      }
    }
    # check is_target to avoid erroneous nodes, such as duplicates
    if (exists($content->{'cmdname'})
        and $content->{'cmdname'} eq 'node'
        and exists($content->{'extra'})
        and $content->{'extra'}->{'is_target'}) {
      $previous_node_relations = $nodes_list->[$node_idx];
      # debug
      if ($previous_node_relations->{'element'} ne $content) {
        confess("insert_nodes_for_sectioning_commands: wrong node: '"
        .$previous_node_relations->{'element'}->{'extra'}->{'identifier'}.
               "' '".$content->{'extra'}->{'identifier'}."'\n");
      }
      $node_idx++;
      # reset node index taking into account the added nodes
      $content->{'extra'}->{'node_number'} = $node_idx;
    }
  }
}

1;
