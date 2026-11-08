# Structuring.pm: load structuring modules and structuring functions not
#                 defined in XS.
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

package Texinfo::Structuring;

use 5.006;
use strict;
use warnings;

use Carp qw(cluck);

use Texinfo::XSLoader;

use Texinfo::Commands;

use Texinfo::TreeElement;

use Texinfo::Common;

use Texinfo::ManipulateTree;

# for error messages
use Texinfo::Convert::Texinfo qw(target_element_to_texi_label
                                 link_element_to_texi);

# for internal references and misc uses
use Texinfo::Convert::NodeNameNormalization;
# for translations related to new master menu
use Texinfo::Translations;

our $VERSION = '7.3dev';

BEGIN {
  Texinfo::XSLoader::init (
    "Texinfo::Structuring",
    "Texinfo::StructuringNonXS",
    'StructuringXS',
    undef,
    ['texinfo', 'texinfoxs'],
  );
}

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(
  associate_internal_references
  check_node_tree_menu_structure
  check_nodes_are_referenced
  complete_node_tree_with_menus
  construct_nodes_tree
  number_floats
  sectioning_structure
  warn_non_empty_parts
);

my %appendix_commands = %Texinfo::Commands::appendix_commands;

# Should be called after sectioning_structure.
sub get_node_node_childs_from_sectioning($) {
  my $node_relations = shift;

  my @node_childs;

  if (exists($node_relations->{'associated_section'})) {
    my $associated_relations = $node_relations->{'associated_section'};

    if (exists($associated_relations->{'section_children'})) {
      foreach my $child_relations
                        (@{$associated_relations->{'section_children'}}) {
        if (exists($child_relations->{'associated_node'})) {
          push @node_childs, $child_relations->{'associated_node'};
        }
      }
    }
    # Special case for @top.  Gather all the children of the @part following
    # @top.
    if ($associated_relations->{'element'}->{'cmdname'} eq 'top') {
      my $current_relations = $associated_relations;
      while (exists($current_relations->{'section_directions'})
         and exists($current_relations->{'section_directions'}->{'next'})) {
        $current_relations
          = $current_relations->{'section_directions'}->{'next'};
        if ($current_relations->{'element'}->{'cmdname'} eq 'part') {
          if (exists($current_relations->{'section_children'})) {
            foreach my $child_relations
                         (@{$current_relations->{'section_children'}}) {
              if (exists($child_relations->{'associated_node'})) {
                push @node_childs,
                     $child_relations->{'associated_node'};
              }
            }
          }
        } else {
          if (exists($current_relations->{'associated_node'})) {
            # for @appendix, and what follows, as it stops a @part, but is
            # not below @top
            push @node_childs,
                 $current_relations->{'associated_node'};
          }
        }
      }
    }
  }
  return @node_childs;
}

# For each internal reference command, set the 'normalized' key, in the
# @*ref first argument or in 'menu_entry_node' extra.
# The implementation is here and not in StructuringNonXS.pm because it
# is used in a test of the Perl implementation.
sub _associate_internal_references($) {
  my $document = shift;

  my $customization_information = $document;

  my $identifier_target = $document->labels_information();
  my $refs = $document->internal_references_information();

  return if (!defined($refs));

  foreach my $ref (@$refs) {
    my $label_element;
    if (exists($ref->{'type'}) and $ref->{'type'} eq 'menu_entry_node') {
      $label_element = $ref;
    } else {
      $label_element = $ref->{'contents'}->[0];
    }

    if (exists($label_element->{'extra'})
        and exists($label_element->{'extra'}->{'node_content'})) {
      my $normalized =
        Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
            $label_element->{'extra'}->{'node_content'});
      $label_element->{'extra'}->{'normalized'} = $normalized
        if (defined($normalized) and $normalized ne '');
    }

    if (exists($ref->{'type'}) and $ref->{'type'} eq 'menu_entry_node') {
      # similar messages are output in _check_menu_entry
      next;
    } elsif (exists($label_element->{'extra'})) {
      my $normalized = $label_element->{'extra'}->{'normalized'};
      if (!defined($normalized)
          or !defined($identifier_target->{$normalized})) {
        if (!$customization_information->get_conf('novalidate')) {
          $document->document_line_error(
                     sprintf(__("\@%s reference to nonexistent node `%s'"),
                             $ref->{'cmdname'},
                             link_element_to_texi($label_element)),
                                 $ref->{'source_info'});
        }
      } else {
        my $node_target = $identifier_target->{$normalized};
        if (!$customization_information->get_conf('novalidate')
            and !Texinfo::Convert::Texinfo::check_node_same_texinfo_code(
                               $node_target,
                               $label_element->{'extra'}->{'node_content'})) {
          $document->document_line_warn(
                 sprintf(__("\@%s to `%s', different from %s name `%s'"),
                     $ref->{'cmdname'},
                     link_element_to_texi($label_element),
                     $node_target->{'cmdname'},
                     target_element_to_texi_label($node_target)),
                                $ref->{'source_info'});
        }
      }
    }
  }
}

