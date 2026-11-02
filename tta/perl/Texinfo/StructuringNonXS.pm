# StructuringNonXS.pm: extract information about a document structure
#                      based on the document tree.
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

# ALTIMP XSTexinfo/parser_document/Structuring.xs
# ALTIMP C/structuring_transfo/structuring.c

package Texinfo::Structuring;

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

use Texinfo::Commands;

use Texinfo::TreeElement;

use Texinfo::Common;

use Texinfo::ManipulateTree qw(normalized_entry_associated_internal_node);

# for error messages
use Texinfo::Convert::Texinfo qw(target_element_to_texi_label
                                 link_element_to_texi);

my %command_structuring_level = %Texinfo::CommandsValues::command_structuring_level;

my %appendix_commands = %Texinfo::Commands::appendix_commands;
my %unnumbered_commands = %Texinfo::Commands::unnumbered_commands;

# Go through the sectioning commands (e.g. @chapter, not @node) and
# associated sectioning commands relations, and set:
# 'section_level'
# 'section_heading_number'
# 'section_children'
# 'section_directions'
# 'toplevel_directions'
sub sectioning_structure($) {
  my $document = shift;

  my $sections_list = $document->sections_list();

  my $customization_information = $document;

  my $sec_root;
  my $previous_section_relations;
  my $previous_toplevel_relations;

  my $in_appendix = 0;
  # lowest level with a number.  This is the lowest level above 0.
  my $number_top_level;

  my $top_relations;

  # holds the current number for all the levels.  It is not possible to use
  # something like the last child index, because of @unnumbered.
  my @command_numbers;
  # keep track of the unnumbered
  my @command_unnumbered;
  foreach my $section_relations (@{$sections_list}) {
    my $content = $section_relations->{'element'};
    if ($content->{'cmdname'} eq 'top' and not defined($top_relations)) {
      $top_relations = $section_relations;
    }

    $content->{'extra'} = {} if (! exists($content->{'extra'}));

    my $level = Texinfo::Common::section_level($content);
    if (!defined($level)) {
      warn "BUG: level not defined for "
           .Texinfo::Common::debug_print_element($content)."\n";
      $level = 0;
    }

    if (defined($previous_section_relations)) {
      my $previous_section = $previous_section_relations->{'element'};
      my $prev_section_level = $previous_section->{'extra'}->{'section_level'};
      if ($prev_section_level < $level) {
        # new command is below
        if ($level - $prev_section_level > 1) {
          $document->document_line_error(
           sprintf(__("raising the section level of \@%s which is too low"),
              $content->{'cmdname'}), $content->{'source_info'});
          $level = $prev_section_level + 1;
        }
        $previous_section_relations->{'section_children'}
          = [$section_relations];

        $section_relations->{'section_directions'} = {};
        $section_relations->{'section_directions'}->{'up'}
           = $previous_section_relations;

        # if the up is unnumbered, the number information has to be kept,
        # to avoid reusing an already used number.
        if (!exists($unnumbered_commands{$previous_section->{'cmdname'}})) {
          $command_numbers[$level] = undef;
        } elsif (!exists($unnumbered_commands{$content->{'cmdname'}})) {
          $command_numbers[$level]++;
        }
        if (exists($unnumbered_commands{$content->{'cmdname'}})) {
          $command_unnumbered[$level] = 1;
        } else {
          $command_unnumbered[$level] = 0;
        }
      } else {
        my $new_upper_part_element;
        # try to find the up in the sectioning hierarchy
        my $up = $previous_section;
        my $up_relations = $previous_section_relations;
        my $up_section_directions = $up_relations->{'section_directions'};

        while (defined($up_section_directions)
               and exists($up_section_directions->{'up'})
               and $up->{'extra'}->{'section_level'} >= $level) {
          $up_relations = $up_section_directions->{'up'};
          $up = $up_relations->{'element'};
          $up_section_directions = $up_relations->{'section_directions'};
        }
        # no up found.  The element is below the sectioning root
        if ($level <= $up->{'extra'}->{'section_level'}) {
          $up = undef;
          $up_relations = $sec_root;
          if ($level <= $sec_root->{'section_root_level'}) {
            # in that case, the level of the element is not in line
            # with being below the sectioning root, something need to
            # be done
            if ($content->{'cmdname'} eq 'part') {
              # the first part just appeared, and there was no @top first in
              # document.  Mark that the sectioning root level needs to be updated
              $new_upper_part_element = 1;
              if ($level < $sec_root->{'section_root_level'}) {
                # level is 0 for part and section level -1 for sec root. The
                # condition means section level > 1, ie below chapter-level.
                $document->document_line_warn(
                 sprintf(__("no chapter-level command before \@%s"),
                         $content->{'cmdname'}), $content->{'source_info'});
              }
            } else {
              $document->document_line_warn(
  sprintf(__("lowering the section level of \@%s appearing after a lower element"),
                  $content->{'cmdname'}), $content->{'source_info'});
              $level = $sec_root->{'section_root_level'} + 1;
            }
          }
        }
        if (exists($appendix_commands{$content->{'cmdname'}}) and !$in_appendix
            and $level <= $number_top_level
            and $up and exists($up->{'cmdname'})
            and $up->{'cmdname'} eq 'part') {
          $up = undef;
          $up_relations = $sec_root;
        }
        if (defined($new_upper_part_element)) {
          # In that case the root level has to be updated because the first
          # 'part' just appeared, no direction to set.
          $sec_root->{'section_root_level'} = $level - 1;
          push @{$sec_root->{'section_children'}}, $section_relations;
          $number_top_level = $level;
          $number_top_level = 1 if (!$number_top_level);
        } else {
          $section_relations->{'section_directions'} = {};
          # do not set sec_root as up, but always put in section_children.
          $section_relations->{'section_directions'}->{'up'} = $up_relations
            if ($up_relations ne $sec_root);
          my $prev_relations = $up_relations->{'section_children'}->[-1];
          $section_relations->{'section_directions'}->{'prev'}
            = $prev_relations;
          $prev_relations->{'section_directions'} = {}
              if (!exists($prev_relations->{'section_directions'}));
          $prev_relations->{'section_directions'}->{'next'}
            = $section_relations;
          push @{$up_relations->{'section_children'}}, $section_relations;
        }
        if (!exists($unnumbered_commands{$content->{'cmdname'}})) {
          $command_numbers[$level]++;
          $command_unnumbered[$level] = 0;
        } else {
          $command_unnumbered[$level] = 1;
        }
      }
    } else {
      # first section determines the level of the root.  It is
      # typically -1 when there is a @top.
      $sec_root = {'section_children' => [$section_relations],
                   'section_root_level' => $level - 1};
      $document->{'sectioning_root'} = $sec_root;
      $number_top_level = $level;
      # if $level of top sectioning element is 0, which means that
      # it is a @top, $number_top_level is 1 as it is associated to
      # the level of chapter/unnumbered...
      $number_top_level = 1 if (!$number_top_level);
      if ($content->{'cmdname'} ne 'top') {
        if (!exists($unnumbered_commands{$content->{'cmdname'}})) {
          $command_unnumbered[$level] = 0;
        } else {
          $command_unnumbered[$level] = 1;
        }
      }
    }

    $content->{'extra'}->{'section_level'} = $level;

    if (!defined($command_numbers[$level])) {
      if (exists($unnumbered_commands{$content->{'cmdname'}})) {
        $command_numbers[$level] = 0;
      } else {
        $command_numbers[$level] = 1;
      }
    }
    if (exists($appendix_commands{$content->{'cmdname'}}) and !$in_appendix
        and $level == $number_top_level) {
      $in_appendix = 1;
      # NOTE we rely on perl auto-increment operator 'magic' for variables
      # in string context, the increment is done as a string, preserving each
      # character within its range, with carry (see perlop).
      $command_numbers[$level] = 'A';
    }
    if (!exists($unnumbered_commands{$content->{'cmdname'}})) {
      # construct the number, if not below an unnumbered
      if (!$command_unnumbered[$number_top_level]) {
        my $section_number = "$command_numbers[$number_top_level]";
        for (my $i = $number_top_level+1; $i <= $level; $i++) {
          $section_number .= ".$command_numbers[$i]";
          # If there is an unnumbered above, then no number is added.
          if ($command_unnumbered[$i]) {
            $section_number = undef;
            last;
          }
        }
        if (defined($section_number)) {
          $content->{'extra'}->{'section_heading_number'} = $section_number;
        }
      }
    }

    $previous_section_relations = $section_relations;

    if ($content->{'cmdname'} ne 'part' and $level <= $number_top_level) {
      if (defined($previous_toplevel_relations)
          or (defined($top_relations)
              and $section_relations ne $top_relations)) {
        $section_relations->{'toplevel_directions'} = {};
        if (defined($previous_toplevel_relations)) {
          $previous_toplevel_relations->{'toplevel_directions'} = {}
           if (!exists($previous_toplevel_relations->{'toplevel_directions'}));
          $previous_toplevel_relations->{'toplevel_directions'}->{'next'}
            = $section_relations;
          $section_relations->{'toplevel_directions'}->{'prev'}
            = $previous_toplevel_relations;
        }
        if (defined($top_relations) and $section_relations ne $top_relations) {
          $section_relations->{'toplevel_directions'}->{'up'} = $top_relations;
        }
      }
      $previous_toplevel_relations = $section_relations;
    } elsif ($content->{'cmdname'} eq 'part'
             and not exists($section_relations->{'part_associated_section'})) {

      $document->document_line_warn(
        sprintf(__("no sectioning command associated with \@%s"),
                $content->{'cmdname'}), $content->{'source_info'});
    }
  }
}

