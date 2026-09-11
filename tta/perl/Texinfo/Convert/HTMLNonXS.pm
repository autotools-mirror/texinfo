# HTMLNonXS.pm: output tree as HTML.  Implementation of functions with
#               an XS interface
#
# Copyright 2011-2026 Free Software Foundation, Inc.
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

# ALTIMP XSTexinfo/convert/ConvertHTMLXS.xs
# ALTIMP C/convert/*html*.[ch]

# General information on the HTML converter is in HTML.pm comments

package Texinfo::Convert::HTML;

# charnames::vianame is not documented in 5.6.0.
use 5.008;

# See 'The "Unicode Bug"' under 'perlunicode' man page.  This means
# that regular expressions will treat characters 128-255 in a Perl string
# the same regardless of whether the string is using a UTF-8 encoding.
#  For older Perls, you can use utf8::upgrade on the strings, where the
# difference matters.
# Also follows unicode rules for uc() and lc ().
use if $] >= 5.012, feature => 'unicode_strings';

use if $] >= 5.014, re => '/a';  # ASCII-only character classes in regexes

use strict;
use warnings;

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck confess);

use File::Copy qw(copy);

use File::Spec;

my $updir = File::Spec->updir();

use Storable;

use Encode qw(find_encoding decode);
use charnames ();

use Texinfo::Commands;
use Texinfo::Options;
use Texinfo::HTMLData;

use Texinfo::TreeElement;

use Texinfo::Common;
use Texinfo::Indices;

use Texinfo::Convert::Unicode;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Utils;
use Texinfo::Convert::Text;
use Texinfo::Convert::NodeNameNormalization;
use Texinfo::ManipulateTree;
use Texinfo::Structuring;
use Texinfo::OutputUnits;

# copy_options_for_convert_to_latex_math
use Texinfo::Convert::LaTeX;

my %sectioning_heading_commands = %Texinfo::Commands::sectioning_heading_commands;
my %brace_commands = %Texinfo::Commands::brace_commands;
my %block_commands = %Texinfo::Commands::block_commands;
my %root_commands = %Texinfo::Commands::root_commands;
my %preformatted_commands = %Texinfo::Commands::preformatted_commands;
my %math_commands = %Texinfo::Commands::math_commands;
my %preformatted_code_commands = %Texinfo::Commands::preformatted_code_commands;

my %brace_code_commands       = %Texinfo::Commands::brace_code_commands;
my %small_block_associated_command = %Texinfo::Common::small_block_associated_command;

our %HTML_align_commands;

my %composition_context_commands = (%preformatted_commands, %root_commands,
  %HTML_align_commands);
$composition_context_commands{'float'} = 1;
my %format_context_commands = (%block_commands, %root_commands);
# also defined in HTML.pm
my %format_raw_commands;
foreach my $block_command (keys(%block_commands)) {
  $composition_context_commands{$block_command} = 1
    if ($block_commands{$block_command} eq 'menu');
  if ($block_commands{$block_command} eq 'format_raw') {
    $format_raw_commands{$block_command} = 1;
    delete $format_context_commands{$block_command};
  }
}

foreach my $misc_context_command('tab', 'item', 'itemx', 'headitem') {
  $format_context_commands{$misc_context_command} = 1;
}



my $direction_orders = Texinfo::HTMLData::get_directions_order();
# 'global', 'text', 'relative', 'file'
my @global_directions_order = @{$direction_orders->[0]};
my @text_directions_order = @{$direction_orders->[1]};

# API for html formatting

# ALTIMP C/convert/html_prepare_converter.c html_set_global_direction
# similar to texinfo_register_global_direction in Texinfo::Config, to be
# used to modify global directions after the converter initialization,
# but before association of global directions with output units
sub set_global_direction($$;$) {
  my ($self, $direction, $node_texi_name) = @_;

  if (!$self->{'all_directions'}->{$direction}) {
    $self->converter_document_warn(
        sprintf(__("not setting an unknown direction: %s"), $direction));
    return;
  }
  if (!exists($self->{'customized_global_directions'})
      or !exists($self->{'customized_global_directions'}->{$direction})) {
    if (not grep {$_ eq $direction} @global_directions_order) {
      if (defined($node_texi_name)) {
        $self->converter_document_warn(sprintf(__(
                "keep direction %s, do not set to `%s'"), $direction,
                $node_texi_name));
      } else {
        $self->converter_document_warn(sprintf(__(
                "keep direction %s"), $direction));
      }
      return;
    }
  }
  $self->{'customized_global_directions'} = {}
    if (!exists($self->{'customized_global_directions'}));
  $self->{'customized_global_directions'}->{$direction} = $node_texi_name;
  return;
}

sub _collect_css_element_class($$) {
  my ($self, $element_class) = @_;

  #if (not $self->{'document_global_context_counter'}
  #    and not exists($self->{'current_filename'})) {
  #  cluck "BUG: $element_class: CSS no current file";
  #}

  if (exists($self->{'css_element_class_styles'}->{$element_class})) {
    if ($self->{'document_global_context_counter'}) {
      $self->{'document_global_context_css'}->{$element_class} = 1;
    } elsif (exists($self->{'current_filename'})) {
      $self->{'page_css'}->{$self->{'current_filename'}} = {}
        if (!exists($self->{'page_css'}->{$self->{'current_filename'}}));
      $self->{'page_css'}->{$self->{'current_filename'}}->{$element_class} = 1;
    }
  }
}

#my $characters_replaced_from_class_names = quotemeta('[](),~#:/\\@+=!;.,?* ');
# Not clear what character should be allowed and which ones replaced
# besides space.  Not really important as the caller should themselves
# sanitize the class names already.
my $characters_replaced_from_class_names = quotemeta(' ');
sub _protect_class_name($$) {
  my ($self, $class_name) = @_;

  $class_name =~ s/[$characters_replaced_from_class_names]/-/g;

  # API info: using the API to allow for customization would be:
  # return &{$self->formatting_function('format_protect_text')}($self, $class_name);
  return _default_format_protect_text($self, $class_name);
}

# $classes should be an array reference or undef
sub html_attribute_class($$;$) {
  my ($self, $element, $classes) = @_;

  if (defined($classes) and ref($classes) ne 'ARRAY') {
    confess("html_attribute_class: $classes not an array ref (for $element)");
  }
  if (!defined($classes) or scalar(@$classes) == 0
      or $self->get_conf('NO_CSS')) {
    if ($element eq 'span') {
      return '';
    } else {
      return "<$element";
    }
  }

  my $style = '';

  if ($self->get_conf('INLINE_CSS_STYLE')) {
    my @styles = ();
    foreach my $style_class (@$classes) {
      if (not defined($style_class)) {
        confess("class not defined (for $element)");
      }
      if (exists($self->{'css_element_class_styles'}
                                   ->{"$element.$style_class"})) {
        push @styles,
          $self->{'css_element_class_styles'}->{"$element.$style_class"};
      }
    }
    if (scalar(@styles) >  0) {
      $style = ' style="'.join(';', @styles).'"';
    }
  } else {
    foreach my $style_class (@$classes) {
      if (not defined($style_class)) {
        confess ("class not defined (for $element)");
      }
      _collect_css_element_class($self, "$element.$style_class");
    }
  }
  my $class_str = join(' ', map {_protect_class_name($self, $_)} @$classes);
  return "<$element class=\"$class_str\"$style";
}

# CSS

# returns an array of CSS element.class seen in the $FILENAME
sub html_get_css_elements_classes($;$) {
  my ($self, $filename) = @_;

  my %css_elements_classes;
  if (exists($self->{'document_global_context_css'})) {
    %css_elements_classes = ( %{$self->{'document_global_context_css'}} );
  }

  if (defined($filename) and exists($self->{'page_css'})
      and exists($self->{'page_css'}->{$filename})) {
    %css_elements_classes = ( %css_elements_classes,
                              %{$self->{'page_css'}->{$filename}} );
  }

  if ($css_elements_classes{'a.copiable-link'}) {
    $css_elements_classes{'span:hover a.copiable-link'} = 1;
  }

  my @result = sort(keys(%css_elements_classes));
  return \@result;
}

sub css_add_info($$$) {
  my ($self, $spec, $css_info) = @_;

  if ($spec eq 'rules') {
    push @{$self->{'css_rule_lines'}}, $css_info;
  } elsif ($spec eq 'imports') {
    push @{$self->{'css_import_lines'}}, $css_info;
  }
}

sub css_set_selector_style($$$) {
  my ($self, $css_info, $css_style) = @_;

  if (!defined($css_style)) {
    delete($self->{'css_element_class_styles'}->{$css_info});
  } else {
    $self->{'css_element_class_styles'}->{$css_info} = $css_style;
  }
}

sub css_get_info($$) {
  my ($self, $spec) = @_;

  my @empty_array;

  if ($spec eq 'rules') {
    if (defined($self->{'css_rule_lines'})) {
      return $self->{'css_rule_lines'};
    } else {
      return \@empty_array;
    }
  } elsif ($spec eq 'imports') {
    if (defined($self->{'css_import_lines'})) {
      return $self->{'css_import_lines'};
    } else {
      return \@empty_array;
    }
  } else {
    my @result = sort(keys(%{$self->{'css_element_class_styles'}}));
    return \@result;
  }
}

sub css_get_selector_style($$) {
  my ($self, $css_info) = @_;

  if (exists($self->{'css_element_class_styles'}->{$css_info})) {
    return $self->{'css_element_class_styles'}->{$css_info};
  } else {
    return undef;
  }
}

# flags used to specify the conversion contexts.
our $CTXF_string;
our $CTXF_code;
our $CTXF_normal;

our %special_list_mark_css_string_no_arg_command;



# API to access converter state for conversion

sub in_math($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'math'};
}

# set if in menu or preformatted command
sub in_preformatted_context($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'preformatted_context'}->[-1];
}

sub inside_preformatted($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'inside_preformatted'};
}

sub in_upper_case($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                              ->{'upper_case'};
}

sub in_non_breakable_space($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                         ->{'no_break'};
}

sub in_space_protected($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                         ->{'space_protected'};
}

sub in_code($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'monospace'}->[-1];
}

sub in_string($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'string'};
}

sub in_verbatim($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'verbatim'};
}

sub in_raw($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'raw'};
}

sub in_multiple_conversions($) {
  my $self = shift;

  return scalar(@{$self->{'multiple_pass'}});
}

sub paragraph_number($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                     ->{'paragraph_number'};
}

sub preformatted_number($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                  ->{'preformatted_number'};
}

sub top_block_command($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'block_commands'}->[-1];
}

sub preformatted_classes_stack($) {
  my $self = shift;

  return $self->{'document_context'}->[-1]->{'preformatted_classes'};
}

sub in_align($) {
  my $self = shift;

  my $context
       = $self->{'document_context'}->[-1]->{'composition_context'}->[-1];
  if (exists($HTML_align_commands{$context})) {
    return $context;
  } else {
    return undef;
  }
}

sub multi_expanded_region($) {
  my $self = shift;

  if (scalar(@{$self->{'multiple_pass'}})) {
    return $self->{'multiple_pass'}->[-1];
  }
  return undef;
}

sub count_elements_in_filename($$$) {
  my ($self, $spec, $filename) = @_;

  if (!defined($filename)) {
    confess("count_elements_in_filename: filename undef");
  }

  if ($spec eq 'total') {
    if (defined($self->{'elements_in_file_count'}->{$filename})) {
      return $self->{'elements_in_file_count'}->{$filename};
    }
  } elsif ($spec eq 'remaining') {
    if (defined($self->{'file_counters'}->{$filename})) {
      return $self->{'file_counters'}->{$filename};
    }
  } elsif ($spec eq 'current') {
    if (defined($self->{'file_counters'}->{$filename})) {
      return $self->{'elements_in_file_count'}->{$filename}
                - $self->{'file_counters'}->{$filename} +1;
    }
  }
  return undef;
}

sub is_format_expanded($$) {
  my ($self, $format) = @_;

  return $self->{'expanded_formats'}->{$format};
}

sub _set_code_context($$) {
  my ($self, $code) = @_;

  push @{$self->{'document_context'}->[-1]->{'monospace'}}, $code;
}

sub _pop_code_context($) {
  my $self = shift;

  pop @{$self->{'document_context'}->[-1]->{'monospace'}};
}



# API for links and elements directions formatting.

# the main data structure of the element target API is a hash reference, called
# the target information.
# The 'target' and 'filename' keys should be set for every type of element,
# but the other keys will only be set on some elements.
#
# The following keys can be set:
#
# Strings
#
#   'target': A unique string representing the target.  Used as argument to
#             'id' attribute.
#   'contents_target': A unique string representing the target to the location
#                      of the element in the table of content.
#   'shortcontents_target': A unique string representing the target to the
#                      location of the element in the short table of contents
#   'node_filename': the file name deriving from the element node name
#   'section_filename': the file name deriving from the element section name
#   'special_unit_filename': the file name of special elements
#                            (separate contents, about...)
#   'filename': the file name the element content is output to
#   'text', 'text_nonumber': a textual representation of the element where
#              there is no restriction on the text formatting (ie HTML elements
#              can be used).
#              With _nonumber, no section number.
#   'string', 'string_nonumber': a textual representation of the element with
#                   restrictions on the available formatting, in practice no
#                   HTML elements, only entities to be able to use in attributes.
#                   With _nonumber, no section number.
#
# Other types
#
#   'tree', 'tree_nonumber: a Texinfo tree element which conversion should
#                   correspond to the element name.
#                   With _nonumber, no section number.
#   'node_command': the node element associated with the target element.
#   'root_element_command': the command associated to the top level element
#                           associated with the target element.
#
# Some functions cache their results in these hashes.

# $COMMAND should be a tree element which is a possible target of a link.
# return the target information.
sub _get_target($$) {
  my ($self, $command) = @_;

  if (!defined($command)) {
    cluck("_get_target command argument not defined");
  }

  if (exists($self->{'targets'}->{$command})) {
    return $self->{'targets'}->{$command};
  }

  return undef;
}

# API for links and elements directions formatting

# This returns the id specific of the $COMMAND tree element
sub command_id($$) {
  my ($self, $command) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    return $target->{'target'};
  } else {
    return undef;
  }
}

sub command_contents_target($$$) {
  my ($self, $command, $contents_or_shortcontents) = @_;

  $contents_or_shortcontents = 'shortcontents'
    if ($contents_or_shortcontents eq 'summarycontents');

  my $target = _get_target($self, $command);
  if (defined($target)) {
    return $target->{$contents_or_shortcontents .'_target'};
  } else {
    return undef;
  }
}

sub _get_footnote_location_target($$) {
  my ($self, $command) = @_;

  if (exists($self->{'special_targets'})
      and exists($self->{'special_targets'}->{'footnote_location'})
      and exists($self->{'special_targets'}->{'footnote_location'}->{$command})) {
    return $self->{'special_targets'}->{'footnote_location'}->{$command};
  }
  return undef;
}

sub footnote_location_target($$) {
  my ($self, $command) = @_;

  my $footnote_location_special_target_info
    = _get_footnote_location_target($self, $command);
  if (defined($footnote_location_special_target_info)) {
    return $footnote_location_special_target_info->{'target'};
  }
  return undef;
}

sub command_filename($$) {
  my ($self, $command) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (exists($target->{'filename'})) {
      return $target->{'filename'};
    }
    # this finds a special element for footnote command if such an element
    # exists.  This is best, the special element filename is the footnote
    # filename.
    my ($root_element, $root_command)
           = _html_get_tree_root_element($self, $command, 1);

    if (defined($root_element)
        and exists($root_element->{'unit_filename'})) {
      $target->{'filename'}
        = $root_element->{'unit_filename'};
      return $root_element->{'unit_filename'};
    } else {
      $target->{'filename'} = undef;
    }
  }
  return undef;
}

sub command_root_element_command($$) {
  my ($self, $command) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (not exists($target->{'root_element_command'})) {
      # in contrast with command_filename() we find the root element through
      # the location holding the @footnote command.  It is better, as the
      # footnote special element is not associated with a root command,
      # it is better to stay in the document to find a root element.
      my ($root_element, $root_command)
        = _html_get_tree_root_element($self, $command);
      if (defined($root_element) and $root_element->{'unit_type'} eq 'unit') {
        $target->{'root_element_command'}
          = $root_element->{'unit_command'};
      } else {
        $target->{'root_element_command'} = undef;
      }
    }
    return $target->{'root_element_command'};
  }
  return undef;
}

sub command_node($$) {
  my ($self, $command) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (not exists($target->{'node_command'})) {
      # this finds a special element for footnote command if
      # such an element exists
      my ($root_element, $root_command)
           = _html_get_tree_root_element($self, $command, 1);
      if (defined($root_command) and exists($root_command->{'cmdname'})) {
        if ($root_command->{'cmdname'} eq 'node') {
          $target->{'node_command'} = $root_command;
        } elsif (exists($self->{'document'})) {
          my $sections_list = $self->{'document'}->sections_list();
          my $section_relations
            = $sections_list->[$root_command->{'extra'}->{'section_number'} -1];
          if (exists($section_relations->{'associated_node'})) {
            $target->{'node_command'}
              = $section_relations->{'associated_node'}->{'element'};
          }
        }
      } else {
        $target->{'node_command'} = undef;
      }
    }
    return $target->{'node_command'};
  }
  return undef;
}

# $SPECIFIED_TARGET can be used to specify explicitly the target
sub _internal_command_href($$;$$) {
  my ($self, $command, $source_filename, $specified_target) = @_;

  $source_filename = $self->{'current_filename'}
    if (!defined($source_filename));

  my $target;
  if (defined($specified_target)) {
    $target = $specified_target;
  } else {
    my $target_command = $command;
    # for sectioning command prefer the associated node.  If there is no
    # associated node, use the associated_anchor_command.  This order
    # is important for sectioning commands, it means that in the following
    # case the @chapter href will be given by the @node, even if there is
    # an @xrefname in-between.
    #
    # @node my node
    # @xrefname name for my node
    #
    # @chapter Chapter without directly associated node
    if (exists($self->{'document'}) and exists($command->{'extra'})) {
      if ($command->{'extra'}->{'section_number'}) {
        my $sections_list = $self->{'document'}->sections_list();
        my $section_relations
          = $sections_list->[$command->{'extra'}->{'section_number'} -1];

        if (exists($section_relations->{'associated_node'})) {
          $target_command
            = $section_relations->{'associated_node'}->{'element'};
        } elsif (exists($section_relations->{'associated_anchor_command'})) {
          $target_command
            = $section_relations->{'associated_anchor_command'}->{'element'};
        }
      } elsif ($command->{'extra'}->{'heading_number'}) {
        my $headings_list = $self->{'document'}->headings_list();
        my $heading_relations
          = $headings_list->[$command->{'extra'}->{'heading_number'} -1];

        if (exists($heading_relations->{'associated_anchor_command'})) {
          $target_command
            = $heading_relations->{'associated_anchor_command'}->{'element'};
        }
      }
    }

    my $target_information = _get_target($self, $target_command);
    $target = $target_information->{'target'} if (defined($target_information));
  }
  return undef if (!defined($target));
  my $href = '';

  my $target_filename = $self->command_filename($command);
  if (!defined($target_filename)) {
    # Happens if there are no pages, for example if OUTPUT is set to ''
    # as in the test cases.  Also for things in @titlepage when
    # titlepage is not output.
    if (exists($self->{'document_units'}->[0]->{'unit_filename'})) {
      # In that case use the first page.
      $target_filename
        = $self->{'document_units'}->[0]->{'unit_filename'};
    }
  }
  if (defined($target_filename)) {
    if (!defined($source_filename)
         or $source_filename ne $target_filename) {
      $href .= $self->url_protect_file_text($target_filename);
      # omit target if the command is an element command, there is only
      # one element in file and there is a file in the href
      my $command_root_element_command
               = $self->command_root_element_command($command);
      if (defined($source_filename)
          and defined($command_root_element_command)) {
        my $possible_empty_target = 0;
        if ($command_root_element_command eq $command) {
          $possible_empty_target = 1;
        } elsif (exists($command_root_element_command->{'cmdname'})
                 and $command_root_element_command->{'cmdname'} eq 'node'
                 and exists($command_root_element_command->{'extra'})
                 and $command_root_element_command->{'extra'}->{'node_number'}
                 and exists($self->{'document'})) {
          my $nodes_list = $self->{'document'}->nodes_list();
          my $node_relations
            = $nodes_list->[$command_root_element_command
                                      ->{'extra'}->{'node_number'} -1];
          if (exists($node_relations->{'associated_section'})
       and $node_relations->{'associated_section'}->{'element'} eq $command) {
            $possible_empty_target = 1;
          }
        }
        if ($possible_empty_target) {
          my $count_elements_in_file
             = $self->count_elements_in_filename('total', $target_filename);
          if (defined($count_elements_in_file) and $count_elements_in_file == 1) {
            $target = '';
          }
        }
      }
    }
  }
  $href .= '#' . $target if ($target ne '');

  if ($href eq '') {
    return undef;
  }
  return $href;
}

our %contents_command_special_unit_variety;

# Return string for linking to $CONTENTS_OR_SHORTCONTENTS associated
# element from $COMMAND with <a href>
sub command_contents_href($$$;$) {
  my ($self, $command, $contents_or_shortcontents, $source_filename) = @_;

  $source_filename = $self->{'current_filename'}
    if (not defined($source_filename));

  my ($special_unit_variety, $special_unit, $class_base,
    $special_unit_direction)
     = $self->command_name_special_unit_information($contents_or_shortcontents);
  my $target
    = $self->command_contents_target($command, $contents_or_shortcontents);
  my $target_filename;
  # !defined happens when called as convert() and not output()
  if (defined($special_unit)) {
    my $command = $special_unit->{'unit_command'};
    $target_filename = $self->command_filename($command);
  }
  my $href = '';
  if (defined($target_filename) and
      (!defined($source_filename)
       or $source_filename ne $target_filename)) {
    $href .= $target_filename;
  }
  $href .= '#' . $target if ($target ne '');

  if ($href eq '') {
    return undef;
  }

  return $href;
}

sub footnote_location_href($$;$$$) {
  my ($self, $command, $source_filename, $specified_target,
      $target_filename) = @_;

  $source_filename = $self->{'current_filename'}
    if (not defined($source_filename));

  my $footnote_location_target_info
    = _get_footnote_location_target($self, $command);
  my $target = '';
  if (defined($specified_target)) {
    $target = $specified_target;
  } elsif (defined($footnote_location_target_info)) {
    $target = $footnote_location_target_info->{'target'};
  }
  # In the default footnote formatting functions, which calls
  # footnote_location_href, the target file is always known as the
  # footnote in the document appears before the footnote text formatting.
  # $target_filename is therefore always defined.  It is a good thing
  # for the case of @footnote being formatted more than once (in multiple
  # @insertcopying for instance) as the file found just below may not be the
  # correct one in such a case.
  if (not defined($target_filename)) {
    if (defined($footnote_location_target_info)
        and defined($footnote_location_target_info->{'filename'})) {
      $target_filename = $footnote_location_target_info->{'filename'};
    } else {
      # in contrast with command_filename() we find the location holding
      # the @footnote command, not the footnote element with footnotes
      my ($root_element, $root_command)
        = _html_get_tree_root_element($self, $command);
      if (defined($root_element)) {
        if (not defined($footnote_location_target_info)) {
          $self->{'special_targets'}->{'footnote_location'}->{$command} = {};
          $footnote_location_target_info
            = $self->{'special_targets'}->{'footnote_location'}->{$command};
        }
        $footnote_location_target_info->{'filename'}
          = $root_element->{'unit_filename'};
        $target_filename = $footnote_location_target_info->{'filename'};
      }
    }
  }
  my $href = '';
  if (defined($target_filename) and
      (!defined($source_filename)
       or $source_filename ne $target_filename)) {
    $href .= $target_filename;
  }
  $href .= '#' . $target if ($target ne '');
  return $href;
}