sub section_level_adjusted_command_name($) {
  my $element = shift;

  # the following condition should only be false if sectioning_structure was
  # not called
  if (exists($element->{'extra'})
      and defined($element->{'extra'}->{'section_level'})) {
    my $heading_level = $element->{'extra'}->{'section_level'};
    if ($heading_level ne $Texinfo::CommandsValues::command_structuring_level{
                                                       $element->{'cmdname'}}) {
      my $command
        = $Texinfo::Common::level_to_structuring_command{$element->{'cmdname'}}
                                                            ->[$heading_level];
      return $command;
    }
  }
  return $element->{'cmdname'};
}


# The following code is about menu elements creation

# returns the Texinfo tree corresponding to a single menu entry pointing
# to $NODE.
# if $USE_SECTIONS is set, use the section name as menu entry name.
sub new_node_menu_entry($;$) {
  my ($node_relations, $use_sections) = @_;

  my $node = $node_relations->{'element'};

  my $node_name_element;
  if ($node->{'extra'}->{'is_target'}) {
    my $arguments_line = $node->{'contents'}->[0];
    $node_name_element = $arguments_line->{'contents'}->[0];
  }

  # can happen with node without argument or with empty argument
  return undef if (not defined($node_name_element));

  my $menu_entry_name;
  if ($use_sections) {
    my $name_element;
    # use associated_title_command and not associated_section as
    # it is more logical here.
    if (exists($node_relations->{'associated_title_command'})) {
      my $arguments_line = $node_relations->{'associated_title_command'}
               ->{'contents'}->[0];
      $name_element = $arguments_line->{'contents'}->[0];
    } else {
      $name_element = $node_name_element; # shouldn't happen
    }

    $menu_entry_name
     = Texinfo::ManipulateTree::copy_contents($name_element,
                                              'menu_entry_name');
    foreach my $content (@{$menu_entry_name->{'contents'}}) {
      $content->{'parent'}
           = $menu_entry_name unless(exists($content->{'text'}));
    }
    # colons could be doubly protected, but it is probably better
    # than not protected at all.
    Texinfo::ManipulateTree::protect_colon_in_tree($menu_entry_name);
  }

  my $entry = Texinfo::TreeElement::new({'type' => 'menu_entry'});

  if (exists($node->{'source_info'})) {
    $entry->{'source_info'} = {%{$node->{'source_info'}}};
  }

  my $menu_entry_node
   = Texinfo::ManipulateTree::copy_contents($node_name_element,
                                            'menu_entry_node');
  foreach my $content (@{$menu_entry_node->{'contents'}}) {
    $content->{'parent'} = $menu_entry_node unless(exists($content->{'text'}));
  }
  $menu_entry_node->{'parent'} = $entry;

  # do not protect here, as it could already be protected, and
  # the menu entry should be the same as the node
  #Texinfo::ManipulateTree::protect_colon_in_tree($menu_entry_node);

  my $description
    = Texinfo::TreeElement::new({'type' => 'menu_entry_description',
                                 'contents' => []});
  $description->{'contents'}->[0]
    = Texinfo::TreeElement::new({'type' => 'preformatted',
                                 'parent' => $description,
                                 'contents' => []});
  $description->{'contents'}->[0]->{'contents'}->[0]
    = Texinfo::TreeElement::new({'text' => "\n"});
  $description->{'parent'} = $entry;

  if ($use_sections) {
    $entry->{'contents'}
     = [Texinfo::TreeElement::new({'text' => '* ',
                              'type' => 'menu_entry_leading_text'}),
        $menu_entry_name,
        Texinfo::TreeElement::new({'text' => ': ',
                                   'type' => 'menu_entry_separator'}),
        $menu_entry_node,
        Texinfo::TreeElement::new({'text' => '.',
                                   'type' => 'menu_entry_separator'}),
        $description];
    $menu_entry_name->{'parent'} = $entry;
  } else {
    $entry->{'contents'}
     = [Texinfo::TreeElement::new({'text' => '* ',
                                   'type' => 'menu_entry_leading_text'}),
        $menu_entry_node,
        Texinfo::TreeElement::new({'text' => '::',
                                   'type' => 'menu_entry_separator'}),
        $description];
  }

  my $parsed_node_manual
    = Texinfo::Common::parse_node_manual($menu_entry_node, 1);
  if (defined($parsed_node_manual)) {
    foreach my $label_info (keys(%$parsed_node_manual)) {
      $menu_entry_node->{'extra'} = {}
         if (!exists($menu_entry_node->{'extra'}));
      $menu_entry_node->{'extra'}->{$label_info}
         = $parsed_node_manual->{$label_info};

      if ($label_info eq 'node_content') {
        $menu_entry_node->{'extra'}->{'normalized'}
      = Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
             $menu_entry_node->{'extra'}->{$label_info});
      }
    }
  }

  return $entry;
}