sub sectioning_targets($;$) {
  my ($document, $warn_duplicated) = @_;

  my $sections_list = $document->sections_list();
  my $identifier_target = $document->labels_information();

  foreach my $section_relations (@{$sections_list}) {
    next if (exists($section_relations->{'associated_node'}));

    my $content = $section_relations->{'element'};
    next if ($content->{'cmdname'} eq 'part');

    my $arguments_line = $content->{'contents'}->[0];
    my $line_arg = $arguments_line->{'contents'}->[0];

    my $node_tree = Texinfo::ManipulateTree::copy_contents($line_arg);

    next if (!exists($node_tree->{'contents'}));

    # No @xref in target
    $node_tree
      = Texinfo::ManipulateTree::reference_to_arg_in_tree($node_tree,
                                                          $document);

    my $normalized
       = Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
          $node_tree);

    if ($normalized !~ /[^-]/) {
      next;
    }

    if (defined($identifier_target)
        and $identifier_target->{$normalized}) {
      my $existing_target = $identifier_target->{$normalized};
      if ($warn_duplicated
          and exists($Texinfo::Commands::sectioning_heading_commands{
                                        $existing_target->{'cmdname'}})) {
        my $debug = $document->get_conf('DEBUG');
        my $error_messages = $document->{'error_messages'};

        my $section_texinfo
          = Texinfo::Convert::Texinfo::convert_contents_to_texinfo($line_arg);
        push @$error_messages, Texinfo::Report::line_warn(
                        sprintf(__("\@%s `%s' already added target"),
                           $content->{'cmdname'}, $section_texinfo),
                           $content->{'source_info'}, 0, $debug);
        push @$error_messages, Texinfo::Report::line_warn(
                               sprintf(__("added for \@%s"),
                                  $existing_target->{'cmdname'}),
                          $existing_target->{'source_info'}, 1, $debug);
      }

      next;
    }

    $content->{'extra'}->{'identifier'} = $normalized;

    Texinfo::Document::register_label_element($document, $content,
                                              $document->{'error_messages'},
                                              $document->get_conf('DEBUG'));
  }
}

# for debugging
sub _print_sectioning_tree($);
sub _print_sectioning_tree($) {
  my $current_relations = shift;

  my $current = $current_relations->{'element'};
  my $result = ' ' x $current->{'extra'}->{'section_level'}
   . Texinfo::Convert::Texinfo::root_heading_command_to_texinfo($current)."\n";
  foreach my $child_relations (@{$current_relations->{'section_children'}}) {
    $result .= _print_sectioning_tree($child_relations);
  }
  return $result;
}

sub warn_non_empty_parts($) {
  my $document = shift;

  my $global_commands = $document->global_commands_information();

  if (exists($global_commands->{'part'})) {
    foreach my $part (@{$global_commands->{'part'}}) {
      if (!Texinfo::Common::is_content_empty($part)) {
        $document->document_line_warn(
                     sprintf(__("\@%s not empty"), $part->{'cmdname'}),
                       $part->{'source_info'});
      }
    }
  }
}

sub warn_multiple_node_descriptions($) {
  my $document = shift;

  my $nodes_list = $document->nodes_list();

  return unless (defined($nodes_list) and scalar(@{$nodes_list}));

  foreach my $node_relations (@{$nodes_list}) {
    if (exists($node_relations->{'node_descriptions'})) {
      my $description_nr = scalar(@{$node_relations->{'node_descriptions'}});
      if ($description_nr > 1) {
        foreach my $description
         (@{$node_relations->{'node_descriptions'}}[1 .. $description_nr -1]) {
          $document->document_line_warn(
            __("multiple node \@nodedescription"),
            $description->{'source_info'});
        }
      }
    }
    if (exists($node_relations->{'node_long_descriptions'})) {
      my $description_nr = scalar(@{$node_relations->{'node_long_descriptions'}});
      if ($description_nr > 1) {
        foreach my $long_description
         (@{$node_relations->{'node_long_descriptions'}}[1 .. $description_nr -1]) {
          $document->document_line_warn(
            __("multiple node \@nodedescriptionblock"),
            $long_description->{'source_info'});
        }
      }
    }
  }
}

# No translation of those special Info keywords.
my %direction_texts = (
 'prev' => 'Prev',
 'next' => 'Next',
 'up' => 'Up'
);

