# TransformationsNonXS.pm: some transformations of the document tree
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
# ALTIMP perl/XSTexinfo/parser_document/TransformationsXS.xs
# ALTIMP C/structuring_transfo/transformations.c

package Texinfo::Transformations;

use 5.006;
use strict;
use warnings;

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);


use Carp qw(cluck confess);

use Texinfo::Commands;

use Texinfo::TreeElement;

use Texinfo::Common;
use Texinfo::Translations;

use Texinfo::Document;
use Texinfo::Parser;
use Texinfo::ManipulateTree;
use Texinfo::Structuring;

# Add raise/lowersections to be back at the normal level from
# the $SECTION level.  The raise/lowersections are added at the
# end of $PARENT.
# If $MODIFIER is set to -1, add raise/lowersections to go from
# the normal level to the $SECTION level.
sub _correct_level($$;$) {
  my ($section, $parent, $modifier) = @_;

  $modifier = 1 if (!defined($modifier));

  if (exists($section->{'extra'})
      and $section->{'extra'}->{'level_modifier'}) {
    my $level_to_remove = $modifier * $section->{'extra'}->{'level_modifier'};
    my $cmdname;
    if ($level_to_remove < 0) {
      $cmdname = 'raisesections';
    } else {
      $cmdname = 'lowersections';
    }
    my $remaining_level = abs($level_to_remove);
    while ($remaining_level) {
      my $element
       = Texinfo::TreeElement::new({'cmdname' => $cmdname,
                                    'type' => 'normal_command',
                                    'parent' => $parent});
      push @{$parent->{'contents'}}, $element;
      my $line_args
        = Texinfo::TreeElement::new({'type' => 'line_arg',
                            'contents' => [
             Texinfo::TreeElement::new({'type' => 'spaces_before_argument',
                                        'text' => "\n"}),
                                          ],
                         'parent' => $element});
      push @{$element->{'contents'}}, $line_args;
      $remaining_level--;
    }
  }
}

sub fill_gaps_in_sectioning_in_document($;$) {
  my ($document, $commands_heading_texi) = @_;

  my $root = $document->tree();

  my $sections_list = $document->sections_list();

  my $contents_nr = scalar(@{$root->{'contents'}});

  # prepare contents to be inserted as added sectioning commands arguments
  my $commands_heading_content;
  if (defined($commands_heading_texi)) {
    my $parser = Texinfo::Parser::parser({'NO_INDEX' => 1,
                                          'NO_USER_COMMANDS' => 1,});
    $commands_heading_content
      = $parser->parse_string($commands_heading_texi);
  }

  # initialize current and next sections
  my $idx_current_section = -1;
  my $idx_next_section = -1;
  my $idx = 0;
  while ($idx < $contents_nr) {
    my $content = $root->{'contents'}->[$idx];
    if (! exists($content->{'cmdname'}) or $content->{'cmdname'} eq 'node'
      or ! exists($Texinfo::Commands::root_commands{$content->{'cmdname'}})) {
    } elsif ($idx_current_section < 0) {
      $idx_current_section = $idx;
    } elsif ($idx_next_section < 0) {
      $idx_next_section = $idx;
      last;
    }
    $idx++;
  }

  return undef
    if ($idx_current_section < 0);

  # index in sections_list
  my $section_idx = 0;
  while (1) {
    my $current_section = $root->{'contents'}->[$idx_current_section];
    my $current_section_level
       = Texinfo::Common::section_level($current_section);

    my $next_section = $root->{'contents'}->[$idx_next_section];
    my $next_section_level
       = Texinfo::Common::section_level($next_section);

    if ($next_section_level - $current_section_level > 1) {
      _correct_level($next_section, $current_section);
      my @new_sections;
      while ($next_section_level - $current_section_level > 1) {
        $current_section_level++;
        my $new_section =
         Texinfo::TreeElement::new({'cmdname' =>
          $Texinfo::Common::level_to_structuring_command{'unnumbered'}
                                                ->[$current_section_level],
                                   'type' => 'normal_command',
                                   'parent' => $root,
        });
        my $arguments_line
          = Texinfo::TreeElement::new({'type' => 'arguments_line',
                                       'parent' => $new_section});

        my $line_arg
          = Texinfo::TreeElement::new({'type' => 'line_arg',
                                       'parent' => $arguments_line,});
        $arguments_line->{'contents'} = [$line_arg];

        my $line_content;
        if (defined($commands_heading_content)) {
          $line_content
            = Texinfo::ManipulateTree::copy_contents(
                        $commands_heading_content, 'generic_container');
          $line_content->{'parent'} = $line_arg;
        } else {
          my $asis_command
            = Texinfo::TreeElement::new({'cmdname' => 'asis',
                                         'type' => 'normal_command',
                                         'parent' => $line_arg});
          $asis_command->{'contents'} = [
             Texinfo::TreeElement::new({'type' => 'brace_container',
                                        'parent' => $asis_command})];
          $line_content = $asis_command;
        }
        $line_arg->{'contents'} = [
            Texinfo::TreeElement::new({'text' => ' ',
                                       'type' => 'spaces_before_argument'}),
                                   $line_content,
                        Texinfo::TreeElement::new({'text' => "\n",
                                  'type' => 'spaces_after_argument'}),
                                  ];
        $new_section->{'contents'} = [$arguments_line,
            Texinfo::TreeElement::new({'type' => 'empty_line',
                                       'text' => "\n"})];

        my $new_section_relations = {'element' => $new_section};
        splice(@{$sections_list}, $section_idx+1, 0, $new_section_relations);
        $section_idx++;

        $new_section->{'extra'} = {'section_number' => $section_idx+1};

        push @new_sections, $new_section;
      }
      splice (@{$root->{'contents'}}, $idx_current_section+1, 0, @new_sections);
      $idx_next_section += scalar(@new_sections);
      $contents_nr += scalar(@new_sections);
      _correct_level($next_section, $new_sections[-1], -1);
    }
    $idx_current_section = $idx_next_section;
    $section_idx++;
    $next_section->{'extra'}->{'section_number'} = $section_idx+1;

    # find the new next section index
    $idx_next_section = $idx_current_section +1;
    while ($idx_next_section < $contents_nr) {
      my $content = $root->{'contents'}->[$idx_next_section];
      if (exists($content->{'cmdname'}) and $content->{'cmdname'} ne 'node'
       and exists($Texinfo::Commands::root_commands{$content->{'cmdname'}})) {
        last;
      }
      $idx_next_section++;
    }
    if ($idx_next_section >= $contents_nr) {
      last;
    }
  }
}