# Currently the only possibility for $TYPE is heading
sub _special_unit_info_tree($$$) {
  my ($self, $type, $special_unit_variety) = @_;

  if (exists($self->{'translated_special_unit_info_texinfo'}->{$type})) {
    if (not exists($self->{'translated_special_unit_info_tree'}->{$type}
                                    ->{$special_unit_variety})) {
      my $special_unit_info_texinfo_string
         = $self->{'translated_special_unit_info_texinfo'}->{$type}
                                            ->{$special_unit_variety};
      my $translated_tree;
      if (defined($special_unit_info_texinfo_string)) {
        # NOTE to be kept in sync with generated context in
        # generate_code_convert_data.pl
        my $translation_context = "$special_unit_variety section $type";
        $translated_tree = $self->pcdt($translation_context,
                                       $special_unit_info_texinfo_string);
      }
      $self->{'translated_special_unit_info_tree'}->{$type}
         ->{$special_unit_variety}
              = $translated_tree;
      return $translated_tree;
    } else {
      return $self->{'translated_special_unit_info_tree'}->{$type}
                                        ->{$special_unit_variety};
    }
  }
  return undef;
}

sub _internal_command_tree($$$) {
  my ($self, $command, $no_number) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (!exists($target->{'tree'})) {
      my $tree;
      my $in_code;
      if (exists($command->{'type'})
          and $command->{'type'} eq 'special_unit_element') {
        my $special_unit_variety
           = $command->{'associated_unit'}->{'special_unit_variety'};
        $tree
          = $self->_special_unit_info_tree('heading',
                                      $special_unit_variety);
      } elsif (exists($command->{'cmdname'})
               and ($command->{'cmdname'} eq 'node'
                    or $command->{'cmdname'} eq 'anchor'
                    or $command->{'cmdname'} eq 'namedanchor')) {
        # to be a target, the node or anchor cannot be empty (nor expand to
        # spaces only), so argument is necessarily set.
        my $label_element;
        if ($command->{'cmdname'} eq 'anchor'
            or $command->{'cmdname'} eq 'namedanchor') {
          $label_element = $command->{'contents'}->[0];
        } else {
          # arguments_line type element
          my $arguments_line = $command->{'contents'}->[0];
          $label_element = $arguments_line->{'contents'}->[0];
        }
        $tree = $label_element;
        $in_code = 1;
      } elsif (exists($command->{'cmdname'})
               and ($command->{'cmdname'} eq 'float')) {
        $tree = $self->float_type_number($command);
      } else {
        my $line_arg;
        if (exists($root_commands{$command->{'cmdname'}})) {
          # arguments_line type element
          my $arguments_line = $command->{'contents'}->[0];
          $line_arg = $arguments_line->{'contents'}->[0];
        } else {
          # @heading* commands
          $line_arg = $command->{'contents'}->[0];
        }
        if (!Texinfo::Common::empty_spaces_argument($line_arg)) {
          my $section_number;
          $section_number = $command->{'extra'}->{'section_heading_number'}
            if (exists($command->{'extra'})
                and defined($command->{'extra'}->{'section_heading_number'}));
          if ($section_number
              and ($self->get_conf('NUMBER_SECTIONS')
                   or !defined($self->get_conf('NUMBER_SECTIONS')))) {
            # NOTE since there is a copy, the elements that are found using their
            # hash won't be found during conversion.  This is the case for
            # target elements such as @anchor.
            my $substituted_strings
              = {'number' =>
                  Texinfo::TreeElement::new({'text' => $section_number}),
                 'section_title'
                => Texinfo::ManipulateTree::copy_element_tree($line_arg)};

            if ($command->{'cmdname'} eq 'appendix'
                and $command->{'extra'}->{'section_level'} == 1) {
              $tree = $self->cdt('Appendix {number} {section_title}',
                                 $substituted_strings);
            } else {
              # TRANSLATORS: numbered section title
              $tree = $self->cdt('{number} {section_title}',
                                 $substituted_strings);
            }
          } else {
            $tree = $line_arg;
          }
        }

        $target->{'tree_nonumber'} = $line_arg;
      }
      $target->{'tree'} = $tree;
      if ($in_code) {
        $target->{'in_code'} = $in_code;
      }
    }

    return $target->{'tree_nonumber'}, $target->{'in_code'}
         if ($no_number and exists($target->{'tree_nonumber'}));
    return $target->{'tree'}, $target->{'in_code'};
  }
  return undef, undef;
}

sub _push_referred_command_stack_command($$) {
  my ($self, $command) = @_;

  push @{$self->{'referred_command_stack'}}, $command;
}

sub _pop_referred_command_stack($) {
  my $self = shift;

  pop @{$self->{'referred_command_stack'}};
}

sub command_is_in_referred_command_stack($$) {
  my ($self, $command) = @_;

  return grep {$_ eq $command} @{$self->{'referred_command_stack'}};
}

sub _convert_command_tree($$$$$$) {
  my ($self, $command, $type, $selected_tree, $in_code, $command_info) = @_;

  my $explanation;
  my $context_name;

  if (exists($command->{'cmdname'})) {
    my $cmdname = $command->{'cmdname'};
    $context_name = $cmdname;
    $explanation = "$command_info:$type \@$cmdname";
  } else {
    $context_name = $command->{'type'};
    if ($command->{'type'} eq 'special_unit_element') {
      my $special_unit_variety
        = $command->{'associated_unit'}->{'special_unit_variety'};
      $explanation = "$command_info $special_unit_variety";
    }
  }

  my $context_type = 0;
  if ($type eq 'string' or $type eq 'string_nonumber') {
    $context_type |= $CTXF_string;
  }
  if ($in_code) {
    $context_type |= $CTXF_code;
  }

  _new_document_context($self, $context_name, $context_type, $explanation);

  _set_multiple_conversions($self, undef);

  _push_referred_command_stack_command($self, $command);

  my $result = _convert($self, $selected_tree, $explanation);

  _pop_referred_command_stack($self);

  _unset_multiple_conversions($self);

  _pop_document_context($self);
  return $result;
}

sub _internal_command_text($$$) {
  my ($self, $command, $type) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (exists($target->{$type})) {
      return $target->{$type};
    }
    my ($command_tree, $in_code) = _internal_command_tree($self, $command, 0);
    return '' if (!defined($command_tree));

    my $selected_tree;

    if ($type =~ /^(.*)_nonumber$/
        and defined($target->{'tree_nonumber'})) {
      $selected_tree = $target->{'tree_nonumber'};
    } else {
      $selected_tree = $command_tree;
    }

    $target->{$type}
      = _convert_command_tree($self, $command, $type, $selected_tree, $in_code,
                              'command_text');
    return $target->{$type};
  }
  # Can happen
  # * if USE_NODES is 0 and there are no sectioning commands.
  # * if a special element target was set to undef in user defined code.
  # * for @*ref with missing targets (maybe @novalidate needed in that case).
  # * for @node header if the node consist only in spaces (example in sectioning
  #   in_menu_only_special_ascii_spaces_node).
  # * for multiple targets with the same name, eg both @node and @anchor
  # * with @inforef with node argument only, without manual argument.
  return undef;
}

# Return undef if there is no tree for the name
sub _internal_command_name_tree($$$) {
  my ($self, $command, $no_number) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (!exists($target->{'name_tree'})) {
      my $tree;
      if (exists($command->{'cmdname'})
          and $command->{'cmdname'} eq 'namedanchor'
          and scalar(@{$command->{'contents'}}) > 1
          and not Texinfo::Common::empty_spaces_argument(
                                  $command->{'contents'}->[1])) {
        $tree = $command->{'contents'}->[1];
      }
      $target->{'name_tree'} = $tree;
    }

    # currently not possible
    #return $target->{'name_tree_nonumber'} if ($no_number
    #                                  and $target->{'name_tree_nonumber'});
    return $target->{'name_tree'}, $target->{'in_code'};
  }
  return undef, undef;
}

sub _internal_command_name($$$) {
  my ($self, $command, $type) = @_;

  my $name_type = "name_$type";

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (exists($target->{$name_type})) {
      return $target->{$name_type};
    }
    my ($command_name_tree, $in_code)
      = _internal_command_name_tree($self, $command, 0);

    if (!defined($command_name_tree)) {
      ($command_name_tree, $in_code)
         = _internal_command_tree($self, $command, 0);
    }
    return '' if (!defined($command_name_tree));

    my $selected_tree;

    if ($type =~ /^(.*)_nonumber$/
        and exists($target->{'name_tree_nonumber'})) {
      $selected_tree = $target->{'name_tree_nonumber'};
    } else {
      $selected_tree = $command_name_tree;
    }

    $target->{$name_type}
      = _convert_command_tree($self, $command, $type, $selected_tree, $in_code,
                              'command_name');
    return $target->{$name_type};
  }
  return undef;
}

# Return text to be used for $COMMAND description.
# $TYPE refers to the type of value returned from this function:
#  'text' - return text
#  'string' - return simpler text that can be used in element attributes
sub command_description($$;$) {
  my ($self, $command, $type) = @_;

  if (!defined($type)) {
    $type = 'text';
  }

  if (!defined($command)) {
    cluck "in command_description($type) command not defined";
  }

  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'manual_content'})) {
    return undef;
  }

  my $target = _get_target($self, $command);
  if (defined($target)) {
    my $cached_type = 'description_'.${type};
    if (exists($target->{$cached_type})) {
      return $target->{$cached_type};
    }

    if ((exists($command->{'type'})
         and $command->{'type'} eq 'special_unit_element')
        or (exists($command->{'cmdname'})
            and ($command->{'cmdname'} eq 'anchor'
                 or $command->{'cmdname'} eq 'namedanchor'
                 or $command->{'cmdname'} eq 'float'))) {
      $target->{$cached_type} = undef;
      return undef;
    }
    my $node;

    if (exists($command->{'cmdname'})) {
      if ($command->{'cmdname'} eq 'node') {
        $node = $command;
      } elsif (exists($self->{'document'})) {
        my $sections_list = $self->{'document'}->sections_list();
        my $section_relations
          = $sections_list->[$command->{'extra'}->{'section_number'} -1];
        if (exists($section_relations->{'associated_node'})) {
          $node = $section_relations->{'associated_node'}->{'element'};
        }
      }
    }

    if (!defined($node) or !exists($node->{'extra'})
        or !$node->{'extra'}->{'node_number'}
        or !exists($self->{'document'})) {
      return undef;
    }

    my $nodes_list = $self->{'document'}->nodes_list();
    my $node_relations = $nodes_list->[$node->{'extra'}->{'node_number'} -1];

    my $node_description;
    my $long_description = 0;
    if (exists($node_relations->{'node_description'})) {
      $node_description = $node_relations->{'node_description'};
    } elsif (exists($node_relations->{'node_long_description'})) {
      $node_description = $node_relations->{'node_long_description'};
      $long_description = 1;
    } else {
      return undef;
    }

    my $formatted_nodedescription_nr
       = _formatted_nodedescription_nr($self, $node);

    my $cmdname = $command->{'cmdname'};
    my $context_name = "$cmdname description";
    my $explanation = "command_description:$type \@$cmdname";

    my $description_element;
    if (!$long_description) {
      $description_element = $node_description->{'contents'}->[0];
    } else {
      # nodedescriptionblock
      $description_element = Texinfo::TreeElement::new(
            {'contents' => $node_description->{'contents'}});
    }
    my $multiple_formatted;
    if ($formatted_nodedescription_nr > 1) {
      $multiple_formatted
        = 'node-description-'.$formatted_nodedescription_nr;
    }

    my $context_type;
    if ($type eq 'string') {
      $context_type = $CTXF_string;
    }

    $target->{$cached_type}
      = $self->convert_tree_new_formatting_context($description_element,
                                         $context_name, $context_type,
                                       $multiple_formatted, $explanation);

    return $target->{$cached_type};
  }
  return undef;
}

sub get_special_unit_info_varieties($$) {
  my ($self, $type) = @_;

  return keys(%{$self->{'special_unit_info'}->{$type}});
}

# Valid $SPECIAL_UNIT_VARIETY are the keys of
# %Texinfo::HTMLData::default_special_unit_info
sub special_unit_info($$$) {
  my ($self, $type, $special_unit_variety) = @_;

  return $self->{'special_unit_info'}->{$type}->{$special_unit_variety};
}

# Currently the only possibility for $TYPE is heading
sub special_unit_info_text($$$;$) {
  my ($self, $type, $special_unit_variety, $context) = @_;

  my $tree = $self->_special_unit_info_tree($type,
                                       $special_unit_variety);

  return '' if (!defined($tree));

  $context = 'normal' if (!defined($context));

  my $explanation = "convert $special_unit_variety $type/$context";
  if ($context eq 'string') {
    return $self->convert_tree_new_formatting_context($tree, $explanation,
                                                      $CTXF_string);
  } else {
    return $self->convert_tree($tree, $explanation);
  }
}

my %valid_direction_string_type = (
  # accesskey associated to the direction
  'accesskey' => 1,
  # direction button name
  'button' => 1,
  # description of the direction
  'description' => 1,
  # section number corresponding to the example in About text
  'example' => 1,
  # rel/ref string associated to the direction
  'rel' => 1,
  # few words text associated to the direction
  'text' => 1,
);

my %valid_direction_string_context = (
  'normal' => 1,
  'string' => 1,
);

my %direction_type_translation_context = (
  'button' => 'button label',
  'description' => 'description',
  'text' => 'string',
);

sub direction_string($$$;$) {
  my ($self, $direction, $string_type, $context) = @_;

  if (!exists($valid_direction_string_type{$string_type})) {
    print STDERR "Incorrect type $string_type in direction_string call\n";
    return undef;
  }

  $context = 'normal' if (!defined($context));

  if (!exists($valid_direction_string_context{$context})) {
    print STDERR "Incorrect context $context in direction_string call\n";
    return undef;
  }

  $direction =~ s/^FirstInFile//;

  my $translated_directions_strings = $self->{'translated_direction_strings'};
  if (!defined($translated_directions_strings)) {
    cluck();
  }

  if (not exists($self->{'directions_strings'}->{$string_type}->{$direction})
       or not exists($self->{'directions_strings'}->{$string_type}
                                                ->{$direction}->{$context})) {
    $self->{'directions_strings'}->{$string_type}->{$direction} = {}
      if (not exists($self->{'directions_strings'}
                                     ->{$string_type}->{$direction}));
    if (exists($translated_directions_strings->{$string_type})
        # can exist and be undef if user-defined and also maybe for
        # some default directions, but maybe only for unlikely type.
        and defined($translated_directions_strings->{$string_type}
                                              ->{$direction})
        and defined($translated_directions_strings->{$string_type}
                                              ->{$direction}->{'converted'})) {

      # translate already converted direction strings
      my $converted_directions
       = $translated_directions_strings->{$string_type}
                                          ->{$direction}->{'converted'};
      my $context_converted_string;
      if (exists($converted_directions->{$context})) {
        $context_converted_string = $converted_directions->{$context};
      } elsif ($context eq 'string'
               and defined($converted_directions->{'normal'})) {
        $context_converted_string = $converted_directions->{'normal'};
      }
      if (defined($context_converted_string)) {
        my $result_string
          = $self->cdt_string($context_converted_string);
        $self->{'directions_strings'}->{$string_type}->{$direction}->{$context}
          = $self->substitute_html_non_breaking_space($result_string);
      } else {
        $self->{'directions_strings'}->{$string_type}->{$direction}->{$context}
          = undef;
      }
    } elsif (exists($translated_directions_strings->{$string_type})
        # can exist and be undef if user-defined and also maybe for
        # some default directions, but maybe only for unlikely type.
             and defined($translated_directions_strings->{$string_type}
                                            ->{$direction})
             and defined($translated_directions_strings->{$string_type}
                                            ->{$direction}->{'to_convert'})) {
      # translate direction strings that need to be translated and converted
      my $translation_context = $direction;
      $translation_context .= ' (current section)' if ($direction eq 'This');
      $translation_context .= ' direction '
                       .$direction_type_translation_context{$string_type};
      my $translated_tree
        = $self->pcdt($translation_context,
                      $translated_directions_strings->{$string_type}
                                            ->{$direction}->{'to_convert'});

      my $context_str = "DIRECTION $direction ($string_type/$context)";

      my $context_type;
      if ($context eq 'string') {
        $context_type = $CTXF_string;
      }

      my $result_string
         = $self->convert_tree_new_formatting_context($translated_tree,
                                              $context_str, $context_type,
                                                      undef, $context_str);

      # NOTE direction strings should be simple Texinfo code, but it is
      # possible to set to anything through customization.  Since
      # anything except simple code is incorrect, there is no guarantee
      # on the output, but it is good if there is no crash.
      # If there is a @documentlanguage in $converted_tree, translate_names
      # would be called and
      # $self->{'directions_strings'}->{$string_type}->{$direction} would be
      # reset.  So, for this very special case (tested in the test suite),
      # there may be a need to set again even though it was already done
      # just above.
      $self->{'directions_strings'}->{$string_type}->{$direction} = {}
          if (not $self->{'directions_strings'}->{$string_type}->{$direction});

      $self->{'directions_strings'}->{$string_type}->{$direction}->{$context}
        = $result_string;
    } else {
      $self->{'directions_strings'}->{$string_type}->{$direction}->{$context}
         = undef;
    }
  }
  return $self->{'directions_strings'}->{$string_type}
                                       ->{$direction}->{$context};
}

sub global_direction_unit($$) {
  my ($self, $direction) = @_;

  return $self->{'global_units_directions'}->{$direction};
}

sub global_direction_text($$) {
  my ($self, $direction) = @_;

  return $self->{'global_texts_directions'}->{$direction};
}



# API for misc conversion and formatting functions

# if $OUTPUT_UNITS is defined, the first output unit is used if a proper
# top output unit is not found.
sub _get_top_unit($;$) {
  my ($self, $output_units) = @_;

  my $global_commands;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();

    if (defined($global_commands)) {
      my $section_top = $global_commands->{'top'};
      if (defined($section_top)) {
        return $section_top->{'associated_unit'};
      }
    }
  }

  my $top_target_element = $self->converter_find_identifier_target('Top');

  if (defined($top_target_element)
      and $top_target_element->{'cmdname'} eq 'node') {
    if (!exists($top_target_element->{'associated_unit'})) {
      die "No associated unit for Top node: "
         .Texinfo::Common::debug_print_element($top_target_element, 1);
    }
    return $top_target_element->{'associated_unit'};
  }

  if (defined($output_units)) {
    return $output_units->[0];
  }
  return undef;
}

# it is considered 'top' only if element corresponds to @top or
# element is a node
sub unit_is_top_output_unit($$) {
  my ($self, $output_unit) = @_;

  my $top_output_unit = _get_top_unit($self);
  if (defined($top_output_unit) and $top_output_unit eq $output_unit) {
    return 1;
  } else {
    return 0;
  }
}

our %default_shared_conversion_states;

sub _XS_get_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  return _get_shared_conversion_state($self, $cmdname,
                                      $state_name, @args);
}

sub _XS_set_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  _set_shared_conversion_state($self, $cmdname,
                               $state_name, @args);
}

sub register_footnote($$$$$$$) {
  my ($self, $command, $footid, $docid, $number_in_doc,
      $footnote_location_filename, $multi_expanded_region) = @_;

  my $in_skipped_node_top
    = $self->get_shared_conversion_state('top', 'in_skipped_node_top');
  if (!defined($in_skipped_node_top) or $in_skipped_node_top != 1) {
    push @{$self->{'pending_footnotes'}}, [$command, $footid, $docid,
      $number_in_doc, $footnote_location_filename, $multi_expanded_region];
  }
}

# No equivalent function in C, the pending_footnotes are accessed directly
sub get_pending_footnotes($) {
  my $self = shift;

  my @result = @{$self->{'pending_footnotes'}};
  @{$self->{'pending_footnotes'}} = ();
  return \@result;
}


# API to register, cancel and get inline content that should be output
# when in an inline situation, mostly in a paragraph or preformatted
sub register_pending_formatted_inline_content($$$) {
  my ($self, $category, $inline_content) = @_;

  if (!defined($inline_content)) {
    return;
  }

  if (not exists($self->{'pending_inline_content'})) {
    $self->{'pending_inline_content'} = [];
  }
  push @{$self->{'pending_inline_content'}}, [$category, $inline_content];
}

# cancel only the first pending content for the category
sub cancel_pending_formatted_inline_content($$) {
  my ($self, $category) = @_;

  if (exists($self->{'pending_inline_content'})) {
    my $pending_inline = $self->{'pending_inline_content'};
    my $current_idx = scalar(@$pending_inline) - 1;
    if ($current_idx >= 0) {
      while ($current_idx >= 0) {
        if ($pending_inline->[$current_idx]->[0] eq $category) {
          my $removed = splice(@$pending_inline, $current_idx, 1);
          return $removed->[1];
        }
        $current_idx--;
      }
    }
  }
  return undef;
}

sub get_pending_formatted_inline_content($) {
  my $self = shift;

  if (not exists($self->{'pending_inline_content'})) {
    return '';
  } else {
    my $result = '';
    foreach my $category_inline_content (@{$self->{'pending_inline_content'}}) {
      if (defined($category_inline_content->[1])) {
        $result .= $category_inline_content->[1];
      }
    }
    delete $self->{'pending_inline_content'};
    return $result;
  }
}

# API to associate inline content to an element, typically
# paragraph or preformatted.  Allows to associate the pending
# content to the first inline element.
sub associate_pending_formatted_inline_content($$$) {
  my ($self, $element, $inline_content) = @_;

  $self->{'associated_inline_content'}->{$element} .= $inline_content;
}

sub get_associated_formatted_inline_content($$) {
  my ($self, $element) = @_;

  if (exists($self->{'associated_inline_content'}->{$element})) {
    my $result = $self->{'associated_inline_content'}->{$element};
    delete $self->{'associated_inline_content'}->{$element};
    return $result;
  }
  return '';
}

# API to register an information to a file and get it.  To be able to
# set an integer information during conversion and get it back during headers
# and footers conversion
sub register_file_information($$$) {
  my ($self, $key, $value) = @_;

  if (!exists($self->{'current_filename'})) {
    cluck();
  }

  $self->{'html_files_information'}->{$self->{'current_filename'}} = {}
    if (!exists(
           $self->{'html_files_information'}->{$self->{'current_filename'}}));
  $self->{'html_files_information'}->{$self->{'current_filename'}}->{$key}
    = $value;
}

sub get_file_information($$;$) {
  my ($self, $key, $filename) = @_;

  if (not defined($filename)) {
    $filename = $self->{'current_filename'};
  }
  if (not defined($filename)
      or not exists($self->{'html_files_information'})
      or not exists($self->{'html_files_information'}->{$filename})
      or not exists($self->{'html_files_information'}->{$filename}->{$key})) {
    return (0, undef);
  }
  return (1, $self->{'html_files_information'}->{$filename}->{$key})
}

sub current_filename($) {
  my $self = shift;

  return $self->{'current_filename'};
}