sub _check_menu_entry($$$$$) {
  my ($document, $identifier_target, $command, $menu_content,
      $menu_entry_node) = @_;

  if (defined($menu_entry_node->{'extra'}->{'normalized'})) {
    my $normalized_menu_node = $menu_entry_node->{'extra'}->{'normalized'};

    my $menu_node = $identifier_target->{$normalized_menu_node};

    if (!defined($menu_node)) {
      $document->document_line_error(
                  sprintf(__("\@%s reference to nonexistent node `%s'"),
                          $command,
                          link_element_to_texi($menu_entry_node)),
                            $menu_content->{'source_info'});
    } else {
      if (!Texinfo::Convert::Texinfo::check_node_same_texinfo_code($menu_node,
                           $menu_entry_node->{'extra'}->{'node_content'})) {
        $document->document_line_warn(
        sprintf(__("\@%s entry node name `%s' different from %s name `%s'"),
                $command,
                link_element_to_texi($menu_entry_node),
                $menu_node->{'cmdname'},
                target_element_to_texi_label($menu_node)),
                               $menu_content->{'source_info'});
      }
    }
  }
}

sub _register_menu_node_targets($$$) {
  my ($identifier_target, $node_relations, $register) = @_;

  if (exists($node_relations->{'menus'})) {
    foreach my $menu (@{$node_relations->{'menus'}}) {
      foreach my $menu_content (@{$menu->{'contents'}}) {
        if (exists($menu_content->{'type'})
            and $menu_content->{'type'} eq 'menu_entry') {
          my $menu_node = normalized_entry_associated_internal_node
                            ($menu_content, $identifier_target);
          $register->{$menu_node} = 1 if (defined($menu_node));
        }
      }
    }
  }
}

sub _node_automatic_directions ($) {
  my $node = shift;

  my $arguments_line = $node->{'contents'}->[0];
  return (scalar(@{$arguments_line->{'contents'}}) <= 1);
}

my @node_directions_names = ('next', 'prev', 'up');
# In general should be called only after complete_node_tree_with_menus
# to generate the Top node first node directions automatically when there
# are no sections nor menus before checking.
sub check_nodes_are_referenced($) {
  my $document = shift;

  my $customization_information = $document;
  my $nodes_list = $document->nodes_list();
  my $identifier_target = $document->labels_information();
  my $refs = $document->internal_references_information();

  return unless (defined($nodes_list) and scalar(@{$nodes_list}));

  my $top_node;
  my $top_target_element = $identifier_target->{'Top'};
  if (defined($top_target_element)
      and $top_target_element->{'cmdname'} eq 'node') {
    $top_node = $top_target_element;
  } else {
    $top_node = $nodes_list->[0]->{'element'};
  }

  my %referenced_nodes = ($top_node => 1);
  my %referenced_in_menus = ();
  foreach my $node_relations (@{$nodes_list}) {
    my $node = $node_relations->{'element'};
    # gather referenced nodes based on node pointers
    my $node_directions = $node_relations->{'node_directions'};
    if (defined($node_directions)) {
      foreach my $direction (@node_directions_names) {
        if ($node_directions->{$direction}
            and not $node_directions->{$direction}
                                   ->{'extra'}->{'manual_content'}) {
          $referenced_nodes{$node_directions->{$direction}} = 1;
        }
      }
    }
    if (exists($node_relations->{'menus'})) {
      _register_menu_node_targets($identifier_target, $node_relations,
                                 \%referenced_in_menus);
      %referenced_nodes = (%referenced_nodes, %referenced_in_menus);
    } else {
      # If an automatic menu can be setup, consider that all
      # the nodes appearing in the automatic menu are referenced.
      # Note that the menu may not be actually setup, but
      # it is better not to warn for nothing.
      if (_node_automatic_directions($node)) {
        my @node_childs
          = get_node_node_childs_from_sectioning($node_relations);
        foreach my $node_child (@node_childs) {
          $referenced_nodes{$node_child->{'element'}} = 1;
        }
      }
    }
  }

  # consider nodes in internal @*ref commands to be referenced
  if (defined($refs)) {
    foreach my $ref (@$refs) {
      if (exists($ref->{'contents'})
          and exists($ref->{'contents'}->[0]->{'extra'})) {
        my $label_arg = $ref->{'contents'}->[0];
        my $label_normalized = $label_arg->{'extra'}->{'normalized'};
        if ($label_normalized) {
          my $node_target = $identifier_target->{$label_normalized};
          if (defined($node_target) and $node_target->{'cmdname'} eq 'node') {
            $referenced_nodes{$node_target} = 1;
          }
        }
      }
    }
  }

  foreach my $node_relations (@{$nodes_list}) {
    my $node = $node_relations->{'element'};
    # it is normal that a redundant node is not referenced
    if ($node->{'extra'}->{'is_target'}) {
      if (not exists($referenced_nodes{$node})) {
        $document->document_line_warn(sprintf(__("node `%s' unreferenced"),
                                      target_element_to_texi_label($node)),
                              $node->{'source_info'});
      # if the node is referenced, warn if there is no menu up
      } elsif ($customization_information->get_conf(
                                             'CHECK_NORMAL_MENU_STRUCTURE')
               and $node->{'extra'}->{'identifier'} ne 'Top'
               and scalar(@{$nodes_list}) > 1) {
        if (not ((exists($node_relations->{'associated_section'})
                  and _node_automatic_directions($node))
                 or $referenced_in_menus{$node})) {
          $document->document_line_warn(sprintf(__("node `%s' not in menu"),
                                        target_element_to_texi_label($node)),
                               $node->{'source_info'});
        }
      }
    }
  }
}