# Has an XS override. Defined to be able to test Perl and XS. Undocumented
# on purpose.
sub reference_to_arg_in_document($) {
  my $document = shift;

  Texinfo::ManipulateTree::reference_to_arg_in_tree($document->tree(),
                                                    $document);
}

sub _prepend_new_menu_in_node_section($$$) {
  my ($node_relations, $section, $current_menu) = @_;

  if (not defined($current_menu)) {
    cluck "input menu undef";
  }
  push @{$section->{'contents'}}, $current_menu;
  $current_menu->{'parent'} = $section;
  push @{$section->{'contents'}},
        Texinfo::TreeElement::new({'type' => 'empty_line',
                                   'text' => "\n",});
  push @{$node_relations->{'menus'}}, $current_menu;
}

sub _complete_node_menu($;$) {
  my ($node_relations, $use_sections) = @_;

  my @node_childs
   = Texinfo::Structuring::get_node_node_childs_from_sectioning(
                                                       $node_relations);

  if (scalar(@node_childs)) {
    my %existing_entries;
    if (exists($node_relations->{'menus'})
        and scalar(@{$node_relations->{'menus'}})) {
      foreach my $menu (@{$node_relations->{'menus'}}) {
        foreach my $entry (@{$menu->{'contents'}}) {
          if ($entry->{'type'} eq 'menu_entry') {
            my $normalized_entry_node
              = Texinfo::ManipulateTree::normalized_menu_entry_internal_node(
                                                                       $entry);
            if (defined($normalized_entry_node)) {
              $existing_entries{$normalized_entry_node} = [$menu, $entry];
            }
          }
        }
      }
    }
    #print STDERR "existing_entries: ".join('|', keys(%existing_entries))."\n";
    my @pending;
    my $current_menu;
    foreach my $node_entry_relations (@node_childs) {
      my $node_entry = $node_entry_relations->{'element'};
      my $normalized = $node_entry->{'extra'}->{'identifier'};
      if (exists($existing_entries{$normalized})) {
        my $entry;
        ($current_menu, $entry) = @{$existing_entries{$normalized}};
        if (scalar(@pending)) {
          my $index;
          for ($index = 0; $index < scalar(@{$current_menu->{'contents'}}); $index++) {
            #print STDERR "$index, ".scalar(@{$current_menu->{'contents'}})."\n";
            last if ($current_menu->{'contents'}->[$index] eq $entry);
          }
          splice (@{$current_menu->{'contents'}}, $index, 0, @pending);
          foreach my $pending_entry (@pending) {
            $pending_entry->{'parent'} = $current_menu;
          }
          @pending = ();
        }
      } else {
        my $entry
           = Texinfo::Structuring::new_node_menu_entry($node_entry_relations,
                                                              $use_sections);
        # not defined $entry should mean an empty node.  We do not warn as
        # we try, in general, to be silent in the transformations.
        push @pending, $entry if (defined($entry));
      }
    }
    if (scalar(@pending)) {
      if (!defined($current_menu)) {
        my $section = $node_relations->{'associated_section'}->{'element'};
        $current_menu
          = Texinfo::TreeElement::new({'cmdname' => 'menu',
                                       'type' => 'normal_command',
                                       'contents' => \@pending,
                                       'parent' => $section});
        Texinfo::Structuring::new_block_command($current_menu);
        _prepend_new_menu_in_node_section($node_relations,
                                          $section, $current_menu);
      } else {
        if (exists($current_menu->{'contents'}->[-1]->{'cmdname'})
            and $current_menu->{'contents'}->[-1]->{'cmdname'} eq 'end') {
          splice (@{$current_menu->{'contents'}}, -1, 0, @pending);
        } else {
          # Should probably only happen with menu without end
          push @{$current_menu->{'contents'}}, @pending;
        }
      }
      foreach my $entry (@pending) {
        $entry->{'parent'} = $current_menu;
      }
    }
  }
}