sub current_output_unit($) {
  my $self = shift;

  return $self->{'current_output_unit'};
}

# information from converter available 'read-only', set up before
# really starting the formatting.
my %available_converter_info;
foreach my $converter_info ('copying_comment', 'date_in_header',
   'destination_directory', 'document', 'document_name',
   'documentdescription_string', 'documentinfo_metadata',
   'expanded_formats',
   'jslicenses', 'line_break_element', 'non_breaking_space',
   'paragraph_symbol', 'simpletitle_command_name', 'simpletitle_tree',
   'title_string', 'title_tree', 'title_titlepage') {
  $available_converter_info{$converter_info} = 1;
}

sub get_info($$) {
  my ($self, $converter_info) = @_;

  if (not exists($available_converter_info{$converter_info})) {
    confess("BUG: $converter_info not an available converter info");
  }
  if (defined($self->{'converter_info'}->{$converter_info})) {
    return $self->{'converter_info'}->{$converter_info};
  }
  return undef;
}

sub _source_info_id($) {
  my $source_info = shift;

  my $result;
  if (exists($source_info->{'file_name'})) {
    $result = $source_info->{'file_name'};
  } else {
    $result = '';
  }
  $result .= '-';
  if (exists($source_info->{'macro'})) {
    $result .= $source_info->{'macro'};
  }
  $result .= '-';
  if (exists($source_info->{'line_nr'})) {
    $result .= $source_info->{'line_nr'};
  } else {
    $result .= '0';
  }
  return $result;
}

sub _check_htmlxref_already_warned($$$) {
  my ($self, $manual_name, $source_info) = @_;

  my $node_manual_key;
  if (defined($source_info)) {
    $node_manual_key = _source_info_id($source_info).'-'.$manual_name;
  } else {
    $node_manual_key = 'UNDEF-'.$manual_name;
  }
  if (exists($self->{'check_htmlxref_already_warned'}->{$node_manual_key})) {
    return 1;
  } else {
    $self->{'check_htmlxref_already_warned'}->{$node_manual_key} = 1;
    return 0;
  }
}

our %defaults;

# heading
my %default_translated_special_unit_info
  = %{ Texinfo::HTMLData::get_default_translated_special_unit_info() };

# for rel, see http://www.w3.org/TR/REC-html40/types.html#type-links
my %default_converted_directions_strings
  = %{ Texinfo::HTMLData::get_default_converted_directions_strings() };

# translation contexts should be consistent with
# %direction_type_translation_context.  If the direction is not used
# as is, it should also be taken into account in direction_string().
# For now 'This' becomes 'This (current section)'.
my %default_translated_directions_strings
   = %{ Texinfo::HTMLData::get_default_translated_directions_strings() };

our @no_args_commands_contexts;

# to be called before starting conversion and when language changes.
# $RESET_CONTEXT is the context being set or reset.
# $REF_CONTEXT is the context that should be used for defaults, if
#              defined and there is no information for $CMDNAME $RESET_CONTEXT.
#              In that case, 'unset' should exist for $RESET_CONTEXT.
sub _reset_unset_no_arg_commands_formatting_context($$$$;$) {
  my ($self, $cmdname, $reset_context, $ref_context, $translate) = @_;

  my $conversion_contexts = $self->{'no_arg_commands_formatting'}->{$cmdname};

  # should never happen as unset is set at initialization in that case
  #if (!exists($conversion_contexts->{$reset_context})) {
  #  die "Non-existing no_arg_commands_formatting $cmdname $reset_context";
  #}
  my $no_arg_command_context = $conversion_contexts->{$reset_context};

  if (defined($ref_context) and exists($no_arg_command_context->{'unset'})) {
    foreach my $key (keys(%{$conversion_contexts->{$ref_context}})) {
      # If present, both 'translated_converted' and (possibly translated)
      # 'text' are referred to.
      # In case of 'text', if 'translated_tree' is referred to and
      # $translate is set, the 'text' will be replaced just below.
      $no_arg_command_context->{$key}
        = $conversion_contexts->{$ref_context}->{$key};
    }
  }
  if ($translate
      and exists($conversion_contexts->{'translated_tree'})
      and not exists($no_arg_command_context->{'translated_converted'})) {
    my $translated_tree
      = $conversion_contexts->{'translated_tree'};
    my $translation_result;
    my $explanation = "Translated NO ARG \@$cmdname ctx $reset_context";
    my $context_str = "Tr $cmdname ctx $reset_context";
    if ($reset_context eq 'normal') {
      $translation_result
        = $self->convert_tree($translated_tree, $explanation);
    } elsif ($reset_context eq 'preformatted') {
      # there does not seems to be anything simpler...
      my $preformatted_cmdname = 'example';
      _new_document_context($self, $context_str);
      _open_command_update_context($self, $preformatted_cmdname);
      $translation_result
        = $self->convert_tree($translated_tree, $explanation);
      _convert_command_update_context($self, $preformatted_cmdname);
      _pop_document_context($self);
    } elsif ($reset_context eq 'string') {
      _new_document_context($self, $context_str, $CTXF_string);
      $translation_result = $self->convert_tree($translated_tree,
                                                $explanation);
      _pop_document_context($self);
    } elsif ($reset_context eq 'css_string') {
      $translation_result = _html_convert_css_string($self, $translated_tree,
                                                     $context_str);
    }
    $no_arg_command_context->{'text'} = $translation_result;
  }
}

sub _complete_no_arg_commands_formatting($$;$) {
  my ($self, $cmdname, $translate) = @_;

  _reset_unset_no_arg_commands_formatting_context($self, $cmdname,
                                            'normal', undef, $translate);
  _reset_unset_no_arg_commands_formatting_context($self, $cmdname,
                                   'preformatted', 'normal', $translate);
  _reset_unset_no_arg_commands_formatting_context($self, $cmdname,
                                    'string', 'preformatted', $translate);
  _reset_unset_no_arg_commands_formatting_context($self, $cmdname,
                                   'css_string', 'string', $translate);
}

my @sorted_no_arg_commands;

sub _translate_names($) {
  my $self = shift;

  my $debug = $self->get_conf('DEBUG');

  if ($debug) {
    my $output_encoding_name = $self->get_conf('OUTPUT_ENCODING_NAME');
    $output_encoding_name = 'UNDEF' if (!defined($output_encoding_name));
    my $bcp47_locale = $self->current_bcp47_locale();
    print STDERR "\nTRANSLATE_NAMES encoding_name: $output_encoding_name"
      ." bcp47_locale: $bcp47_locale\n";
  }

  # reset strings such that they are translated when needed.
  # could also use the keys of $self->{'translated_direction_strings'}
  foreach my $string_type (keys(%default_translated_directions_strings)) {
    $self->{'directions_strings'}->{$string_type} = {};
  }

  # could also use keys of $self->{'translated_special_unit_info_texinfo'}
  foreach my $type (keys(%default_translated_special_unit_info)) {
    $self->{'translated_special_unit_info_tree'}->{$type} = {};
  }

  # delete the tree and formatted results for special elements
  # such that they are redone with the new tree when needed.
  foreach my $special_unit_variety
                 ($self->get_special_unit_info_varieties('direction')) {
    my $special_unit_direction
     = $self->special_unit_info('direction', $special_unit_variety);
    my $special_unit
     = $self->global_direction_unit($special_unit_direction);
    if (defined($special_unit)) {
      my $command = $special_unit->{'unit_command'};
      if (defined($command)
          and exists($self->{'targets'}->{$command})) {
        my $target = $self->{'targets'}->{$command};
        foreach my $key ('text', 'string', 'tree', 'description_text',
                         'description_string') {
          delete $target->{$key};
        }
      }
    }
  }
  my %translated_commands;
  foreach my $cmdname (@sorted_no_arg_commands) {
    my $conversion_contexts = $self->{'no_arg_commands_formatting'}->{$cmdname};

    my $translated_tree;
    if (exists($conversion_contexts->{'translated_to_convert'})) {
      $translated_tree
        = $self->cdt($conversion_contexts->{'translated_to_convert'});
    } else {
      # generic Converter default translated commands
      $translated_tree = $self->translated_command_tree($cmdname);
    }
    if (defined($translated_tree)) {
      $conversion_contexts->{'translated_tree'} = $translated_tree;
      $translated_commands{$cmdname} = 1;
    }
    foreach my $context (@no_args_commands_contexts) {
      if (exists($conversion_contexts->{$context}->{'translated_converted'})
          and not exists($conversion_contexts->{$context}->{'unset'})) {
        $translated_commands{$cmdname} = 1;
        $conversion_contexts->{$context}->{'text'}
         = $self->cdt_string(
             $conversion_contexts->{$context}->{'translated_converted'});
      }
    }
  }
  foreach my $cmdname (keys(%translated_commands)) {
    _complete_no_arg_commands_formatting($self, $cmdname, 1);
  }

  print STDERR "END TRANSLATE_NAMES\n\n" if ($debug);
}

my %preformatted_commands_context = %preformatted_commands;
$preformatted_commands_context{'verbatim'} = 1;

my %pre_class_commands;
foreach my $preformatted_command (keys(%preformatted_commands_context)) {
  # no class for the @small* variants
  if ($small_block_associated_command{$preformatted_command}) {
    $pre_class_commands{$preformatted_command}
      = $small_block_associated_command{$preformatted_command};
  } else {
    $pre_class_commands{$preformatted_command} = $preformatted_command;
  }
}
$pre_class_commands{'menu'} = 'menu';

our @informative_global_commands;
our @contents_commands;

our %default_no_arg_commands_formatting;

sub register_opened_section_level($$$$) {
  my ($self, $filename, $level, $close_string) = @_;

  if (!exists($self->{'pending_closes'}->{$filename})) {
    $self->{'pending_closes'}->{$filename} = [];
  }
  my $pending_closes = $self->{'pending_closes'}->{$filename};
  while (@$pending_closes < $level) {
    push(@$pending_closes, "");
  }
  push(@$pending_closes, $close_string);
}

sub close_registered_sections_level($$$) {
  my ($self, $filename, $level) = @_;

  if (not defined($level)) {
    cluck 'close_registered_sections_level $level not defined';
  }

  my @closed_elements;
  if (!exists($self->{'pending_closes'}->{$filename})) {
    return \@closed_elements;
  }

  my $pending_closes = $self->{'pending_closes'}->{$filename};
  while (@$pending_closes > $level) {
      my $close_string = pop @$pending_closes;
      push(@closed_elements, $close_string)
        if ($close_string ne "");
  }
  return \@closed_elements;
}



# setting formatting context API

# Following functions are sometimes called from converting functions,
# but mainly from within calls of convert_tree called from
# converting functions.  If XS is used, this makes sure that the
# formatting contexts accessed and modified are only the formatting
# contexts in C data.

# if $document_global_context is set, it means that the formatting
# is not done within the document formatting flow, but the formatted
# output may still end up in the document.  In particular for
# command_text() which caches its computations.
sub _new_document_context($$;$$$) {
  my ($self, $context, $context_type, $document_global_context,
      $block_command) = @_;

  my $doc_context =
         {'context' => $context,
           'formatting_context' => [{'context_name' => '_format'}],
           'composition_context' => [''],
           'preformatted_context' => [0],
           'inside_preformatted' => 0,
           'document_global_context' => $document_global_context,
           'block_commands' => [],
          };

  if (defined($document_global_context)) {
    $self->{'document_global_context_counter'}++;
  }

  if (defined($context_type) and ($context_type & $CTXF_code)) {
    $doc_context->{'monospace'} = [1];
  } else {
    $doc_context->{'monospace'} = [0];
  }

  if (defined($block_command)) {
    push @{$doc_context->{'block_commands'}},
            $block_command;
  }

  if (defined($context_type) and ($context_type & $CTXF_string)) {
    $doc_context->{'string'}++;
  }
  push @{$self->{'document_context'}}, $doc_context;
}

sub _pop_document_context($) {
  my $self = shift;

  my $context = pop @{$self->{'document_context'}};
  if (defined($context->{'document_global_context'})) {
    $self->{'document_global_context_counter'}--;
  }
}

sub _set_string_context($) {
  my $self = shift;

  $self->{'document_context'}->[-1]->{'string'}++;
}

sub _unset_string_context($) {
  my $self = shift;

  $self->{'document_context'}->[-1]->{'string'}--;
}

sub _set_raw_context($) {
  my $self = shift;

  $self->{'document_context'}->[-1]->{'raw'}++;
}

sub _unset_raw_context($) {
  my $self = shift;

  $self->{'document_context'}->[-1]->{'raw'}--;
}

sub _set_multiple_conversions($$) {
  my ($self, $multiple_pass) = @_;

  push @{$self->{'multiple_pass'}}, $multiple_pass;
}

sub _unset_multiple_conversions($) {
  my $self = shift;

  pop @{$self->{'multiple_pass'}};
}

sub _open_command_update_context($$) {
  my ($self, $command_name) = @_;

  my $convert_to_latex;

  if ((exists($brace_commands{$command_name})
       and ($brace_commands{$command_name} eq 'context'
            or exists($math_commands{$command_name})))
      or $command_name eq 'printindex') {
    _new_document_context($self, $command_name);
  }
  if (exists($format_context_commands{$command_name})) {
    push @{$self->{'document_context'}->[-1]->{'formatting_context'}},
                                  {'context_name' => '@'.$command_name};
  }
  if (exists($block_commands{$command_name})) {
    push @{$self->{'document_context'}->[-1]->{'block_commands'}},
                                                      $command_name;
  }
  my $preformatted = 0;
  if (exists($pre_class_commands{$command_name})) {
    push @{$self->{'document_context'}->[-1]->{'preformatted_classes'}},
      $pre_class_commands{$command_name};
    if (exists($preformatted_commands{$command_name})) {
      $self->{'document_context'}->[-1]->{'inside_preformatted'}++;
      $preformatted = 1;
    } elsif ($block_commands{$command_name} eq 'menu'
             and $self->{'document_context'}->[-1]->{'inside_preformatted'}) {
      $preformatted = 1;
    }
  }
  if (exists($composition_context_commands{$command_name})) {
    push @{$self->{'document_context'}->[-1]->{'composition_context'}},
                                                           $command_name;
    push @{$self->{'document_context'}->[-1]->{'preformatted_context'}},
         $preformatted;
  }
  if (exists($format_raw_commands{$command_name})) {
    $self->{'document_context'}->[-1]->{'raw'}++;
  } elsif ($command_name eq 'verbatim') {
    $self->{'document_context'}->[-1]->{'verbatim'}++;
  }
  if (exists($brace_code_commands{$command_name}) or
      exists($preformatted_code_commands{$command_name})) {
    push @{$self->{'document_context'}->[-1]->{'monospace'}}, 1;
  } elsif (exists($brace_commands{$command_name})
           and $brace_commands{$command_name} eq 'style_no_code') {
    push @{$self->{'document_context'}->[-1]->{'monospace'}}, 0;
  } elsif ($self->{'upper_case_commands'}->{$command_name}) {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                         ->{'upper_case'}++;
  } elsif (exists($math_commands{$command_name})) {
    $self->{'document_context'}->[-1]->{'math'}++;
    $convert_to_latex = 1 if ($self->get_conf('CONVERT_TO_LATEX_IN_MATH'));
  }
  if ($command_name eq 'verb') {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                    ->{'space_protected'}++;
  } elsif ($command_name eq 'w') {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                               ->{'no_break'}++;
  }
  return $convert_to_latex;
}

sub _convert_command_update_context($$) {
  my ($self, $command_name) = @_;

  if (exists($composition_context_commands{$command_name})) {
    pop @{$self->{'document_context'}->[-1]->{'composition_context'}};
    pop @{$self->{'document_context'}->[-1]->{'preformatted_context'}};
  }
  if (exists($pre_class_commands{$command_name})) {
    pop @{$self->{'document_context'}->[-1]->{'preformatted_classes'}};
    if (exists($preformatted_commands{$command_name})) {
      $self->{'document_context'}->[-1]->{'inside_preformatted'}--;
    }
  }
  if (exists($preformatted_code_commands{$command_name})
      or (exists($brace_commands{$command_name})
          and $brace_commands{$command_name} eq 'style_no_code')
      or exists($brace_code_commands{$command_name})) {
    pop @{$self->{'document_context'}->[-1]->{'monospace'}};
  } elsif ($self->{'upper_case_commands'}->{$command_name}) {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                    ->{'upper_case'}--;
  } elsif (exists($math_commands{$command_name})) {
    $self->{'document_context'}->[-1]->{'math'}--;
  }
  if ($command_name eq 'verb') {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                               ->{'space_protected'}--;
  } elsif ($command_name eq 'w') {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                               ->{'no_break'}--;
  }
  if (exists($format_raw_commands{$command_name})) {
    $self->{'document_context'}->[-1]->{'raw'}--;
  } elsif ($command_name eq 'verbatim') {
    $self->{'document_context'}->[-1]->{'verbatim'}--;
  }
  if (exists($block_commands{$command_name})) {
    pop @{$self->{'document_context'}->[-1]->{'block_commands'}};
  }
  if (exists($format_context_commands{$command_name})) {
    pop @{$self->{'document_context'}->[-1]->{'formatting_context'}};
  }
  if ((exists($brace_commands{$command_name})
       and ($brace_commands{$command_name} eq 'context'
            or exists($math_commands{$command_name})))
      or $command_name eq 'printindex') {
    _pop_document_context($self);
  }
}

sub _open_type_update_context($$) {
  my ($self, $type_name) = @_;

  if ($type_name eq 'paragraph') {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                    ->{'paragraph_number'}++;
  } elsif ($type_name eq 'preformatted'
           or $type_name eq 'rawpreformatted') {
    $self->{'document_context'}->[-1]->{'formatting_context'}->[-1]
                                                 ->{'preformatted_number'}++;
  } elsif ($self->{'pre_class_types'}->{$type_name}) {
    push @{$self->{'document_context'}->[-1]->{'preformatted_classes'}},
      $self->{'pre_class_types'}->{$type_name};
    push @{$self->{'document_context'}->[-1]->{'preformatted_context'}}, 1;
    push @{$self->{'document_context'}->[-1]->{'composition_context'}},
      $type_name;
  }

  if ($self->{'code_types'}->{$type_name}) {
    push @{$self->{'document_context'}->[-1]->{'monospace'}}, 1;
  }
}

sub _convert_type_update_context($$) {
  my ($self, $type_name) = @_;

  if ($self->{'code_types'}->{$type_name}) {
    pop @{$self->{'document_context'}->[-1]->{'monospace'}};
  }
  if ($self->{'pre_class_types'}->{$type_name}) {
    pop @{$self->{'document_context'}->[-1]->{'preformatted_classes'}};
    pop @{$self->{'document_context'}->[-1]->{'composition_context'}};
    pop @{$self->{'document_context'}->[-1]->{'preformatted_context'}};
  }
}

sub _debug_print_html_contexts($) {
  my $self = shift;

  my @document_contexts = map {defined($_->{'context'})
                                       ? $_->{'context'}: 'UNDEF'}
                                  @{$self->{'document_context'}};
  my @contexts_names = map {defined($_->{'context_name'})
                                 ? $_->{'context_name'}: 'UNDEF'}
        @{$self->{'document_context'}->[-1]->{'formatting_context'}};
  return "[".join('|',@document_contexts)."](".join('|',@contexts_names).")";
}



# converter API: converter_defaults, code called from converter_initialize,
# convert and output

sub _set_variables_texi2html($) {
  my $options = shift;

  my @texi2html_options = (
  ['SECTION_BUTTONS', ['FastBack', 'Back', 'Up', 'Forward', 'FastForward',
                             'Space', 'Space', 'Space', 'Space',
                             'Top', 'Contents', 'Index', 'About' ]],
  ['TOP_BUTTONS', ['Back', 'Forward', 'Space',
                             'Contents', 'Index', 'About']],
  ['TOP_FOOTER_BUTTONS', ['Back', 'Forward', 'Space',
                             'Contents', 'Index', 'About']],

  ['MISC_BUTTONS', [ 'Top', 'Contents', 'Index', 'About' ]],
  ['CHAPTER_BUTTONS', [ 'FastBack', 'FastForward', 'Space',
                              'Space', 'Space', 'Space', 'Space',
                              'Top', 'Contents', 'Index', 'About', ]],
  ['SECTION_FOOTER_BUTTONS', [ 'FastBack', 'FirstInFileBack', 'FirstInFileUp',
                                               'Forward', 'FastForward' ]],
  ['CHAPTER_FOOTER_BUTTONS', [ 'FastBack', 'FastForward', 'Space',
                              'Space', 'Space', 'Space', 'Space',
                              'Top', 'Contents', 'Index', 'About', ]],
  ['NODE_FOOTER_BUTTONS', [ 'FastBack', 'Back',
                                            'Up', 'Forward', 'FastForward',
                             'Space', 'Space', 'Space', 'Space',
                             'Top', 'Contents', 'Index', 'About' ]],
  );
  my $regular_texi2html_options
    = Texinfo::Options::get_regular_options('texi2html');
  foreach my $option (keys(%$regular_texi2html_options)) {
    $options->{$option} = $regular_texi2html_options->{$option};
  }
  foreach my $option (@texi2html_options) {
    $options->{$option->[0]} = $option->[1];
  }
}

sub converter_defaults($;$) {
  my ($self, $conf) = @_;

  if (defined($conf) and $conf->{'TEXI2HTML'}) {
    my $default_ref = { %defaults };
    my $texi2html_defaults = { %$default_ref };
    _set_variables_texi2html($texi2html_defaults);
    return $texi2html_defaults;
  }
  return \%defaults;
}

# called from converter_initialize

our %htmlxref_entries;