# Set node_directions and complete automatic directions with menus.
sub complete_node_tree_with_menus($) {
  my $document = shift;

  my $customization_information = $document;
  my $global_commands = $document->global_commands_information();
  my $nodes_list = $document->nodes_list();
  my $identifier_target = $document->labels_information();

  return undef unless (defined($nodes_list) and scalar(@{$nodes_list}));

  my $format_menu = $customization_information->get_conf('FORMAT_MENU');

  my $check_menu_entries = (!$customization_information->get_conf('novalidate')
      and (!defined($format_menu) or $format_menu eq 'menu'
           or $format_menu eq 'menu_no_detailmenu'));
  my $top_target_element = $identifier_target->{'Top'};

  # First go through all the menus and set menu up, menu next and menu prev,
  # and warn for unknown nodes.
  # Remark: since the @menu are only checked if they are in @node,
  # menu entries before the first node, or @menu nested inside
  # another command such as @format, may be treated slightly
  # differently; at least, there are no error messages for them.
  #
  foreach my $node_relations (@{$nodes_list}) {
    my $node = $node_relations->{'element'};
    if (exists($node_relations->{'menus'})) {
      if (scalar(@{$node_relations->{'menus'}}) > 1) {
        foreach my $menu (@{$node_relations->{'menus'}}[1 .. $#{$node_relations->{'menus'}}]) {
          $document->document_line_warn(sprintf(__("multiple \@%s"),
                       $menu->{'cmdname'}), $menu->{'source_info'});
        }
      }
      foreach my $menu (@{$node_relations->{'menus'}}) {
        my $previous_node_relations;
        my $previous_node;
        foreach my $menu_content (@{$menu->{'contents'}}) {
          if (exists($menu_content->{'type'})
              and $menu_content->{'type'} eq 'menu_entry') {
            my $menu_node;
            my $menu_node_relations;
            foreach my $content (@{$menu_content->{'contents'}}) {
              if ($content->{'type'} eq 'menu_entry_node') {
                if (exists($content->{'extra'})) {
                  if (!exists($content->{'extra'}->{'manual_content'})) {
                    if ($check_menu_entries) {
                      _check_menu_entry($document,
                                        $identifier_target, 'menu',
                                        $menu_content, $content);
                    }
                    if (defined($content->{'extra'}->{'normalized'})) {
                      $menu_node
                        = $identifier_target->{$content->{'extra'}->{'normalized'}};
                      if (defined($menu_node)
                          and $menu_node->{'cmdname'} eq 'node') {
                        $menu_node_relations
                          = $nodes_list->[$menu_node->{'extra'}->{'node_number'} -1];
                        if ((!defined($top_target_element)
                             or $menu_node ne $top_target_element)
                            and _node_automatic_directions($menu_node)) {
                          $menu_node_relations->{'node_directions'} = {}
                           if (!exists($menu_node_relations->{'node_directions'}));
                          my $menu_node_directions
                            = $menu_node_relations->{'node_directions'};
                          if (!defined($menu_node_directions)
                              or !exists($menu_node_directions->{'up'})) {
                            $menu_node_directions->{'up'} = $node;
                          }
                        }
                      }
                    }
                  } else {
                    $menu_node = $content;
                  }
                }
                last;
              }
            }
            if (defined($menu_node) and defined($previous_node_relations)
                and !exists($previous_node_relations->{'element'}
                                    ->{'extra'}->{'manual_content'})) {
              if ((!defined($top_target_element)
                   or $previous_node ne $top_target_element)
                  and _node_automatic_directions($previous_node)) {
                $previous_node_relations->{'node_directions'} = {}
                  if (!exists($previous_node_relations->{'node_directions'}));
                my $previous_node_directions
                  = $previous_node_relations->{'node_directions'};
                if (!$previous_node_directions->{'next'}) {
                  $previous_node_directions->{'next'} = $menu_node;
                }
              }
            }
            if (defined($menu_node_relations) and defined($previous_node)
                and !exists($menu_node->{'extra'}->{'manual_content'})) {
              if ((!defined($top_target_element)
                   or $menu_node ne $top_target_element)
                  and _node_automatic_directions($menu_node)) {
                $menu_node_relations->{'node_directions'} = {}
                  if (!exists($menu_node_relations->{'node_directions'}));
                my $menu_node_directions
                  = $menu_node_relations->{'node_directions'};
                if (!exists($menu_node_directions->{'prev'})) {
                  $menu_node_directions->{'prev'} = $previous_node;
                }
              }
            }
            $previous_node = $menu_node;
            $previous_node_relations = $menu_node_relations;
          }
        } # end menu
      }
    }
  }
  # Check @detailmenu
  if ($check_menu_entries and exists($global_commands->{'detailmenu'})) {
    foreach my $detailmenu (@{$global_commands->{'detailmenu'}}) {
      foreach my $menu_content (@{$detailmenu->{'contents'}}) {
        if (exists($menu_content->{'type'})
            and $menu_content->{'type'} eq 'menu_entry') {
          foreach my $content (@{$menu_content->{'contents'}}) {
            if ($content->{'type'} eq 'menu_entry_node') {
              if (not (exists($content->{'extra'})
                       and exists($content->{'extra'}->{'manual_content'}))) {
                _check_menu_entry($document,
                    $identifier_target, 'detailmenu', $menu_content, $content);
              }
              last;
            }
          }
        }
      }
    }
  }
}

# determine node found through section directions, usually
# from section_directions.  It could also be from
# toplevel_directions if going through parts, except for @top
# as prev or next.
sub _section_direction_associated_node($$) {
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

# Checks on structure related to menus.
sub check_node_tree_menu_structure($) {
  my $document = shift;

  my $customization_information = $document;
  my $nodes_list = $document->nodes_list();
  my $identifier_target = $document->labels_information();

  return unless (defined($nodes_list) and scalar(@{$nodes_list}));

  # Used to suppress later errors about a node if an error was
  # already reported to avoid deluging the user with error
  # messages.  Indexed by 'node_number' extra value.
  my %node_errors;

  # Check for nodes listed in the wrong menu(s)
  if ($customization_information->get_conf('CHECK_NORMAL_MENU_STRUCTURE')) {
    foreach my $node_relations (@{$nodes_list}) {
      my $node = $node_relations->{'element'};

      if (exists($node_relations->{'menus'})) {
        foreach my $menu (@{$node_relations->{'menus'}}) {
          foreach my $menu_content (@{$menu->{'contents'}}) {
            next if (!exists($menu_content->{'type'})
                     or $menu_content->{'type'} ne 'menu_entry');
            my $menu_node = normalized_entry_associated_internal_node
                              ($menu_content, $identifier_target);
            if (defined($menu_node) and $menu_node->{'cmdname'} eq 'node') {
              my $menu_node_relations = $nodes_list
                ->[$menu_node->{'extra'}->{'node_number'} -1];

              my $section_relations
                = $menu_node_relations->{'associated_section'};

              # possibly a lone @node that is not part of the
              # section structure.
              next if (!defined($section_relations));
              next if (!_node_automatic_directions($menu_node));

              my $section_up_node
                = _section_direction_associated_node($section_relations,'up');
              if (!defined($section_up_node)) {
                $document->document_line_warn(
    sprintf(__("node `%s' in menu in `%s' but not under it in sectioning"),
                             target_element_to_texi_label($menu_node),
                             target_element_to_texi_label($node)),
                    $menu_content->{'source_info'});
                $node_errors{$menu_node->{'extra'}->{'node_number'}} = 1;
              } elsif ($section_up_node->{'element'} ne $node) {
                $document->document_line_warn(
    sprintf(__("node `%s' in menu in `%s' but under `%s' in sectioning"),
                    target_element_to_texi_label($menu_node),
                    target_element_to_texi_label($node),
                    target_element_to_texi_label
                      ($section_up_node->{'element'})),
                    $menu_content->{'source_info'});
                $node_errors{$menu_node->{'extra'}->{'node_number'}} = 1;
              }
            }
          }
        }
      }
    }
  }

  # Go through all the menus and check if they match subordinate
  # nodes.
  if ($customization_information->get_conf('CHECK_NORMAL_MENU_STRUCTURE')) {
    foreach my $node_relations (@{$nodes_list}) {

      next if (! exists($node_relations->{'menus'}));

      next if (! exists($node_relations->{'associated_section'}));
      my $section_children = $node_relations->{'associated_section'}
                                          ->{'section_children'};

      next if (!defined($section_children) or !scalar(@{$section_children}));

      # Find the first subordinate section, which should appear first
      # in the menu.
      my $first_child = $section_children->[0];
      while (!exists($first_child->{'associated_node'})
             and exists($first_child->{'section_directions'})
             and exists($first_child->{'section_directions'}->{'next'})) {
        $first_child = $first_child->{'section_directions'}->{'next'};
      }

      my $first_child_node_relations = $first_child->{'associated_node'};
      next if (!defined($first_child_node_relations));

      my $section_node = $first_child_node_relations->{'element'};
      next if (!defined($section_node));
      my $last_menu_node_relations;

      foreach my $menu (@{$node_relations->{'menus'}}) {
        # Loop through each each entry in the menu and
        # check if it is the menu entry we were expecting
        # to see based on what came before.
        MENU_CONTENT:
        foreach my $menu_content (@{$menu->{'contents'}}) {
          next if (!exists($menu_content->{'type'})
                   or $menu_content->{'type'} ne 'menu_entry');
          my $menu_node
            = normalized_entry_associated_internal_node
                ($menu_content, $identifier_target);
          # no node_number happens for @anchor and @namedanchor labels in
          # menu entry nodes
          next if (!defined($menu_node)
                   or !exists($menu_node->{'extra'})
                   or !exists($menu_node->{'extra'}->{'node_number'}));

          my $menu_node_element_number
            = $menu_node->{'extra'}->{'node_number'};

          # If there are explicit node pointers, also allow
          # the "next" node.
          my $next_pointer_node;
          if (!defined($section_node) or $menu_node ne $section_node) {
            if ($last_menu_node_relations) {
              my $last_menu_node = $last_menu_node_relations->{'element'};
              if (!_node_automatic_directions($last_menu_node)) {
                my $last_menu_node_directions
                  = $last_menu_node_relations->{'node_directions'};
                $next_pointer_node = $last_menu_node_directions->{'next'};
              }
            }
          }

          if ($node_errors{$menu_node_element_number}) {
          } elsif (defined($section_node) and $menu_node eq $section_node
                   or defined($next_pointer_node)
                        and $menu_node eq $next_pointer_node) {
            # good
          } elsif (defined($section_node)) {
            $document->document_line_warn(
              sprintf(__("node `%s' in menu where `%s' expected"),
                target_element_to_texi_label($menu_node),
                target_element_to_texi_label($section_node)),
              $menu_content->{'source_info'});
            $node_errors{$menu_node_element_number} = 1;
          } else {
            $document->document_line_warn(
              sprintf(__("unexpected node `%s' in menu"),
                target_element_to_texi_label($menu_node)),
              $menu_content->{'source_info'});
            $node_errors{$menu_node_element_number} = 1;
            # If no more nodes were expected, don't warn about any
            # further menu entries.
            last if !defined($next_pointer_node);
          }

          # Now set section_node for the section that is
          # expected to follow the current menu node.

          $last_menu_node_relations
            = $nodes_list->[$menu_node_element_number - 1];

          next MENU_CONTENT
            if (!exists($last_menu_node_relations->{'associated_section'}));

          my $menu_section_dirs
            = $last_menu_node_relations->{'associated_section'}
                ->{'section_directions'};

          next MENU_CONTENT
            if (!defined($menu_section_dirs)
                or !exists($menu_section_dirs->{'up'})
                or !exists($menu_section_dirs->{'up'}->{'associated_node'}));

          my $menu_node_up = $menu_section_dirs->{'up'}->{'associated_node'};
          if ($menu_node_up ne $node_relations) {
            # Keep the same expected section as the current menu node
            # is misplaced.
          } elsif (exists($menu_section_dirs->{'next'})) {
            my $section_next = $menu_section_dirs->{'next'};
            while (defined($section_next)
                   and !exists($section_next->{'associated_node'})
                   and exists($section_next->{'section_directions'})) {
              $section_next = $section_next->{'section_directions'}->{'next'};
            }
            if (defined($section_next)
                and exists($section_next->{'associated_node'})) {
              $section_node = $section_next->{'associated_node'}->{'element'};
            } else {
              undef $section_node;
            }
          } else {
            # We reached the last subordinate section so no more menu
            # entries are expected.
            undef $section_node;
          }
        }
      }
    }
  }

  my %cached_menu_nodes;

  # check for node up / menu up mismatch
  if ($customization_information->get_conf('CHECK_MISSING_MENU_ENTRY')) {
    foreach my $node_relations (@{$nodes_list}) {
      my $node = $node_relations->{'element'};
      next if $node_errors{$node->{'extra'}->{'node_number'}};

      my $section_relations = $node_relations->{'associated_section'};
      next if (!defined($section_relations));

      # We need to check both toplevel_ and section_directions in case
      # the up section is a @part.
      my $section_directions = $section_relations->{'toplevel_directions'};
      if (!defined($section_directions)) {
        $section_directions = $section_relations->{'section_directions'};
      }

      my ($up_node_relations, $up_node);

      if (defined($section_directions)
          and exists($section_directions->{'up'})) {
        $up_node_relations = $section_directions->{'up'}->{'associated_node'};
        if (defined($up_node_relations)) {
          $up_node = $up_node_relations->{'element'};
        }
      }

      if ($up_node
          # No check if node up is an external manual
          and not exists($up_node->{'extra'}->{'manual_content'})
          # no check for a redundant node, the node registered in the menu
          # was the main equivalent node
          and $node->{'extra'}->{'is_target'}) {

        # check only if there are menus
        next if (!exists($up_node_relations->{'menus'}));

        if (!$cached_menu_nodes{$up_node}) {
          $cached_menu_nodes{$up_node} = {};
          _register_menu_node_targets($identifier_target, $up_node_relations,
                                      $cached_menu_nodes{$up_node});
        }
        if (!$cached_menu_nodes{$up_node}->{$node}) {
          my $node_directions = $node_relations->{'node_directions'};
          # Suppress the error if the node up pointer for the child
          # node is to a different node.
          if (!defined($node_directions)
                or !defined($node_directions->{'up'})
                or $node_directions->{'up'} eq $up_node) {
            $document->document_line_warn(sprintf(
     __("node `%s' lacks menu item for `%s' but is above it in sectioning"),
               target_element_to_texi_label($up_node),
               target_element_to_texi_label($node)),
                              $up_node->{'source_info'});
            $node_errors{$node->{'extra'}->{'node_number'}} = 1;
          }
        }
      }
    }
  }

  # loop over all the menus in all the nodes and check for
  # mismatch with any explicit node pointers.
  if ($customization_information->get_conf('CHECK_NORMAL_MENU_STRUCTURE')) {
    my $top_node = $identifier_target->{'Top'};
    foreach my $node_relations (@{$nodes_list}) {
      my $node = $node_relations->{'element'};
      next if !$node_relations->{'menus'};

      my $in_top_node = (defined($top_node) and $node eq $top_node);

      my ($menu_prev_node, $menu_prev_node_directions);
      foreach my $menu (@{$node_relations->{'menus'}}) {
        foreach my $menu_content (@{$menu->{'contents'}}) {
          next if !defined($menu_content->{'type'})
            or $menu_content->{'type'} ne 'menu_entry';
          my $menu_node = normalized_entry_associated_internal_node
                            ($menu_content, $identifier_target);
          next if (!defined($menu_node)
                   or !exists($menu_node->{'extra'})
                   or !exists($menu_node->{'extra'}->{'node_number'}));
          my $menu_node_element_number
            = $menu_node->{'extra'}->{'node_number'};
          my $menu_node_relations
            = $nodes_list->[$menu_node_element_number - 1];
          my $menu_node_directions;

          if (!_node_automatic_directions($menu_node)) {
            $menu_node_directions = $menu_node_relations->{'node_directions'};
          }

          # Warn if the Up node of a listed node is not the current node.
          # Omit these warnings for the Top node menu, in case @detailmenu
          # was missing around a listing of all nodes in the manual.
          if (defined($menu_node_directions)
              and exists($menu_node_directions->{'up'})
              and $menu_node_directions->{'up'} ne $node
              and !$in_top_node) {
            my $direction = 'up';
            $document->document_line_warn(
     sprintf(__("node %s pointer for `%s' is `%s' but %s is `%s' in menu"),
                  $direction,
                  target_element_to_texi_label($menu_node),
                  target_element_to_texi_label(
                      $menu_node_directions->{$direction}),
                  $direction,
                  target_element_to_texi_label($node)),
                                  $menu_content->{'source_info'});
          }

          if (defined($menu_prev_node)) {
            # Check menu entries in pairs.
            # next pointer for menu_prev_node should be menu_node, and
            # prev pointer for menu_node should be menu_prev_node.

            if (defined($menu_prev_node_directions)
                and exists($menu_prev_node_directions->{'next'})
                and $menu_prev_node_directions->{'next'} ne $menu_node) {
                my $direction = 'next';
                $document->document_line_warn(
         sprintf(__("node %s pointer for `%s' is `%s' but %s is `%s' in menu"),
                          $direction,
                          target_element_to_texi_label($menu_prev_node),
                          target_element_to_texi_label(
                              $menu_prev_node_directions->{$direction}),
                          $direction,
                          target_element_to_texi_label($menu_node)),
                                      $menu_content->{'source_info'});
            }


            if (defined($menu_node_directions)
                and exists($menu_node_directions->{'prev'})
                and $menu_node_directions->{'prev'} ne $menu_prev_node) {
              my $direction = 'prev';
              $document->document_line_warn(
         sprintf(__("node %s pointer for `%s' is `%s' but %s is `%s' in menu"),
                          $direction,
                          target_element_to_texi_label($menu_node),
                          target_element_to_texi_label(
                              $menu_node_directions->{$direction}),
                          $direction,
                          target_element_to_texi_label($menu_prev_node)),
                                      $menu_content->{'source_info'});
            }
          }

          $menu_prev_node = $menu_node;
          $menu_prev_node_directions = $menu_node_directions;
        }
      }
    }
  }
}

# As mentioned in the manual, the node next pointer for the Top
# is special, and usually points to the first chapter in the
# document.   Set it using sectioning if possible, otherwise using
# menus.  Return reference to Top node.
sub _set_top_node_next($$) {
  my ($nodes_list, $identifier_target) = @_;

  my $top_node = $identifier_target->{'Top'};

  return undef if (!defined($top_node)
                   or $top_node->{'cmdname'} ne 'node');

  if (_node_automatic_directions($top_node)) {
    my $top_node_next;
    my $top_node_number = $top_node->{'extra'}->{'node_number'};
    my $node_relations
      = $nodes_list->[$top_node_number -1];

    my $node_directions = $node_relations->{'node_directions'};

    # Special case for Top node, use first section
    if (exists($node_relations->{'associated_section'})) {
      my $associated_relations = $node_relations->{'associated_section'};
      my $section_children = $associated_relations->{'section_children'};
      if (defined($section_children) and scalar(@$section_children)) {
        my $section_child_relations = $section_children->[0];
        if (exists($section_child_relations->{'associated_node'})) {
          $top_node_next
            = $section_child_relations->{'associated_node'}->{'element'};
          $node_directions = {}
              if (! defined($node_directions));
          $node_relations->{'node_directions'} = {}
              if (!exists($node_relations->{'node_directions'}));
          $node_relations->{'node_directions'}->{'next'}
           = $top_node_next;
        }
      }
    }

    if (!defined($top_node_next)) {
      # use first menu entry if available as next for Top
      my $menu_child
         = Texinfo::ManipulateTree::first_menu_node($node_relations,
                                                    $identifier_target);
      if ($menu_child) {
        $top_node_next = $menu_child;
      } else {
        # use the first non top node as next for Top
        foreach my $first_non_top_node_relations (@{$nodes_list}) {
          my $first_non_top_node
            = $first_non_top_node_relations->{'element'};
          if ($first_non_top_node ne $top_node) {
            $top_node_next = $first_non_top_node;
            last;
          }
        }
      }
      if (defined($top_node_next)) {
        $node_relations->{'node_directions'} = {}
           if (!exists($node_relations->{'node_directions'}));
        $node_relations->{'node_directions'}->{'next'}
          = $top_node_next;
        if (exists($top_node_next->{'extra'}->{'manual_content'})
            or $top_node_next->{'cmdname'} ne 'node') {
          $top_node_next = undef;
        }
      }
    }
    # prev defined as first Top node menu entry node
    if (defined($top_node_next)) {
      if (_node_automatic_directions($top_node_next)) {
        my $next_node_number = $top_node_next->{'extra'}->{'node_number'};
        # different from Top node and after Top node
        if ($next_node_number > $top_node_number) {
          my $next_node_relations = $nodes_list->[$next_node_number -1];

          $next_node_relations->{'node_directions'} = {}
            if (!exists($next_node_relations->{'node_directions'}));
          if (!exists($next_node_relations->{'node_directions'}->{'prev'})) {
            $next_node_relations->{'node_directions'}->{'prev'}
              = $top_node;
          }
        }
      }
    }
  }
  return $top_node;
}

# set node directions based on sectioning and @node explicit directions
sub construct_nodes_tree($) {
  my $document = shift;

  my $customization_information = $document;
  my $identifier_target = $document->labels_information();

  my $top_target_element = $identifier_target->{'Top'};
  # Go through all the nodes and set directions.
  my $nodes_list = $document->nodes_list();

  _set_top_node_next($nodes_list, $identifier_target);

  foreach my $node_relations (@{$nodes_list}) {
    my $node = $node_relations->{'element'};

    if (_node_automatic_directions($node)) {
      if (!defined($top_target_element) or $node ne $top_target_element) {
        foreach my $direction (@node_directions_names) {
          if (exists($node_relations->{'associated_section'})) {
            my $direction_relation = $node_relations->{'associated_section'};

            # Prefer the section associated with a @part for node directions.
            if ($direction_relation
                and exists($direction_relation->{'part_associated_section'})) {
              $direction_relation
                = $direction_relation->{'part_associated_section'};
            }

            my $direction_associated_node
              = _section_direction_associated_node($direction_relation,
                                                   $direction);
            if ($direction_associated_node) {
              $node_relations->{'node_directions'} = {}
                 if (!exists($node_relations->{'node_directions'}));
              $node_relations->{'node_directions'}->{$direction}
                              = $direction_associated_node->{'element'};
            }
          }
        }
      }
    } else { # explicit directions
      my $arguments_line = $node->{'contents'}->[0];
      for (my $i = 1; $i < scalar(@{$arguments_line->{'contents'}}); $i++) {
        my $direction_element = $arguments_line->{'contents'}->[$i];
        my $direction = $node_directions_names[$i-1];

        # external node
        if (exists($direction_element->{'extra'})
            and exists($direction_element->{'extra'}->{'manual_content'})) {
          $node_relations->{'node_directions'} = {}
             if (!exists($node_relations->{'node_directions'}));
          $node_relations->{'node_directions'}->{$direction}
             = $direction_element;
        } elsif (exists($direction_element->{'extra'})
                 and defined($direction_element->{'extra'}->{'normalized'})) {
          my $direction_normalized = $direction_element->{'extra'}->{'normalized'};
          if ($identifier_target->{$direction_normalized}) {
            my $node_target
               = $identifier_target->{$direction_normalized};
            $node_relations->{'node_directions'} = {}
               if (!exists($node_relations->{'node_directions'}));
            $node_relations->{'node_directions'}->{$direction} = $node_target;

            if (!$customization_information->get_conf('novalidate')
                and !Texinfo::Convert::Texinfo::check_node_same_texinfo_code(
                                 $node_target,
                                 $direction_element->{'extra'}->{'node_content'})) {
              $document->document_line_warn(sprintf(
             __("%s pointer `%s' (for node `%s') different from %s name `%s'"),
                  $direction_texts{$direction},
                  link_element_to_texi($direction_element),
                  target_element_to_texi_label($node),
                                     $node_target->{'cmdname'},
                  target_element_to_texi_label($node_target)),
                                    $node->{'source_info'});
            }
          } else {
            if (!$customization_information->get_conf('novalidate')) {
              $document->document_line_error(
                   sprintf(__("%s reference to nonexistent `%s'"),
                      $direction_texts{$direction},
                      link_element_to_texi($direction_element)),
                                $node->{'source_info'});
            }
          }
        }
      }
    }
  }
}

sub _print_line_command($) {
  my $element = shift;

  if (exists($Texinfo::Commands::root_commands{$element->{'cmdname'}})) {
    return Texinfo::ManipulateTree::root_command_element_string($element);
  } else {
    if (scalar(@{$element->{'contents'}})) {
      my $root_command_texi
        = Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                            $element->{'contents'}->[0]);
      if (defined($root_command_texi)) {
        return '@'."$element->{'cmdname'} ".$root_command_texi;
      }
    }
    return undef;
  }
}

sub _print_line_command_key_element($$) {
  my ($key, $element) = @_;

  my $line_command_text = _print_line_command($element);
  if (!defined($line_command_text)) {
    return " $key\n";
  } else {
    return " $key: ".$line_command_text."\n";
  }
}

sub _print_key_section_with_number($$) {
  my ($section_key, $element) = @_;

  my $section_texi
      = Texinfo::ManipulateTree::root_command_element_string($element);
  if (!defined($section_texi)) {
    return " $section_key\n";
  } else {
    return " $section_key: ".$section_texi."\n";
  }
}

sub _print_root_command($) {
  my $element = shift;
  #if (!defined($element)) {
  #  confess('_print_root_command element undef');
  #}
  #if (!defined($element->{'contents'})) {
  #  confess('_print_root_command element contents undef');
  #}

  my $argument_line = $element->{'contents'}->[0];
  if (exists($argument_line->{'contents'})) {
    my $root_command_texi
     = Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                   $argument_line->{'contents'}->[0]);
    return $root_command_texi;
  }
  return undef;
}