sub _get_non_automatic_nodes_with_sections($) {
  my $document = shift;

  my $root = $document->tree();
  my $nodes_list = $document->nodes_list();

  my @non_automatic_nodes;
  foreach my $node_relations (@{$nodes_list}) {
    my $node_element = $node_relations->{'element'};
    if (not (scalar(@{$node_element->{'contents'}->[0]->{'contents'}}) > 1)
        and exists($node_relations->{'associated_section'})) {
      push @non_automatic_nodes, $node_relations;
    }
  }
  return [ @non_automatic_nodes ];
}

# This should be called after Texinfo::Structuring::sectioning_structure.
sub complete_tree_nodes_menus_in_document($;$) {
  my ($document, $use_sections) = @_;

  my $non_automatic_nodes = _get_non_automatic_nodes_with_sections($document);
  foreach my $node_relations (@{$non_automatic_nodes}) {
    _complete_node_menu($node_relations, $use_sections);
  }
}

# Complete menus if there was no menu for a whole document.
sub complete_tree_nodes_missing_menu($;$) {
  my ($document, $use_sections) = @_;

  my $document_info = $document->global_information();

  my $lang_translations
        = Texinfo::Translations::set_preamble_language_commands(
           $document_info->{'preamble_lang_cmd'},
           $Texinfo::Translations::converters_translation_cache,
           $document->get_conf('documentlanguage'),
           $document->get_conf('documentscript'));

  my $debug = $document->get_conf('DEBUG');

  my $non_automatic_nodes = _get_non_automatic_nodes_with_sections($document);
  foreach my $node_relations (@{$non_automatic_nodes}) {
    if (not exists($node_relations->{'menus'})
        or not scalar(@{$node_relations->{'menus'}})) {
      my $current_menu
        = Texinfo::Structuring::new_complete_node_menu($node_relations,
                                 $lang_translations, $debug, $use_sections);
      if (defined($current_menu)) {
        my $section = $node_relations->{'associated_section'}->{'element'};
        _prepend_new_menu_in_node_section($node_relations, $section,
                                          $current_menu);
      }
    }
  }
}