# $FILES is an array reference of file names binary strings.
sub _parse_htmlxref_files($$) {
  my ($self, $files) = @_;

  my $htmlxref = {};

  my $debug = $self->get_conf('DEBUG');

  foreach my $file (@$files) {
    my $fname = $file;
    if ($self->get_conf('TEST')) {
      my ($volume, $directories);
      # strip directories for out-of-source builds reproducible file names
      ($volume, $directories, $fname) = File::Spec->splitpath($file);
    }
    print STDERR "html refs config file: $file\n" if ($debug);
    unless (open(HTMLXREF, $file)) {
      my $htmlxref_file_name = $file;
      my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
      if (defined($encoding)) {
        $htmlxref_file_name = decode($encoding, $htmlxref_file_name);
      }
      $self->converter_document_warn(
        sprintf(__("could not open html refs config file %s: %s"),
          $htmlxref_file_name, $!));
      next;
    }
    my $line_nr = 0;
    my %variables;
    while (1) {
      my $hline = <HTMLXREF>;
      last if (!defined($hline));
      #my $line = $hline;
      $line_nr++;
      $hline =~ s/^\s*//;
      next if $hline =~ /^#/;
      next if $hline =~ /^$/;
      chomp ($hline);
      if ($hline =~ s/^(\w+)\s*=\s*//) {
        # handle variables
        my $var = $1;
        my $re = join '|', map { quotemeta $_ } keys %variables;
        $hline =~ s/\$\{($re)\}/defined $variables{$1} ? $variables{$1}
                                                       : "\${$1}"/ge;
        $variables{$var} = $hline;
        next;
      }
      my @htmlxref = split /\s+/, $hline;
      my $manual = shift @htmlxref;
      my $split_or_mono = shift @htmlxref;
      #print STDERR "$fname: $line_nr: $manual $split_or_mono\n";
      if (!defined($split_or_mono)) {
        $self->converter_line_warn(__("missing type"),
                 {'file_name' => $fname, 'line_nr' => $line_nr});
        next;
      } elsif (!exists($htmlxref_entries{$split_or_mono})) {
        $self->converter_line_warn(sprintf(__("unrecognized type: %s"),
                                        $split_or_mono),
                    {'file_name' => $fname, 'line_nr' => $line_nr});
        next;
      }
      my $href = shift @htmlxref;
      # No warning for an empty URL prefix as it is the only way to
      # override an entry appearing in a file processed later on
      #if (!defined($href)) {
      #  $self->converter_line_warn(sprintf(
      #       __("missing %s URL prefix for `%s'"), $split_or_mono, $manual),
      #           {'file_name' => $fname, 'line_nr' => $line_nr});
      #}

      # keep previously set value
      next if (exists($htmlxref->{$manual})
               and exists($htmlxref->{$manual}->{$split_or_mono}));

      if (defined($href)) { # substitute 'variables'
        my $re = join '|', map { quotemeta $_ } keys %variables;
        $href =~ s/\$\{($re)\}/defined $variables{$1} ? $variables{$1}
                                                      : "\${$1}"/ge;
        $href =~ s/\/*$// if ($split_or_mono ne 'mono');
      } else {
        # Store empty text instead of undef, such that exists can safely
        # be used.
        $href = '';
      }
      $htmlxref->{$manual} = {} if (!exists($htmlxref->{$manual}));
      $htmlxref->{$manual}->{$split_or_mono} = $href;
    }
    if (!close (HTMLXREF)) {
      my $htmlxref_file_name = $file;
      my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
      if (defined($encoding)) {
        $htmlxref_file_name = decode($encoding, $htmlxref_file_name);
      }
      $self->converter_document_warn(sprintf(__(
                       "error on closing html refs config file %s: %s"),
                             $htmlxref_file_name, $!));
    }
  }
  return $htmlxref;
}

sub _load_htmlxref_files($) {
  my $self = shift;

  my $deprecated_dirs = $self->{'deprecated_config_directories'};

  my @htmlxref_files;
  my $htmlxref_mode = $self->get_conf('HTMLXREF_MODE');
  return if (defined($htmlxref_mode) and $htmlxref_mode eq 'none');
  my $htmlxref_file_name = 'htmlxref.cnf';
  if (defined($htmlxref_mode) and $htmlxref_mode eq 'file') {
    if (defined($self->get_conf('HTMLXREF_FILE'))) {
      $htmlxref_file_name = $self->get_conf('HTMLXREF_FILE');
    }
    my ($encoded_htmlxref_file_name, $htmlxref_file_encoding)
      = $self->encoded_output_file_name($htmlxref_file_name);
    if (-e $encoded_htmlxref_file_name and -r $encoded_htmlxref_file_name) {
      @htmlxref_files = ($encoded_htmlxref_file_name);
    } else {
      $self->converter_document_warn(
        sprintf(__("could not find html refs config file %s"),
          $htmlxref_file_name));
    }
  } else {
    my @htmlxref_dirs;
    if ($self->get_conf('TEST')) {
      my $curdir = File::Spec->curdir();
      # to have reproducible tests, do not use system or user
      # directories if TEST is set.
      @htmlxref_dirs = join('/', ($curdir, '.texinfo'));

      if ($Texinfo::ModulePath::texinfo_uninstalled) {
        unshift @htmlxref_dirs, join('/', (
          $Texinfo::ModulePath::t2a_srcdir, 'perl', 't', 'input_files'));
      }
    } elsif ($self->get_conf('TEXINFO_LANGUAGE_DIRECTORIES')
       and scalar(@{$self->get_conf('TEXINFO_LANGUAGE_DIRECTORIES')}) > 0) {
      @htmlxref_dirs = @{$self->get_conf('TEXINFO_LANGUAGE_DIRECTORIES')};
    }

    my $cnf_directory_name;

    # no htmlxref for tests, unless explicitly specified
    if ($self->get_conf('TEST')) {
      if (defined($self->get_conf('HTMLXREF_FILE'))) {
        $htmlxref_file_name = $self->get_conf('HTMLXREF_FILE');
      } else {
        $htmlxref_file_name = undef;
      }
    } else {
      $cnf_directory_name = 'htmlxref.d';
      if (defined($self->get_conf('HTMLXREF_FILE'))) {
        $htmlxref_file_name = $self->get_conf('HTMLXREF_FILE');
      }
    }

    my ($encoded_htmlxref_file_name, $htmlxref_file_encoding);
    # encode file name and handle specific cases for the main htmlxref file
    # without search in directories.
    if (defined($htmlxref_file_name)) {
      ($encoded_htmlxref_file_name, $htmlxref_file_encoding)
        = $self->encoded_output_file_name($htmlxref_file_name);
      if (File::Spec->file_name_is_absolute($encoded_htmlxref_file_name)) {
        if (-e $encoded_htmlxref_file_name and -r $encoded_htmlxref_file_name) {
          push @htmlxref_files, $encoded_htmlxref_file_name;
        }
        $htmlxref_file_name = undef;
      } else {
        my ($volume, $path_directories, $file)
          = File::Spec->splitpath($htmlxref_file_name);
        my @path_directories = File::Spec->splitdir($path_directories);
        # do not search in directories if the file name already contains
        # directories.
        if (scalar(@path_directories) > 0) {
          if (-e $encoded_htmlxref_file_name
              and -r $encoded_htmlxref_file_name) {
            push @htmlxref_files, $encoded_htmlxref_file_name;
          }
          $htmlxref_file_name = undef;
        }
      }
    }

    # now search in directories
    if (defined($htmlxref_file_name) or defined($cnf_directory_name)) {
      my ($encoded_cnf_directory_name, $cnf_directory_encoding);
      if (defined($cnf_directory_name)) {
        ($encoded_cnf_directory_name, $cnf_directory_encoding)
          = $self->encoded_output_file_name($cnf_directory_name);
      }

      my $deprecated_dirs_used;
      foreach my $dir (@htmlxref_dirs) {
        next unless (-d $dir);
        my $deprecated_dir_set = 0;
        if (defined($htmlxref_file_name)) {
          my $possible_file = "$dir/$encoded_htmlxref_file_name";
          if (-e $possible_file and -r $possible_file) {
            if (defined($deprecated_dirs) and $deprecated_dirs->{$dir}) {
              $deprecated_dirs_used = [] if (!defined($deprecated_dirs_used));
              push @$deprecated_dirs_used, $dir;
              $deprecated_dir_set = 1;
            }
            push (@htmlxref_files, $possible_file);
          }
        }
        if (defined($cnf_directory_name)) {
          my $cnf_dir = "$dir/$encoded_cnf_directory_name";
          if (-d $cnf_dir) {
            my $file_found = 0;
            # the internal simple quotes are for the case of spaces in $cnf_dir.
            my @possible_files = glob("'$cnf_dir/*.cnf'");
            foreach my $possible_file (sort(@possible_files)) {
              if (-e $possible_file and -r $possible_file) {
                push (@htmlxref_files, $possible_file);
                $file_found = 1;
              }
            }
            if (!$deprecated_dir_set and $file_found
                and $deprecated_dirs and $deprecated_dirs->{$dir}) {
              $deprecated_dirs_used = [] if (!defined($deprecated_dirs_used));
              push @$deprecated_dirs_used, $dir;
              $deprecated_dir_set = 1;
            }
          }
        }
      }
      if (defined($deprecated_dirs_used)) {
        foreach my $dir (@$deprecated_dirs_used) {
          my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
          my ($dir_name, $replacement_dir);
          if (defined($encoding)) {
            $dir_name = decode($encoding, $dir);
            $replacement_dir = decode($encoding, $deprecated_dirs->{$dir})
          } else {
            $dir_name = $dir;
            $replacement_dir = $deprecated_dirs->{$dir};
          }
          $self->converter_document_warn(sprintf(__(
                    "%s directory is deprecated. Use %s instead"),
                           $dir_name, $replacement_dir));
        }
      }
    }
  }

  $self->{'htmlxref'} = {};
  if (scalar(@htmlxref_files)) {
    $self->{'htmlxref'} = _parse_htmlxref_files($self,
                                                \@htmlxref_files);
  }
}

sub _process_css_file($$$) {
  my ($self, $fh, $file) = @_;

  my $in_rules = 0;
  my $in_comment = 0;
  my $in_import = 0;
  my $in_string = 0;
  my $rules = [];
  my $imports = [];
  my $line_nr = 0;
  # the rule is to assume utf-8.  There could also be a BOM, and
  # the Content-Type: HTTP header but it is not relevant here.
  # https://developer.mozilla.org/en-US/docs/Web/CSS/@charset
  my $input_perl_encoding = 'utf-8';
  while (1) {
    my $input_line = <$fh>;
    last if (!defined($input_line));
    my $line = Encode::decode($input_perl_encoding, $input_line);
    $line_nr++;
    if ($line_nr == 1) {
      # should always be the first line
      if ($line =~ /^\@charset  *"([^"]+)" *; *$/) {
        my $charset = $1;
        my $Encode_encoding_object = find_encoding($charset);
        if (defined($Encode_encoding_object)) {
          my $perl_encoding = $Encode_encoding_object->name();
          if (defined($perl_encoding) and $perl_encoding ne '') {
            $input_perl_encoding = $perl_encoding;
          }
        }
        next;
      }
    }
    #print STDERR "Line: $line";
    if ($in_rules) {
      push @$rules, $line;
      next;
    }
    my $text = '';
    while (1) {
      #sleep 1;
      #print STDERR "${text}!in_comment $in_comment in_rules $in_rules in_import $in_import in_string $in_string: $line";
      if ($in_comment) {
        if ($line =~ s/^(.*?\*\/)//) {
          $text .= $1;
          $in_comment = 0;
        } else {
          push @$imports, $text . $line;
          last;
        }
      } elsif (!$in_string and $line =~ s/^\///) {
        if ($line =~ s/^\*//) {
          $text .= '/*';
          $in_comment = 1;
        } else {
          push (@$imports, $text. "\n") if ($text ne '');
          push (@$rules, '/' . $line);
          $in_rules = 1;
          last;
        }
      } elsif (!$in_string and $in_import and $line =~ s/^([\"\'])//) {
        # strings outside of import start rules
        $text .= "$1";
        $in_string = quotemeta("$1");
      } elsif ($in_string and $line =~ s/^(\\$in_string)//) {
        $text .= $1;
      } elsif ($in_string and $line =~ s/^($in_string)//) {
        $text .= $1;
        $in_string = 0;
      } elsif ((! $in_string and !$in_import)
              and ($line =~ s/^([\\]?\@import)$//
                   or $line =~ s/^([\\]?\@import\s+)//)) {
        $text .= $1;
        $in_import = 1;
      } elsif (!$in_string and $in_import and $line =~ s/^\;//) {
        $text .= ';';
        $in_import = 0;
      } elsif (($in_import or $in_string) and $line =~ s/^(.)//) {
        $text .= $1;
      } elsif (!$in_import and $line =~ s/^([^\s])//) {
        push (@$imports, $text. "\n") if ($text ne '');
        push (@$rules, $1 . $line);
        $in_rules = 1;
        last;
      } elsif ($line =~ s/^(\s)//) {
        $text .= $1;
      } elsif ($line eq '') {
        push (@$imports, $text);
        last;
      }
    }
  }
  $self->converter_line_warn(__("string not closed in css file"),
                 {'file_name' => $file, 'line_nr' => $line_nr}) if ($in_string);
  $self->converter_line_warn(__("--css-include ended in comment"),
                 {'file_name' => $file, 'line_nr' => $line_nr}) if ($in_comment);
  $self->converter_line_warn(__("\@import not finished in css file"),
                 {'file_name' => $file, 'line_nr' => $line_nr})
    if ($in_import and !$in_comment and !$in_string);
  return ($imports, $rules);
}

sub _prepare_css($) {
  my $self = shift;

  $self->{'files_css_rule_lines'} = [];
  $self->{'files_css_import_lines'} = [];

  return if ($self->get_conf('NO_CSS'));

  my @css_import_lines;
  my @css_rule_lines;

  my $css_files = $self->get_conf('CSS_FILES');
  foreach my $css_file (@$css_files) {
    my $css_file_fh;
    my $css_file_path;
    if ($css_file eq '-') {
      $css_file_fh = \*STDIN;
      $css_file_path = '-';
    } else {
      ($css_file_path, undef) = Texinfo::Common::locate_include_file($css_file,
                                  $self->get_conf('INCLUDE_DIRECTORIES'));
      unless (defined($css_file_path)) {
        my $css_input_file_name;
        my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
        if (defined($encoding)) {
          $css_input_file_name = decode($encoding, $css_file);
        } else {
          $css_input_file_name = $css_file;
        }
        $self->converter_document_warn(sprintf(
               __("CSS file %s not found"), $css_input_file_name));
        next;
      }
      unless (open(CSSFILE, $css_file_path)) {
        my $css_file_name;
        my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
        if (defined($encoding)) {
          $css_file_name = decode($encoding, $css_file_path);
        } else {
          $css_file_name = $css_file_path;
        }
        $self->converter_document_warn(sprintf(__(
             "could not open --include-file %s: %s"),
              $css_file_name, $!));
        next;
      }
      $css_file_fh = \*CSSFILE;
    }
    my ($import_lines, $rules_lines);
    ($import_lines, $rules_lines)
      = _process_css_file($self, $css_file_fh, $css_file_path);
    if (!close($css_file_fh)) {
      my $css_file_name;
      my $encoding = $self->get_conf('COMMAND_LINE_ENCODING');
      if (defined($encoding)) {
        $css_file_name = decode($encoding, $css_file_path);
      } else {
        $css_file_name = $css_file_path;
      }
      $self->converter_document_warn(
            sprintf(__("error on closing CSS file %s: %s"),
                                   $css_file_name, $!));
    }
    push @css_import_lines, @$import_lines;
    push @css_rule_lines, @$rules_lines;

  }
  if ($self->get_conf('DEBUG')) {
    if (@css_import_lines) {
      print STDERR "# css import lines\n";
      foreach my $line (@css_import_lines) {
        print STDERR "$line";
      }
    }
    if (@css_rule_lines) {
      print STDERR "# css rule lines\n";
      foreach my $line (@css_rule_lines) {
        print STDERR "$line";
      }
    }
  }

  push @{$self->{'files_css_import_lines'}}, @css_import_lines;
  push @{$self->{'files_css_rule_lines'}}, @css_rule_lines;
}

sub _html_converter_initialize_beginning($) {
  my $self = shift;

  # used in initialization.  Set if undef
  if (!defined($self->get_conf('FORMAT_MENU'))) {
    $self->force_conf('FORMAT_MENU', '');
  }

  # NOTE we reset silently if the split specification is not one known.
  # The main program warns if the specific command line option value is
  # not known.  We could add a warning here to catch mistakes in init
  # files.  Wait for user reports.
  my $split = $self->get_conf('SPLIT');
  if ($split and $split ne 'chapter'
      and $split ne 'section'
      and $split ne 'node') {
    $self->force_conf('SPLIT', 'node');
  }

  my $max_header_level = $self->get_conf('MAX_HEADER_LEVEL');
  if (!defined($max_header_level)) {
    $self->force_conf('MAX_HEADER_LEVEL', $defaults{'MAX_HEADER_LEVEL'});
  } elsif ($max_header_level < 1) {
    $self->force_conf('MAX_HEADER_LEVEL', 1);
  }

  # For CONTENTS_OUTPUT_LOCATION
  # should lead to contents not output, but if not, it is not an issue,
  # the way to set contents to be output or not should be through the
  # contents and shortcontents @-commands and customization options.
  foreach my $conf ('CONTENTS_OUTPUT_LOCATION', 'INDEX_ENTRY_COLON',
                    'MENU_ENTRY_COLON') {
    if (!defined($self->get_conf($conf))) {
      $self->force_conf($conf, '');
    }
  }

  _load_htmlxref_files($self);
  _prepare_css($self);
}

sub _XS_html_converter_get_customization($$$$$$$$$$$$$$$$$$$) {
}

# conversion with convert and output and the functions they call

# transform <hr> to <hr/>
sub _xhtml_re_close_lone_element($) {
  my $element = shift;

  if ($element =~ /\/\s*>$/) {
    # already a closed lone element
    return $element;
  }
  $element =~ s/^(<[a-zA-Z][^<>]*)>$/$1\/>/;
  return $element;
}

my $xml_named_entity_nbsp = '&nbsp;';

my %special_characters = (
  'paragraph_symbol' => ['&para;', '00B6'],
  'left_quote' => ['&lsquo;', '2018'],
  'right_quote' => ['&rsquo;', '2019'],
  'bullet' => ['&bull;', '2022'],
  'non_breaking_space' => [$xml_named_entity_nbsp, '00A0'],
);

our %default_commands_conversion;
our %default_css_element_class_styles;

# This function initializes states that are initialized either in XS
# or in Perl.  In general called by output or convert, as early as possible.
# May also be called on a converter when output and convert are not used,
# which happens only in tests.
# NOTE not called directly by convert_tree, which means that convert_tree
# needs to be called from a converter which would have had this function
# called already.
#
# $CONTEXT is the first conversion context name.
# $DOCUMENT is the converted Texinfo parsed document.
sub conversion_initialization($$;$) {
  my ($self, $context, $document) = @_;

  $self->{'converter_info'} = {};

  $self->set_document($document);

  if (defined($document)) {
    $self->{'converter_info'}->{'document'} = $document;
  } elsif ($self->get_conf('DEBUG')) {
    print STDERR "REMARK: conversion_initialization: no document\n";
  }

  # needed if a converter is reused
  $self->set_global_document_commands('before', \@informative_global_commands);
  $self->set_global_document_commands('before', \@contents_commands);

  $self->{'css_import_lines'} = [@{$self->{'files_css_import_lines'}}];
  $self->{'css_rule_lines'} = [@{$self->{'files_css_rule_lines'}}];

  $self->{'shared_conversion_state'} = {};

  $self->{'document_context'} = [];
  $self->{'document_global_context_counter'} = 0;

  $self->{'associated_inline_content'} = {};

  foreach my $cmdname (keys(%default_shared_conversion_states)) {
    foreach my $state_name
        (keys(%{$default_shared_conversion_states{$cmdname}})) {
      $self->define_shared_conversion_state($cmdname, $state_name,
          $default_shared_conversion_states{$cmdname}->{$state_name});
    }
  }

  # even if there is no actual file, this is needed if the API is used.
  $self->{'html_files_information'} = {};

  # Needed for CSS gathering, even if nothing related to CSS is output
  $self->{'document_global_context_css'} = {};
  $self->{'page_css'} = {};

  # targets

  # used for diverse tree elements: nodes and sectioning commands, indices,
  # footnotes, special output units elements...
  $self->{'targets'} = {};

  # for footnotes
  $self->{'special_targets'} = {'footnote_location' => {}};

  $self->{'seen_ids'} = {};

  # other
  $self->{'pending_footnotes'} = [];
  $self->{'pending_closes'} = {};

  delete $self->{'current_node'};
  delete $self->{'current_root_command'};

  # for user-defined translation results.  Always reset such as not
  # to get a cached translation obtained for a previous conversion.
  $self->{'translation_cache'} = {};

  my %special_characters_set;

  my $output_encoding = $self->get_conf('OUTPUT_ENCODING_NAME');

  foreach my $special_character (keys(%special_characters)) {
    my ($default_entity, $unicode_point)
           = @{$special_characters{$special_character}};
    if ($self->get_conf('OUTPUT_CHARACTERS')
        and Texinfo::Convert::Unicode::unicode_point_decoded_in_encoding(
                                         $output_encoding, $unicode_point)) {
      $special_characters_set{$special_character}
                                    = charnames::vianame("U+$unicode_point");
    } elsif ($self->get_conf('USE_NUMERIC_ENTITY')) {
      $special_characters_set{$special_character}
                     = '&#'.hex($unicode_point).';';
    } else {
      $special_characters_set{$special_character} = $default_entity;
    }
  }

  $self->{'converter_info'}->{'non_breaking_space'}
    = $special_characters_set{'non_breaking_space'};

  $self->{'converter_info'}->{'paragraph_symbol'}
    = $special_characters_set{'paragraph_symbol'};

  if (not defined($self->get_conf('OPEN_QUOTE_SYMBOL'))) {
    my $set = $self->set_conf('OPEN_QUOTE_SYMBOL',
                      $special_characters_set{'left_quote'});
    # override undef set in init file/command line
    $self->force_conf('OPEN_QUOTE_SYMBOL', '') if (!$set);
  }
  if (not defined($self->get_conf('CLOSE_QUOTE_SYMBOL'))) {
    my $set = $self->set_conf('CLOSE_QUOTE_SYMBOL',
                        $special_characters_set{'right_quote'});
    # override undef set in init file/command line
    $self->force_conf('CLOSE_QUOTE_SYMBOL', '') if (!$set);
  }
  if (not defined($self->get_conf('MENU_SYMBOL'))) {
    my $set = $self->set_conf('MENU_SYMBOL',
                              $special_characters_set{'bullet'});
    # override undef set in init file/command line
    $self->force_conf('MENU_SYMBOL', '') if (!$set);
  }

  my $line_break_element;
  if ($self->get_conf('USE_XML_SYNTAX')) {
    foreach my $customization_variable ('BIG_RULE', 'DEFAULT_RULE') {
      my $variable_value = $self->get_conf($customization_variable);
      if (defined($variable_value)) {
        my $closed_lone_element = _xhtml_re_close_lone_element($variable_value);
        if ($closed_lone_element ne $variable_value) {
          $self->force_conf($customization_variable, $closed_lone_element);
        }
      }
    }
    $line_break_element = '<br/>';
  } else {
    $line_break_element = '<br>';
  }
  $self->{'converter_info'}->{'line_break_element'} = $line_break_element;

  # duplicate such as not to modify the defaults
  my $conf_default_no_arg_commands_formatting_normal
    = Storable::dclone($default_no_arg_commands_formatting{'normal'});

  @sorted_no_arg_commands
    = sort(keys(%{$default_no_arg_commands_formatting{'normal'}}));

  my $non_breaking_space = $self->get_info('non_breaking_space');

  if ($non_breaking_space ne $xml_named_entity_nbsp) {
    foreach my $space_command (' ', "\t", "\n", 'tie') {
      $conf_default_no_arg_commands_formatting_normal->{$space_command}->{'text'}
        = $non_breaking_space;
    }
  }

  if ($self->get_conf('USE_NUMERIC_ENTITY')) {
    foreach my $cmdname (keys(%Texinfo::Convert::Unicode::unicode_entities)) {
      $conf_default_no_arg_commands_formatting_normal->{$cmdname}->{'text'}
       = $Texinfo::Convert::Unicode::unicode_entities{$cmdname};
    }
  }

  $conf_default_no_arg_commands_formatting_normal->{'*'}->{'text'}
    = $self->get_info('line_break_element');

  # NOTE need to be before the call to css_set_selector_style just below
  %{$self->{'css_element_class_styles'}} = %default_css_element_class_styles;

  # initialized here and not with the converter because it may depend on
  # the document encoding.
  $self->{'no_arg_commands_formatting'} = {};
  # use sorted for reproducible debug output
  foreach my $cmdname (@sorted_no_arg_commands) {
    $self->{'no_arg_commands_formatting'}->{$cmdname} = {};
    # For now, there are no 'translated_to_convert' Texinfo code for
    # no args commands in the default case.  The translated command
    # is common to diverse output formats
    if (defined($self->{'customized_no_arg_commands_formatting'}
                 ->{$cmdname}->{'translated_to_convert'})) {
      $self->{'no_arg_commands_formatting'}->{$cmdname}
          ->{'translated_to_convert'}
        = $self->{'customized_no_arg_commands_formatting'}
            ->{$cmdname}->{'translated_to_convert'};
    }
    foreach my $context (@no_args_commands_contexts) {
      my $no_arg_command_customized_formatting
        = $self->{'customized_no_arg_commands_formatting'}
                                             ->{$cmdname}->{$context};
      if (defined($no_arg_command_customized_formatting)) {
        $self->{'no_arg_commands_formatting'}->{$cmdname}->{$context}
           = $no_arg_command_customized_formatting;
      } else {
        my $context_default_default_no_arg_commands_formatting;
        if ($context eq 'normal') {
          $context_default_default_no_arg_commands_formatting
           = $conf_default_no_arg_commands_formatting_normal;
        } else {
          $context_default_default_no_arg_commands_formatting
           = $default_no_arg_commands_formatting{$context};
        }
        if (defined($context_default_default_no_arg_commands_formatting
                                                              ->{$cmdname})) {
          if ($self->get_conf('OUTPUT_CHARACTERS')
              and Texinfo::Convert::Unicode::brace_no_arg_command(
                         $cmdname, $self->get_conf('OUTPUT_ENCODING_NAME'))) {
            $self->{'no_arg_commands_formatting'}->{$cmdname}->{$context}
              = { 'text' => Texinfo::Convert::Unicode::brace_no_arg_command(
                           $cmdname, $self->get_conf('OUTPUT_ENCODING_NAME'))};
            # reset CSS for itemize command arguments
            if ($context eq 'css_string'
                and exists($brace_commands{$cmdname})
                and $cmdname ne 'bullet' and $cmdname ne 'w'
                and not $special_list_mark_css_string_no_arg_command{$cmdname}) {
              my $css_string
                = $self->{'no_arg_commands_formatting'}
                                    ->{$cmdname}->{$context}->{'text'};
              $css_string = '"'.$css_string.'"';

              css_set_selector_style($self, "ul.mark-$cmdname",
                                     "list-style-type: $css_string");
            }
          } else {
            $self->{'no_arg_commands_formatting'}->{$cmdname}->{$context}
              = $context_default_default_no_arg_commands_formatting->{$cmdname};
          }
        } else {
          # not possible for the normal context because the commands come
          # from the normal context defaults, and in addition there should
          # be normal context defaults for all the nobrace brace commands
          # except for @today
          #if ($context eq 'normal') {
          #  die "Brace no args command normal no set for $cmdname";
          #}
          $self->{'no_arg_commands_formatting'}->{$cmdname}->{$context}
            = {'unset' => 1};
        }
      }
    }
  }

  # set sane defaults in case there is none and the default formatting
  # function is used
  foreach my $cmdname (@sorted_no_arg_commands) {
    if (exists($self->{'commands_conversion'}->{$cmdname})
        and $self->{'commands_conversion'}->{$cmdname}
            eq $default_commands_conversion{$cmdname}) {
      _complete_no_arg_commands_formatting($self, $cmdname);
    }
  }

  # for global directions always set, and for directions to special elements,
  # only filled if special elements are actually used.
  $self->{'global_units_directions'} = {};

  # three types of direction strings:
  # * strings not translated, already converted
  # * strings translated
  #   - strings already converted
  #   - strings not already converted
  $self->{'directions_strings'} = {};

  # The strings not translated, already converted are
  # initialized here and not with the converter because
  # substitute_html_non_breaking_space is used and it depends on the document.
  foreach my $string_type (keys(%default_converted_directions_strings)) {
    $self->{'directions_strings'}->{$string_type} = {};
    foreach my $direction (keys(%{$self->{'all_directions'}})) {
      $self->{'directions_strings'}->{$string_type}->{$direction} = {};
      my $string_contexts;
      if (exists($self->{'customized_direction_strings'}->{$string_type})
          and exists($self->{'customized_direction_strings'}->{$string_type}
                                                           ->{$direction})) {
        if (defined($self->{'customized_direction_strings'}->{$string_type}
                                              ->{$direction}->{'converted'})) {
          $string_contexts
            = $self->{'customized_direction_strings'}->{$string_type}
                                          ->{$direction}->{'converted'};
        } else {
          $string_contexts = {'normal' => undef };
        }
      } else {
        my $string
          = $default_converted_directions_strings{$string_type}->{$direction};
        $string_contexts = {'normal' => $string};
      }
      $string_contexts->{'string'} = $string_contexts->{'normal'}
        if (not defined($string_contexts->{'string'}));
      foreach my $context (keys(%$string_contexts)) {
        if (defined($string_contexts->{$context})) {
          $self->{'directions_strings'}->{$string_type}
                                     ->{$direction}->{$context}
            = $self->substitute_html_non_breaking_space(
                                             $string_contexts->{$context});
        } else {
          $self->{'directions_strings'}->{$string_type}
                                     ->{$direction}->{$context} = undef;
        }
      }
    }
  }

  # direction strings
  foreach my $string_type (keys(%default_translated_directions_strings)) {
    # those will be determined from translatable strings
    $self->{'directions_strings'}->{$string_type} = {};
  };

  # to avoid infinite recursions when a section refers to itself, possibly
  # indirectly
  $self->{'referred_command_stack'} = [];

  $self->{'check_htmlxref_already_warned'} = {};

  $self->{'converter_info'}->{'expanded_formats'}
    = $self->{'expanded_formats'};

  $self->{'multiple_pass'} = [];

  if (not defined($self->get_conf('NODE_NAME_IN_INDEX'))) {
    $self->set_conf('NODE_NAME_IN_INDEX', $self->get_conf('USE_NODES'));
  }

  if ($self->get_conf('HTML_MATH')
      and not defined($self->get_conf('CONVERT_TO_LATEX_IN_MATH'))) {
    $self->set_conf('CONVERT_TO_LATEX_IN_MATH', 1);
  }

  if ($self->get_conf('CONVERT_TO_LATEX_IN_MATH')) {
    $self->{'options_latex_math'}
     = { Texinfo::Convert::LaTeX::copy_options_for_convert_to_latex_math($self) };
  }

  if ($self->get_conf('NO_TOP_NODE_OUTPUT')
      and not defined($self->get_conf('SHOW_TITLE'))) {
    $self->set_conf('SHOW_TITLE', 1);
  }

  my $use_accesskey = $self->get_conf('USE_ACCESSKEY');
  if (!defined($use_accesskey) and $self->get_conf('SPLIT')
      and $self->get_conf('SPLIT') eq 'node') {
    $self->set_conf('USE_ACCESSKEY', 1);
  }

  _new_document_context($self, $context);
}

sub conversion_finalization($) {
  my $self = shift;

  _pop_document_context($self);
}

sub _prepare_title_titlepage($$$$) {
  my ($self, $output_file, $output_filename, $output_units) = @_;

  # set file name to be the first file name for formatting of title page.
  # The title page prepared here is thus only fit to be used in the first
  # output unit.
  if ($output_file ne '') {
    $self->{'current_filename'}
      = $output_units->[0]->{'unit_filename'};
  } else {
    $self->{'current_filename'} = $output_filename;
  }

  # title
  $self->{'converter_info'}->{'title_titlepage'}
    = &{$self->formatting_function('format_title_titlepage')}($self);
  delete $self->{'current_filename'};
}

sub _html_convert_convert($$$$) {
  my ($self, $document, $output_units, $special_units) = @_;

  my $result = '';

  $self->{'current_filename'} = '';

  my $unit_nr = 0;
  # NOTE there is no rule before the footnotes special element in
  # case of separate footnotes in this setting.
  my $debug = $self->get_conf('DEBUG');
  foreach my $output_unit (@$output_units, @$special_units) {
    print STDERR "\nUNIT $unit_nr\n" if ($debug);
    my $output_unit_text = $self->convert_output_unit($output_unit,
                                               "convert unit $unit_nr");
    $result .= $output_unit_text;
    $unit_nr++;
  }
  delete $self->{'current_filename'};
  return $result;
}

sub _prepare_simpletitle($) {
  my $self = shift;

  if (exists($self->{'document'})) {
    my $global_commands = $self->{'document'}->global_commands_information();
    if (defined($global_commands)) {
      foreach my $simpletitle_command ('settitle', 'shorttitlepage') {
        if (exists($global_commands->{$simpletitle_command})) {
          my $command = $global_commands->{$simpletitle_command};
          next if (!exists($command->{'contents'}->[0]->{'contents'}));
          $self->{'converter_info'}->{'simpletitle_tree'}
             = $command->{'contents'}->[0];
          $self->{'converter_info'}->{'simpletitle_command_name'}
             = $simpletitle_command;
          last;
        }
      }
    }
  }
}

# Common to output and convert, run after the first handler in output.
sub _init_conversion_after_setup_handler($) {
  my $self = shift;

  # the presence of contents elements in the document is used in diverse
  # places, set it once for all here
  my @contents_elements_options
                  = grep {Texinfo::Common::valid_customization_option($_)}
                        sort(keys(%contents_command_special_unit_variety));
  $self->set_global_document_commands('last', \@contents_elements_options);

  # cache, as it is checked for each text element
  if ($self->get_conf('OUTPUT_CHARACTERS')
      and $self->get_conf('OUTPUT_ENCODING_NAME')
      and $self->get_conf('OUTPUT_ENCODING_NAME') eq 'utf-8') {
    $self->{'use_unicode_text'} = 1;
  }
}

sub _setup_convert($) {
  my $self = shift;

  _init_conversion_after_setup_handler($self);
}

# Conversion to a string, mostly used in tests.
# $SELF is the output converter object of class Texinfo::Convert::HTML (this
# module), and $DOCUMENT is the parsed document from the parser and structuring
sub convert($$) {
  my ($self, $document) = @_;

  $self->conversion_initialization('_convert', $document);

  _setup_convert($self);

  my ($output_units, $special_units, $associated_special_units)
    = _prepare_conversion_units($self, $document, undef);

  # setup global targets.  It is not clearly relevant to have those
  # global targets when called as convert, but the Top global
  # unit directions is often referred to in code, so at least this
  # global target needs to be setup.
  # Since the relative directions are not set, this leads to lone
  # global direction buttons such as [Contents] or [Index] appearing
  # in otherwise empty navigation headings if those global directions
  # are set and present in the buttons, as is the case in the default
  # buttons.  For example in converters_tests/ref_in_sectioning
  # or converters_tests/sections_and_printindex.
  _prepare_output_units_global_targets($self, $output_units,
                                              $special_units,
                                              $associated_special_units);

  # setup untranslated strings
  _translate_names($self);

  _prepare_simpletitle($self);

  # title.  Not often set in the default case, as convert() is only
  # used in the *.t tests, and a title requires both simpletitle_tree
  # and SHOW_TITLE set, with the default formatting function.
  _prepare_title_titlepage($self, '', '', $output_units);

  # main conversion here
  my $result = _html_convert_convert($self, $document, $output_units,
                                            $special_units);

  $self->conversion_finalization();
  return $result;
}

# Get the name of a file containing a label, as well as the identifier within
# that file to link to that label.  $normalized is the normalized label name
# and $label_element is the label contents element.  Labels are typically
# associated to @node, @*anchor or @float and to external nodes.
sub _normalized_label_id_file($$$) {
  my ($self, $normalized, $label_element) = @_;

  my $target;
  if (!defined($normalized) and defined($label_element)) {
    $normalized
      = Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
        $label_element);
  }

  if (defined($normalized)) {
    $target = _normalized_to_id($normalized);
  } else {
    $target = '';
  }
  # to find out the Top node, one could check $normalized
  if (defined($self->{'file_id_setting'}->{'label_target_name'})) {
    $target = &{$self->{'file_id_setting'}->{'label_target_name'}}($self,
                             $normalized, $label_element, $target);
  }

  my $filename = $self->node_information_filename($normalized,
                                                  $label_element);

  return ($filename, $target);
}

sub _register_id($$) {
  my ($self, $id) = @_;

  $self->{'seen_ids'}->{$id} = 1;
}

sub _id_is_registered($$) {
  my ($self, $id) = @_;

  if (exists($self->{'seen_ids'}->{$id})) {
    return 1;
  } else {
    return 0;
  }
}

sub _unique_target($$) {
  my ($self, $target_base) = @_;

  my $nr=1;
  my $target = $target_base;
  while (_id_is_registered($self, $target)) {
    $target = $target_base.'-'.$nr;
    $nr++;
    # Avoid integer overflow
    die if ($nr == 0);
  }
  return $target;
}

sub _register_special_unit($$) {
  my ($self, $special_unit_variety) = @_;

  my $special_unit = {'unit_type' => 'special_unit',
                      'special_unit_variety' => $special_unit_variety,
                      'directions' => {}};

  # a "virtual" out of tree element used for targets
  my $unit_command
    = Texinfo::TreeElement::new({'type' => 'special_unit_element',
                                 'associated_unit' => $special_unit});
  $special_unit->{'unit_command'} = $unit_command;

  return $special_unit;
}

# prepare both special output units in separate output units, and
# special output units associated to a regular document output unit,
# output as part of regular output but also possible target of
# special output unit direction.  In practice, only contents and
# shortcontents are associated with special output unit directions
# and can be output as part of document output units.
sub _prepare_special_units($$) {
  my ($self, $output_units) = @_;

  my $global_commands;
  my $sections_list;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
    $sections_list = $self->{'document'}->sections_list();
  }

  # for separate special output units
  my %do_special;
  # for associated special output units
  my $associated_special_units = [];
  if (defined($sections_list) and scalar(@{$sections_list}) > 1) {
    foreach my $cmdname ('shortcontents', 'contents') {
      my $special_unit_variety
          = $contents_command_special_unit_variety{$cmdname};
      if ($self->get_conf($cmdname)) {
        my $contents_location = $self->get_conf('CONTENTS_OUTPUT_LOCATION');
        if ($contents_location eq 'separate_element') {
          $do_special{$special_unit_variety} = 1;
        } else {
          my $associated_output_unit;
          if ($contents_location eq 'after_title') {
            $associated_output_unit = $output_units->[0];
          } elsif ($contents_location eq 'after_top') {
            if (defined($global_commands)
                and exists($global_commands->{'top'})) {
              my $section_top = $global_commands->{'top'};
              if (exists($section_top->{'associated_unit'})) {
                $associated_output_unit = $section_top->{'associated_unit'};
              }
            }
            next unless ($associated_output_unit);
          } elsif ($contents_location eq 'inline') {
            if (defined($global_commands)
                and exists($global_commands->{$cmdname})) {
              foreach my $command(@{$global_commands->{$cmdname}}) {
                my $root_command;
                ($associated_output_unit, $root_command)
                  = _html_get_tree_root_element($self, $command);
                if (defined($associated_output_unit)) {
                  last;
                }
              }
            } else {
              next;
            }
          } else {
            # only happens with an unknown CONTENTS_OUTPUT_LOCATION
            next;
          }
          my $special_unit = _register_special_unit($self, $special_unit_variety);
          $special_unit->{'associated_document_unit'} = $associated_output_unit;
          push @$associated_special_units, $special_unit;
        }
      }
    }
  }

  if (defined($global_commands) and exists($global_commands->{'footnote'})
      and scalar(@$output_units) > 1) {
    my $footnotestyle = $self->get_conf('footnotestyle');
    if (defined($footnotestyle) and $footnotestyle eq 'separate') {
      $do_special{'footnotes'} = 1;
    }
  }

  if ((!defined($self->get_conf('DO_ABOUT'))
       and scalar(@$output_units) > 1
       and ($self->get_conf('SPLIT') or $self->get_conf('HEADERS')))
      or ($self->get_conf('DO_ABOUT'))) {
    $do_special{'about'} = 1;
  }

  my $special_units = [];
  # sort special elements according to their index order from
  # special_unit_info 'order'.
  # First reverse the hash, using arrays in case some elements are at the
  # same index, and sort to get alphabetically sorted special element
  # varieties that are at the same index.
  my %special_units_indices;
  foreach my $special_unit_variety
      (sort($self->get_special_unit_info_varieties('order'))) {
    next unless ($do_special{$special_unit_variety});
    my $index = $self->special_unit_info('order', $special_unit_variety);
    $special_units_indices{$index} = []
      if (not exists($special_units_indices{$index}));
    push @{$special_units_indices{$index}}, $special_unit_variety;
  }
  # now sort according to indices
  my @sorted_elements_varieties;
  foreach my $index (sort { $a <=> $b } (keys(%special_units_indices))) {
    push @sorted_elements_varieties, @{$special_units_indices{$index}};
  }


  # Setup separate special output units
  my $previous_output_unit;
  $previous_output_unit = $output_units->[-1];

  foreach my $special_unit_variety (@sorted_elements_varieties) {

    my $special_unit = _register_special_unit($self, $special_unit_variety);

    push @$special_units, $special_unit;

    if (defined($previous_output_unit)) {
      $special_unit->{'tree_unit_directions'} = {};
      $previous_output_unit->{'tree_unit_directions'} = {}
        if (not exists($previous_output_unit->{'tree_unit_directions'}));
      $special_unit->{'tree_unit_directions'}->{'prev'} = $previous_output_unit;
      $previous_output_unit->{'tree_unit_directions'}->{'next'} = $special_unit;
    }
    $previous_output_unit = $special_unit;
  }

  return $special_units, $associated_special_units;
}