# used in t/*.t tests
sub _print_menu_node($) {
  my $element = shift;

  if (exists($element->{'cmdname'}) and $element->{'cmdname'} eq 'node') {
    return _print_root_command($element);
  } elsif (exists($element->{'cmdname'})
           and exists($element->{'contents'})) {
    my $result
      = Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                            $element->{'contents'}->[0]);
    return $result;
  } else {
    return Texinfo::Convert::Texinfo::convert_to_texinfo($element);
  }
}

sub print_sections_list($) {
  my $document = shift;

  my $sections_list = $document->sections_list();

  my $result = '';

  my $idx = 1;

  foreach my $section_relations (@$sections_list) {
    my $element = $section_relations->{'element'};
    my $root_command_texi = _print_root_command($element);
    if (!defined($root_command_texi)) {
      $result .= "$idx\n";
    } else {
      $result .= "$idx|$root_command_texi\n";
    }

    foreach my $node_relations_key (('associated_anchor_command',
                                     'associated_node',
                                     'part_following_node')) {
      if (exists($section_relations->{$node_relations_key})) {
        $result .= " $node_relations_key: "
            ._print_root_command(
            $section_relations->{$node_relations_key}->{'element'})."\n";
      }
    }

    foreach my $section_relations_key (('associated_part',
                                        'part_associated_section')) {
      if (exists($section_relations->{$section_relations_key})) {
        $result .= _print_key_section_with_number($section_relations_key,
               $section_relations->{$section_relations_key}->{'element'});
      }
    }

    foreach my $directions_key (('section_directions', 'toplevel_directions')) {
      if (exists($section_relations->{$directions_key})) {
        my $value = $section_relations->{$directions_key};
        $result .= " $directions_key:\n";
        foreach my $d_key (@node_directions_names) {
          if (exists($value->{$d_key})) {
            my $e = $value->{$d_key}->{'element'};
            my $direction_texi = _print_root_command($e);
            if (defined($direction_texi)) {
              $result .= "  ${d_key}->$direction_texi\n";
            } else {
              # happens with empty sections
              $result .= "  ${d_key}->\n";
            }
          }
        }
      }
    }

    if (exists($section_relations->{'section_children'})) {
      my $key = 'section_children';
      $result .= " $key:\n";
      my $value = $section_relations->{$key};
      my $sec_idx = 1;
      foreach my $section_relations (@$value) {
        my $e = $section_relations->{'element'};
        my $section_texi = _print_root_command($e);
        $result .= "  ${sec_idx}|";
        if (defined($section_texi)) {
          $result .= $section_texi;
        }
        $result .= "\n";
        $sec_idx++;
      }
    }

    $idx++;
  }

  return $result;
}