sub new_block_command($$) {
  my ($element, $command_name) = @_;

  $element->{'cmdname'} = $command_name;

  my $arguments_line
    = Texinfo::TreeElement::new({'type' => 'arguments_line',
                                 'parent' => $element});
  my $block_line_arg = Texinfo::TreeElement::new({'type' => 'block_line_arg',
                                  'parent' => $arguments_line});
  $block_line_arg->{'contents'} = [
                   Texinfo::TreeElement::new({'text' => "\n",
                                   'type' => 'spaces_before_argument'})
                                  ];
  $arguments_line->{'contents'} = [$block_line_arg];
  unshift @{$element->{'contents'}}, $arguments_line;

  my $end = Texinfo::TreeElement::new({'cmdname' => 'end',
                                       'parent' => $element,
                               'extra' => {'text_arg' => $command_name}});
  my $end_args
   = Texinfo::TreeElement::new({'type' => 'line_arg', 'parent' => $end,
                                'contents' => [],});
  $end->{'contents'} = [$end_args];

  my $command_name_text
    = Texinfo::TreeElement::new({'text' => $command_name,});
  push @{$end_args->{'contents'}},
                     Texinfo::TreeElement::new({'text' => ' ',
                                 'type' => 'spaces_before_argument'}),
                     $command_name_text,
                     Texinfo::TreeElement::new({'text' => "\n",
                                   'type' => 'spaces_after_argument'});

  push @{$element->{'contents'}}, $end;

  return $element;
}