sub _new_sectioning_command_target($$) {
  my ($self, $command) = @_;

  my ($normalized_name, $filename, $target);

  my $registered_target;
  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'identifier'})) {
    # case of a sectioning command that is also a target for cross-references.
    $registered_target = $self->{'targets'}->{$command};
    $target = $registered_target->{'target'};
    $filename = $registered_target->{'node_filename'};
    $normalized_name = $command->{'extra'}->{'identifier'};
  } else {
    ($normalized_name, $filename)
     = $self->normalized_sectioning_command_filename($command);

    my $target_base = _normalized_to_id($normalized_name);
    if ($target_base !~ /\S/ and $command->{'cmdname'} eq 'top') {
      # @top is allowed to be empty.  In that case it gets this target name
      $target_base = 'SEC_Top';
      $normalized_name = $target_base;
    }
    my $nr=1;
    $target = $target_base;
    if ($target_base ne '') {
      $target = _unique_target($self, $target_base);
    } else {
      $target = '';
    }
  }

  # These are undefined if the $target is set to ''.
  my $target_contents;
  my $target_shortcontents;
  if (exists($sectioning_heading_commands{$command->{'cmdname'}})) {
    if ($target ne '') {
      my $target_base_contents = 'toc-'.$normalized_name;
      $target_contents = _unique_target($self, $target_base_contents);

      my $target_base_shortcontents = 'stoc-'.$normalized_name;
      $target_shortcontents
        = _unique_target($self, $target_base_shortcontents);
    }
  }

  if (defined($self->{'file_id_setting'}->{'sectioning_command_target_name'})) {
    ($target, $target_contents,
     $target_shortcontents, $filename)
      = &{$self->{'file_id_setting'}->{'sectioning_command_target_name'}}($self,
                                     $command, $target,
                                     $target_contents,
                                     $target_shortcontents,
                                     $filename);
  }

  if (!defined($registered_target)) {
    if ($self->get_conf('DEBUG')) {
      print STDERR "Register $command->{'cmdname'} $target\n";
    }
    $self->{'targets'}->{$command} = {'target' => $target};
    _register_id($self, $target);
  } else {
    # reset in case they were modified by the user.
    $self->{'targets'}->{$command}->{'node_filename'} = $filename;
    $self->{'targets'}->{$command}->{'target'} = $target;
  }

  $self->{'targets'}->{$command}->{'section_filename'} = $filename;

  if (defined($target_contents)) {
    $self->{'targets'}->{$command}->{'contents_target'} = $target_contents;
    _register_id($self, $target_contents);
  } else {
    $self->{'targets'}->{$command}->{'contents_target'} = '';
  }
  if (defined($target_shortcontents)) {
    $self->{'targets'}->{$command}->{'shortcontents_target'}
       = $target_shortcontents;
    _register_id($self, $target_shortcontents);
  } else {
    $self->{'targets'}->{$command}->{'shortcontents_target'} = '';
  }
}

sub _set_special_units_targets_files($$$) {
  my ($self, $special_units, $document_name) = @_;

  my $extension = '';
  $extension = $self->get_conf('EXTENSION')
    if (defined($self->get_conf('EXTENSION')));

  my $debug = $self->get_conf('DEBUG');
  foreach my $special_unit (@$special_units) {

    my $special_unit_variety = $special_unit->{'special_unit_variety'};

    # it may be undef'ined in user customization code
    my $target
        = $self->special_unit_info('target', $special_unit_variety);
    next if (!defined($target));
    my $default_filename;
    if ($self->get_conf('SPLIT') or !$self->get_conf('MONOLITHIC')
        # in general $document_name not defined means called through convert
        and defined($document_name)) {
      my $special_unit_file_string =
         $self->special_unit_info('file_string', $special_unit_variety);
      $special_unit_file_string = '' if (!defined($special_unit_file_string));
      $default_filename = $document_name . $special_unit_file_string;
      $default_filename .= '.'.$extension if (defined($extension));
    } else {
      $default_filename = undef;
    }

    my $filename;
    if (defined($self->{'file_id_setting'}->{'special_unit_target_file_name'})) {
      ($target, $filename)
         = &{$self->{'file_id_setting'}->{'special_unit_target_file_name'}}(
                                                            $self,
                                                            $special_unit,
                                                            $target,
                                                            $default_filename);
    }
    $filename = $default_filename if (!defined($filename));

    if ($debug) {
      my $fileout = $filename;
      $fileout = 'UNDEF' if (!defined($fileout));
      print STDERR 'Add special'
        # uncomment for the perl object name
        #." $special_unit"
        ." $special_unit_variety: target $target,\n".
        "    filename $fileout\n";
    }

    my $unit_command = $special_unit->{'unit_command'};
    $self->{'targets'}->{$unit_command} = {'target' => $target,
                                      'special_unit_filename' => $filename,
                                     };
    _register_id($self, $target);
  }
}

sub _prepare_associated_special_units_targets($$) {
  my ($self, $associated_output_units) = @_;

  return unless (defined($associated_output_units));

  my $debug = $self->get_conf('DEBUG');
  foreach my $special_unit (@$associated_output_units) {
    my $special_unit_variety = $special_unit->{'special_unit_variety'};

    # it may be undef'ined in user customization code
    my $target
      = $self->special_unit_info('target', $special_unit_variety);

    my $default_filename;

    my $filename;
    if (defined($self->{'file_id_setting'}->{'special_unit_target_file_name'})) {
      ($target, $filename)
        = &{$self->{'file_id_setting'}->{'special_unit_target_file_name'}}(
                                                      $self,
                                                      $special_unit,
                                                      $target,
                                                      $default_filename);
    }
    $filename = $default_filename if (!defined($filename));
    if ($debug) {
      my $str_filename = $filename;
      $str_filename = 'UNDEF (default)' if (not defined($str_filename));
      my $str_target = $target;
      $str_target = 'UNDEF' if (not defined($str_target));
      print STDERR 'Add content'
        # uncomment to get the perl object name
        #." $special_unit"
            ." $special_unit_variety: target $str_target,\n".
             "    filename $str_filename\n";
    }

    my $unit_command = $special_unit->{'unit_command'};
    my $command_target = {'target' => $target};
    $self->{'targets'}->{$unit_command} = $command_target;
    if (defined($target)) {
      _register_id($self, $target);
    }
    if (defined ($filename)) {
      $command_target->{'special_unit_filename'}
        = $filename;
    }
  }
}