sub print_sectioning_root($) {
  my $document = shift;

  my $sectioning_root = $document->sectioning_root();

  my $result = '';

  if ($sectioning_root) {
    $result .= "level: ".
      $sectioning_root->{'section_root_level'}."\n";
    $result .= "list:\n";
    my $sec_idx = 1;
    foreach my $section_relations (@{$sectioning_root->{'section_children'}}) {
      $result .= " $sec_idx|";
      my $section = $section_relations->{'element'};
      my $section_texi = _print_root_command($section);
      if (defined($section_texi)) {
        $result .= $section_texi;
      }
      $result .= "\n";
      $sec_idx++;
    }
  }

  return $result;
}

sub print_headings_list($) {
  my $document = shift;

  my $headings_list = $document->headings_list();

  my $result = '';

  my $idx = 1;

  foreach my $heading_relations (@$headings_list) {
    my $element = $heading_relations->{'element'};
    my $root_command_texi;
    if (exists($element->{'contents'})) {
      $root_command_texi
        = Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                               $element->{'contents'}->[0]);
    }
    if (!defined($root_command_texi)) {
      $result .= "$idx\n";
    } else {
      $result .= "$idx|$root_command_texi\n";
    }

    foreach my $node_relations_key (('associated_anchor_command')) {
      if (exists($heading_relations->{$node_relations_key})) {
        $result .= " $node_relations_key: "
       ._print_root_command(
          $heading_relations->{$node_relations_key}->{'element'})."\n";
      }
    }
    $idx++;
  }

  return $result;
}