sub _insert_menu_comment_content($$$;$) {
  my ($menu_contents, $position, $inserted_element,
      $no_leading_empty_line) = @_;

  my $menu_comment
    = Texinfo::TreeElement::new({'type' => 'menu_comment', 'contents' => []});
  my $preformatted
    = Texinfo::TreeElement::new({'type' => 'preformatted',
                                 'parent' => $menu_comment,
                                 'contents' => []});
  $menu_comment->{'contents'}->[0] = $preformatted;

  if (!$no_leading_empty_line) {
    push @{$preformatted->{'contents'}},
     Texinfo::TreeElement::new({'text' => "\n", 'type' => 'empty_line'});
  }

  # no contents if a section has a missing argument
  if (exists($inserted_element->{'contents'})) {
    push @{$preformatted->{'contents'}},
      @{$inserted_element->{'contents'}},
      Texinfo::TreeElement::new({'text' => "\n", 'type' => 'empty_line'}),
      Texinfo::TreeElement::new({'text' => "\n", 'type' => 'empty_line'});

    foreach my $content (@{$inserted_element->{'contents'}}) {
      $content->{'parent'} = $preformatted unless(exists($content->{'text'}));
    }
  }
  splice (@$menu_contents, $position, 0, $menu_comment);
}

# Creates a new @menu element based on $NODE sectioning information.
# $LANG_TRANSLATIONS and $DEBUG are only used for the top menu.
sub new_complete_node_menu($;$$$) {
  my ($node_relations, $lang_translations, $debug, $use_sections) = @_;

  my @node_childs
    = get_node_node_childs_from_sectioning($node_relations);

  if (not scalar(@node_childs)) {
    return undef;
  }

  my $associated_relations = $node_relations->{'associated_section'};

  # only holds contents here, will be turned into a proper block
  # command in new_block_command below
  my $new_menu = Texinfo::TreeElement::new({'contents' => []});
  foreach my $child (@node_childs) {
    my $entry = new_node_menu_entry($child, $use_sections);
    if (defined($entry)) {
      $entry->{'parent'} = $new_menu;
      push @{$new_menu->{'contents'}}, $entry;
    }
  }

  my $node = $node_relations->{'element'};
  # in top node, additionally insert menu comments for parts and for
  # the first appendix.
  if (defined($associated_relations)
      and $associated_relations->{'element'}->{'cmdname'} eq 'top'
      and $node->{'extra'}->{'identifier'} eq 'Top') {
    my $content_index = 0;
    my $in_appendix = 0;
    foreach my $node_child_relations (@node_childs) {
      if (!$node_child_relations->{'element'}->{'extra'}->{'is_target'}) {
        next;
      }
      my $child_relations = $node_child_relations->{'associated_section'};
      if (defined($child_relations)) {
        my $child_section = $child_relations->{'element'};
        my $part_added = 0;
        my $associated_part = $child_relations->{'associated_part'};
        if (defined($associated_part)) {
          my $part_arguments_line
            = $associated_part->{'element'}->{'contents'}->[0];
          my $part_line_arg = $part_arguments_line->{'contents'}->[0];
          my $part_title_copy
            = Texinfo::ManipulateTree::copy_contents($part_line_arg);
          my $part_title
           = Texinfo::Translations::gdt('Part: {part_title}',
                                        $lang_translations,
                                     {'part_title' => $part_title_copy},
                                         undef, $debug);
          _insert_menu_comment_content($new_menu->{'contents'}, $content_index,
                                       $part_title, ($content_index == 0));
          $content_index++;
          $part_added = 1;
        }
        if (!$in_appendix
            and $appendix_commands{$child_section->{'cmdname'}}) {
          my $appendix_title
             = Texinfo::Translations::gdt('Appendices',
                                 $lang_translations, undef, undef, $debug);
          _insert_menu_comment_content($new_menu->{'contents'}, $content_index,
                                       $appendix_title,
                                       ($content_index == 0 or $part_added));
          $content_index++;
          $in_appendix++;
        }
      }
      $content_index++;
    }
  }

  new_block_command($new_menu, 'menu');

  return $new_menu;
}