# This set with two different codes
#  * the target information, id and normalized filename of 'identifiers_target',
#    ie everything that may be the target of a ref: @node, @float label,
#    @anchor, @namedanchor and sectioning commands without associated node.
#  * The target information of sectioning elements.  Sectioning commands
#    without associated node are processed a second time, to set specific
#    sectioning command information.
# @node and section commands targets are therefore both set.
#
# conversion to HTML is done on-demand, upon call to command_text
# and similar functions.
# Note that 'node_filename', which is set here for Top target information
# too, is not used later for Top anchors or links, see the NOTE below
# associated with setting TOP_NODE_FILE_TARGET.
sub _set_root_commands_targets_node_files($) {
  my $self = shift;

  my $sections_list;
  my $labels_list;
  if (exists($self->{'document'})) {
    $sections_list = $self->{'document'}->sections_list();
    $labels_list = $self->{'document'}->labels_list();
  }

  if (defined($labels_list)) {
    my $debug = $self->get_conf('DEBUG');
    my $extension = '';
    $extension = '.'.$self->get_conf('EXTENSION')
                if (defined($self->get_conf('EXTENSION'))
                    and $self->get_conf('EXTENSION') ne '');

    foreach my $target_element (@$labels_list) {
      next if (not exists($target_element->{'extra'})
               or not $target_element->{'extra'}->{'is_target'});
      my $label_element = Texinfo::Common::get_label_element($target_element);
      my ($node_filename, $target)
        = _normalized_label_id_file($self, $target_element->{'extra'}
                                                              ->{'identifier'},
                                           $label_element);
      $node_filename .= $extension;
      if (defined($self->{'file_id_setting'}->{'node_file_name'})) {
        # a non defined filename is ok if called with convert, but not
        # if output in files.  We reset if undef, silently unless verbose
        # in case called by convert.
        my $user_node_filename
              = &{$self->{'file_id_setting'}->{'node_file_name'}}(
                                       $self, $target_element, $node_filename);
        if (defined($user_node_filename)) {
          $node_filename = $user_node_filename;
        } elsif ($self->get_conf('VERBOSE')) {
          $self->converter_document_warn(sprintf(__(
              "user-defined node file name not set for `%s'"),
              $node_filename));
        } elsif ($debug) {
          warn "user-defined node file name undef for `$node_filename'\n";
        }
      }
      if ($debug) {
        print STDERR 'Label'
         # uncomment to get the perl object names
         #."($target_element)"
          ." \@$target_element->{'cmdname'} $target, $node_filename\n";
      }
      $self->{'targets'}->{$target_element} = {'target' => $target,
                                           'node_filename' => $node_filename};
      _register_id($self, $target);
    }
  }

  if (defined($sections_list)) {
    foreach my $section_relations (@{$sections_list}) {
      my $section_element = $section_relations->{'element'};
      _new_sectioning_command_target($self, $section_element);
    }
  }
}

sub _set_heading_commands_targets($) {
  my $self = shift;

  my $global_commands;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
  }
  if (defined($global_commands)) {
    foreach my $cmdname (sort(keys(%sectioning_heading_commands)),
                         'xrefname') {
      if (!exists($root_commands{$cmdname})
          and exists($global_commands->{$cmdname})) {
        foreach my $command (@{$global_commands->{$cmdname}}) {
          _new_sectioning_command_target($self, $command);
        }
      }
    }
  }
}

sub _prepare_index_entries_targets($) {
  my $self = shift;

  my $indices_information;
  if (exists($self->{'document'})) {
    $indices_information = $self->{'document'}->indices_information();
  }

  if (defined($indices_information)) {
    foreach my $index_name (sort(keys(%$indices_information))) {
      foreach my $index_entry (@{$indices_information->{$index_name}
                                                    ->{'index_entries'}}) {
        my $main_entry_element = $index_entry->{'entry_element'};
        # does not refer to the document
        my $seeentry
         = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                       'seeentry');
        next if (defined($seeentry));
        my $seealso
         = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                       'seealso');
        next if (defined($seealso));

        my $region = '';
        $region = "$main_entry_element->{'extra'}->{'element_region'}-"
          if (defined($main_entry_element->{'extra'}->{'element_region'}));
        my $entry_reference_content_element
          = $self->converter_index_content_element($main_entry_element, 1);
        # construct element to convert to a normalized identifier to use as
        # hrefs target
        my $normalize_index_element = Texinfo::TreeElement::new(
           {'contents' => [$entry_reference_content_element]});

        my $subentries_tree
         = Texinfo::Convert::Utils::comma_index_subentries_tree(
                                               $main_entry_element, ' ');

        if (defined($subentries_tree)) {
          push @{$normalize_index_element->{'contents'}},
                    @{$subentries_tree->{'contents'}};
        }

        my $normalized_index =
          Texinfo::Convert::NodeNameNormalization::convert_to_identifier(
                                                 $normalize_index_element);
        my $target_base = "index-" . $region .$normalized_index;
        my $target = _unique_target($self, $target_base);
        _register_id($self, $target);
        my $target_element = $main_entry_element;
        $target_element = $index_entry->{'entry_associated_element'}
          if ($index_entry->{'entry_associated_element'});
        $self->{'targets'}->{$target_element} = {'target' => $target, };
      }
    }
  }
}

sub _prepare_footnotes_targets($) {
  my $self = shift;

  my $footid_base = 'FOOT';
  my $docid_base = 'DOCF';

  my $global_commands;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
  }

  if (defined($global_commands) and exists($global_commands->{'footnote'})) {
    my $debug = $self->get_conf('DEBUG');
    my $footnote_nr = 0;
    foreach my $footnote (@{$global_commands->{'footnote'}}) {
      $footnote_nr++;
      my $nr = $footnote_nr;
      # anchor for the footnote text
      my $footid = $footid_base.$nr;
      # anchor for the location of the @footnote in the document
      my $docid = $docid_base.$nr;
      while (_id_is_registered($self, $docid)
             or _id_is_registered($self, $footid)) {
        $nr++;
        $footid = $footid_base.$nr;
        $docid = $docid_base.$nr;
        # Avoid integer overflow
        die if ($nr == 0);
      }
      _register_id($self, $footid);
      _register_id($self, $docid);
      $self->{'targets'}->{$footnote} = { 'target' => $footid };
      $self->{'special_targets'}->{'footnote_location'}->{$footnote}
         = { 'target' => $docid };
      print STDERR 'Enter footnote'
        # uncomment for the perl object name
        #." $footnote"
        .": target $footid, nr $footnote_nr\n"
       .Texinfo::Convert::Texinfo::convert_to_texinfo($footnote)."\n"
          if ($debug);
    }
  }
}

# $DOCUMENT is a Texinfo document with a parsed tree.  Return a list of the
# "elements" we need to output in the HTML file(s).  Each "element" is what
# can go in one HTML file, such as the content between @node lines in the
# Texinfo source.
# Also setup targets associated to tree elements and to elements associated
# to special units.
sub _prepare_conversion_units($$$) {
  my ($self, $document, $document_name) = @_;

  my ($output_units, $special_units, $associated_special_units);

  if ($self->get_conf('USE_NODES')) {
    $output_units = Texinfo::OutputUnits::split_by_node($document);
  } else {
    $output_units = Texinfo::OutputUnits::split_by_section($document);
  }

  # Needs to be set early in case it would be needed to find some region
  # command associated root command.
  $self->{'document_units'} = $output_units;

  # configuration used to determine if a special element is to be done
  # (in addition to contents)
  my @conf_for_special_units = ('footnotestyle');
  $self->set_global_document_commands('last', \@conf_for_special_units);
  # NOTE if the last value of footnotestyle is separate, all the footnotes
  # formatted text are set to the special element set in _prepare_special_units
  # as _html_get_tree_root_element uses the Footnote direction for every
  # footnote.  Therefore if @footnotestyle separate is set late in the
  # document the current value may not be consistent with the link obtained
  # for the footnote formatted text.  This is not an issue, as the manual
  # says that @footnotestyle should only appear in the preamble, and it
  # makes sense to have something consistent in the whole document for
  # footnotes position.
  ($special_units, $associated_special_units)
     = _prepare_special_units($self, $output_units);
  # reset to the default
  $self->set_global_document_commands('before', \@conf_for_special_units);

  # Do that before the other elements, to be sure that special page ids
  # are registered before elements id are.
  _set_special_units_targets_files($self, $special_units, $document_name);

  _prepare_associated_special_units_targets($self, $associated_special_units);

  _set_root_commands_targets_node_files($self);

  _prepare_index_entries_targets($self);
  _prepare_footnotes_targets($self);

  _set_heading_commands_targets($self);

  $self->register_output_units_lists([$output_units,
                                 $special_units, $associated_special_units]);

  return ($output_units, $special_units, $associated_special_units);
}

# Associate output units to the global targets, First, Last, Top, Index.
sub _prepare_output_units_global_targets($$$$) {
  my ($self, $output_units, $special_units, $associated_special_units) = @_;

  $self->{'global_units_directions'}->{'First'} = $output_units->[0];
  $self->{'global_units_directions'}->{'Last'} = $output_units->[-1];

  $self->{'global_units_directions'}->{'Top'}
    = _get_top_unit($self, $output_units);

  my $global_commands;
  my $nodes_list;
  my $sections_list;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
    $nodes_list = $self->{'document'}->nodes_list();
    $sections_list = $self->{'document'}->sections_list();
  }

  # Associate Index with the last @printindex.  According to Werner Lemberg,
  # "the most general index is normally the last one, not the first"
  # https://lists.gnu.org/archive/html/bug-texinfo/2025-01/msg00019.html
  #
  # It is always the last printindex, even if it is not output (for example
  # it is in @copying and @titlepage, which are certainly wrong constructs).
  if (defined($global_commands) and exists($global_commands->{'printindex'})) {
    # Here document_unit can only be a document unit, or maybe undef if there
    # are no document unit at all
    my ($document_unit, $root_command)
     = _html_get_tree_root_element($self,
                               $global_commands->{'printindex'}->[-1]);
    if (defined($document_unit)) {
      if (defined($root_command)) {
        my $section_relations;
        if ($root_command->{'cmdname'} eq 'node') {
          if (defined($nodes_list)) {
            my $node_relations
              = $nodes_list->[$root_command->{'extra'}->{'node_number'} -1];
            if (exists($node_relations->{'associated_section'})) {
              $section_relations = $node_relations->{'associated_section'};
            }
          }
        } else {
          $section_relations
            = $sections_list->[$root_command->{'extra'}->{'section_number'} -1];
        }

        # find the first level 1 sectioning element to associate the printindex
        # with.  May not work correctly if structuring was not done
        if ($section_relations) {
          my $current_command = $section_relations->{'element'};
          while (exists($current_command->{'extra'})
                 and defined($current_command->{'extra'}->{'section_level'})
                 and $current_command->{'extra'}->{'section_level'} > 1
                 and exists($section_relations->{'section_directions'})
                 and exists($section_relations->{'section_directions'}->{'up'})
                 and exists($section_relations->{'section_directions'}->{'up'}
                                    ->{'element'}->{'associated_unit'})) {
            $section_relations
              = $section_relations->{'section_directions'}->{'up'};
            $current_command = $section_relations->{'element'};
            $document_unit = $current_command->{'associated_unit'};
          }
        }
      }
      $self->{'global_units_directions'}->{'Index'} = $document_unit;
    }
  }

  if ($self->{'customized_global_directions'}) {
    foreach my $direction (sort(keys(%{$self->{'customized_global_directions'}}))) {
      my $node_texi_name
        = $self->{'customized_global_directions'}->{$direction};
      if (defined($node_texi_name)
          and not defined($self->global_direction_text($direction))) {
        # Determine the document unit corresponding to the direction
        # node name Texinfo code

        # Parse the customized direction node name Texinfo code
        my $node_element;
        my $parser = Texinfo::Parser::parser({'NO_INDEX' => 1,
                                              'NO_USER_COMMANDS' => 1,});
        my $tree = $parser->parse_string($node_texi_name, undef, 1);
        my $errors = $parser->errors();
        my $errors_count = Texinfo::Report::count_errors($errors);
        if ($errors_count) {
          warn "Global $direction node name parsing $errors_count error(s)\n";
          warn "node name: $node_texi_name\n";
          warn "Error messages: \n";
          foreach my $error_message (@$errors) {
            warn $error_message->{'error_line'};
          }
        }

        # convert to identifier and determine the node element target
        if ($tree) {
          my $normalized_node
   = Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier($tree);
          if ($normalized_node ne '' and $normalized_node =~ /[^-]/) {
            $node_element
              = $self->converter_find_identifier_target($normalized_node);
          }
        }
        if (!defined($node_element)) {
          $self->converter_document_warn(
               sprintf(__("could not find %s node `%s'"),
                       $direction, $node_texi_name));
        } else {
          $self->{'global_units_directions'}->{$direction}
            = $node_element->{'associated_unit'};
        }
      }
    }
  }

  if ($self->get_conf('DEBUG')) {
    # TODO also show the global directions added by the user
    print STDERR "GLOBAL DIRECTIONS:\n";
    foreach my $global_direction (@global_directions_order) {
      my $global_unit = $self->global_direction_unit($global_direction);
      if (defined($global_unit)) {
        print STDERR " $global_direction"
            # uncomment to get the perl object name
            # ."($global_unit)"
     .': '. Texinfo::OutputUnits::output_unit_texi($global_unit)."\n";
      }
    }
    print STDERR "TEXT DIRECTIONS:\n";
    foreach my $text_direction (@text_directions_order) {
      if ($self->global_direction_text($text_direction)) {
        my $text_value = $self->direction_string($text_direction, 'button');
        if (defined($text_value)) {
          print STDERR " $text_direction {$text_value}\n";
        }
      }
    }

    print STDERR "\n";
  }

  # TODO show the special units directions if DEBUG is set?
  foreach my $units_list ($special_units, $associated_special_units) {
    if (defined($units_list) and scalar(@$units_list)) {
      foreach my $special_unit (@$units_list) {
        my $special_unit_variety = $special_unit->{'special_unit_variety'};
        my $special_unit_direction
         = $self->special_unit_info('direction', $special_unit_variety);
        $self->{'global_units_directions'}->{$special_unit_direction}
         = $special_unit;
      }
    }
  }
}

sub _html_set_pages_files($$$$$$$$) {
  my ($self, $output_units, $special_units, $associated_output_units,
      $output_file, $destination_directory, $output_filename,
      $document_name) = @_;

  my @filenames_order;
  my %unit_file_name_paths;
  # associate a file to the source information leading to set the file
  # name.  Use the first element source information associated to a file.
  # The source information can be either a tree element associated to
  # the 'file_info_element' key, with a 'file_info_type' 'node' or
  # 'section'... or a specific source associated to the 'file_info_name'
  # key with 'file_info_type' 'special_file', or a source set if
  # nothing was found, with 'file_info_type' 'stand_in_file' and a
  # 'file_info_name'.  Redirection files are added in the output()
  # function.
  my %files_source_info = ();
  if (!$self->get_conf('SPLIT')) {
    push @filenames_order, $output_filename;
    foreach my $output_unit (@$output_units) {
      $unit_file_name_paths{$output_unit} = $output_filename;
    }
    $files_source_info{$output_filename}
      = {'file_info_type' => 'special_file',
         'file_info_name' => 'non_split',
         'file_info_path' => $output_file};
  } else {
    my $identifiers_target;
    if (exists($self->{'document'})) {
      $identifiers_target = $self->{'document'}->labels_information();
    }

    # first determine the top node file name.
    my $top_node;
    if (defined($identifiers_target)) {
      my $top_target_element = $identifiers_target->{'Top'};
      if (defined($top_target_element)
          and $top_target_element->{'cmdname'} eq 'node') {
        $top_node = $top_target_element;
      }
    }
    my $top_node_filename = $self->top_node_filename($document_name);
    my $top_node_output_unit;
    if (defined($top_node) and defined($top_node_filename)) {
      $top_node_output_unit = $top_node->{'associated_unit'};
      die "BUG: No output unit for top node"
        if (!defined($top_node_output_unit));
      push @filenames_order, $top_node_filename;
      $unit_file_name_paths{$top_node_output_unit} = $top_node_filename;
      $files_source_info{$top_node_filename}
         = {'file_info_type' => 'special_file',
            'file_info_name' => 'Top',
            'file_info_path' => undef};
    }
    my $file_nr = 0;
    my $extension = '';
    $extension = '.'.$self->get_conf('EXTENSION')
            if (defined($self->get_conf('EXTENSION'))
                and $self->get_conf('EXTENSION') ne '');

    foreach my $output_unit (@$output_units) {
      # For Top node.
      next if ($top_node_output_unit and $output_unit eq $top_node_output_unit);

      my $file_output_unit = $output_unit->{'first_in_page'};
      if (!defined($file_output_unit)) {
        cluck ("No first_in_page for $output_unit\n");
      }
      if (not exists($unit_file_name_paths{$file_output_unit})) {
        my $node_filename;
        foreach my $root_command (@{$file_output_unit->{'unit_contents'}}) {
          if (exists($root_command->{'cmdname'})
              and $root_command->{'cmdname'} eq 'node') {
            # double node are not normalized, they are handled here
            if (!exists($root_command->{'extra'})
                or !exists($root_command->{'extra'}->{'identifier'})
                or !exists($identifiers_target->{
                           $root_command->{'extra'}->{'identifier'}})) {
              $node_filename = 'unknown_node';
              $node_filename .= $extension;

              if (!exists($files_source_info{$node_filename})) {
                push @filenames_order, $node_filename;
                $files_source_info{$node_filename}
                               = {'file_info_type' => 'stand_in_file',
                                  'file_info_name' => 'unknown_node',
                                  'file_info_path' => undef};
              }
            } else {
              # Nodes with {'extra'}->{'is_target'} should always be in
              # 'identifiers_target', and thus in targets.  It is a bug otherwise.
              $node_filename
                = $self->{'targets'}->{$root_command}->{'node_filename'};
              if (not exists($files_source_info{$node_filename})
                  or $files_source_info{$node_filename}
                            ->{'file_info_type'} ne 'stand_in_file') {

                push @filenames_order, $node_filename
                  unless ($files_source_info{$node_filename});

                $files_source_info{$node_filename}
                                     = {'file_info_type' => 'node',
                                        'file_info_element' => $root_command,
                                        'file_info_path' => undef};
              }
            }
            $unit_file_name_paths{$file_output_unit} = $node_filename;
            last;
          }
        }
        if (not defined($node_filename)) {
          # use section to do the file name if there is no node
          my $command = $file_output_unit->{'unit_section'};
          if (defined($command)) {
            if ($command->{'element'}->{'cmdname'} eq 'top'
                and !defined($top_node) and defined($top_node_filename)) {
              $unit_file_name_paths{$file_output_unit} = $top_node_filename;

              # existing top_node_filename can happen, see
              # html_tests.t top_file_name_and_node_name_collision
              push @filenames_order, $top_node_filename
                unless exists($files_source_info{$top_node_filename});

              $files_source_info{$top_node_filename}
                  = {'file_info_type' => 'special_file',
                     'file_info_name' => 'Top',
                     'file_info_path' => undef};
            } else {
              my $section_filename
                = $self->{'targets'}->{$command->{'element'}}
                     ->{'section_filename'};
              $unit_file_name_paths{$file_output_unit} = $section_filename;

              if (not exists($files_source_info{$section_filename})
                  or $files_source_info{$section_filename}
                                ->{'file_info_type'} ne 'stand_in_file') {

                push @filenames_order, $section_filename
                  unless (exists($files_source_info{$section_filename}));

                $files_source_info{$section_filename}
                  = {'file_info_type' => 'section',
                     'file_info_element' => $command->{'element'},
                     'file_info_path' => undef};
              }
            }
          } else {
            # when everything else has failed
            if ($file_nr == 0 and !defined($top_node)
                and defined($top_node_filename)) {
              $unit_file_name_paths{$file_output_unit} = $top_node_filename;
              unless (exists($files_source_info{$top_node_filename})) {
                push @filenames_order, $top_node_filename;
                $files_source_info{$top_node_filename}
                  = {'file_info_type' => 'stand_in_file',
                     'file_info_name' => 'Top',
                     'file_info_path' => undef};
              }
            } else {
              my $filename = $document_name . "_$file_nr";
              $filename .= $extension;
              $unit_file_name_paths{$file_output_unit} = $filename;

              unless (exists($files_source_info{$filename})) {
                push @filenames_order, $filename;
                $files_source_info{$filename}
                   = {'file_info_type' => 'stand_in_file',
                      'file_info_name' => 'unknown',
                      'file_info_path' => undef};
              }
            }
            $file_nr++;
          }
        }
      }
      if ($output_unit ne $file_output_unit) {
        $unit_file_name_paths{$output_unit}
           = $unit_file_name_paths{$file_output_unit}
      }
    }
  }

  my $debug = $self->get_conf('DEBUG');
  foreach my $output_unit (@$output_units) {
    my $filename = $unit_file_name_paths{$output_unit};
    my $file_source_info = $files_source_info{$filename};
    # check
    if (!defined($file_source_info)) {
      print STDERR "BUG: no files_source_info: $filename\n";
    }
    my $filepath = $file_source_info->{'file_info_path'};
    if (defined($self->{'file_id_setting'}->{'unit_file_name'})) {
      # NOTE the information that it is associated with @top or @node Top
      # may be determined with $self->unit_is_top_output_unit($output_unit);
      my ($user_filename, $user_filepath)
         = &{$self->{'file_id_setting'}->{'unit_file_name'}}(
               $self, $output_unit, $filename, $filepath);
      if (defined($user_filename)) {
        my $user_file_source_info;
        if (exists($files_source_info{$user_filename})) {
          $user_file_source_info = $files_source_info{$user_filename};
          my $previous_filepath = $user_file_source_info->{'file_info_path'};
          # It is likely that setting different paths for the same file is
          # not intended, so we warn.
          if (defined($user_filepath) and defined($previous_filepath)
              and $user_filepath ne $previous_filepath) {
            $self->converter_document_warn(
             sprintf(__("resetting %s file path %s to %s"),
              $user_filename, $previous_filepath, $user_filepath));
          } elsif (defined($user_filepath) and !defined($previous_filepath)) {
            $self->converter_document_warn(
              sprintf(__("resetting %s file path from a relative path to %s"),
                           $user_filename, $user_filepath));
          } elsif (!defined($user_filepath) and defined($previous_filepath)) {
            $self->converter_document_warn(
              sprintf(__("resetting %s file path from %s to a relative path"),
                           $user_filename, $previous_filepath));
          }
        }
        $filename = $user_filename;
        push @filenames_order, $filename
          unless (defined($user_file_source_info));
        $files_source_info{$filename} = {'file_info_type' => 'special_file',
                                         'file_info_name' => 'user_defined',
                                         'file_info_path' => $user_filepath};
      }
    }
    $self->set_output_unit_file($output_unit, $filename);
    my $output_unit_filename = $output_unit->{'unit_filename'};
    $self->{'file_counters'}->{$output_unit_filename} = 0
       if (!exists($self->{'file_counters'}->{$output_unit_filename}));
    $self->{'file_counters'}->{$output_unit_filename}++;
    print STDERR 'Page '
      # uncomment for perl object name
      #."$output_unit "
      .Texinfo::OutputUnits::output_unit_texi($output_unit)
      .": $output_unit_filename($self->{'file_counters'}->{$output_unit_filename})\n"
             if ($debug);
  }

  if (defined($special_units)) {
    foreach my $special_unit (@$special_units) {
      my $unit_command = $special_unit->{'unit_command'};
      my $filename
       = $self->{'targets'}->{$unit_command}->{'special_unit_filename'};
      # Associate the special elements that have no page with the main page.
      # This may only happen if not split.
      if (!defined($filename)
          and defined($output_units->[0]->{'unit_filename'})) {
        $filename = $output_units->[0]->{'unit_filename'};
      }
      if (defined($filename)) {
        push @filenames_order, $filename
          unless exists($files_source_info{$filename});
        $self->set_output_unit_file($special_unit, $filename);
        $self->{'file_counters'}->{$filename} = 0
           if (!exists($self->{'file_counters'}->{$filename}));
        $self->{'file_counters'}->{$filename}++;
        print STDERR 'Special page'
           # uncomment for perl object name
           #." $special_unit"
           .": $filename($self->{'file_counters'}->{$filename})\n"
                 if ($debug);
        my $file_source_info = {'file_info_element' => $unit_command,
                                'file_info_type' => 'special_unit',
                                'file_info_path' => undef};
        $files_source_info{$filename} = $file_source_info
          unless(exists($files_source_info{$filename})
                 and $files_source_info{$filename}->{'file_info_type'}
                       ne 'stand_in_file');
      }
    }
  }

  foreach my $filename (@filenames_order) {
    $self->set_file_path($filename, $destination_directory,
                         $files_source_info{$filename}->{'file_info_path'});
  }

  # to be able to associate to the output unit file the associated
  # output units will be output into, this is done after document output
  # units got files.
  # In practice only used for contents and shortcontents.
  if (defined($associated_output_units)
      and scalar(@$associated_output_units)) {
    foreach my $special_unit (@$associated_output_units) {
      my $associated_output_unit = $special_unit->{'associated_document_unit'};
      my $unit_command = $special_unit->{'unit_command'};
      my $filename;

      my $command_target = $self->{'targets'}->{$unit_command};
      # set by the user
      if (defined($command_target->{'special_unit_filename'})) {
        $filename = $command_target->{'special_unit_filename'};
      } else {
        $filename = $associated_output_unit->{'unit_filename'}
          if ($associated_output_unit);
        $command_target->{'special_unit_filename'} = $filename;
      }

      # set here the file name, but do not associate a counter as it is already
      # set for the output unit the special output unit is in.
      $self->set_output_unit_file($special_unit, $filename)
        if (defined($filename));
    }
  }

  return \%files_source_info;
}