sub print_nodes_list($) {
  my $document = shift;

  my $nodes_list = $document->nodes_list();

  my $result = '';

  my $idx = 1;

  foreach my $node_relations (@$nodes_list) {
    my $element = $node_relations->{'element'};
    my $root_command_texi = _print_root_command($element);
    if (!defined($root_command_texi)) {
      $result .= "$idx\n";
    } else {
      $result .= "$idx|$root_command_texi\n";
    }
    foreach my $section_key (('associated_section', 'node_preceding_part')) {
      if (exists($node_relations->{$section_key})) {
        $result .= _print_key_section_with_number($section_key,
                             $node_relations->{$section_key}->{'element'});
      }
    }
    foreach my $line_cmd_key (('associated_title_command')) {
      if (exists($node_relations->{$line_cmd_key})) {
        $result .= _print_line_command_key_element($line_cmd_key,
                                  $node_relations->{$line_cmd_key});
      }
    }

    foreach my $line_commands_key (('node_descriptions')) {
      if (exists($node_relations->{$line_commands_key})) {
        $result .= " $line_commands_key:\n";
        foreach my $command_element (@{$node_relations->{$line_commands_key}}) {
          $result .= "  "._print_line_command($command_element)."\n";
        }
      }
    }

    foreach my $command_key (('node_long_descriptions')) {
      if (exists($node_relations->{$command_key})) {
        $result .= " $command_key:\n";
        foreach my $command_element (@{$node_relations->{$command_key}}) {
          my $source_info = $command_element->{'source_info'};
          # we do not call Texinfo::Report::print_source_info_details
          # because we do not have all the arguments ready.
          my $line_nr = '';
          if (defined($source_info) and $source_info->{'line_nr'}) {
            $line_nr = " l$source_info->{'line_nr'}";
          }
          $result .= "  @".$command_element->{'cmdname'}."$line_nr\n";
        }
      }
    }

    if (exists($node_relations->{'menus'})
        and scalar(@{$node_relations->{'menus'}})) {
      $result .= " menus:\n";
      foreach my $menu (@{$node_relations->{'menus'}}) {
        foreach my $menu_content (@{$menu->{'contents'}}) {
          if (exists($menu_content->{'type'})
              and $menu_content->{'type'} eq 'menu_entry') {
            my $menu_node;
            foreach my $content (@{$menu_content->{'contents'}}) {
              if ($content->{'type'} eq 'menu_entry_node') {
                # This is only supposed to identify the menu
                my $node_menu_entry_texi
                 = Texinfo::Convert::Texinfo::convert_to_texinfo($content);

                $result .= "  ".$node_menu_entry_texi."\n";
              }
            }
          }
        }
      }
    }

    if (exists($node_relations->{'node_directions'})) {
      my $value = $node_relations->{'node_directions'};
      $result .= " node_directions:\n";
      foreach my $d_key (@node_directions_names) {
        if (exists($value->{$d_key})) {
          my $e = $value->{$d_key};
          my $node_direction_texi = _print_menu_node($e);
          if (defined($node_direction_texi)) {
            $result .= "  ${d_key}->$node_direction_texi\n";
          } else {
            $result .= "  ${d_key}->\n";
          }
        }
      }
    }
    $idx++;
  }

  return $result;
}