# Create a new @detailmenu element.
# used in tree transformations.  Used in converters through
# new_complete_menu_master_menu.
sub new_detailmenu($$$$$$;$$) {
  my ($lang_translations, $converter, $document, $identifier_target,
      $nodes_list, $menus, $debug, $use_sections) = @_;

  # only holds contents here, will be turned into a proper block
  # command in new_block_command
  my $new_detailmenu = Texinfo::TreeElement::new({'contents' => []});
  if (defined($menus) and ref($menus) ne 'ARRAY') {
    cluck();
  }
  if (defined($menus) and scalar(@$menus)) {
    foreach my $menu (@$menus) {
      foreach my $entry (@{$menu->{'contents'}}) {
        if (exists($entry->{'type'}) and $entry->{'type'} eq 'menu_entry') {
          my $node
        = Texinfo::ManipulateTree::normalized_entry_associated_internal_node(
                                                  $entry, $identifier_target);
          if (defined($node)) {
            push @{$new_detailmenu->{'contents'}},
                         _print_down_menus($node, undef,
                                           $converter,
                                           $document,
                                           $identifier_target,
                                           $nodes_list,
                                           $use_sections);
          }
        }
      }
    }
  }
  if (scalar(@{$new_detailmenu->{'contents'}})) {
    # There is a menu comment with a preformatted added in front of each
    # detailed menu section with the node section name
    my $first_preformatted
         = $new_detailmenu->{'contents'}->[0]->{'contents'}->[0];
    my $master_menu_title
           = Texinfo::Translations::gdt(' --- The Detailed Node Listing ---',
                  $lang_translations,
                  undef, undef, $debug);
    my @master_menu_title_contents;
    foreach my $content (@{$master_menu_title->{'contents'}}) {
      $content->{'parent'} = $first_preformatted
                                 unless(exists($content->{'text'}));
    }
    push @master_menu_title_contents, @{$master_menu_title->{'contents'}},
                                Texinfo::TreeElement::new({'text' => "\n"});
    unshift @{$first_preformatted->{'contents'}}, @master_menu_title_contents;
    foreach my $content (@{$new_detailmenu->{'contents'}}) {
      # menu_entry or menu_comment
      $content->{'parent'} = $new_detailmenu;
    }
    Texinfo::Structuring::new_block_command($new_detailmenu, 'detailmenu');
    return $new_detailmenu;
  } else {
    return undef;
  }
}

# TODO document
# Returns a @menu element for $NODE, formatted with a master menu with a
# @detailmenu if $NODE is the Top node.
# $SELF should be a converter.
sub new_complete_menu_master_menu($$$$) {
  my ($self, $labels, $nodes_list, $node_relations) = @_;

  my $menu_node
    = new_complete_node_menu($node_relations,
                        $self->{'current_lang_translations'},
                        $self->get_conf('DEBUG'));

  my $node = $node_relations->{'element'};

  if (defined($menu_node)
      and exists($node->{'extra'}->{'identifier'})
      and $node->{'extra'}->{'identifier'} eq 'Top') {
    if (exists($node_relations->{'associated_section'})
  and $node_relations->{'associated_section'}->{'element'}->{'cmdname'} eq 'top') {
      my $detailmenu = new_detailmenu($self->{'current_lang_translations'},
                                      $self, undef, $labels, $nodes_list,
                                      [$menu_node], $self->get_conf('DEBUG'));
      if ($detailmenu) {
        # add a blank line before the detailed node listing
        my $menu_comment
          = Texinfo::TreeElement::new({'type' => 'menu_comment',
                                       'parent' => $menu_node});
        push @{$menu_node->{'contents'}}, $menu_comment;
        my $preformatted
         = Texinfo::TreeElement::new({'type' => 'preformatted',
                                      'parent' => $menu_comment});
        push @{$menu_comment->{'contents'}}, $preformatted;
        my $empty_line = Texinfo::TreeElement::new(
                          {'type' => 'after_menu_description_line',
                           'text' => "\n"});
        push @{$preformatted->{'contents'}}, $empty_line;

        $detailmenu->{'parent'} = $menu_node;
        push @{$menu_node->{'contents'}}, $detailmenu;
      }
    }
  }
  return $menu_node;
}