sub _prepare_special_units_directions($$) {
  my ($self, $special_units) = @_;

  return unless(defined($special_units));

  foreach my $special_unit (@$special_units) {
    $special_unit->{'directions'}->{'This'} = $special_unit;
  }
}

sub _prepare_units_directions_files($$$$$$$$) {
  my ($self, $output_units, $special_units, $associated_special_units,
      $output_file, $destination_directory, $output_filename,
      $document_name) = @_;

  my $identifiers_target;
  my $nodes_list;
  if (exists($self->{'document'})) {
    $identifiers_target = $self->{'document'}->labels_information();
    $nodes_list = $self->{'document'}->nodes_list();
  }

  _prepare_output_units_global_targets($self, $output_units, $special_units,
                                              $associated_special_units);

  Texinfo::OutputUnits::split_pages($output_units, $nodes_list,
                                    $self->get_conf('SPLIT'));

  # reset even if $output_file eq '', as 'file_counters' is accessed
  # below, so it needs to be empty in the case of $output_file eq ''.
  $self->initialize_output_units_files();

  # determine file names associated with the different pages, and setup
  # the counters for special element pages.
  my $files_source_info;
  if ($output_file ne '') {
    $files_source_info =
      _html_set_pages_files($self, $output_units, $special_units,
                    $associated_special_units, $output_file,
                    $destination_directory, $output_filename, $document_name);
  }

  # do output units directions.
  Texinfo::OutputUnits::units_directions($identifiers_target, $nodes_list,
                                         $output_units,
                                         $self->get_conf('DEBUG'));

  _prepare_special_units_directions($self, $special_units);

  # do output units directions related to files.
  # Here such that PrevFile and NextFile can be set.
  Texinfo::OutputUnits::units_file_directions($output_units);

  # elements_in_file_count is only set in HTML, not in
  # Texinfo::Convert::Converter
  $self->{'elements_in_file_count'} = {};
  # condition could also be based on $output_file ne ''
  if (exists($self->{'file_counters'})) {
    # 'file_counters' is dynamic, decreased when the element is encountered
    # 'elements_in_file_count' is not modified afterwards
    foreach my $filename (keys(%{$self->{'file_counters'}})) {
      $self->{'elements_in_file_count'}->{$filename}
                            = $self->{'file_counters'}->{$filename};
    }
  }

  #if (1 or $self->get_conf('DEBUG') >= 30) {
  #  if ($self->{'document'}) {
  #    my $tree = $self->{'document'}->tree();
  #    my $use_filename = 0;
  #    if ($self->get_conf('TEST')) {
  #      $use_filename = 1;
  #    }
  #    my $output_units_output
  #      = Texinfo::OutputUnits::print_output_units_tree_details($output_units,
  #              $tree, $use_filename);
  #  }
  #}

  return $files_source_info;
}

sub convert_output_unit($$;$) {
  my ($self, $output_unit,
  # only used for debug
      $explanation) = @_;

  my $debug = $self->get_conf('DEBUG');

  my $unit_type_name = $output_unit->{'unit_type'};

  if (exists($self->{'output_units_conversion'}->{$unit_type_name})
      and !defined($self->{'output_units_conversion'}->{$unit_type_name})) {
    if ($debug) {
      print STDERR "IGNORED OU $unit_type_name\n";
    }
    return '';
  }

  if ($debug) {
    print STDERR "UNIT($explanation) -> ou: $unit_type_name '"
        .Texinfo::OutputUnits::output_unit_texi($output_unit)."'\n";
  }

  $self->{'current_output_unit'} = $output_unit;

  my $content_formatted = '';
  if (exists($output_unit->{'unit_contents'})) {
    my $content_idx = 0;
    foreach my $content (@{$output_unit->{'unit_contents'}}) {
      $content_formatted
        .= _convert($self, $content, "$unit_type_name c[$content_idx]");
      $content_idx++;
    }
  }
  my $result = '';
  if (defined($self->{'output_units_conversion'}->{$unit_type_name})) {
    $result
     .= &{$self->{'output_units_conversion'}->{$unit_type_name}} ($self,
                                               $unit_type_name,
                                               $output_unit,
                                               $content_formatted);
  } elsif (defined($content_formatted)) {
    $result .= $content_formatted;
  }

  delete $self->{'current_output_unit'};

  print STDERR "DOUNIT ($unit_type_name) => `$result'\n" if $debug;

  return $result;
}

sub _run_stage_handlers($$$$) {
  my ($converter, $stage_handlers, $document, $stage) = @_;

  return 0 if (!defined($stage_handlers->{$stage}));

  my $handler_idx = 1;
  foreach my $handler_and_priority (@{$stage_handlers->{$stage}}) {
    my ($handler, $priority) = @$handler_and_priority;
    if ($converter->get_conf('DEBUG')) {
      print STDERR "RUN handler $handler_idx: stage $stage, priority $priority\n";
    }
    my $status = &{$handler}($converter, $document, $stage);
    if (!defined($status) or ref($status) ne '' or $status !~ /^\d+$/) {
      $converter->converter_document_error(
       sprintf(__("handler %d of stage %s priority %s: non-numeric status"),
                      $handler_idx, $stage, $priority));
      $status = $converter->get_conf('HANDLER_FATAL_ERROR_LEVEL') +1;
    }
    if ($status != 0) {
      if ($status < 0) {
        $converter->converter_document_error(
           sprintf(__("handler %d of stage %s priority %s failed"),
                      $handler_idx, $stage, $priority));
      } else {
        # the handler is supposed to have output an error message
        # already if $status > 0
        if ($converter->get_conf('VERBOSE') or $converter->get_conf('DEBUG')) {
          print STDERR "FAIL handler $handler_idx: stage $stage, "
                                     ."priority $priority, status $status\n";
        }
      }
      return $status;
    }
    $handler_idx++;
  }
  return 0;
}

sub _prepare_converted_output_info($$$$) {
  my ($self, $output_file, $output_filename, $output_units) = @_;

  my $stage_handlers = $self->{'stage_handlers'};

  my $structure_status = _run_stage_handlers($self, $stage_handlers,
                                             $self->{'document'}, 'structure');
  my $handler_fatal_error_level = $self->get_conf('HANDLER_FATAL_ERROR_LEVEL');

  unless ($structure_status < $handler_fatal_error_level
          and $structure_status > -$handler_fatal_error_level) {
    return 0;
  }

  my $global_commands;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
  }

  my $default_bcp47_locale = $self->current_bcp47_locale();

  # This also sets the language related options to their pre-conversion
  # values (which is not really needed here).
  $self->set_converter_preamble_language_commands();

  my $preamble_bcp47_locale = $self->current_bcp47_locale();

  if ($default_bcp47_locale ne $preamble_bcp47_locale) {
    _translate_names($self);
  }

  # prepare title.  fulltitle uses more possibility than simpletitle for
  # title, including @-commands found in @titlepage only.  Therefore
  # simpletitle is more in line with what makeinfo in C did.

  _prepare_simpletitle($self);

  my $fulltitle_tree = $self->get_fulltitle_tree();

  my $html_title_string;
  my $title_tree;
  if (defined($fulltitle_tree)) {
    $title_tree = $fulltitle_tree;
    $html_title_string
      = $self->convert_tree_new_formatting_context($title_tree,
                                                   'title_string',
                                                   $CTXF_string);
    if ($html_title_string !~ /\S/) {
      $html_title_string = undef;
    }
  }
  if (!defined($html_title_string)) {
    my $default_title = $self->cdt('Untitled Document');
    $title_tree = $default_title;
    $self->{'converter_info'}->{'title_tree'} = $title_tree;
    $self->{'converter_info'}->{'title_string'}
      = $self->convert_tree_new_formatting_context($title_tree,
                                                   'title_string',
                                                   $CTXF_string);
    my $input_file_name;
    if (exists($self->{'document'})) {
      my $document_info = $self->{'document'}->global_information();
      if (defined($document_info)) {
        $input_file_name = $document_info->{'input_file_name'};
      }
    }

    if (defined($input_file_name)) {
      $self->converter_line_warn(__(
                         "must specify a title with a title command or \@top"),
                           {'file_name' => $input_file_name});
    } else {
      $self->converter_document_warn(__(
                         "must specify a title with a title command or \@top"));
    }
  } else {
    $self->{'converter_info'}->{'title_tree'} = $title_tree;
    $self->{'converter_info'}->{'title_string'} = $html_title_string;
  }

  # copying comment
  if (defined($global_commands) and exists($global_commands->{'copying'})) {
    my $copying_comment = Texinfo::Convert::Text::convert_to_text(
     Texinfo::TreeElement::new(
      {'contents' => $global_commands->{'copying'}->{'contents'}}),
     $self->{'convert_text_options'});
    if ($copying_comment ne '') {
      $self->{'converter_info'}->{'copying_comment'}
       = &{$self->formatting_function('format_comment')}($self, $copying_comment);
    }
  }

  # documentdescription
  if (defined($self->get_conf('documentdescription'))) {
    $self->{'converter_info'}->{'documentdescription_string'}
      = $self->get_conf('documentdescription');
  } elsif (defined($global_commands)
           and exists($global_commands->{'documentdescription'})) {
    my $tmp = Texinfo::TreeElement::new({'contents'
               => $global_commands->{'documentdescription'}->{'contents'}});

    my $documentdescription_string
      = $self->convert_tree_new_formatting_context($tmp,
                                 'documentdescription', $CTXF_string);

    chomp($documentdescription_string);
    $self->{'converter_info'}->{'documentdescription_string'}
      = $documentdescription_string;
  }

  # documentinfo metadata
  if (defined($global_commands)
      and exists($global_commands->{'documentinfo'})) {
    my $documentinfo = $global_commands->{'documentinfo'};
    if (exists($documentinfo->{'contents'})) {
      my $metadata_in_documentinfo = '';
      foreach my $element (@{$documentinfo->{'contents'}}) {
        if ((exists($element->{'type'})
             and $element->{'type'} eq 'arguments_line'
            or (exists($element->{'cmdname'})
                and (exists(
        $Texinfo::Commands::metadata_commands{$element->{'cmdname'}})
    # If EPUB is expanded, @html metadata is used for the EPUB specific
    # metadata, not for each converted HTML file metadata included in the EPUB
    # container.  This allows to have EPUB metadata even without a specific
    # @epub raw format command.
                     or ($element->{'cmdname'} eq 'html'
                         and $self->is_format_expanded('epub')))))) {
          next;
        }
        $metadata_in_documentinfo
          .= $self->convert_tree_new_formatting_context($element,
                                             'documentinfo metadata');
      }
      if ($metadata_in_documentinfo =~ /\S/) {
        $self->{'converter_info'}->{'documentinfo_metadata'}
          = $metadata_in_documentinfo;
      }
    }
  }

  if ($self->get_conf('DATE_IN_HEADER')) {
    my $today
      = $self->convert_tree_new_formatting_context(
           Texinfo::TreeElement::new({'cmdname' => 'today'}),
                                                   'DATE_IN_HEADER');
    my $date =
      $self->close_html_lone_element(
        "<meta name=\"date\" content=\"$today\"")."\n";

    $self->{'converter_info'}->{'date_in_header'} = $date;
  }

  my $init_status = _run_stage_handlers($self, $stage_handlers,
                                        $self->{'document'}, 'init');
  unless ($init_status < $handler_fatal_error_level
          and $init_status > -$handler_fatal_error_level) {
    return 0;
  }

  _prepare_title_titlepage($self, $output_file, $output_filename,
                                  $output_units);

  if ($default_bcp47_locale ne $preamble_bcp47_locale) {
    $self->reset_lang_translation_from_customization(
                           $self->get_conf('documentlanguage'),
                           $self->get_conf('documentscript'));
    _translate_names($self);
  }

  # reset in case the user changed customization variables in handlers
  $self->{'convert_text_options'}
     = Texinfo::Convert::Text::copy_options_for_convert_text($self);

  return 1;
}

# units or root conversion
sub _html_convert_output($$$$$$$$) {
  my ($self, $output_file, $destination_directory, $output_filename,
      $document_name, $document, $output_units, $special_units) = @_;

  my ($encoded_destination_directory, $dir_encoding)
    = $self->encoded_output_file_name($destination_directory);
  my $succeeded
    = $self->create_destination_directory($encoded_destination_directory,
                                          $destination_directory);
  if (!$succeeded) {
    return undef;
  }

  my $debug = $self->get_conf('DEBUG');
  my $text_output = '';
  if ($output_file eq '') {
    $self->{'current_filename'} = $output_filename;
    my $body = '';
    my $unit_nr = 0;
    # NOTE there is no rule before the footnotes special element in
    # case of separate footnotes in this setting.
    foreach my $output_unit (@$output_units, @$special_units) {
      print STDERR "\nUNIT NO-PAGE $unit_nr\n" if ($debug);
      my $output_unit_text
        = $self->convert_output_unit($output_unit,
                                     "no-page output unit $unit_nr");
      $body .= $output_unit_text;
      $unit_nr++;
    }

    # do end file first, in case it needs some CSS
    my $file_end = &{$self->formatting_function('format_end_file')}($self,
                                                  $output_filename, undef);
    my $file_beginning
        = &{$self->formatting_function('format_begin_file')}($self,
                                                  $output_filename, undef);
    $text_output .= $file_beginning;
    $text_output .= $body;
    $text_output .= $file_end;
  } else {
    # output with pages
    print STDERR "DO Units with filenames\n" if ($debug);
    my %files;

    my $unit_nr = -1;
    # Now do the output, converting each output units and special output units
    # in turn
    $special_units = [] if (!defined($special_units));
    foreach my $output_unit (@$output_units, @$special_units) {
      $unit_nr++;

      my $output_unit_filename = $output_unit->{'unit_filename'};
      $self->{'current_filename'} = $output_unit_filename;

      # convert body before header in case this affects the header
      # and, for special output unit, to avoid outputting anything if empty.
      my $body;
      if ($output_unit->{'unit_type'} eq 'special_unit') {
        print STDERR "\nUNIT SPECIAL "
           ."$output_unit->{'special_unit_variety'} $unit_nr\n"
             if ($debug);
        $body = $self->convert_output_unit($output_unit,
                                           "output s-unit $unit_nr");
        if ($body eq '') {
          $body = undef;
        }
      } else {
        print STDERR "\nUNIT $unit_nr\n" if ($debug);
        $body = $self->convert_output_unit($output_unit,
                                           "output unit $unit_nr");
      }

      $self->{'file_counters'}->{$output_unit_filename}--;

      # register the output but do not print anything. Printing
      # only when file_counters reach 0, to be sure that all the
      # elements have been converted before headers are done.
      if (defined($body)) {
        if (!exists($files{$output_unit_filename})) {
          $files{$output_unit_filename} = {'first_unit' => $output_unit,
                                           'body' => ''};
        }
        $files{$output_unit_filename}->{'body'} .= $body;
      } else {
        next if (!exists($files{$output_unit_filename})
                 or $files{$output_unit_filename}->{'body'} eq '');
      }

      if ($self->{'file_counters'}->{$output_unit_filename} == 0) {
        my $out_filepath = $self->{'out_filepaths'}->{$output_unit_filename};
        my $file_output_unit = $files{$output_unit_filename}->{'first_unit'};
        my ($encoded_out_filepath, $path_encoding)
          = $self->encoded_output_file_name($out_filepath);
        # the third return information, set if the file has already been used
        # in this files_information is not checked as this cannot happen.
        my ($file_fh, $error_message)
                = Texinfo::Convert::Utils::output_files_open_out(
                         $self->output_files_information(),
                         $encoded_out_filepath, undef,
                         $self->get_conf('OUTPUT_ENCODING_NAME'));
        if (!defined($file_fh)) {
          $self->converter_document_error(
               sprintf(__("could not open %s for writing: %s"),
                                    $out_filepath, $error_message));
          delete $self->{'current_filename'};
          return undef;
        }
        # do end file first in case it requires some CSS
        my $end_file = &{$self->formatting_function('format_end_file')}($self,
                                                         $output_unit_filename,
                                                           $output_unit);
        print $file_fh "".&{$self->formatting_function('format_begin_file')}(
                               $self, $output_unit_filename, $file_output_unit);
        print $file_fh "".$files{$output_unit_filename}->{'body'};
        # end file
        print $file_fh "". $end_file;

        # Do not close STDOUT now such that the file descriptor is not reused
        # by open, which uses the lowest-numbered file descriptor not open,
        # for another filehandle.  Closing STDOUT is handled by the caller.
        if ($out_filepath ne '-') {
          Texinfo::Convert::Utils::output_files_register_closed(
             $self->output_files_information(), $encoded_out_filepath);
          if (!close($file_fh)) {
            $self->converter_document_error(
                       sprintf(__("error on closing %s: %s"),
                                  $out_filepath, $!));
            delete $self->{'current_filename'};
            return undef;
          }
        }
      }
    }
  }
  delete $self->{'current_filename'};
  return $text_output;
}

sub _prepare_node_redirection_page($$$) {
  my ($self, $target_element, $redirection_filename) = @_;

  $self->{'current_filename'} = $redirection_filename;

  my $redirection_page
   = &{$self->formatting_function('format_node_redirection_page')}($self,
                                    $target_element, $redirection_filename);
  delete $self->{'current_filename'};

  return $redirection_page;
}