# The implementation is in StructuringTransfo.pm to be able to call it
# for a test.
sub associate_internal_references($) {
  my $document = shift;

  _associate_internal_references($document);
}

sub number_floats($) {
  my $document = shift;

  my $listoffloats_and_sections = $document->floats_information();

  return if (!defined($listoffloats_and_sections));

  foreach my $style (keys(%$listoffloats_and_sections)) {
    my $float_index = 0;
    my $current_chapter_relations;
    my $nr_in_chapter = 0;
    foreach my $float_and_section (@{$listoffloats_and_sections->{$style}}) {
      my ($float, $float_section_relations) = @$float_and_section;
      next if (!exists($float->{'extra'})
               or !defined($float->{'extra'}->{'identifier'}));
      $float_index++;
      my $number;
      if (defined($float_section_relations)) {
        my $up_relations = $float_section_relations;
        my $up = $up_relations->{'element'};
        my $up_section_directions = $up_relations->{'section_directions'};
        my $up_cmdname;
        while (defined($up_section_directions)
               and exists($up_section_directions->{'up'})
               and $command_structuring_level{
                 $up_section_directions->{'up'}->{'element'}->{'cmdname'}}) {
          $up_relations = $up_section_directions->{'up'};
          $up = $up_relations->{'element'};
          $up_section_directions = $up_relations->{'section_directions'};
        }
        if (!defined($current_chapter_relations)
            or $current_chapter_relations ne $up_relations) {
          $nr_in_chapter = 0;
          $current_chapter_relations = $up_relations;
        }
        if (!$unnumbered_commands{$up->{'cmdname'}}) {
          $nr_in_chapter++;
          $number = $up->{'extra'}->{'section_heading_number'} .
            '.' . $nr_in_chapter;
        }
      }
      $number = "$float_index" if (!defined($number));
      $float->{'extra'} = {} if (! exists($float->{'extra'}));
      $float->{'extra'}->{'float_number'} = $number;
    }
  }
}

# wrapper on print_listoffloats_types that can be used for XS overriding.
# Used in tests only.
sub print_document_listoffloats($) {
  my $document = shift;

  my $float_text;

  if ($document) {
    my $floats = $document->floats_information();
    if (defined($floats)) {
      $float_text
          = Texinfo::ManipulateTree::print_listoffloats_types($floats);
    }
  }

  return $float_text;
}

1;