# returns menu contents
sub _print_down_menus($$$$$$;$);
sub _print_down_menus($$$$$$;$) {
  my ($node, $up_nodes, $converter, $document, $identifier_target, $nodes_list,
      $use_sections) = @_;

  # NOTE the menus are not used directly, the entry of the menus are copied
  # and returned in @master_menu_contents.
  my @menus;

  my @master_menu_contents;

  return @master_menu_contents unless($node->{'cmdname'} eq 'node');

  my $node_relations = $nodes_list->[$node->{'extra'}->{'node_number'} -1];

  if (exists($node_relations->{'menus'})
      and scalar(@{$node_relations->{'menus'}})) {
    # Re-use a menu unless it has an entry that looks like
    # "* label: node.".   The separate label may not give enough
    # detail when used in the Top node, e.g. just "Menu" for the
    # "Info Format Menu" node in the Texinfo manual.
    my $menu_entry_name_found = 0;
   MENUS:
    foreach my $menu (@{$node_relations->{'menus'}}) {
      next if (!exists($menu->{'contents'}));
      foreach my $entry (@{$menu->{'contents'}}) {
        next if (!exists($entry->{'contents'})
                 or !exists($entry->{'type'})
                 or $entry->{'type'} ne 'menu_entry');
        foreach my $entry_content (@{$entry->{'contents'}}) {
          if (exists($entry_content->{'type'})
              and $entry_content->{'type'} eq 'menu_entry_name') {
            $menu_entry_name_found = 1;
            last MENUS;
          }
        }
      }
    }
    if (!$menu_entry_name_found) {
      @menus = @{$node_relations->{'menus'}};
    }
  }

  if (!scalar(@menus)) {
    my $current_menu
      = new_complete_node_menu($node_relations,
                               undef, undef, $use_sections);
    if (defined($current_menu)) {
      @menus = ( $current_menu );
    } else {
      return @master_menu_contents;
    }
  }

  my @node_children;
  foreach my $menu (@menus) {
    foreach my $entry (@{$menu->{'contents'}}) {
      if (exists($entry->{'type'}) and $entry->{'type'} eq 'menu_entry') {
        push @master_menu_contents,
               Texinfo::ManipulateTree::copy_element_tree($entry);
        # gather node children to recursively print their menus
        my $node
          = Texinfo::ManipulateTree::normalized_entry_associated_internal_node(
                                                 $entry, $identifier_target);
        if (defined($node)) {
          push @node_children, $node;
        }
      }
    }
  }
  if (scalar(@master_menu_contents)) {
    # Prepend node title
    my $node_name_element;
    my $node_relations = $nodes_list->[$node->{'extra'}->{'node_number'} -1];
    if (exists($node_relations->{'associated_section'})) {
      my $associated_section
        = $node_relations->{'associated_section'}->{'element'};
      my $arguments_line = $associated_section->{'contents'}->[0];
      $node_name_element = $arguments_line->{'contents'}->[0];
    } else {
      my $arguments_line = $node->{'contents'}->[0];
      $node_name_element = $arguments_line->{'contents'}->[0];
    }

    my $node_title_copy
      = Texinfo::ManipulateTree::copy_contents($node_name_element);

    _insert_menu_comment_content(\@master_menu_contents, 0,
                                 $node_title_copy, 0);

    if (!defined($up_nodes)) {
      $up_nodes = [];
    }
    push @$up_nodes, [$node->{'extra'}->{'identifier'}, $node];
    # now recurse in the children
    foreach my $child (@node_children) {
      my $up_node_in_menu = 0;
      my $normalized_child = $child->{'extra'}->{'identifier'};
      foreach my $up_node_normalized (@$up_nodes) {
        if ($normalized_child eq $up_node_normalized->[0]) {
          # we show only if CHECK_NORMAL_MENU_STRUCTURE is set
          # as non-tree-like manuals may have cycles in menus
          # on purpose
          if (Texinfo::Common::converter_or_document_get_conf(
               $document, $converter, 'CHECK_NORMAL_MENU_STRUCTURE')) {
            Texinfo::Common::converter_or_document_line_warn($document,
                   $converter,
                sprintf(__("node `%s' appears in its own menus"),
                target_element_to_texi_label($up_node_normalized->[1])),
                           $up_node_normalized->[1]->{'source_info'});
          }
          $up_node_in_menu = 1;
          last;
        }
      }
      if (!$up_node_in_menu) {
        push @master_menu_contents, _print_down_menus($child,
                                           $up_nodes,
                                           $converter,
                                           $document,
                                           $identifier_target,
                                           $nodes_list,
                                           $use_sections);
      }
    }
    pop @$up_nodes;
  }

  return @master_menu_contents;
}