sub _node_redirections($$$$) {
  my ($self, $output_file, $destination_directory, $files_source_info) = @_;

  my $labels_list;
  if (exists($self->{'document'})) {
    $labels_list = $self->{'document'}->labels_list();
  }

  my $redirection_files_done = 0;
  # do node redirection pages
  delete $self->{'current_filename'};
  if ($self->get_conf('NODE_FILES')
      and defined($labels_list) and $output_file ne '') {

    my $add_translit_redirection = 0;

    my $added_translit_extension;
    if ($self->get_conf('TRANSLITERATE_FILE_NAMES')) {
      $add_translit_redirection = 1;
      $added_translit_extension = '';
      $added_translit_extension = '.'.$self->get_conf('EXTENSION')
                if (defined($self->get_conf('EXTENSION'))
                    and $self->get_conf('EXTENSION') ne '');
    }

    my %redirection_filenames;
    foreach my $target_element (@$labels_list) {
      next if (not exists($target_element->{'extra'})
               or not $target_element->{'extra'}->{'is_target'});
      my $label_element = Texinfo::Common::get_label_element($target_element);
      # filename may not be defined in case of an @anchor or similar in
      # @titlepage, and @titlepage is not used.
      my $filename = $self->command_filename($target_element);
      next if (!defined($filename));

      my $node_filename;
      my $normalized = $target_element->{'extra'}->{'identifier'};
      # NOTE 'node_filename' is not used for Top, TOP_NODE_FILE_TARGET
      # is.  The other manual must use the same convention to get it
      # right.  We do not do 'node_filename' as a redirection file
      # either.
      if ($normalized eq 'Top'
          and defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
        $node_filename = $self->get_conf('TOP_NODE_FILE_TARGET');
      } else {
        my ($target_filebase, $external_file_extension, $id)
          = _standard_label_id_file($self, $normalized, $label_element,
                               $self->get_conf('EXTERNAL_CROSSREF_EXTENSION'),
                                     $defaults{'EXTENSION'});
        $node_filename = $target_filebase.$external_file_extension;
      }

      my @redirection_files;
      my $node_redirection_filename
        = $self->register_normalize_case_filename($node_filename);
      if ($node_filename ne $filename) {
        # first condition finds conflict with tree elements
        if ($self->count_elements_in_filename('total',
                                              $node_redirection_filename)
            or exists($redirection_filenames{$node_redirection_filename})) {
          $self->converter_line_warn(
             sprintf(__("\@%s `%s' file %s for redirection exists"),
               $target_element->{'cmdname'},
               Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                                              $label_element),
               $node_redirection_filename),
            $target_element->{'source_info'});
          my $file_source = $files_source_info->{$node_redirection_filename};
          my $file_info_type = $file_source->{'file_info_type'};
          if ($file_info_type eq 'special_file'
              or $file_info_type eq 'stand_in_file') {
            my $name = $file_source->{'file_info_name'};
            if ($name eq 'non_split') {
              # This cannot actually happen, as the @anchor/@node/@float
              # with potentially conflicting name will also be in the
              # non-split output document and therefore does not need
              # a redirection.
              $self->converter_document_warn(
                            __("conflict with whole document file"), 1);
            } elsif ($name eq 'Top') {
              $self->converter_document_warn(
                           __("conflict with Top file"), 1);
            } elsif ($name eq 'user_defined') {
              $self->converter_document_warn(
                            __("conflict with user-defined file"), 1);
            } elsif ($name eq 'unknown_node') {
              $self->converter_document_warn(
                           __("conflict with unknown node file"), 1);
            } elsif ($name eq 'unknown') {
              $self->converter_document_warn(
                            __("conflict with file without known source"), 1);
            }
          } elsif ($file_info_type eq 'node') {
            my $conflicting_node = $file_source->{'file_info_element'};
            my $label_element
              = Texinfo::Common::get_label_element($conflicting_node);
            $self->converter_line_warn(
         sprintf(__p('conflict of redirection file with file based on node name',
                     "conflict with \@%s `%s' file"),
                 $conflicting_node->{'cmdname'},
             Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                                             $label_element)
                 ),
              $conflicting_node->{'source_info'}, 1);
          } elsif ($file_info_type eq 'redirection') {
            my $conflicting_node = $file_source->{'file_info_element'};
            my $conflicting_label_element
                 = $file_source->{'file_info_label_element'};
            $self->converter_line_warn(
               sprintf(__("conflict with \@%s `%s' redirection file"),
                 $conflicting_node->{'cmdname'},
            Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                                $conflicting_label_element)
                 ),
              $conflicting_node->{'source_info'}, 1);
          } elsif ($file_info_type eq 'section') {
            my $conflicting_section = $file_source->{'file_info_element'};
            # arguments_line type element
            my $arguments_line = $conflicting_section->{'contents'}->[0];
            my $line_arg = $arguments_line->{'contents'}->[0];
            $self->converter_line_warn(
         sprintf(__p('conflict of redirection file with file based on section name',
                     "conflict with \@%s `%s' file"),
                 $conflicting_section->{'cmdname'},
            Texinfo::Convert::Texinfo::convert_contents_to_texinfo(
                                                                 $line_arg),
                 ),
              $conflicting_section->{'source_info'}, 1);
          } elsif ($file_info_type eq 'special_unit') {
            my $unit_command = $file_source->{'file_info_element'};
            my $special_unit = $unit_command->{'associated_unit'};
            my $output_unit_variety
              = $special_unit->{'special_unit_variety'};
            $self->converter_document_warn(
               sprintf(__("conflict with %s special element"),
                       $output_unit_variety), 1);
          }
        } else {
          push @redirection_files, $node_redirection_filename;
        }
      }

      if ($add_translit_redirection and $normalized ne 'Top') {
        # based on Texinfo::Convert::Converter node_information_filename

        my $translit_filename
   = Texinfo::Convert::NodeNameNormalization::normalize_transliterate_texinfo(
        Texinfo::TreeElement::new(
          {'contents' => $label_element->{'contents'}}));

        $translit_filename = $self->_id_to_filename($translit_filename);
        $translit_filename = $translit_filename.$added_translit_extension;

        if ($translit_filename ne $node_redirection_filename
            and $translit_filename ne $filename) {
          my $translit_redirection_filename
            = $self->register_normalize_case_filename($translit_filename);

          if (!$self->count_elements_in_filename('total',
                                            $translit_redirection_filename)
             and not exists(
                  $redirection_filenames{$translit_redirection_filename})) {
            push @redirection_files, $translit_redirection_filename;
          }
        }
      }

      if (defined($self->{'file_id_setting'}->{'redirection_file_names'})) {
        my $reference_redirection_files = [@redirection_files];
        # NOTE there are no checks on returned redirection files not
        # replacing other files, it is up to the user to do what they
        # should.
        @redirection_files
       = &{$self->{'file_id_setting'}->{'redirection_file_names'}}($self,
                             $target_element, $filename,
                             $node_redirection_filename,
                             $reference_redirection_files);
      }

      foreach my $redirection_filename (@redirection_files) {
        $redirection_filenames{$redirection_filename} = $target_element;
        $files_source_info->{$redirection_filename}
            = {'file_info_type' => 'redirection',
               'file_info_element' => $target_element,
               'file_info_path' => undef,
               'file_info_label_element' => $label_element};

        my $redirection_page
          = _prepare_node_redirection_page($self, $target_element,
                                           $redirection_filename);

        my $out_filepath;
        if ($destination_directory ne '') {
          $out_filepath = join('/', ($destination_directory,
                                     $redirection_filename));
        } else {
          $out_filepath = $redirection_filename;
        }
        my ($encoded_out_filepath, $path_encoding)
          = $self->encoded_output_file_name($out_filepath);
        # the third return information, set if the file has already been used
        # in this files_information is not checked as this cannot happen.
        my ($file_fh, $error_message)
               = Texinfo::Convert::Utils::output_files_open_out(
                             $self->output_files_information(),
                             $encoded_out_filepath, undef,
                             $self->get_conf('OUTPUT_ENCODING_NAME'));
        if (!defined($file_fh)) {
          $self->converter_document_error(sprintf(__(
                                    "could not open %s for writing: %s"),
                                    $out_filepath, $error_message));
        } else {
          print $file_fh $redirection_page;
          Texinfo::Convert::Utils::output_files_register_closed(
                  $self->output_files_information(), $encoded_out_filepath);
          if (!close($file_fh)) {
            $self->converter_document_error(sprintf(__(
                           "error on closing redirection node file %s: %s"),
                                    $out_filepath, $!));
            $self->conversion_finalization();
            return undef;
          }
        }
        $redirection_files_done++;
        # NOTE failure to open a file does not stop the processing
      }
    }
  }
  return $redirection_files_done;
}

sub _setup_output($) {
  my $self = shift;

  # Should not actually be needed, as it is already deleted after conversion
  # and each time it is set out of the conversion.
  delete $self->{'current_filename'};

  # no splitting when writing to the null device or to stdout or returning
  # a string
  if (defined($self->get_conf('OUTFILE'))
      and ($Texinfo::Common::null_device_file{$self->get_conf('OUTFILE')}
           or $self->get_conf('OUTFILE') eq '-'
           or $self->get_conf('OUTFILE') eq '')) {
    $self->force_conf('SPLIT', '');
    $self->force_conf('MONOLITHIC', 1);
  }
  if ($self->get_conf('SPLIT')) {
    $self->set_conf('NODE_FILES', 1);
  }
  $self->set_conf('EXTERNAL_CROSSREF_SPLIT', $self->get_conf('SPLIT'));

  my $handler_fatal_error_level = $self->get_conf('HANDLER_FATAL_ERROR_LEVEL');
  if (!defined($handler_fatal_error_level)) {
    $handler_fatal_error_level =
      $Texinfo::Options::converter_customization_options{
                                           'HANDLER_FATAL_ERROR_LEVEL'};
    $self->force_conf('HANDLER_FATAL_ERROR_LEVEL',
                      $handler_fatal_error_level);
  }

  if ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax') {
    # See https://www.gnu.org/licenses/javascript-labels.html
    #
    # The link to the source for mathjax does not strictly follow the advice
    # there: instead we link to instructions for obtaining the full source in
    # its preferred form of modification.

    my $mathjax_script = $self->get_conf('MATHJAX_SCRIPT');
    if (! defined($mathjax_script)) {
      $mathjax_script = 'https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js';
      $self->set_conf('MATHJAX_SCRIPT', $mathjax_script);
    }

    my $mathjax_source = $self->get_conf('MATHJAX_SOURCE');
    if (! defined($mathjax_source)) {
      $mathjax_source = 'http://docs.mathjax.org/en/latest/web/hosting.html#getting-mathjax-via-git';
      $self->set_conf('MATHJAX_SOURCE', $mathjax_source);
    }
 }

  my $setup_status = _run_stage_handlers($self, $self->{'stage_handlers'},
                                         $self->{'document'}, 'setup');

  if ($setup_status < $handler_fatal_error_level
      and $setup_status > -$handler_fatal_error_level) {
  } else {
    return undef;
  }

  # the settable commands configuration has potentially been modified for
  # this output file especially in setup handler.  Update the corresponding
  # initial configuration.
  my $conf = $self->{'conf'};
  foreach my $settable_command (
         keys(%Texinfo::Common::document_settable_at_commands)) {
    if (exists($conf->{$settable_command})) {
      $self->{'commands_init_conf'}->{$settable_command}
        = $conf->{$settable_command};
    }
  }

  # set BODY_ELEMENT_ATTRIBUTES
  my $default_bcp47_locale = $self->current_bcp47_locale();

  # This also sets the language related options to their pre-conversion
  # values.
  $self->set_converter_preamble_language_commands();

  my $preamble_bcp47_locale = $self->current_bcp47_locale();

  if ($preamble_bcp47_locale ne '') {
    $self->set_conf('BODY_ELEMENT_ATTRIBUTES', 'lang="'
                                       .$preamble_bcp47_locale.'"');
  } else {
    #$self->set_conf('BODY_ELEMENT_ATTRIBUTES', 'lang=""');

    # Note: HTML 5 documentation specifies that the lang attribute can
    # take an empty string as its value to specify that the language
    # is unknown.  However, outputting lang="" is unnecessary.
  }

  if ($default_bcp47_locale ne $preamble_bcp47_locale) {
    $self->reset_lang_translation_from_customization(
                           $self->get_conf('documentlanguage'),
                           $self->get_conf('documentscript'));
  }

  _init_conversion_after_setup_handler($self);

  my $jslicenses = {};
  if ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax') {
    # See https://www.gnu.org/licenses/javascript-labels.html

    my $mathjax_script = $self->get_conf('MATHJAX_SCRIPT');
    my $mathjax_source = $self->get_conf('MATHJAX_SOURCE');

    $jslicenses->{'mathjax'} = {
      $mathjax_script =>
        [ 'Apache License, Version 2.0.',
          'https://www.apache.org/licenses/LICENSE-2.0',
          $mathjax_source ]};
  }
  if ($self->get_conf('INFO_JS_DIR')) {
    $jslicenses->{'infojs'} = {
      'js/info.js' =>
         [ 'GNU General Public License 3.0 or later',
           'https://www.gnu.org/licenses/gpl-3.0.html',
           'js/info.js' ],
       'js/modernizr.js' =>
          [ 'Expat',
            'http://www.jclark.com/xml/copying.txt',
            'js/modernizr.js' ]};
  }

  $self->{'converter_info'}->{'jslicenses'} = $jslicenses;

  # this sets output_file (based on OUTFILE), to be used if not split,
  # but also the corresponding 'output_filename' that is useful in
  # particular when output_file is '', 'destination_directory' that
  # is mainly useful when split and 'document_name' that is generally useful.
  my ($output_file, $destination_directory, $output_filename, $document_name)
        = $self->determine_files_and_directory(
                              $self->get_conf('TEXINFO_OUTPUT_FORMAT'));

  # set for init files
  $self->{'converter_info'}->{'document_name'} = $document_name;
  $self->{'converter_info'}->{'destination_directory'} = $destination_directory;

  return [$output_file, $destination_directory, $output_filename,
          $document_name];
}

sub _do_jslicenses_file($$) {
  my ($self, $destination_directory) = @_;

  my $setting = $self->get_conf('JS_WEBLABELS');
  my $path = $self->get_conf('JS_WEBLABELS_FILE');

  # Possible settings:
  #   'generate' - create file at JS_WEBLABELS_FILE
  #   'reference' - reference file at JS_WEBLABELS_FILE but do not create it
  #   'omit' - do nothing
  return if (!defined($setting) or $setting ne 'generate' or !defined($path)
             or $path eq '');

  if (File::Spec->file_name_is_absolute($path) or $path =~ /^[A-Za-z]*:/
      or $path eq '-') {
    $self->converter_document_warn(sprintf(
 __("cannot use absolute path or URL `%s' for JS_WEBLABELS_FILE when generating web labels file"), $path));
    return;
  }

  my $doctype = $self->get_conf('DOCTYPE');
  $doctype = '' if (!defined($doctype));
  my $root_html_element_attributes
      = _root_html_element_attributes_string($self);
  my $a = $doctype . "\n" ."<html${root_html_element_attributes}>"
   .'<head><title>jslicense labels</title></head>
<body>
<table id="jslicense-labels1">
';

  my $jslicenses = $self->get_info('jslicenses');
  foreach my $category (sort(keys(%$jslicenses))) {
    foreach my $file (sort(keys(%{$jslicenses->{$category}}))) {
      my $file_info = $jslicenses->{$category}->{$file};
      $a .= "<tr>\n";
      $a .= '<td><a href="'.
                 $self->url_protect_url_text($file)."\">$file</a></td>\n";
      $a .= '<td><a href="'.$self->url_protect_url_text($file_info->[1])
                                         ."\">$file_info->[0]</a></td>\n";
      $a .= '<td><a href="'.$self->url_protect_url_text($file_info->[2])
                                         ."\">$file_info->[2]</a></td>\n";
      $a .= "</tr>\n";
    }
  }

  $a .= "</table>\n</body></html>\n";

  my $license_file;
  if ($destination_directory ne '') {
    $license_file = join('/', ($destination_directory, $path));
  } else {
    $license_file = $path;
  }
  # sequence of bytes
  my ($licence_file_path, $path_encoding)
     = $self->encoded_output_file_name($license_file);
  my ($fh, $error_message_licence_file, $overwritten_file)
         = Texinfo::Convert::Utils::output_files_open_out(
                         $self->output_files_information(),
                         $licence_file_path, undef,
                         $self->get_conf('OUTPUT_ENCODING_NAME'));
  if ($overwritten_file) {
    $self->converter_document_warn(
     sprintf(__("overwriting output file with js licences: %s"),
             $license_file));
  }
  if (defined($fh)) {
    print $fh $a;
    Texinfo::Convert::Utils::output_files_register_closed(
                  $self->output_files_information(), $licence_file_path);
    if (!close ($fh)) {
      $self->converter_document_error(
               sprintf(__("error on closing %s: %s"),
                                    $license_file, $!));
    }
  } else {
    $self->converter_document_error(
           sprintf(__("could not open %s for writing: %s"),
                   $license_file, $error_message_licence_file));
  }
}

sub _do_js_files($$) {
  my ($self, $destination_directory) = @_;

  if ($self->get_conf('INFO_JS_DIR')) {
    my $info_js_dir = $self->get_conf('INFO_JS_DIR');
    my $jsdir;
    if ($destination_directory ne '') {
      $jsdir = join('/', ($destination_directory, $info_js_dir));
    } else {
      $jsdir = $info_js_dir;
    }
    my ($encoded_jsdir, $dir_encoding)
      = $self->encoded_output_file_name($jsdir);
    my $succeeded
      = $self->create_destination_directory($encoded_jsdir, $jsdir);
    # Copy JS files.
    if ($succeeded) {
      if (!$self->get_conf('TEST')) {
        my $jssrcdir;
        if (!$Texinfo::ModulePath::texinfo_uninstalled) {
          $jssrcdir = join('/', (
            $Texinfo::ModulePath::converter_datadir, 'js'));
        } else {
          $jssrcdir = join('/', (
            $Texinfo::ModulePath::t2a_srcdir, $updir, 'js'));
        }
        for my $f ('info.js', 'modernizr.js', 'info.css') {
          my $from = join('/', ($jssrcdir, $f));

          if (!copy($from, $jsdir)) {
            $self->converter_document_error(
              sprintf(__("error on copying %s into %s"), $from, $jsdir));
          }
        }
      } else {
      # create empty files for tests to keep results stable.
        foreach my $f ('info.js', 'modernizr.js', 'info.css') {
          my $filename = join('/', ($jsdir, $f));
          if (!open(FH, '>', $filename)) {
            $self->converter_document_error(
              sprintf(__("error on creating empty %s: %s"),
                      $filename, $!));
          } else {
            if (!close(FH)) {
              $self->converter_document_error(
                sprintf(__("error on closing empty %s: %s"),
                        $filename, $!));
            }
          }
        }
      }
    }
  }

  my $jslicenses = $self->get_info('jslicenses');
  if (defined($jslicenses) and scalar(%$jslicenses)) {
    _do_jslicenses_file($self, $destination_directory);
  }
}

# return 0 on failure, 1 on success.
sub _finish_output($$$$) {
  my ($self, $output_file, $destination_directory, $files_source_info) = @_;

  _do_js_files($self, $destination_directory);

  my $stage_handlers = $self->{'stage_handlers'};
  my $handler_fatal_error_level = $self->get_conf('HANDLER_FATAL_ERROR_LEVEL');
  my $finish_status = _run_stage_handlers($self, $stage_handlers,
                                          $self->{'document'}, 'finish');
  unless ($finish_status < $handler_fatal_error_level
          and $finish_status > -$handler_fatal_error_level) {
    return 0;
  }

  # undef status means an error occured
  my $node_redirections_status = _node_redirections($self, $output_file,
                               $destination_directory, $files_source_info);

  if (!defined($node_redirections_status)) {
    return 0;
  }

  return 1;
}

# Main function for outputting a manual in HTML.
# $SELF is the output converter object of class Texinfo::Convert::HTML (this
# module), and $DOCUMENT is the parsed document from the parser and structuring
sub output($$) {
  my ($self, $document) = @_;

  $self->conversion_initialization('_output', $document);

  my $paths = _setup_output($self);
  if (!defined($paths)) {
    $self->conversion_finalization();
    return undef;
  }
  my ($output_file, $destination_directory, $output_filename, $document_name)
    = @$paths;

  # Get the list of output units to be processed.
  my ($output_units, $special_units, $associated_special_units)
    = _prepare_conversion_units($self, $document, $document_name);

  # setup untranslated strings
  _translate_names($self);

  my $files_source_info
    = _prepare_units_directions_files($self, $output_units, $special_units,
                $associated_special_units,
                $output_file, $destination_directory, $output_filename,
                $document_name);

  my $succeeded = _prepare_converted_output_info($self, $output_file,
                                      $output_filename, $output_units);
  if (!$succeeded) {
    $self->conversion_finalization();
    return undef;
  }

  # conversion
  my $text_output = _html_convert_output($self, $output_file,
                       $destination_directory, $output_filename, $document_name,
                       $document, $output_units, $special_units);

  if (!defined($text_output)) {
    $self->conversion_finalization();
    return undef;
  }

  if ($text_output ne '' and $output_file eq '') {
    # $output_file eq '' should always be true, as $text_output is only
    # filled in that case.
    if (!$self->get_conf('TEST')) {
      # This case is unlikely to happen, as there is no output file
      # only if formatting is called as convert, which only happens in tests.
      _do_js_files($self, $destination_directory);
    }
    $self->conversion_finalization();
    return $text_output;
  }

  my $finish_succeeded = _finish_output($self, $output_file,
                                  $destination_directory, $files_source_info);

  if (!$finish_succeeded) {
    $self->conversion_finalization();
    return undef;
  }

  $self->conversion_finalization();
  return undef;
}

# This is called from the main program on the converter.
sub output_internal_links($) {
  my $self = shift;

  my $out_string = '';

  foreach my $output_unit (@{$self->{'document_units'}}) {
    my $text;
    my $href;
    my $command = $output_unit->{'unit_command'};
    if (defined($command)) {
      # Use '' for filename, to force a filename in href.
      $href = $self->command_href($command, '');
      my ($tree, $in_code) = _internal_command_tree($self, $command, 0);
      if (defined($tree)) {
        $text = Texinfo::Convert::Text::convert_to_text($tree,
                                  $self->{'convert_text_options'});
      }
      if (defined($href) or defined($text)) {
        $out_string .= $href if (defined($href));
        $out_string .= "\tunit\t";
        $out_string .= $text if (defined($text));
        $out_string .= "\n";
      }
    }
  }

  if (exists($self->{'document'})) {
    my $sections_list = $self->{'document'}->sections_list();
    foreach my $section_relations (@{$sections_list}) {
      my $command = $section_relations->{'element'};
      my $href = $self->command_href($command, '');
      my ($tree, $in_code) = _internal_command_tree($self, $command, 0);
      my $text;
      if (defined($tree)) {
        $text = Texinfo::Convert::Text::convert_to_text($tree,
                                  $self->{'convert_text_options'});
      }
      if (defined($href) or defined($text)) {
        $out_string .= $href if (defined($href));
        $out_string .= "\tsection\t";
        my $command_name
          = Texinfo::Structuring::section_level_adjusted_command_name($command);
        $out_string .= $command_name.' ';
        $out_string .= $text if (defined($text));
        $out_string .= "\n";
      }
    }

    my $labels_list = $self->{'document'}->labels_list();
    if (defined($labels_list)) {
      my %commands_lists;
      foreach my $target_element (@$labels_list) {
        next if (not exists($target_element->{'extra'})
                 or not $target_element->{'extra'}->{'is_target'});

        my $cmdname = $target_element->{'cmdname'};
        if (!exists($commands_lists{$cmdname})) {
          $commands_lists{$cmdname} = [];
        }
        push @{$commands_lists{$cmdname}}, $target_element;
      }
      foreach my $cmdtype ('node', 'anchor', 'namedanchor', 'float') {
        next unless (exists($commands_lists{$cmdtype}));
        foreach my $target_element (@{$commands_lists{$cmdtype}}) {
          my $label_element
            = Texinfo::Common::get_label_element($target_element);
          my $href = $self->command_href($target_element, '');
          my $text;
          if (defined($label_element)) {
            $text = Texinfo::Convert::Text::convert_to_text($label_element,
                                    $self->{'convert_text_options'});
          }
          if (defined($href) or defined($text)) {
            $out_string .= $href if (defined($href));
            $out_string .= "\t${cmdtype}\t";
            $out_string .= $text if (defined($text));
            $out_string .= "\n";
          }
        }
      }
    }
  }

  my $sorted_indexes_by_letter
    = $self->get_converter_indices_sorted_by_letter();
  if (defined($sorted_indexes_by_letter)) {
    my $indices_information;
    if (exists($self->{'document'})) {
      $indices_information = $self->{'document'}->indices_information();
    }

    foreach my $index_name (sort(keys(%{$sorted_indexes_by_letter}))) {
      foreach my $letter_entry (@{$sorted_indexes_by_letter->{$index_name}}) {
        foreach my $index_entry (@{$letter_entry->{'entries'}}) {
          my $main_entry_element = $index_entry->{'entry_element'};
          # does not refer to the document
          my $seeentry
            = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                          'seeentry');
          next if (defined($seeentry));
          my $seealso
            = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                          'seealso');
          next if (defined($seealso));

          my $href;
          $href = $self->command_href($main_entry_element, '');
          # Obtain term by converting to text
          my $in_code
            = $indices_information->{$index_entry->{'index_name'}}->{'in_code'};
          if ($in_code) {
            Texinfo::Convert::Text::set_options_code(
                                          $self->{'convert_text_options'});
          }
          my $entry_reference_content_element
            = $self->converter_index_content_element($main_entry_element);
          my @contents = ($entry_reference_content_element);
          my $subentries_tree
            = Texinfo::Convert::Utils::comma_index_subentries_tree(
                                                     $main_entry_element);
          if (defined($subentries_tree)) {
            push @contents, @{$subentries_tree->{'contents'}};
          }
          my $index_term = Texinfo::Convert::Text::convert_to_text(
                Texinfo::TreeElement::new({'contents' => \@contents}),
                                            $self->{'convert_text_options'});
          if ($in_code) {
            Texinfo::Convert::Text::reset_options_code(
                                          $self->{'convert_text_options'});
          }
          if (defined($index_term) and $index_term =~ /\S/) {
            $out_string .= $href if (defined($href));
            $out_string .= "\t$index_name\t";
            $out_string .= $index_term;
            $out_string .= "\n";
          }
        }
      }
    }
  }
  if ($out_string ne '') {
    return $out_string;
  } else {
    return undef;
  }
}

1;