# Called as tree transformation only.
# The $DOCUMENT is used to get the nodes information, but also to determine
# the languages information for the end of the preamble and to register
# error messages.
sub regenerate_master_menu($;$) {
  my ($document, $use_sections) = @_;

  my $identifier_target = $document->labels_information();
  my $nodes_list = $document->nodes_list();
  my $document_info = $document->global_information();

  my $top_node = $identifier_target->{'Top'};

  return undef if (!defined($top_node)
                   or $top_node->{'cmdname'} ne 'node');

  my $top_node_relations
    = $nodes_list->[$top_node->{'extra'}->{'node_number'} -1];

  return undef if (!exists($top_node_relations->{'menus'})
                   or !scalar(@{$top_node_relations->{'menus'}}));

  my $lang_translation
        = Texinfo::Translations::set_preamble_language_commands(
           $document_info->{'preamble_lang_cmd'},
           $Texinfo::Translations::converters_translation_cache,
           $document->get_conf('documentlanguage'),
           $document->get_conf('documentscript'));

  my $new_detailmenu
      = Texinfo::Structuring::new_detailmenu(
                      $lang_translation,
                      undef, $document,
                      $identifier_target, $nodes_list,
                      $top_node_relations->{'menus'},
                      $document->get_conf('DEBUG'),
                      $use_sections);
  # no need for a master menu
  return undef if (!defined($new_detailmenu));

  my $global_detailmenu
    = $document->global_commands_information()->{'detailmenu'};
  foreach my $menu (@{$top_node_relations->{'menus'}}) {
    my $menu_contents_len = scalar(@{$menu->{'contents'}});
    for (my $current_idx = 0; $current_idx < $menu_contents_len;
         $current_idx++) {
      my $entry = $menu->{'contents'}->[$current_idx];
      if (exists($entry->{'cmdname'})
          and $entry->{'cmdname'} eq 'detailmenu') {
        # replace existing detailmenu by the master menu
        $new_detailmenu->{'parent'} = $menu;
        splice (@{$menu->{'contents'}}, $current_idx, 1,
                $new_detailmenu);
        # also replace in global commands
        Texinfo::Common::replace_remove_list_element($global_detailmenu,
                                                  $entry, $new_detailmenu);

        # NOTE the menu entries added in @detailmenu are not added as
        # internal references.  However, this is not an issue, as the
        # menu entries in @detailmenu are also in regular menus.
        # As long as internal references are only used to check if all
        # the nodes are referenced, not having @detailmenu entries
        # added is not an issue at all.

        # remove internal refs of removed entries
        my $internal_references = $document->internal_references_information();
        foreach my $detailmenu_entry (@{$entry->{'contents'}}) {
          if ($detailmenu_entry->{'type'} eq 'menu_entry') {
            foreach my $entry_content (@{$detailmenu_entry->{'contents'}}) {
              if ($entry_content->{'type'} eq 'menu_entry_node') {
                Texinfo::Common::replace_remove_list_element(
                                                      $internal_references,
                                                      $entry_content);
              }
            }
          }
        }
        return 1;
      }
    }
  }

  my $last_menu = $top_node_relations->{'menus'}->[-1];
  my $index = scalar(@{$last_menu->{'contents'}});
  if ($index
      and $last_menu->{'contents'}->[$index-1]->{'cmdname'}
      and $last_menu->{'contents'}->[$index-1]->{'cmdname'} eq 'end') {
    $index--;
  }

  $new_detailmenu->{'parent'} = $last_menu;
  if ($index) {
    my $last_element = $last_menu->{'contents'}->[$index-1];
    if ($last_element->{'type'} eq 'menu_comment'
        and scalar(@{$last_element->{'contents'}})
        and $last_element->{'contents'}->[-1]->{'type'} eq 'preformatted') {
      {
        # already a menu comment at the end of the menu, add an empty line
        my $preformatted = $last_element->{'contents'}->[-1];
        my $empty_line
          = Texinfo::TreeElement::new({'type' => 'empty_line',
                                       'text' => "\n",});
        push @{$preformatted->{'contents'}}, $empty_line;
      }
    } elsif ($last_element->{'type'} eq 'menu_entry') {
      # there is a last menu entry, add a menu comment containing an empty line
      # after it
      my $menu_comment
        = Texinfo::TreeElement::new({'type' => 'menu_comment',
                                     'parent' => $last_menu});
      splice (@{$last_menu->{'contents'}}, $index, 0, $menu_comment);
      $index++;
      my $preformatted
        = Texinfo::TreeElement::new({'type' => 'preformatted',
                                     'parent' => $menu_comment});
      push @{$menu_comment->{'contents'}}, $preformatted;
      my $empty_line = Texinfo::TreeElement::new(
               {'type' => 'after_menu_description_line', 'text' => "\n",});
      push @{$preformatted->{'contents'}}, $empty_line;
    }
  }
  # insert master menu
  splice (@{$last_menu->{'contents'}}, $index, 0, $new_detailmenu);
  push @$global_detailmenu, $new_detailmenu;

  return 1;
}

# Has an XS override. Defined to be able to test Perl and XS. Undocumented
# on purpose.
sub protect_hashchar_at_line_beginning_in_document($) {
  my $document = shift;

  protect_hashchar_at_line_beginning($document->tree(), $document);
  return;
}

# Has an XS override. Defined to be able to test Perl and XS. Undocumented
# on purpose.
sub protect_first_parenthesis_in_targets_in_document($) {
  my $document = shift;

  protect_first_parenthesis_in_targets($document->tree());
  return;
}

1;