1;

__END__

=head1 NAME

Texinfo::Structuring - information on Texinfo::Document document structure

=head1 SYNOPSIS

  use Texinfo::Structuring qw(sectioning_structure construct_nodes_tree
    number_floats associate_internal_references);

  # $document is a parsed Texinfo::Document document.
  # When customization variables information is needed, it is obtained
  # from the $document by calling the get_conf() method.
  sectioning_structure($document);
  construct_nodes_tree($document);
  check_node_tree_menu_structure($document);
  complete_node_tree_with_menus($document);
  check_nodes_are_referenced($document);
  associate_internal_references($document);
  number_floats($document->floats_information());

=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

C<Texinfo::Structuring> allows to collect information on a Texinfo
document structure.  Thanks to C<sectioning_structure> the hierarchy
of sectioning commands is determined.  The node tree is analysed
with C<construct_nodes_tree>.  Structural checking and warning
on the consistency of menus and sectioning structure is done by
C<check_node_tree_menu_structure>.  Nodes directions are completed
with menu directions with C<complete_node_tree_with_menus>.
Floats get their standard numbering with C<number_floats> and
internal references are matched up with nodes, floats or anchors
with C<associate_internal_references>.

=head1 METHODS

No method is exported in the default case.

Most methods use the error messages list from a parsed document
for error reporting. Most also require Texinfo customization variables
information, which means an object implementing the C<get_conf> method, in
general a parsed document with registered customization, or, sometime,
a converter (L<Texinfo::Convert::Converter/Getting and setting customization
variables>).  Other common data needed such as target elements associated to
identifiers or refs are obtained from a parsed document, see
L<Texinfo::Document>.

=over

=item associate_internal_references($document)
X<C<associate_internal_references>>

Verify that internal references (C<@ref> and similar without fourth of
fifth argument and menu entries) have an associated node, anchor or float.
Set the I<normalized> key in the C<extra> hash of C<menu_entry_node> container
for menu entries and in the first argument C<extra> hash for internal
references C<@ref> and similar @-commands.

=item check_nodes_are_referenced($document)
X<C<check_nodes_are_referenced>>

Check that all the nodes are referenced (in menu, @*ref or node direction).

Should be called after C<complete_node_tree_with_menus> in order to
have corresponding autogenerated node directions set.

=item complete_node_tree_with_menus($document)
X<C<complete_node_tree_with_menus>>

Complete nodes directions with menu directions and I<Top> node first node
directions.

=item check_node_tree_menu_structure($document)
X<C<check_node_tree_menu_structure>>

Check consistency of menus, sectioning and nodes directions.

=item @children_nodes = get_node_node_childs_from_sectioning($node_relations)
X<C<get_node_node_childs_from_sectioning>>

Find the I<$node_relations> node relations children based on the
sectioning structure.  For the node associated with C<@top> sectioning
command, the sections associated with parts are considered.

=item new_block_command($element, $command_name)
X<C<new_block_command>>

Complete I<$element> by adding the I<$command_name>, the command line
argument and C<@end> to turn the element to a proper block command.

=item $new_menu = new_complete_node_menu($node_relations, $lang_translations, $debug_level, $use_sections)
X<C<new_complete_node_menu>>

Returns a C<@menu> Texinfo tree element for the node relations
I<$node_relations>, pointing to the
children of the node obtained with the sectioning structure.
If I<$use_sections> is set, use section names for the menu entry names.  The
I<$lang_translations> argument should be an array reference with one or two
elements.  The first element of the array is the language used for translations.
The second element, if set, should be an hash reference holding
translations already done.  I<$debug_level> is an optional debugging level
similar to the C<DEBUG> customization variable.  If set, it is supplied to the
function called for translations.  Translations are only needed when generating
the top node menu.

=item $detailmenu = new_detailmenu($lang_translations, $converter, $document, $identifier_target, $nodes_list, $debug, $menus)
X<C<new_detailmenu>>

Returns a detailmenu tree element formatted as a master node.
I<$menus> is an array reference containing the regular menus of the Top node.
I<$lang_translations> argument should be a language translations object holding
information on document language and script and cached translations.
I<TODO: refer to something relevant about $lang_translations>.
If I<$debug> optional arguments is set, debugging mode
is assumed.  I<$identifier_target> should hold
information on cross-reference target commands, typically obtained by
calling L<< C<Texinfo::Document::labels_information>|Texinfo::Document/$identifier_target = labels_information($document) >>.
I<$nodes_list> should be the list of nodes relations information, typically
obtained by calling L<< C<Texinfo::Document::nodes_list>|Texinfo::Document/$nodes_relations_list = nodes_list($document) >>.

I<$converter>, if set, is used for error reporting
(L<Texinfo::Convert::Converter/Registering error and warning messages>).  If
not set, the I<$document> is used for error reporting instead.

=item $entry = new_node_menu_entry($node_relations, $use_sections)
X<C<new_node_menu_entry>>

Returns the Texinfo tree corresponding to a single menu entry pointing to
I<$node_relations>.
If I<$use_sections> is set, use the section name for the menu
entry name.  Returns C<undef> if the node argument is missing.

=item construct_nodes_tree($document)
X<C<construct_nodes_tree>>

Goes through nodes in I<$document> tree and set directions.
This functions sets, in each node relations element hash:

=over

=item node_directions

Hash reference with I<up>, I<next> and I<prev> keys associated to
the node line direction node relations.

=back

=item number_floats($float_information)
X<C<number_floats>>

Number the floats as described in the Texinfo manual.  Sets
the I<float_number> key in the C<extra> hash of the float
tree elements.

=item $command_name = section_level_adjusted_command_name($element)
X<C<section_level_adjusted_command_name>>

Return the sectioning command name corresponding to the sectioning
element I<$element>, adjusted in order to take into account raised
and lowered sections, when needed.

=item sectioning_structure($document)
X<C<sectioning_structure>>

This function goes through the parsed document tree and gather information
on the document structure for sectioning commands.

It sets section elements C<extra> hash values:

=over

=item section_level

The level in the sectioning tree hierarchy.  0 is for C<@top> or
C<@part>, 1 for C<@chapter>, C<@appendix>...  This level is corrected
by C<@raisesections> and C<@lowersections>.

=item section_heading_number

The sectioning command formatted number.

=back

The following is set in section relations hashes:

=over

=item section_children

An array holding sectioning element children.  The children are also
section relations.

=item section_directions

Hash reference with I<up>, I<next> and I<prev> keys associated to
section directions.

=item toplevel_directions

Hash reference with I<up>, I<next> and I<prev> keys associated to toplevel
sectioning relations directions, for elements like C<@top>, C<@chapter>,
C<@appendix>, not taking into account C<@part> elements.

=back

After calling this function, information on the sectioning tree root
can be obtained by calling C<< $document->sectioning_root() >>.

=item warn_non_empty_parts($document)
X<C<warn_non_empty_parts>>

Register a warning in for each C<@part> in global commands information of
I<$document> that is not empty.

=back

=head1 SEE ALSO

L<Texinfo manual|http://www.gnu.org/s/texinfo/manual/texinfo/>,
L<Texinfo::Document>.

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

