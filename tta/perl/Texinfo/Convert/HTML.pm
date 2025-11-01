# HTML.pm: output tree as HTML.
#
# Copyright 2011-2025 Free Software Foundation, Inc.
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# The documentation of the HTML customization API which is both
# used and implemented in the current file is in the customization_api
# Texinfo manual.
#
# Formatting and conversion functions that can be replaced by user-defined
# functions should only use documented functions to pass information
# and formatted content, such that users can overrides them independently
# without risking unwanted results.  Also in formatting functions, the state of
# the converter should only be accessed through functions, such as in_math,
# in_preformatted_context, preformatted_classes_stack and similar functions.
#
# Original author: Patrice Dumas <pertusus@free.fr>

# ALTIMP XSTexinfo/convert/ConvertXS.xs
# ALTIMP C/convert/*.[ch]


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

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck confess);
# for abort
#use POSIX;

use File::Copy qw(copy);

use File::Spec;

my $updir = File::Spec->updir();

use Storable;

use Encode qw(find_encoding decode encode);
use charnames ();

use Texinfo::Convert::ConvertXS;
use Texinfo::XSLoader;

use Texinfo::Commands;
use Texinfo::Options;
use Texinfo::CommandsValues;
use Texinfo::UnicodeData;
use Texinfo::HTMLData;
use Texinfo::HTMLDataCSS;

use Texinfo::TreeElement;

use Texinfo::Common;

use Texinfo::Config;
use Texinfo::Convert::Unicode;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Utils;
use Texinfo::Convert::Text;
use Texinfo::Convert::NodeNameNormalization;
use Texinfo::ManipulateTree;
use Texinfo::Structuring;
use Texinfo::OutputUnits;
# for index_entry_first_letter_text_or_command
use Texinfo::Indices;
use Texinfo::Convert::Converter;

# used to convert Texinfo to LaTeX math in @math and @displaymath
# for further conversion by softwares that only convert LaTeX.
# NOTE mathjax does not implement some constructs output by the
# Texinfo::Convert::LaTeX converter.  Examples in 2022:
# \mathord{\text{}} \textsl{} \copyright{} \mathsterling{}
use Texinfo::Convert::LaTeX;

require Exporter;

our @ISA = qw(Texinfo::Convert::Converter);

our $VERSION = '7.2dev';

my $XS_convert = Texinfo::XSLoader::XS_convert_enabled();

my %XS_overrides = (
  "Texinfo::Convert::HTML::_default_format_protect_text"
    => "Texinfo::MiscXS::default_format_protect_text",
  "Texinfo::Convert::HTML::_entity_text"
    => "Texinfo::MiscXS::entity_text",
);

my %XS_conversion_overrides = (
  "Texinfo::Convert::HTML::_XS_format_setup"
   => "Texinfo::Convert::ConvertXS::html_format_setup",

  "Texinfo::Convert::HTML::converter_defaults"
   => "Texinfo::Convert::ConvertXS::converter_defaults",
  "Texinfo::Convert::HTML::_XS_html_converter_initialize_beginning"
   => "Texinfo::Convert::ConvertXS::html_converter_initialize_beginning",
  "Texinfo::Convert::HTML::_XS_html_converter_get_customization"
   => "Texinfo::Convert::ConvertXS::html_converter_get_customization_sv",

  "Texinfo::Convert::HTML::output"
   => "Texinfo::Convert::ConvertXS::html_output",
  "Texinfo::Convert::HTML::convert"
   => "Texinfo::Convert::ConvertXS::html_convert",

  "Texinfo::Convert::HTML::output_internal_links"
    => "Texinfo::Convert::ConvertXS::html_output_internal_links",

  # following are not called when output and convert are overriden
  # (since 2024-07).
  # NOTE not possible to simply remove output or convert overriding,
  # there are errors because overrides related to passing output
  # units were removed when some associated code was modified in 2025-08.
  "Texinfo::Convert::HTML::conversion_initialization"
   => "Texinfo::Convert::ConvertXS::html_conversion_initialization",
  "Texinfo::Convert::HTML::_setup_convert"
   => "Texinfo::Convert::ConvertXS::html_setup_convert",
  "Texinfo::Convert::HTML::_setup_output"
   => "Texinfo::Convert::ConvertXS::html_setup_output",
  "Texinfo::Convert::HTML::conversion_finalization"
   => "Texinfo::Convert::ConvertXS::html_conversion_finalization",
  "Texinfo::Convert::HTML::_prepare_simpletitle"
   => "Texinfo::Convert::ConvertXS::html_prepare_simpletitle",
  "Texinfo::Convert::HTML::_prepare_converted_output_info"
   => "Texinfo::Convert::ConvertXS::html_prepare_converted_output_info",

  "Texinfo::Convert::HTML::command_id"
   => "Texinfo::Convert::ConvertXS::html_command_id",
  "Texinfo::Convert::HTML::command_contents_target"
   => "Texinfo::Convert::ConvertXS::html_command_contents_target",
  "Texinfo::Convert::HTML::footnote_location_target"
   => "Texinfo::Convert::ConvertXS::html_footnote_location_target",
  "Texinfo::Convert::HTML::footnote_location_href"
   => "Texinfo::Convert::ConvertXS::html_footnote_location_href",
  "Texinfo::Convert::HTML::command_filename"
   => "Texinfo::Convert::ConvertXS::html_command_filename",
  "Texinfo::Convert::HTML::command_root_element_command"
   => "Texinfo::Convert::ConvertXS::html_command_root_element_command",
  "Texinfo::Convert::HTML::command_node"
   => "Texinfo::Convert::ConvertXS::html_command_node",
  "Texinfo::Convert::HTML::_internal_command_href"
   => "Texinfo::Convert::ConvertXS::html_internal_command_href",
  "Texinfo::Convert::HTML::command_contents_href"
   => "Texinfo::Convert::ConvertXS::html_command_contents_href",
  "Texinfo::Convert::HTML::_internal_command_tree"
   => "Texinfo::Convert::ConvertXS::html_internal_command_tree",
  "Texinfo::Convert::HTML::_internal_command_name_tree"
   => "Texinfo::Convert::ConvertXS::html_internal_command_name_tree",
  "Texinfo::Convert::HTML::_internal_command_text"
   => "Texinfo::Convert::ConvertXS::html_internal_command_text",
  "Texinfo::Convert::HTML::_internal_command_name"
   => "Texinfo::Convert::ConvertXS::html_internal_command_name",
  "Texinfo::Convert::HTML::command_description"
   => "Texinfo::Convert::ConvertXS::html_command_description",
  "Texinfo::Convert::HTML::global_direction_unit"
   => "Texinfo::Convert::ConvertXS::html_global_direction_unit",
  "Texinfo::Convert::HTML::global_direction_text"
   => "Texinfo::Convert::ConvertXS::html_global_direction_text",

  "Texinfo::Convert::HTML::_XS_set_shared_conversion_state"
   => "Texinfo::Convert::ConvertXS::html_set_shared_conversion_state",
  "Texinfo::Convert::HTML::_XS_get_shared_conversion_state"
   => "Texinfo::Convert::ConvertXS::html_get_shared_conversion_state",

  "Texinfo::Convert::HTML::get_info"
   => "Texinfo::Convert::ConvertXS::html_get_info",

  "Texinfo::Convert::HTML::_open_command_update_context"
   => "Texinfo::Convert::ConvertXS::html_open_command_update_context",
  "Texinfo::Convert::HTML::_convert_command_update_context",
   => "Texinfo::Convert::ConvertXS::html_convert_command_update_context",
  "Texinfo::Convert::HTML::_open_type_update_context",
   => "Texinfo::Convert::ConvertXS::html_open_type_update_context",
  "Texinfo::Convert::HTML::_convert_type_update_context"
   => "Texinfo::Convert::ConvertXS::html_convert_type_update_context",
  "Texinfo::Convert::HTML::_new_document_context"
   => "Texinfo::Convert::ConvertXS::html_new_document_context",
  "Texinfo::Convert::HTML::_pop_document_context"
   => "Texinfo::Convert::ConvertXS::html_pop_document_context",
  "Texinfo::Convert::HTML::_set_code_context"
   => "Texinfo::Convert::ConvertXS::html_set_code_context",
  "Texinfo::Convert::HTML::_pop_code_context"
   => "Texinfo::Convert::ConvertXS::html_pop_code_context",
  "Texinfo::Convert::HTML::_set_string_context"
   => "Texinfo::Convert::ConvertXS::html_set_string_context",
  "Texinfo::Convert::HTML::_unset_string_context"
   => "Texinfo::Convert::ConvertXS::html_unset_string_context",
  "Texinfo::Convert::HTML::_set_raw_context"
   => "Texinfo::Convert::ConvertXS::html_set_raw_context",
  "Texinfo::Convert::HTML::_unset_raw_context"
   => "Texinfo::Convert::ConvertXS::html_unset_raw_context",
  "Texinfo::Convert::HTML::_set_multiple_conversions"
   => "Texinfo::Convert::ConvertXS::html_set_multiple_conversions",
  "Texinfo::Convert::HTML::_unset_multiple_conversions"
   => "Texinfo::Convert::ConvertXS::html_unset_multiple_conversions",

  "Texinfo::Convert::HTML::_debug_print_html_contexts"
   => "Texinfo::Convert::ConvertXS::html_debug_print_html_contexts",

  "Texinfo::Convert::HTML::in_math"
   => "Texinfo::Convert::ConvertXS::html_in_math",
  "Texinfo::Convert::HTML::in_preformatted_context"
   => "Texinfo::Convert::ConvertXS::html_in_preformatted_context",
  "Texinfo::Convert::HTML::inside_preformatted"
   => "Texinfo::Convert::ConvertXS::html_inside_preformatted",
  "Texinfo::Convert::HTML::in_upper_case"
   => "Texinfo::Convert::ConvertXS::html_in_upper_case",
  "Texinfo::Convert::HTML::in_non_breakable_space"
   => "Texinfo::Convert::ConvertXS::html_in_non_breakable_space",
  "Texinfo::Convert::HTML::in_space_protected"
   => "Texinfo::Convert::ConvertXS::html_in_space_protected",
  "Texinfo::Convert::HTML::in_code"
   => "Texinfo::Convert::ConvertXS::html_in_code",
  "Texinfo::Convert::HTML::in_string"
   => "Texinfo::Convert::ConvertXS::html_in_string",
  "Texinfo::Convert::HTML::in_verbatim"
   => "Texinfo::Convert::ConvertXS::html_in_verbatim",
  "Texinfo::Convert::HTML::in_raw"
   => "Texinfo::Convert::ConvertXS::html_in_raw",
  "Texinfo::Convert::HTML::in_multiple_conversions"
   => "Texinfo::Convert::ConvertXS::html_in_multiple_conversions",
  "Texinfo::Convert::HTML::paragraph_number"
   => "Texinfo::Convert::ConvertXS::html_paragraph_number",
  "Texinfo::Convert::HTML::preformatted_number"
   => "Texinfo::Convert::ConvertXS::html_preformatted_number",
  "Texinfo::Convert::HTML::top_block_command"
   => "Texinfo::Convert::ConvertXS::html_top_block_command",
  "Texinfo::Convert::HTML::preformatted_classes_stack"
   => "Texinfo::Convert::ConvertXS::html_preformatted_classes_stack",
  "Texinfo::Convert::HTML::in_align"
   => "Texinfo::Convert::ConvertXS::html_in_align",
  "Texinfo::Convert::HTML::in_multi_expanded"
   => "Texinfo::Convert::ConvertXS::html_in_multi_expanded",
  "Texinfo::Convert::HTML::current_filename"
   => "Texinfo::Convert::ConvertXS::html_current_filename",
  "Texinfo::Convert::HTML::current_output_unit"
   => "Texinfo::Convert::ConvertXS::html_current_output_unit",

  "Texinfo::Convert::HTML::count_elements_in_filename"
   => "Texinfo::Convert::ConvertXS::html_count_elements_in_filename",
  "Texinfo::Convert::HTML::is_format_expanded",
   => "Texinfo::Convert::ConvertXS::html_is_format_expanded",
  "Texinfo::Convert::HTML::register_file_information"
   => "Texinfo::Convert::ConvertXS::html_register_file_information",
  "Texinfo::Convert::HTML::get_file_information",
   => "Texinfo::Convert::ConvertXS::html_get_file_information",
  "Texinfo::Convert::HTML::register_opened_section_level"
   => "Texinfo::Convert::ConvertXS::html_register_opened_section_level",
  "Texinfo::Convert::HTML::close_registered_sections_level"
   => "Texinfo::Convert::ConvertXS::html_close_registered_sections_level",
  "Texinfo::Convert::HTML::set_global_direction"
   => "Texinfo::Convert::ConvertXS::html_set_global_direction",
  "Texinfo::Convert::HTML::html_attribute_class"
   => "Texinfo::Convert::ConvertXS::html_attribute_class",
  "Texinfo::Convert::HTML::html_get_css_elements_classes"
   => "Texinfo::Convert::ConvertXS::html_get_css_elements_classes",
  "Texinfo::Convert::HTML::css_add_info"
   => "Texinfo::Convert::ConvertXS::html_css_add_info",
  "Texinfo::Convert::HTML::css_set_selector_style"
   => "Texinfo::Convert::ConvertXS::html_css_set_selector_style",
  "Texinfo::Convert::HTML::css_get_info"
   => "Texinfo::Convert::ConvertXS::html_css_get_info",
  "Texinfo::Convert::HTML::css_get_selector_style",
   => "Texinfo::Convert::ConvertXS::html_css_get_selector_style",
  "Texinfo::Convert::HTML::register_footnote",
   => "Texinfo::Convert::ConvertXS::html_register_footnote",
  "Texinfo::Convert::HTML::get_pending_footnotes",
   => "Texinfo::Convert::ConvertXS::html_get_pending_footnotes",
  "Texinfo::Convert::HTML::register_pending_formatted_inline_content"
   => "Texinfo::Convert::ConvertXS::html_register_pending_formatted_inline_content",
  "Texinfo::Convert::HTML::cancel_pending_formatted_inline_content",
   => "Texinfo::Convert::ConvertXS::html_cancel_pending_formatted_inline_content",
  "Texinfo::Convert::HTML::get_pending_formatted_inline_content",
   => "Texinfo::Convert::ConvertXS::html_get_pending_formatted_inline_content",
  "Texinfo::Convert::HTML::associate_pending_formatted_inline_content"
   => "Texinfo::Convert::ConvertXS::html_associate_pending_formatted_inline_content",
  "Texinfo::Convert::HTML::get_associated_formatted_inline_content",
   => "Texinfo::Convert::ConvertXS::html_get_associated_formatted_inline_content",
  "Texinfo::Convert::HTML::_push_referred_command_stack_command"
   => "Texinfo::Convert::ConvertXS::html_push_referred_command_stack_command",
  "Texinfo::Convert::HTML::_pop_referred_command_stack"
   => "Texinfo::Convert::ConvertXS::html_pop_referred_command_stack",
  "Texinfo::Convert::HTML::_command_is_in_referred_command_stack"
   => "Texinfo::Convert::ConvertXS::html_command_is_in_referred_command_stack",
  "Texinfo::Convert::HTML::_check_htmlxref_already_warned"
   => "Texinfo::Convert::ConvertXS::html_check_htmlxref_already_warned",

  "Texinfo::Convert::HTML::_translate_names"
   => "Texinfo::Convert::ConvertXS::html_translate_names",

  # following are not called when output and convert are overriden
  "Texinfo::Convert::HTML::_prepare_title_titlepage"
   => "Texinfo::Convert::ConvertXS::html_prepare_title_titlepage",
  "Texinfo::Convert::HTML::_html_convert_convert"
   => "Texinfo::Convert::ConvertXS::html_convert_convert",
  "Texinfo::Convert::HTML::_html_convert_output"
   => "Texinfo::Convert::ConvertXS::html_convert_output",
  "Texinfo::Convert::HTML::_prepare_node_redirection_page"
   => "Texinfo::Convert::ConvertXS::html_prepare_node_redirection_page",
  "Texinfo::Convert::HTML::_node_redirections"
   => "Texinfo::Convert::ConvertXS::html_node_redirections",

  # Cannot be overriden, in general the trees are not registered in Perl
  #"Texinfo::Convert::HTML::_XS_html_convert_tree"
  # => "Texinfo::Convert::ConvertXS::html_convert_tree",
);

# HTML C data initialization independent of customization and of Perl
# default variables.
sub _XS_format_setup() {
}

our $module_loaded = 0;
sub import {
  if (!$module_loaded) {
    foreach my $sub (keys %XS_overrides) {
      Texinfo::XSLoader::override ($sub, $XS_overrides{$sub});
    }

    if ($XS_convert) {
      foreach my $sub (keys %XS_conversion_overrides) {
        Texinfo::XSLoader::override ($sub, $XS_conversion_overrides{$sub});
      }
      # initialize HTML C data
      _XS_format_setup();
    }

    $module_loaded = 1;
  }
  # The usual import method
  goto &Exporter::import;
}

my %nobrace_commands = %Texinfo::Commands::nobrace_commands;
my %line_commands = %Texinfo::Commands::line_commands;
my %nobrace_symbol_text = %Texinfo::CommandsValues::nobrace_symbol_text;
my %accent_commands = %Texinfo::Commands::accent_commands;
my %sectioning_heading_commands = %Texinfo::Commands::sectioning_heading_commands;
my %def_commands = %Texinfo::Commands::def_commands;
my %ref_commands = %Texinfo::Commands::ref_commands;
my %brace_commands = %Texinfo::Commands::brace_commands;
my %block_commands = %Texinfo::Commands::block_commands;
my %root_commands = %Texinfo::Commands::root_commands;
my %preformatted_commands = %Texinfo::Commands::preformatted_commands;
my %math_commands = %Texinfo::Commands::math_commands;
my %preformatted_code_commands = %Texinfo::Commands::preformatted_code_commands;
my %letter_no_arg_commands = %Texinfo::Commands::letter_no_arg_commands;

my %formatted_line_commands = %Texinfo::Commands::formatted_line_commands;
my %formatted_nobrace_commands = %Texinfo::Commands::formatted_nobrace_commands;
my %formattable_line_commands = %Texinfo::Commands::formattable_line_commands;
my %explained_commands = %Texinfo::Commands::explained_commands;
my %inline_format_commands = %Texinfo::Commands::inline_format_commands;
my %brace_code_commands       = %Texinfo::Commands::brace_code_commands;
my %default_index_commands = %Texinfo::Commands::default_index_commands;
my %small_block_associated_command = %Texinfo::Common::small_block_associated_command;

foreach my $def_command (keys(%def_commands)) {
  $formatted_line_commands{$def_command} = 1
     if (exists($line_commands{$def_command}));
}

my %HTML_align_commands;
foreach my $align_command('raggedright', 'flushleft', 'flushright', 'center') {
  $HTML_align_commands{$align_command} = 1;
}

my %composition_context_commands = (%preformatted_commands, %root_commands,
  %HTML_align_commands);
$composition_context_commands{'float'} = 1;
my %format_context_commands = (%block_commands, %root_commands);
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


# API for html formatting

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
  $self->{'customized_global_directions'} = {}
    if (!exists($self->{'customized_global_directions'}));
  $self->{'customized_global_directions'}->{$direction} = $node_texi_name;
  return;
}

sub _collect_css_element_class($$) {
  my ($self, $element_class) = @_;

  #if (not $self->{'document_global_context'}
  #    and not defined($self->{'current_filename'})) {
  #  cluck "BUG: $element_class: CSS no current file";
  #}

  if (defined($self->{'css_element_class_styles'}->{$element_class})) {
    if ($self->{'document_global_context'}) {
      $self->{'document_global_context_css'}->{$element_class} = 1;
    } elsif (defined($self->{'current_filename'})) {
      $self->{'page_css'}->{$self->{'current_filename'}} = {}
        if (!exists($self->{'page_css'}->{$self->{'current_filename'}}));
      $self->{'page_css'}->{$self->{'current_filename'}}->{$element_class} = 1;
    }
  }
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
        confess ("class not defined (for $element)");
      }
      if (defined($self->{'css_element_class_styles'}
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

sub close_html_lone_element($$) {
  my ($self, $html_element) = @_;

  if ($self->get_conf('USE_XML_SYNTAX')) {
    return $html_element . '/>';
  }
  return $html_element .'>';
}

my $xml_named_entity_nbsp = '&nbsp;';

my $html_default_entity_nbsp = $xml_named_entity_nbsp;

sub substitute_html_non_breaking_space($$) {
  my ($self, $text) = @_;

  my $non_breaking_space = $self->get_info('non_breaking_space');
  # using \Q \E on the substitution leads to spurious \
  $text =~ s/\Q$html_default_entity_nbsp\E/$non_breaking_space/g;
  return $text;
}

my @image_files_extensions = ('.png', '.jpg', '.jpeg', '.gif');

# this can be used in init files to get the path of the image
# files.  In general the result of image formatting cannot
# be used to get an image file name path, as the path is not
# used in the output.
sub html_image_file_location_name($$$$$) {
  my ($self, $cmdname, $command, $image_basefile, $args) = @_;

  my @extensions = @image_files_extensions;

  my $image_file;
  my $image_extension;
  # this variable is bytes encoded in the filesystem encoding
  my ($image_path, $image_path_encoding);
  my $extension;
  # NOTE should be consistent with $image_basefile formatting
  if (defined($args->[4]) and defined($args->[4]->{'filenametext'})) {
    $extension = $args->[4]->{'filenametext'};
    unshift @extensions, ("$extension", ".$extension");
  }
  foreach my $tried_extension (@extensions) {
    my ($file_name, $file_name_encoding)
      = $self->encoded_input_file_name($image_basefile.$tried_extension);
    my $located_image_path
          = Texinfo::Common::locate_include_file($file_name,
                                  $self->get_conf('INCLUDE_DIRECTORIES'));
    if (defined($located_image_path) and $located_image_path ne '') {
      $image_path = $located_image_path;
      $image_path_encoding = $file_name_encoding;
      # use the @-command argument and not the file found using the
      # include paths.  It is considered that the files in include paths
      # will be moved by the caller anyway.
      # If the file path found was to be used it should be decoded to perl
      # codepoints too.
      $image_file = $image_basefile.$tried_extension;
      $image_extension = $tried_extension;
      last;
    }
  }
  if (!defined($image_file) or $image_file eq '') {
    if (defined($extension) and $extension ne '') {
      $image_file = $image_basefile.$extension;
      $image_extension = $extension;
    } else {
      $image_file = "$image_basefile.jpg";
      $image_extension = '.jpg';
    }
  }
  return ($image_file, $image_extension, $image_path,
          $image_path_encoding);
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

  $self->{'css_element_class_styles'}->{$css_info} = $css_style;
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

  if (defined($self->{'css_element_class_styles'}->{$css_info})) {
    return $self->{'css_element_class_styles'}->{$css_info};
  } else {
    return undef;
  }
}

my %default_css_string_commands_conversion;
my %default_css_string_types_conversion;
my %default_css_string_formatting_references;

sub html_convert_css_string($$$) {
  my ($self, $element, $context_str) = @_;

  my $saved_commands = {};
  my $saved_types = {};
  my $saved_formatting_references = {};
  foreach my $cmdname (keys(%default_css_string_commands_conversion)) {
    $saved_commands->{$cmdname} = $self->{'commands_conversion'}->{$cmdname};
    $self->{'commands_conversion'}->{$cmdname}
      = $default_css_string_commands_conversion{$cmdname};
  }
  foreach my $type (keys(%default_css_string_types_conversion)) {
    $saved_types->{$type} = $self->{'types_conversion'}->{$type};
    $self->{'types_conversion'}->{$type}
      = $default_css_string_types_conversion{$type};
  }
  foreach my $formatting_reference
                          (keys(%default_css_string_formatting_references)) {
    $saved_formatting_references->{$formatting_reference}
      = $self->{'formatting_function'}->{$formatting_reference};
    $self->{'formatting_function'}->{$formatting_reference}
      = $default_css_string_formatting_references{$formatting_reference};
  }
  my $css_string_context_str = 'CSS string '.$context_str;
  _new_document_context($self, $css_string_context_str);
  _set_string_context($self);
  my $result
   = $self->convert_tree($element, "new_fmt_ctx C($css_string_context_str)");
  _pop_document_context($self);

  foreach my $cmdname (keys (%default_css_string_commands_conversion)) {
    $self->{'commands_conversion'}->{$cmdname} = $saved_commands->{$cmdname};
  }
  foreach my $type (keys(%default_css_string_types_conversion)) {
    $self->{'types_conversion'}->{$type} = $saved_types->{$type};
  }
  foreach my $formatting_reference (keys(%default_css_string_formatting_references)) {
    $self->{'formatting_function'}->{$formatting_reference}
     = $saved_formatting_references->{$formatting_reference};
  }
  return $result;
}

my %special_list_mark_css_string_no_arg_command = (
# tried to use HYPHEN BULLET \2043 for use as in a bullet list, but, at least
# with my test of firefox the result is very different from a bullet.
# hyphen minus or hyphen \2010 are even smaller than hyphen bullet.
# Use the Unicode codepoint used normally for a mathematical minus \2212
# even though it is too large, since the others are too short...
# (which is actually the default, but this could change).
  #'minus' => '-',
  #'minus' => '\2010 ',
  'minus' => '\2212 ',
);

sub html_convert_css_string_for_list_mark($$;$) {
  my ($self, $element, $explanation) = @_;

  my $saved_css_string_no_arg_command = {};
  foreach my $command (keys(%special_list_mark_css_string_no_arg_command)) {
    $saved_css_string_no_arg_command->{$command}
      = $self->{'no_arg_commands_formatting'}->{$command}->{'css_string'};
    $self->{'no_arg_commands_formatting'}->{$command}->{'css_string'}
      = $special_list_mark_css_string_no_arg_command{$command};
  }
  my $result = $self->html_convert_css_string($element, $explanation);
  foreach my $command (keys(%special_list_mark_css_string_no_arg_command)) {
    $self->{'no_arg_commands_formatting'}->{$command}->{'css_string'}
      = $saved_css_string_no_arg_command->{$command};
  }
  return $result;
}

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

  return $self->{'multiple_conversions'};
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

sub in_multi_expanded($) {
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

# Return string for linking to $COMMAND with <a href>
# $SOURCE_COMMAND is only used for messages
# $SPECIFIED_TARGET can be set to specify explicitly the target
sub command_href($$;$$$) {
  my ($self, $command, $source_filename, $source_command,
      $specified_target) = @_;

  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'manual_content'})) {
    return _external_node_href($self, $command, $source_command);
  }

  return _internal_command_href($self, $command, $source_filename,
                                $specified_target);
}

my %contents_command_special_unit_variety = (
  'contents' => 'contents',
  'shortcontents' => 'shortcontents',
  'summarycontents' => 'shortcontents',
);

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

sub _internal_command_tree($$$) {
  my ($self, $command, $no_number) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (!exists($target->{'tree'})) {
      my $tree;
      if (exists($command->{'type'})
          and $command->{'type'} eq 'special_unit_element') {
        my $special_unit_variety
           = $command->{'associated_unit'}->{'special_unit_variety'};
        $tree
          = $self->special_unit_info('heading_tree',
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
        $tree = Texinfo::TreeElement::new({'type' => '_code',
                                           'contents' => [$label_element]});
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
        if (exists($line_arg->{'contents'})) {
          my $section_number;
          $section_number = $command->{'extra'}->{'section_heading_number'}
            if (exists($command->{'extra'})
                and defined($command->{'extra'}->{'section_heading_number'}));
          if ($section_number
              and ($self->get_conf('NUMBER_SECTIONS')
                   or !defined($self->get_conf('NUMBER_SECTIONS')))) {
            my $substituted_strings
              = {'number' =>
                  Texinfo::TreeElement::new({'text' => $section_number}),
                 'section_title'
                => Texinfo::ManipulateTree::copy_treeNonXS($line_arg)};

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
    }

    return $target->{'tree_nonumber'}
         if ($no_number and exists($target->{'tree_nonumber'}));
    return $target->{'tree'};
  }
  return undef;
}

sub _external_command_tree($$) {
  my ($self, $command) = @_;

  my $node_content = $command->{'extra'}->{'node_content'};
  my $tree = Texinfo::TreeElement::new(
       {'type' => '_code',
        'contents' => [Texinfo::TreeElement::new({'text' => '('}),
                       $command->{'extra'}->{'manual_content'},
                       Texinfo::TreeElement::new({'text' => ')'})]});
  if (exists($command->{'extra'}->{'node_content'})) {
    push @{$tree->{'contents'}}, $command->{'extra'}->{'node_content'};
  }
  return $tree;
}

sub command_tree($$;$) {
  my ($self, $command, $no_number) = @_;

  if (!defined($command)) {
    cluck "in command_tree command not defined";
  }

  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'manual_content'})) {
    return _external_command_tree($self, $command);
  }

  return _internal_command_tree($self, $command, $no_number);
}

sub _push_referred_command_stack_command($$) {
  my ($self, $command) = @_;

  push @{$self->{'referred_command_stack'}}, $command;
}

sub _pop_referred_command_stack($) {
  my $self = shift;

  pop @{$self->{'referred_command_stack'}};
}

sub _command_is_in_referred_command_stack($$) {
  my ($self, $command) = @_;

  return grep {$_ eq $command} @{$self->{'referred_command_stack'}};
}

sub _convert_command_tree($$$$$) {
  my ($self, $command, $type, $selected_tree, $command_info) = @_;

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

  _new_document_context($self, $context_name, $explanation);

  my $tree_root;
  if ($type eq 'string' or $type eq 'string_nonumber') {
    $tree_root = Texinfo::TreeElement::new({'type' => '_string',
                                    'contents' => [$selected_tree]});
  } else {
    $tree_root = $selected_tree;
  }

  _set_multiple_conversions($self, undef);

  _push_referred_command_stack_command($self, $command);
  my $result = _convert($self, $tree_root, $explanation);
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
    my $command_tree = _internal_command_tree($self, $command, 0);
    return '' if (!defined($command_tree));

    my $selected_tree;

    if ($type =~ /^(.*)_nonumber$/
        and defined($target->{'tree_nonumber'})) {
      $selected_tree = $target->{'tree_nonumber'};
    } else {
      $selected_tree = $command_tree;
    }

    $target->{$type}
      = _convert_command_tree($self, $command, $type, $selected_tree,
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

# Return text to be used for $COMMAND.
# $TYPE refers to the type of value returned from this function:
#  'text' - return text
#  'text_nonumber' - return text, without the section/chapter number
#  'string' - return simpler text that can be used in element attributes
#  'string_nonumber' - same as string, without the section/chapter number
sub command_text($$;$) {
  my ($self, $command, $type) = @_;

  if (!defined($type)) {
    $type = 'text';
  }

  if (!defined($command)) {
    cluck "in command_text($type) command not defined";
  }

  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'manual_content'})) {
    my $tree = _external_command_tree($self, $command);
    if ($type eq 'string' or $type eq 'string_nonumber') {
      $tree = Texinfo::TreeElement::new({'type' => '_string',
                                         'contents' => [$tree]});
    }
    my $context_str = "command_text $type ";
    if (exists($command->{'cmdname'})) {
      # this never happens, as the external node label tree
      # element is never directly an @-command.  It can be an @-command
      # argument, in a menu, or a reconstituted tree.
      $context_str .= '@'.$command->{'cmdname'};
    } elsif (exists($command->{'type'})) {
      $context_str .= $command->{'type'};
    }
    # NOTE the multiple pass argument is not unicized, and no global
    # context argument is given because this external node manual label
    # should in general be converted only once.
    # In addition, regarding multiple pass, it is unlikely for
    # @-commands which should better be converted only once to be present.
    my $result
      = $self->convert_tree_new_formatting_context($tree,
                                                   $context_str,
                                               'command_text-manual_content');
    return $result;
  }

  return _internal_command_text($self, $command, $type);
}

sub _internal_command_name_tree($$$) {
  my ($self, $command, $no_number) = @_;

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (!exists($target->{'name_tree'})) {
      my $tree;
      if (exists($command->{'cmdname'})
          and $command->{'cmdname'} eq 'namedanchor'
          and scalar(@{$command->{'contents'}}) > 1
          and exists($command->{'contents'}->[1]->{'contents'})) {
        $tree = $command->{'contents'}->[1];
      }
      $target->{'name_tree'} = $tree;
    }

    # currently not possible
    #return $target->{'name_tree_nonumber'} if ($no_number
    #                                  and $target->{'name_tree_nonumber'});
    return $target->{'name_tree'};
  }
  return undef;
}

sub _internal_command_name($$$) {
  my ($self, $command, $type) = @_;

  my $name_type = "name_$type";

  my $target = _get_target($self, $command);
  if (defined($target)) {
    if (exists($target->{$name_type})) {
      return $target->{$name_type};
    }
    my $command_name_tree = _internal_command_name_tree($self, $command, 0);

    if (!defined($command_name_tree)) {
      $command_name_tree = _internal_command_tree($self, $command, 0);
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
      = _convert_command_tree($self, $command, $type, $selected_tree,
                              'command_name');
    return $target->{$name_type};
  }
  return undef;
}

# Return text to be used for $COMMAND using the name rather than an
# identifier, when the distinction exists.
# $TYPE refers to the type of value returned from this function:
#  'text' - return text
#  'text_nonumber' - return text, without the section/chapter number
#  'string' - return simpler text that can be used in element attributes
sub command_name($$;$) {
  my ($self, $command, $type) = @_;

  if (!defined($type)) {
    $type = 'text';
  }

  if (!defined($command)) {
    cluck "in command_name($type) command not defined";
  }

  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'manual_content'})) {
    return command_text($self, $command, $type);
  }

  return _internal_command_name($self, $command, $type);
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

    my $tree_root;
    if ($type eq 'string') {
      $tree_root = Texinfo::TreeElement::new({'type' => '_string',
                               'contents' => [$description_element]});
    } else {
      $tree_root = $description_element;
    }

    $target->{$cached_type}
      = $self->convert_tree_new_formatting_context($tree_root,
                                                   $context_name,
                                     $multiple_formatted, $explanation);

    return $target->{$cached_type};
  }
  return undef;
}


# Return the element in the tree that $LABEL refers to.
sub label_command($$) {
  my ($self, $label) = @_;

  if (!defined($label)) {
    cluck;
  }
  my $identifiers_target;
  if (exists($self->{'document'})) {
    $identifiers_target = $self->{'document'}->labels_information();

    if (defined($identifiers_target)) {
      return $identifiers_target->{$label};
    }
  }
  return undef;
}

sub command_name_special_unit_information($$) {
  my ($self, $cmdname) = @_;

  my $special_unit_variety;
  if (exists($contents_command_special_unit_variety{$cmdname})) {
    $special_unit_variety
       = $contents_command_special_unit_variety{$cmdname};
  } elsif ($cmdname eq 'footnote') {
    $special_unit_variety = 'footnotes';
  } else {
    return (undef, undef, undef, undef);
  }
  my $special_unit_direction
    = $self->special_unit_info('direction', $special_unit_variety);
  my $special_unit
    = $self->global_direction_unit($special_unit_direction);
  my $class_base
    = $self->special_unit_info('class', $special_unit_variety);
  return ($special_unit_variety, $special_unit, $class_base,
          $special_unit_direction);
}

sub global_direction_unit($$) {
  my ($self, $direction) = @_;

  return $self->{'global_units_directions'}->{$direction};
}

sub global_direction_text($$) {
  my ($self, $direction) = @_;

  return $self->{'global_texts_directions'}->{$direction};
}

sub get_element_root_command_element($$) {
  my ($self, $element) = @_;

  my ($output_unit, $root_command)
    = _html_get_tree_root_element($self, $element);
  if (defined($root_command)) {
    if ($self->get_conf('USE_NODES')) {
      if (exists($root_command->{'cmdname'})) {
        if ($root_command->{'cmdname'} eq 'node') {
          return ($output_unit, $root_command);
        } elsif (exists($self->{'document'})) {
          my $sections_list = $self->{'document'}->sections_list();
          my $section_relations
            = $sections_list->[$root_command->{'extra'}->{'section_number'} -1];
          if (exists($section_relations->{'associated_node'})) {
            return ($output_unit,
                    $section_relations->{'associated_node'}->{'element'});
          }
        }
      }
    } elsif (exists($root_command->{'cmdname'})
             and $root_command->{'cmdname'} eq 'node') {
      if (exists($self->{'document'})) {
        my $nodes_list = $self->{'document'}->nodes_list();
        my $node_relations
          = $nodes_list->[$root_command->{'extra'}->{'node_number'} -1];
        if (exists($node_relations->{'associated_section'})) {
          return ($output_unit,
                  $node_relations->{'associated_section'}->{'element'});
        }
      }
    }
  }
  return ($output_unit, $root_command);
}

my %valid_direction_return_type = (
  # a string that can be used in a href linking to the direction
  'href' => 1,
  # a string representing the direction that can be used in
  # context where only entities are available (ie with HTML attributes)
  'string' => 1,
  # a string representing the direction to be used in contexts
  # not restricted in term of available formatting (ie with HTML elements)
  'text' => 1,
  # same as 'text', but select node in priority
  'node' => 1,
  # same as 'text_nonumber' but select section in priority
  'section' => 1
);

foreach my $no_number_type ('text', 'string', 'section') {
  # without section number
  $valid_direction_return_type{$no_number_type .'_nonumber'} = 1;
}

# sub from_element_direction($SELF, $DIRECTION, $TYPE, $SOURCE_UNIT,
#                            $SOURCE_FILENAME, $SOURCE_FOR_MESSAGES)
#
# Return text used for linking from $SOURCE_UNIT in direction $DIRECTION.
# The text returned depends on $TYPE.
#
# This is used both for output units and external nodes
#
# If $SOURCE_UNIT is undef, $self->current_output_unit() is used.
#
# $SOURCE_FOR_MESSAGES is an element used for messages formatting, to get a
# location in input file.  It is better to choose the node and not the
# sectioning command associated with the element, as the error messages
# are about external nodes not found.
#
# $self->current_output_unit() undef happens when there is no
# output file.  In the test suite, that call results only from
# from_element_direction being called from _get_links, itself
# called from 'format_begin_file' ultimately called from output
# without output file.  There could probably be other cases
# with crafted/test code, but it should never happen when output is
# called from the main program as there is always an output file.
sub from_element_direction($$$;$$$) {
  my ($self, $direction, $type, $source_unit, $source_filename,
  # for messages only
     $source_command) = @_;

  my $target_unit;
  my $command;

  $source_unit = $self->current_output_unit() if (!defined($source_unit));
  # NOTE $source_filename is only used for a command_href call.  If with XS,
  # if source_filename remains undef, the command_href XS code will set the
  # source_filename to the current filename in XS. Therefore undef
  # current_filename in that case leads to the same output as set
  # current_filename.
  # We still set it correctly in case it becomes used in other codes.
  $source_filename = $self->current_filename() if (!defined($source_filename));
  if (!exists($valid_direction_return_type{$type})) {
    print STDERR "Incorrect type $type in from_element_direction call\n";
    return undef;
  }
  my $global_target_unit = $self->global_direction_unit($direction);
  if (defined($global_target_unit)) {
    $target_unit = $global_target_unit;
  # output TOP_NODE_UP related info even if $source_unit is not defined,
  # which should correspond to cases when there is no output file, mainly in
  # tests.
  } elsif ((not defined($source_unit)
            or ($source_unit
                and $self->unit_is_top_output_unit($source_unit)))
           and defined($self->get_conf('TOP_NODE_UP_URL'))
           and ($direction eq 'Up' or $direction eq 'NodeUp')) {
    if ($type eq 'href') {
      return $self->get_conf('TOP_NODE_UP_URL');
    } elsif ($type eq 'text' or $type eq 'node' or $type eq 'string'
             or $type eq 'section' or $type eq 'section_nonumber'
             or $type eq 'string_nonumber') {
      return $self->get_conf('TOP_NODE_UP');
    } else {
      cluck("BUG: type $type not available for TOP_NODE_UP\n");
      return '';
    }
  } elsif (not defined($target_unit) and defined($source_unit)
           and exists($source_unit->{'directions'})
           and exists($source_unit->{'directions'}->{$direction})) {
    $target_unit
      = $source_unit->{'directions'}->{$direction};
  }

  if (defined($target_unit)) {
    ######## debug
    if (!exists($target_unit->{'unit_type'})) {
      die "No unit type for element_target $direction $target_unit: "
       . Texinfo::Common::debug_print_output_unit($target_unit)
       . "directions :"
           . Texinfo::OutputUnits::print_output_unit_directions($source_unit);
    }
    ########
    if ($target_unit->{'unit_type'} eq 'external_node_unit') {
      my $external_node_element = $target_unit->{'unit_command'};
      #print STDERR "FROM_ELEMENT_DIRECTION ext node $type $direction\n"
      #  if ($self->get_conf('DEBUG'));
      if ($type eq 'href') {
        return _external_node_href($self, $external_node_element,
                                   $source_command);
      } elsif ($type eq 'text' or $type eq 'node') {
        return $self->command_text($external_node_element);
      } elsif ($type eq 'string') {
        return $self->command_text($external_node_element, $type);
      }
    } elsif ($type eq 'node') {
      if (exists($target_unit->{'unit_node'})) {
        $command = $target_unit->{'unit_node'}->{'element'};
      }
      $type = 'text';
    } elsif ($type eq 'section' or $type eq 'section_nonumber') {
      if (exists($target_unit->{'unit_section'})) {
        $command = $target_unit->{'unit_section'}->{'element'};
      }
      if ($type eq 'section_nonumber') {
        $type = 'text_nonumber';
      } else {
        $type = 'text';
      }
    } else {
      $command = $target_unit->{'unit_command'};
      if ($type eq 'href') {
        if (defined($command)) {
          return $self->command_href($command, $source_filename);
        } else {
          return undef;
        }
      }
    }
  } else {
    return undef;
  }

  if (defined($command)) {
    #print STDERR "FROM_ELEMENT_DIRECTION $type $direction\n"
    #  if ($self->get_conf('DEBUG'));
    return $self->command_text($command, $type);
  }
  # We end up here if there is a target element, but not of the expected
  # type.  For example, if type is section but there is no section associated
  # to the target element node.
  return undef;
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
      my $converted_tree;
      if ($context eq 'string') {
        $converted_tree = Texinfo::TreeElement::new({
                             'type' => '_string',
                             'contents' => [$translated_tree]});
      } else {
        $converted_tree = $translated_tree;
      }
      my $context_str = "DIRECTION $direction ($string_type/$context)";
      my $result_string
         = $self->convert_tree_new_formatting_context($converted_tree,
                                                      $context_str,
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

sub get_special_unit_info_varieties($$) {
  my ($self, $type) = @_;

  if (exists($self->{'translated_special_unit_info'}->{$type})) {
    my $translated_special_unit_info
      = $self->{'translated_special_unit_info'}->{$type}->[1];
    return sort(keys(%{$translated_special_unit_info}));
  }
  return sort(keys(%{$self->{'special_unit_info'}->{$type}}));
}

sub special_unit_info($$$) {
  my ($self, $type, $special_unit_variety) = @_;

  if (exists($self->{'translated_special_unit_info'}->{$type})) {
    my $translated_special_unit_info
      = $self->{'translated_special_unit_info'}->{$type}->[1];

    if (not exists($self->{'special_unit_info'}->{$type}
                                    ->{$special_unit_variety})) {
      my $special_unit_info_string = $translated_special_unit_info
                                            ->{$special_unit_variety};
      my $translated_tree;
      if (defined($special_unit_info_string)) {
        # NOTE to be kept in sync with generated context in
        # generate_code_convert_data.pl
        my $translation_context = "$special_unit_variety section heading";
        $translated_tree = $self->pcdt($translation_context,
                                       $special_unit_info_string);
      }
      $self->{'special_unit_info'}->{$type}->{$special_unit_variety}
        = $translated_tree;
    }
  }
  return $self->{'special_unit_info'}->{$type}->{$special_unit_variety};
}

# API for misc conversion and formatting functions

# if $OUTPUT_UNITS is defined, the first output unit is used if a proper
# top output unit is not found.
sub _get_top_unit($;$) {
  my ($self, $output_units) = @_;

  my $identifiers_target;
  if (exists($self->{'document'})) {
    $identifiers_target = $self->{'document'}->labels_information();
  }

  my $node_top;
  $node_top = $identifiers_target->{'Top'}
                      if (defined($identifiers_target));
  my $section_top;

  my $global_commands;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
  }
  $section_top = $global_commands->{'top'}
                                       if (defined($global_commands));
  if (defined($section_top)) {
    return $section_top->{'associated_unit'};
  } elsif (defined($node_top)) {
    if (!exists($node_top->{'associated_unit'})) {
      die "No associated unit for node_top: "
         .Texinfo::Common::debug_print_element($node_top, 1);
    }
    return $node_top->{'associated_unit'};
  } elsif (defined($output_units)) {
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

my %default_formatting_references;
sub default_formatting_function($$) {
  my ($self, $format) = @_;

  return $default_formatting_references{$format};
}

sub formatting_function($$) {
  my ($self, $format) = @_;

  return $self->{'formatting_function'}->{$format};
}

my %defaults_format_special_unit_body_contents;

sub defaults_special_unit_body_formatting($$) {
  my ($self, $special_unit_variety) = @_;

  return $defaults_format_special_unit_body_contents{$special_unit_variety};
}

sub special_unit_body_formatting($$) {
  my ($self, $special_unit_variety) = @_;

  return $self->{'special_unit_body'}->{$special_unit_variety};
}

# Return the default for the function references used for
# the formatting of commands, in case a user still wants to call
# default @-commands formatting functions when replacing functions,
# using code along
# &{$self->default_command_conversion($cmdname)}($self, $cmdname, $command, args, $content)
my %default_commands_conversion;

sub default_command_conversion($$) {
  my ($self, $command) = @_;

  return $default_commands_conversion{$command};
}

sub command_conversion($$) {
  my ($self, $command) = @_;

  return $self->{'commands_conversion'}->{$command};
}

my %default_commands_open;

sub default_command_open($$) {
  my ($self, $command) = @_;

  return $default_commands_open{$command};
}

# used for customization only (in t2h_singular.init)
sub get_value($$) {
  my ($self, $value) = @_;

  if (exists($self->{'document'}) and exists($self->{'document'}->{'values'})
      and exists($self->{'document'}->{'values'}->{$value})) {
    return $self->{'document'}->{'values'}->{$value};
  } else {
    return undef;
  }
}

my %default_shared_conversion_states = (
  'top' => {'in_skipped_node_top' => ['integer'],},
  'abbr' => {'explained_commands' => ['string', 'string']},
  'acronym' => {'explained_commands' => ['string', 'string']},
  'footnote' => {'footnote_number' => ['integer'],
                 'footnote_id_numbers' => ['string', 'integer']},
  'listoffloats' => {'formatted_listoffloats' => ['string', 'integer']},
  'menu' => {'html_menu_entry_index' => ['integer']},
  'printindex' => {'formatted_index_entries' => ['index_entry', 'integer']},
  'nodedescription' => {'formatted_nodedescriptions' => ['element', 'integer']},
  # also used for titlepage
  'quotation' => {'quotation_titlepage_stack' => ['integer'],
                  'elements_authors' => ['integer', 'integer', 'element'],
                  'element_authors_number' => ['integer', 'integer']},
);

sub define_shared_conversion_state($$$$) {
  my ($self, $cmdname, $state_name, $specification) = @_;

  if (not exists($self->{'shared_conversion_state'}->{$cmdname})) {
    $self->{'shared_conversion_state'}->{$cmdname} = {};
  }
  if (not exists($self->{'shared_conversion_state'}
                                      ->{$cmdname}->{$state_name})) {
    $self->{'shared_conversion_state'}->{$cmdname}->{$state_name} = {};
  }

  my $state = $self->{'shared_conversion_state'}->{$cmdname}->{$state_name};

  if (exists($state->{'spec'})) {
    warn("BUG: redefining shared_conversion_state: $cmdname: $state_name");
  }
  $state->{'spec'} = $specification;
}

sub _get_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  my $state = $self->{'shared_conversion_state'}->{$cmdname}->{$state_name};

  if (!defined($state)) {
    #print STDERR "DEBUG: [".
    #     join('|',keys(%{$self->{'shared_conversion_state'}->{$cmdname}}))."]\n";
    confess("BUG: $self: undef shared_conversion_state: $cmdname: $state_name\n");
  }

  my $spec_nr = scalar(@{$state->{'spec'}});

  if ($spec_nr == 1) {
    return $state->{'values'};
  }

  if (!defined($state->{'values'})) {
    $state->{'values'} = {};
  }
  my $spec_idx = 1;
  my $current = $state->{'values'};
  foreach my $arg (@args) {
    if (!defined($arg)) {
      return $current;
    }
    if ($spec_idx == $spec_nr - 1) {
      return $current->{$arg};
    }
    if (!$current->{$arg}) {
      $current->{$arg} = {};
    }
    $current = $current->{$arg};
    $spec_idx++;
  }
  return $current;
}

sub _XS_get_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  return _get_shared_conversion_state($self, $cmdname,
                                      $state_name, @args);
}

sub get_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  if (exists($default_shared_conversion_states{$cmdname})
      and exists($default_shared_conversion_states{$cmdname}->{$state_name})) {
    my $result = _XS_get_shared_conversion_state($self, $cmdname,
                                           $state_name, @args);
    return $result;
  }

  return _get_shared_conversion_state($self, $cmdname,
                                      $state_name, @args);
}

sub _set_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  my $state = $self->{'shared_conversion_state'}->{$cmdname}->{$state_name};

  my $spec_nr = scalar(@{$state->{'spec'}});
  if (scalar(@args) != $spec_nr) {
    return undef;
  }

  if ($spec_nr == 1) {
    if (!defined($args[0])) {
      return undef;
    }
    $state->{'values'} = $args[0];
    return $args[0];
  }

  if (!exists($state->{'values'})) {
    $state->{'values'} = {};
  }
  my $spec_idx = 1;
  my $current = $state->{'values'};
  foreach my $arg (@args) {
    if (!defined($arg)) {
      return undef;
    }
    if ($spec_idx == $spec_nr - 1) {
      $current->{$arg} = $args[$spec_idx];
      return $current->{$arg};
    }
    if (!exists($current->{$arg})) {
      $current->{$arg} = {};
    }
    $current = $current->{$arg};
    $spec_idx++;
  }
}

sub _XS_set_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  _set_shared_conversion_state($self, $cmdname,
                               $state_name, @args);
}

# XS is only used for default conversion states.
sub set_shared_conversion_state($$$;@) {
  my $self = shift;
  my $cmdname = shift;
  my $state_name = shift;
  my @args = @_;

  if (exists($default_shared_conversion_states{$cmdname})
      and exists($default_shared_conversion_states{$cmdname}->{$state_name})) {
    _XS_set_shared_conversion_state($self, $cmdname,
                                    $state_name, @args);
    return;
  }

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

  if (!defined($self->{'current_filename'})) {
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
foreach my $converter_info ('copying_comment',
   'destination_directory', 'document', 'document_name',
   'documentdescription_string', 'expanded_formats',
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

# Call convert_tree out of the main conversion flow.
sub convert_tree_new_formatting_context($$$;$$$) {
  my ($self, $tree, $context_string, $multiple_pass, $document_global_context,
      $block_command) = @_;

  _new_document_context($self, $context_string, $document_global_context,
                               $block_command);

  my $context_string_str = "C($context_string)";
  my $multiple_pass_str = '';

  if (defined($multiple_pass)) {
    _set_multiple_conversions($self, $multiple_pass);
    $multiple_pass_str = '|M';
  }

  print STDERR "new_fmt_ctx ${context_string_str}${multiple_pass_str}\n"
        if ($self->get_conf('DEBUG'));
  my $result = $self->convert_tree($tree, "new_fmt_ctx ${context_string_str}");

  if (defined($multiple_pass)) {
    _unset_multiple_conversions($self);
  }

  _pop_document_context($self);

  return $result;
}

# values for integer and string options in code generated from
# Texinfo/Convert/converters_defaults.txt
my $regular_defaults = Texinfo::Options::get_regular_options('html_converter');

my %defaults = (
  # Customization option variables
  %{$regular_defaults},

  # Non-string customization variables
  # _default_panel_button_dynamic_direction use nodes direction based on USE_NODE_DIRECTIONS
  # or USE_NODES if USE_NODE_DIRECTIONS is undefined
  'SECTION_BUTTONS'      => [[ 'Next', \&_default_panel_button_dynamic_direction ],
                             [ 'Prev', \&_default_panel_button_dynamic_direction ],
                             [ 'Up', \&_default_panel_button_dynamic_direction ], 'Space',
                             'Contents', 'Index', 'About'],
  'SECTION_FOOTER_BUTTONS' => [[ 'Next', \&_default_panel_button_dynamic_direction_section_footer ],
                              [ 'Prev', \&_default_panel_button_dynamic_direction_section_footer ],
                              [ 'Up', \&_default_panel_button_dynamic_direction_section_footer ], 'Space',
                              'Contents', 'Index'],
  'NODE_FOOTER_BUTTONS'  => [[ 'Next', \&_default_panel_button_dynamic_direction_node_footer ],
                             [ 'Prev', \&_default_panel_button_dynamic_direction_node_footer ],
                             [ 'Up', \&_default_panel_button_dynamic_direction_node_footer ],
                             'Space', 'Contents', 'Index'],

  'LINKS_DIRECTIONS'     => ['Top', 'Index', 'Contents', 'About',
                              'NodeUp', 'NodeNext', 'NodePrev'],

  'ACTIVE_ICONS'         => undef,
  'PASSIVE_ICONS'        => undef,

);

foreach my $buttons ('CHAPTER_BUTTONS', 'TOP_BUTTONS') {
  $defaults{$buttons} = [@{$defaults{'SECTION_BUTTONS'}}];
}

$defaults{'MISC_BUTTONS'} = ['Top', 'Contents', 'Index', 'About'];

foreach my $buttons ('CHAPTER_FOOTER_BUTTONS', 'TOP_FOOTER_BUTTONS') {
  $defaults{$buttons} = [@{$defaults{'SECTION_FOOTER_BUTTONS'}}];
}


my %default_special_unit_info
  = %{ Texinfo::HTMLData::get_default_special_unit_info() };

my %default_translated_special_unit_info
  = %{ Texinfo::HTMLData::get_default_translated_special_unit_info() };

my $direction_orders = Texinfo::HTMLData::get_directions_order();
# 'global', 'relative', 'file'
# include space direction
my @global_directions_order = @{$direction_orders->[0]};
my @all_directions_except_special_units;
foreach my $direction_order (@$direction_orders) {
  push @all_directions_except_special_units, @$direction_order;
}

#print STDERR join('|', @all_directions_except_special_units)."\n";

# for rel, see http://www.w3.org/TR/REC-html40/types.html#type-links
my %default_converted_directions_strings
  = %{ Texinfo::HTMLData::get_default_converted_directions_strings() };

# translation contexts should be consistent with
# %direction_type_translation_context.  If the direction is not used
# as is, it should also be taken into account in direction_string().
# For now 'This' becomes 'This (current section)'.
my %default_translated_directions_strings
   = %{ Texinfo::HTMLData::get_default_translated_directions_strings() };

my @style_commands_contexts = ('normal', 'preformatted');
my @no_args_commands_contexts
    = ('normal', 'preformatted', 'string', 'css_string');

sub _translate_names($) {
  my $self = shift;

  Texinfo::Convert::Text::set_language($self->{'convert_text_options'},
                                       $self->get_conf('documentlanguage'));

  Texinfo::Convert::Utils::switch_lang_translations($self,
                                       $self->get_conf('documentlanguage'));

  if ($self->get_conf('DEBUG')) {
    my $output_encoding_name = $self->get_conf('OUTPUT_ENCODING_NAME');
    $output_encoding_name = 'UNDEF' if (!defined($output_encoding_name));
    my $documentlanguage = $self->get_conf('documentlanguage');
    $documentlanguage = 'UNDEF' if (!defined($documentlanguage));
    print STDERR "\nTRANSLATE_NAMES encoding_name: $output_encoding_name"
      ." documentlanguage: $documentlanguage\n";
  }

  # reset strings such that they are translated when needed.
  # could also use the keys of $self->{'translated_direction_strings'}
  foreach my $string_type (keys(%default_translated_directions_strings)) {
    $self->{'directions_strings'}->{$string_type} = {};
  }

  # could also use keys of $self->{'translated_special_unit_info'}
  foreach my $type (keys(%default_translated_special_unit_info)) {
    $self->{'special_unit_info'}->{$type.'_tree'} = {};
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
  foreach my $command (keys(%{$self->{'no_arg_commands_formatting'}})) {
    foreach my $context (@no_args_commands_contexts) {
      if (exists($self->{'no_arg_commands_formatting'}
                         ->{$command}->{$context}->{'translated_converted'})
          and not $self->{'no_arg_commands_formatting'}
                                        ->{$command}->{$context}->{'unset'}) {
        $translated_commands{$command} = 1;
        $self->{'no_arg_commands_formatting'}->{$command}->{$context}->{'text'}
         = $self->cdt_string($self->{'no_arg_commands_formatting'}
                       ->{$command}->{$context}->{'translated_converted'});
      } elsif ($context eq 'normal') {
        my $translated_tree;
        if (exists($self->{'no_arg_commands_formatting'}
                      ->{$command}->{$context}->{'translated_to_convert'})) {
          $translated_tree = $self->cdt($self->{'no_arg_commands_formatting'}
                          ->{$command}->{$context}->{'translated_to_convert'});
        } else {
          # default translated commands
          $translated_tree = $self->translated_command_tree($command);
        }
        if (defined($translated_tree)) {
          $self->{'no_arg_commands_formatting'}->{$command}
            ->{$context}->{'translated_tree'} = $translated_tree;
          $translated_commands{$command} = 1;
        }
      }
    }
  }
  foreach my $command (keys(%translated_commands)) {
    _complete_no_arg_commands_formatting($self, $command, 1);
  }

  print STDERR "END TRANSLATE_NAMES\n\n" if ($self->get_conf('DEBUG'));
}

# redefined functions
#
# Texinfo::Translations::cache_translate_string redefined to call user defined function.
sub html_cache_translate_string($$$;$) {
  my ($self, $string, $lang_translations, $translation_context) = @_;

  if (defined($self->{'formatting_function'}->{'format_translate_message'})) {
    my $lang = $lang_translations->[0];
    my $translated_string
      = &{$self->{'formatting_function'}->{'format_translate_message'}}($self,
                                         $string, $lang, $translation_context);

    if (defined($translated_string)) {
      my $translations;
      $lang = '' if (!defined($lang));
      if (!exists($self->{'translation_cache'}->{$lang})) {
        $self->{'translation_cache'}->{$lang} = {};
      }
      $translations = $self->{'translation_cache'}->{$lang};

      # reuse the tree if the translation matches the cached translation
      # otherwise setup a new translation (without tree).
      my $translation_context_str;
      if (defined($translation_context)) {
        $translation_context_str = $translation_context;
      } else {
        $translation_context_str = '';
      }

      my $strings_cache = $translations->{$translation_context_str};
      if ($strings_cache) {
        my $translated_string_tree = $strings_cache->{$string};
        if (defined($translated_string_tree)) {
          if ($translated_string_tree->[0] eq $translated_string) {
            return $translated_string_tree;
          }
          # if the string has changed, the cache is invalidated by
          # resetting the cached string array reference just below.
        }
      } else {
        $strings_cache = {};
        $translations->{$translation_context_str} = $strings_cache;
      }

      my $result = [$translated_string];

      $strings_cache->{$string} = $result;

      return $result;
    }
  }

  return Texinfo::Translations::cache_translate_string($string,
                               $lang_translations, $translation_context);
}

# redefine generic Converter functions to pass a customized
# cache_translate_string function
sub cdt($$;$$) {
  my ($self, $string, $replaced_substrings, $translation_context) = @_;

  return Texinfo::Translations::gdt($string,
                                    $self->{'current_lang_translations'},
                                    $replaced_substrings,
                                    $self->get_conf('DEBUG'),
                                    $translation_context, $self,
                                    \&html_cache_translate_string);
}

sub cdt_string($$;$$) {
  my ($self, $string, $replaced_substrings, $translation_context) = @_;

  return Texinfo::Translations::gdt_string($string,
                                    $self->{'current_lang_translations'},
                                    $replaced_substrings,
                                    $translation_context, $self,
                                    \&html_cache_translate_string);
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

my %default_css_element_class_styles
  = %{ Texinfo::HTMLDataCSS::get_base_default_css_info() };

$default_css_element_class_styles{'pre.format-preformatted'}
  = $default_css_element_class_styles{'pre.display-preformatted'};

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

my %default_pre_class_types;
$default_pre_class_types{'menu_comment'} = 'menu-comment';

my %indented_preformatted_commands;
foreach my $indented_format ('example', 'display', 'lisp') {
  $indented_preformatted_commands{$indented_format} = 1;
  $indented_preformatted_commands{"small$indented_format"} = 1;

  $default_css_element_class_styles{"div.$indented_format"}
    = 'margin-left: 3.2em';
}
# output as div.example instead
delete $default_css_element_class_styles{"div.lisp"};

# types that are in code style in the default case.  '_code' is not
# a type that can appear in the tree built from Texinfo code, it is used
# to format a tree fragment as if it was in a @code @-command.
my %default_code_types = (
 '_code' => 1,
);

# specification of arguments formatting
# to obtain the same order of conversion as in C, order for one argument
# should be: normal, monospace, string, monospacestring, monospacetext,
#            filenametext, url, raw
# Also used to be converted automatically to Texinfo code for documentation.
our %html_default_commands_args = (
  'anchor' => [['monospacestring']],
  'namedanchor' => [['monospacestring'], ['normal']],
  'email' => [['url', 'monospacestring'], ['normal']],
  'footnote' => [[]],
  'printindex' => [[]],
  'uref' => [['url', 'monospacestring'], ['normal'], ['normal']],
  'url' => [['url', 'monospacestring'], ['normal'], ['normal']],
  'sp' => [[]],
  'inforef' => [['monospace'],['normal'],['filenametext']],
  'xref' => [['monospace'],['normal'],['normal'],['filenametext'],['normal']],
  'pxref' => [['monospace'],['normal'],['normal'],['filenametext'],['normal']],
  'ref' => [['monospace'],['normal'],['normal'],['filenametext'],['normal']],
  'link' => [['monospace'],['normal'],['filenametext']],
  'image' => [['monospacestring', 'filenametext', 'url'],['filenametext'],['filenametext'],['normal','string'],['filenametext']],
  # FIXME shouldn't it better not to convert if later ignored?
  'inlinefmt' => [['monospacetext'],['normal']],
  'inlinefmtifelse' => [['monospacetext'],['normal'],['normal']],
  'inlineraw' => [['monospacetext'],['raw']],
  'inlineifclear' => [['monospacetext'],['normal']],
  'inlineifset' => [['monospacetext'],['normal']],
  'item' => [[]],
  'itemx' => [[]],
  'value' => [['monospacestring']],
);

foreach my $explained_command (keys(%explained_commands)) {
  $html_default_commands_args{$explained_command}
     = [['normal'], ['normal', 'string']];
}

foreach my $accent_command (keys(%accent_commands)) {
  $html_default_commands_args{$accent_command} = [[]];
}

my %kept_line_commands;

my @informative_global_commands = ('documentlanguage', 'footnotestyle',
  'xrefautomaticsectiontitle', 'deftypefnnewline');

my @contents_commands = ('contents', 'shortcontents', 'summarycontents');

foreach my $line_command (@informative_global_commands,
        @contents_commands, keys(%formattable_line_commands),
        keys(%formatted_line_commands),
        keys(%default_index_commands)) {
  $kept_line_commands{$line_command} = 1;
}

foreach my $line_command (keys(%line_commands)) {
  $default_commands_conversion{$line_command} = undef
    unless (exists($kept_line_commands{$line_command}));
}

foreach my $nobrace_command (keys(%nobrace_commands)) {
  $default_commands_conversion{$nobrace_command} = undef
    unless (exists($formatted_nobrace_commands{$nobrace_command}));
}

# formatted/formattable @-commands that are not converted in
# HTML in the default case.
$default_commands_conversion{'page'} = undef;
$default_commands_conversion{'need'} = undef;
$default_commands_conversion{'vskip'} = undef;

foreach my $ignored_brace_commands ('caption', 'errormsg', 'hyphenation',
  'shortcaption', 'seealso', 'seeentry', 'sortas') {
  $default_commands_conversion{$ignored_brace_commands} = undef;
}

foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro', 'linemacro',
   'copying', 'documentdescription', 'documentinfo', 'titlepage',
   'publication', 'direntry', 'nodedescriptionblock') {
  $default_commands_conversion{$ignored_block_commands} = undef;
};

# Formatting of commands without args

# The hash holding the defaults for the formatting of
# most commands without args.  It has three contexts as keys,
# 'normal' in normal text, 'preformatted' in @example and similar
# commands, and 'string' for contexts where HTML elements should not
# be used.
my %default_no_arg_commands_formatting = (
  'normal' => {},
  'preformatted' => {},
  'string' => {},
  # more internal
  'css_string' => {},
);

foreach my $command (keys(%Texinfo::Convert::Converter::xml_text_entity_no_arg_commands_formatting)) {
  $default_no_arg_commands_formatting{'normal'}->{$command} =
 {'text' =>
  $Texinfo::Convert::Converter::xml_text_entity_no_arg_commands_formatting{
                                                                     $command}};
}

$default_no_arg_commands_formatting{'normal'}->{' '} = {'text' => '&nbsp;'};
$default_no_arg_commands_formatting{'normal'}->{"\t"} = {'text' => '&nbsp;'};
$default_no_arg_commands_formatting{'normal'}->{"\n"} = {'text' => '&nbsp;'};

# possible example of use, right now not used, as
# the generic Converter customization is directly used through
# the call to translated_command_tree().
#$default_no_arg_commands_formatting{'normal'}->{'error'}->{'translated_converted'} = 'error--&gt;';
## This is used to have gettext pick up the chain to be translated
#if (0) {
#  my $not_existing;
#  $not_existing->cdt('error--&gt;');
#}

$default_no_arg_commands_formatting{'normal'}->{'enddots'}
    = {'element' => 'small', 'text' => '...'};
$default_no_arg_commands_formatting{'preformatted'}->{'dots'}
    = {'text' => '...'};
$default_no_arg_commands_formatting{'preformatted'}->{'enddots'}
    = {'text' => '...'};
$default_no_arg_commands_formatting{'normal'}->{'*'} = {'text' => '<br>'};
# this is used in math too, not sure that it is the best
# in that context, '<br>' could be better.
$default_no_arg_commands_formatting{'preformatted'}->{'*'} = {'text' => "\n"};

# escaped code points in CSS
# https://www.w3.org/TR/css-syntax/#consume-escaped-code-point
# Consume as many hex digits as possible, but no more than 5. Note that this means 1-6 hex digits have been consumed in total. If the next input code point is whitespace, consume it as well. Interpret the hex digits as a hexadecimal number.
# Note that in style= HTML attributes entities are used to
# protect CSS strings.  For example, the CSS string a'b"
# is protected as CSS as a\'b", and " is escaped in an HTML style
# attribute: style="list-style-type: 'a\'b&quot;'"

# for the commands without a good representation in the other maps
my %css_no_arg_commands = (
  # we want to set explicitly
  '*' => '\A ',
  # do not set to force using only translations (as the command
  # is in the default converter translated commands)
  'error' => undef,
);

foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  if (exists($css_no_arg_commands{$command})) {
    $default_no_arg_commands_formatting{'css_string'}->{$command}
      = {'text' => $css_no_arg_commands{$command}}
        if (defined($css_no_arg_commands{$command}));
  } elsif (exists($Texinfo::Convert::Unicode::unicode_map{$command})) {
    my $char_nr = hex($Texinfo::Convert::Unicode::unicode_map{$command});
    my $css_string;
    if ($char_nr < 128) { # 7bit ascii
      $css_string = chr($char_nr);
    } else {
      $css_string = "\\$Texinfo::Convert::Unicode::unicode_map{$command} ";
    }
    $default_no_arg_commands_formatting{'css_string'}->{$command}
       = {'text' => $css_string};
  } elsif (exists($nobrace_symbol_text{$command})) {
    $default_no_arg_commands_formatting{'css_string'}->{$command}
      = {'text' => $nobrace_symbol_text{$command}};
  } elsif (exists($Texinfo::CommandsValues::text_brace_no_arg_commands{$command})) {
    # complete the commands not in unicode maps: TeX, enddots, LaTeX, tie
    $default_no_arg_commands_formatting{'css_string'}->{$command}
     = {'text' => $Texinfo::CommandsValues::text_brace_no_arg_commands{$command}};
  } else {
    warn "BUG: $command: no css_string\n";
  }
}



# w not in css_string, set the corresponding default_css_element_class_styles
# especially, which also has none and not w in the class
$default_css_element_class_styles{'ul.mark-none'} = 'list-style-type: none';

# setup default_css_element_class_styles for mark commands based on css strings
foreach my $mark_command (keys(%{$default_no_arg_commands_formatting{'css_string'}})) {
  if (exists($brace_commands{$mark_command})) {
    my $css_string;
    if ($mark_command eq 'bullet') {
      $css_string = 'disc';
    } elsif (exists($default_no_arg_commands_formatting{'css_string'}
                                                        ->{$mark_command})
             and $default_no_arg_commands_formatting{'css_string'}
                                                 ->{$mark_command}->{'text'}) {
      if (exists($special_list_mark_css_string_no_arg_command{$mark_command})) {
        $css_string = $special_list_mark_css_string_no_arg_command{$mark_command};
      } else {
        $css_string
           = $default_no_arg_commands_formatting{'css_string'}
                                             ->{$mark_command}->{'text'};
      }
      $css_string =~ s/^(\\[A-Z0-9]+) $/$1/;
      $css_string = '"'.$css_string.'"';
    }
    if (defined($css_string)) {
      $default_css_element_class_styles{"ul.mark-$mark_command"}
                               = "list-style-type: $css_string";
    }
  }
}

# used to show the built-in CSS rules
sub builtin_default_css_text() {
  my $css_text = '';
  foreach my $css_rule (sort(keys(%default_css_element_class_styles))) {
    if ($default_css_element_class_styles{$css_rule} ne '') {
      $css_text .= "$css_rule {$default_css_element_class_styles{$css_rule}}\n";
    }
  }
  return $css_text;
}

sub _text_element_conversion($$$) {
  my ($self, $specification, $command) = @_;

  my $text = '';
  # note that there could be elements in text
  if (exists($specification->{'text'})) {
    $text = $specification->{'text'};
  }

  if (exists($specification->{'element'})) {
    return $self->html_attribute_class($specification->{'element'}, [$command])
               .'>'. $text . '</'.$specification->{'element'}.'>';
  } else {
    return $text;
  }
}

sub _convert_no_arg_command($$$) {
  my ($self, $cmdname, $command) = @_;

  if (in_upper_case($self) and exists($letter_no_arg_commands{$cmdname})
      and exists($letter_no_arg_commands{uc($cmdname)})) {
    $cmdname = uc($cmdname);
  }

  my $result;

  if (in_preformatted_context($self) or in_math($self)) {
    $result = _text_element_conversion($self, 
      $self->{'no_arg_commands_formatting'}->{$cmdname}->{'preformatted'},
      $cmdname);
  } elsif (in_string($self)) {
    $result = _text_element_conversion($self, 
      $self->{'no_arg_commands_formatting'}->{$cmdname}->{'string'},
      $cmdname);
  } else {
    $result = _text_element_conversion($self, 
      $self->{'no_arg_commands_formatting'}->{$cmdname}->{'normal'},
      $cmdname);
  }

  return $result;
}

foreach my $command(keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  $default_commands_conversion{$command} = \&_convert_no_arg_command;
}

sub _css_string_convert_no_arg_command($$$) {
  my ($self, $cmdname, $command) = @_;

  if (in_upper_case($self) and exists($letter_no_arg_commands{$cmdname})
      and exists($self->{'no_arg_commands_formatting'}->{uc($cmdname)})) {
    $cmdname = uc($cmdname);
  }
  #if (not defined($self->{'no_arg_commands_formatting'}->{$cmdname}->{'css_string'}->{$cmdname})) {
  #  cluck ("BUG: CSS $cmdname no text");
  #}
  return $self->{'no_arg_commands_formatting'}->{$cmdname}->{'css_string'}
                                                 ->{'text'};
}

foreach my $command(keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  $default_css_string_commands_conversion{$command}
     = \&_css_string_convert_no_arg_command;
}

sub _convert_today_command($$$) {
  my ($self, $cmdname, $command) = @_;

  my $tree = $self->expand_today();
  return $self->convert_tree($tree, 'convert today');
}

$default_commands_conversion{'today'} = \&_convert_today_command;

# style commands

my %quoted_style_commands;
foreach my $quoted_command ('samp') {
  $quoted_style_commands{$quoted_command} = 1;
}

my %default_upper_case_commands = ( 'sc' => 1 );

my %style_commands_element
   = %{ Texinfo::HTMLData::get_html_style_commands_element() };

my %default_style_commands_formatting;

my %style_brace_types = map {$_ => 1} ('style_other', 'style_code',
                                       'style_no_code');
# @all_style_commands is the union of style brace commands and commands
# in %style_commands_element, a few not being style brace commands, and
# commands in %quoted_style_commands.
# Using keys of a map generated hash does like uniq, it avoids duplicates.
# The first grep selects style brace commands, ie commands with %brace_commands
# type in %style_brace_types.
my @all_style_commands = keys %{{ map { $_ => 1 }
    ((grep {$style_brace_types{$brace_commands{$_}}} keys(%brace_commands)),
      keys(%style_commands_element), keys(%quoted_style_commands)) }};

# NOTE only normal and preformatted contexts are used.  css strings
# are formatted in string context, and in string context the argument
# is returned as is.
foreach my $command (@all_style_commands) {
  # indicateurl is formatted with a specific function
  next if ($command eq 'indicateurl');
  $default_style_commands_formatting{$command} = {};
  # default is no element.
  foreach my $context (@style_commands_contexts) {
    $default_style_commands_formatting{$command}->{$context} = {}
  }
  if (exists($style_commands_element{$command})) {
    my $html_element = $style_commands_element{$command};
    foreach my $context (@style_commands_contexts) {
      $default_style_commands_formatting{$command}->{$context}
                           = {'element' => $html_element};
    }
  }
  if (exists($quoted_style_commands{$command})) {
    foreach my $context (@style_commands_contexts) {
      $default_style_commands_formatting{$command}->{$context}->{'quote'} = 1;
    }
  }
  $default_commands_conversion{$command} = \&_convert_style_command;
}

$default_style_commands_formatting{'sc'}->{'preformatted'}->{'element'} = 'span';

# currently unused, could be re-used if there is a need to have attributes
# specified in %style_commands_element
sub _parse_attribute($) {
  my $element = shift;

  return ('', '', '') if (!defined($element));

  my ($class, $attributes) = ('', '');

  if ($element =~ /^(\w+)(\s+.*)/)
  {
    $element = $1;
    $attributes = $2;
    if ($attributes =~ s/^\s+class=\"([^\"]+)\"//) {
      $class = $1;
    }
  }
  return ($element, $class, $attributes);
}

sub _convert_style_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $text;
  if (defined($args) and defined($args->[0])) {
    $text = $args->[0]->{'normal'};
  } else {
    # happens with bogus @-commands without argument, like @strong something
    return '';
  }

  if (in_string($self)) {
    return $text;
  }

  my $style_cmdname;
  # effect of kbdinputstyle
  if ($cmdname eq 'kbd' and exists($command->{'extra'})
      and $command->{'extra'}->{'code'}) {
    $style_cmdname = 'code';
  } else {
    $style_cmdname = $cmdname;
  }

  if (exists($self->{'style_commands_formatting'}->{$style_cmdname})) {
    my $style_formatting
       = $self->{'style_commands_formatting'}->{$style_cmdname};
    my $formatting_spec;
    if (in_preformatted_context($self)) {
      $formatting_spec = $style_formatting->{'preformatted'};
    } else {
      $formatting_spec = $style_formatting->{'normal'};
    }
    if (defined($formatting_spec)) {
      if (exists($formatting_spec->{'element'})) {
        my @classes = ($style_cmdname);
        if ($style_cmdname ne $cmdname) {
          push @classes, "as-${style_cmdname}-${cmdname}";
        }
        my $style = $formatting_spec->{'element'};
        my $open = $self->html_attribute_class($style, \@classes);
        if ($open ne '') {
          $text = $open . '>' . $text . "</$style>";
        }
      }
      if (exists($formatting_spec->{'quote'})) {
        $text = $self->get_conf('OPEN_QUOTE_SYMBOL') . $text
                  . $self->get_conf('CLOSE_QUOTE_SYMBOL');
      }
    }
  }
  return $text;
}

sub _convert_w_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $text;
  if (defined($args) and defined($args->[0])) {
    $text = $args->[0]->{'normal'};
  } else {
    $text = '';
  }
  if (in_string($self)) {
    return $text;
  } else {
    return $text . '<!-- /@w -->';
  }
}
$default_commands_conversion{'w'} = \&_convert_w_command;

sub _convert_value_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  return $self->convert_tree($self->cdt('@{No value for `{value}\'@}',
          {'value' => Texinfo::TreeElement::new(
                        {'text' => $args->[0]->{'monospacestring'}}) }),
                             'Tr missing value');
}

$default_commands_conversion{'value'} = \&_convert_value_command;

sub _convert_email_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $args_nr = 0;
  if (defined($args)) {
    $args_nr = scalar(@$args);
  }

  my $mail = '';
  my $mail_string = '';
  if ($args_nr > 0 and defined($args->[0])) {
    my $mail_arg = $args->[0];
    $mail = $mail_arg->{'url'};
    $mail_string = $mail_arg->{'monospacestring'};
  }

  my $text = '';
  if ($args_nr > 1 and defined($args->[1])
      and defined($args->[1]->{'normal'})) {
    my $text_arg = $args->[1];
    $text = $text_arg->{'normal'};
  }
  $text = $mail_string unless ($text ne '');
  # match a non-space character.  Both ascii and non-ascii spaces are
  # considered as spaces.  When perl 5.18 is the oldest version
  # supported, it could become [^\s]
  return $text unless ($mail =~ /[^\v\h\s]/);
  if (in_string($self)) {
    return "$mail_string ($text)";
  } else {
    return $self->html_attribute_class('a', [$cmdname])
    .' href="'.$self->url_protect_url_text("mailto:$mail")."\">$text</a>";
  }
}

$default_commands_conversion{'email'} = \&_convert_email_command;

sub _convert_explained_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $explanation_result;
  my $explanation_string;
  my $normalized_type = '';

  if (exists($command->{'contents'})
      and exists($command->{'contents'}->[0]->{'contents'})) {
    $normalized_type
       = Texinfo::Convert::NodeNameNormalization::convert_to_identifier(
                                   $command->{'contents'}->[0]);
  }

  if (defined($args) and defined($args->[1])
      and defined($args->[1]->{'string'})
      and $args->[1]->{'string'} =~ /\S/) {
    $explanation_string = $args->[1]->{'string'};
    $self->set_shared_conversion_state($cmdname, 'explained_commands',
                                       $normalized_type, $explanation_string);
  } else {
    $explanation_string
      = $self->get_shared_conversion_state($cmdname, 'explained_commands',
                                           $normalized_type);
  }

  my $result = '';
  if (defined($args) and defined($args->[0])) {
    $result = $args->[0]->{'normal'};
  }
  if (!in_string($self)) {
    my $explanation = '';
    $explanation = " title=\"$explanation_string\""
      if (defined($explanation_string));
    my $html_element = 'abbr';
    $result = $self->html_attribute_class($html_element, [$cmdname])
         ."${explanation}>".$result."</$html_element>";
  }
  if (defined($args) and defined($args->[1])
      and defined($args->[1]->{'normal'})) {
    my $explanation_result = $args->[1]->{'normal'};
    # TRANSLATORS: abbreviation or acronym explanation
    $result = $self->convert_tree($self->cdt('{explained_string} ({explanation})',
          {'explained_string' =>
              Texinfo::TreeElement::new({'type' => '_converted',
                                         'text' => $result}),
           'explanation' =>
             Texinfo::TreeElement::new({'type' => '_converted',
                                        'text' => $explanation_result})}),
                                  "convert explained $cmdname");
  }

  return $result;
}

foreach my $explained_command (keys(%explained_commands)) {
  $default_commands_conversion{$explained_command}
    = \&_convert_explained_command;
}

sub _convert_anchor_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  if (!in_multi_expanded($self) and !in_string($self)) {
    my $id = $self->command_id($command);
    if (defined($id) and $id ne '') {
      return &{$self->formatting_function('format_separate_anchor')}($self,
                                                             $id, $cmdname);
    }
  }
  return '';
}

$default_commands_conversion{'anchor'} = \&_convert_anchor_command;
$default_commands_conversion{'namedanchor'} = \&_convert_anchor_command;

sub _convert_footnote_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $foot_num
    = $self->get_shared_conversion_state('footnote', 'footnote_number');
  if (!defined($foot_num)) {
    $foot_num = 0;
  }

  $foot_num++;
  $self->set_shared_conversion_state('footnote', 'footnote_number',
                                     $foot_num);
  my $number_in_doc = $foot_num;
  my $footnote_mark;
  if ($self->get_conf('NUMBER_FOOTNOTES')) {
    $footnote_mark = $number_in_doc;
  } else {
    $footnote_mark = $self->get_conf('NO_NUMBER_FOOTNOTE_SYMBOL');
    $footnote_mark = '' if (!defined($footnote_mark));
  }

  return "($footnote_mark)" if (in_string($self));

  #print STDERR "FOOTNOTE $command\n";
  my $footnote_id = $self->command_id($command);

  # happens for bogus footnotes
  if (!defined($footnote_id)) {
    return '';
  }
  # ID for linking back to the main text from the footnote.
  my $footnote_docid = $self->footnote_location_target($command);

  # id used in output
  my $footid;
  my $docid;

  my $multiple_expanded_footnote = 0;
  my $multi_expanded_region = in_multi_expanded($self);
  if (defined($multi_expanded_region)) {
    # to avoid duplicate names, use a prefix that cannot happen in anchors
    my $target_prefix = "t_f";
    $footid = $target_prefix.$multi_expanded_region.'_'
                    .$footnote_id.'_'.$foot_num;
    $docid = $target_prefix.$multi_expanded_region.'_'
                     .$footnote_docid.'_'.$foot_num;
  } else {
    my $footnote_id_number
      = $self->get_shared_conversion_state('footnote', 'footnote_id_numbers',
                                           $footnote_id);
    if (!defined($footnote_id_number)) {
      $self->set_shared_conversion_state('footnote', 'footnote_id_numbers',
                                         $footnote_id, $foot_num);
      $footid = $footnote_id;
      $docid = $footnote_docid;
    } else {
      # This should rarely happen, except for @footnote in @copying and
      # multiple @insertcopying...
      # Here it is not checked that there is no clash with another anchor.
      # However, unless there are more than 1000 footnotes this should not
      # happen at all, and even in that case it is very unlikely.
      $footid = $footnote_id.'_'.$foot_num;
      $docid = $footnote_docid.'_'.$foot_num;
      $multiple_expanded_footnote = 1;
    }
  }
  my $footnote_href;
  my $footnotestyle = $self->get_conf('footnotestyle');
  if ((!defined($footnotestyle) or $footnotestyle ne 'separate')
      and (defined($multi_expanded_region)
           or $multiple_expanded_footnote)) {
    # if the footnote appears multiple times, command_href() will select
    # one, but it may not be the one expanded at the location currently
    # formatted (in general the first one, but it depends if it is in a
    # tree element or not, for instance in @titlepage).
    # With footnotestyle end, considering that the footnote is in the same file
    # has a better chance of being correct.
    $footnote_href = "#$footid";
  } else {
    $footnote_href = $self->command_href($command, undef, undef, $footid);
  }

  $self->register_footnote($command, $footid, $docid, $number_in_doc,
                    $self->current_filename(), $multi_expanded_region);

  my $footnote_number_text;
  if (in_preformatted_context($self)) {
    $footnote_number_text = "($footnote_mark)";
  } else {
    $footnote_number_text = "<sup>$footnote_mark</sup>";
  }
  return $self->html_attribute_class('a', [$cmdname])
    ." id=\"$docid\" href=\"$footnote_href\">$footnote_number_text</a>";
}
$default_commands_conversion{'footnote'} = \&_convert_footnote_command;

sub _convert_uref_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $args_nr = 0;

  if (defined($args)) {
    $args_nr = scalar(@$args);
  }

  my $text = '';
  my $url = '';
  my $url_string = '';
  my $replacement = '';
  if ($args_nr > 0 and defined($args->[0])) {
    my $url_arg = $args->[0];
    $url = $url_arg->{'url'};
    $url_string = $url_arg->{'monospacestring'};
  }
  if ($args_nr > 1 and defined($args->[1])) {
    my $text_arg = $args->[1];
    $text = $text_arg->{'normal'};
  }
  if ($args_nr > 2 and defined($args->[2])) {
    my $replacement_arg = $args->[2];
    $replacement = $replacement_arg->{'normal'};
  }

  $text = $replacement if ($replacement ne '');
  $text = $url_string if ($text eq '');
  return $text if ($url eq '');
  return "$text ($url_string)" if (in_string($self));

  return $self->html_attribute_class('a', [$cmdname])
           .' href="'.$self->url_protect_url_text($url)."\">$text</a>";
}

$default_commands_conversion{'uref'} = \&_convert_uref_command;
$default_commands_conversion{'url'} = \&_convert_uref_command;

sub _convert_image_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  # NOTE the choice of filenametext or url is somewhat arbitrary here.
  # url is formatted considering that it would be output as UTF-8 to fit
  # with percent encoding, filenametext is formatted according to the the
  # output encoding.  It matter mostly for accent @-commands, @U and symbols
  # no args @-commands not in the ASCII range.
  # As a file name, filenametext could make sense, although a path
  # with all the characters encoded, which happens if UTF-8 is considered
  # as the output encoding may also make sense.  Note that it is
  # also used as the path part of a percent encoded url.
  # In practice, the user should check that the output encoding
  # and the commands used in file names match, so url or
  # filenametext should lead to the same path.
  if (defined($args) and defined($args->[0])
      and defined($args->[0]->{'filenametext'})
      and $args->[0]->{'filenametext'} ne '') {
    my $image_basefile = $args->[0]->{'filenametext'};
    my $basefile_string = '';
    $basefile_string = $args->[0]->{'monospacestring'}
        if (defined($args->[0]->{'monospacestring'}));
    return $basefile_string if (in_string($self));
    my ($image_file, $image_extension, $image_path)
      = $self->html_image_file_location_name($cmdname, $command,
                                             $image_basefile, $args);
    if (not defined($image_path)) {
      # it would have been relevant to output the message only if
      # if not ($self->in_multiple_conversions())
      # However, @image formatted in multiple conversions context should be
      # rare out of test suites (and probably always incorrect), so we avoid
      # complexity and slowdown.  We still check that source_info is set, if
      # not it should be a copy, therefore there is no need for error
      # output, especially without line information.
      if (exists($command->{'source_info'})) {
        $self->converter_line_warn(sprintf(
              __("\@image file `%s' (for HTML) not found, using `%s'"),
                 $image_basefile, $image_file), $command->{'source_info'});
      }
    }
    if (defined($self->get_conf('IMAGE_LINK_PREFIX'))) {
      $image_file = $self->get_conf('IMAGE_LINK_PREFIX') . $image_file;
    }
    my $alt_string;
    if (defined($args->[3]) and defined($args->[3]->{'string'})
        and $args->[3]->{'string'} ne '') {
      $alt_string = $args->[3]->{'string'};
    } else {
      $alt_string = $basefile_string;
    }
    return $self->close_html_lone_element(
      $self->html_attribute_class('img', [$cmdname])
        . ' src="'.$self->url_protect_file_text($image_file)
        ."\" alt=\"$alt_string\"");
  }
  return '';
}

$default_commands_conversion{'image'} = \&_convert_image_command;

sub _convert_math_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $arg;
  if (defined($args) and defined($args->[0])) {
    $arg = $args->[0]->{'normal'};
  } else {
    return '';
  }

  my $math_type = $self->get_conf('HTML_MATH');
  if (defined($math_type) and $math_type eq 'mathjax') {
    $self->register_file_information('mathjax', 1);
    return $self->html_attribute_class('em', [$cmdname, 'tex2jax_process'])
                                          .">\\($arg\\)</em>";
  }
  return $self->html_attribute_class('em', [$cmdname]).">$arg</em>";
}

$default_commands_conversion{'math'} = \&_convert_math_command;

sub _accent_entities_html_accent($$$;$$$$) {
  my ($self, $text, $command, $index_in_stack, $accents_stack,
      $in_upper_case, $use_numeric_entities) = @_;

  my $accent = $command->{'cmdname'};

  if ($in_upper_case and $text =~ /^\w$/) {
    $text = uc($text);
  }

  # do not return a dotless i or j as such if it is further composed
  # with an accented letter, return the letter as is
  if ($accent eq 'dotless') {
    if (exists($Texinfo::UnicodeData::unicode_accented_letters{$accent})
        and exists($Texinfo::UnicodeData::unicode_accented_letters{
                                                             $accent}->{$text})
        and ($index_in_stack > 0
             and $Texinfo::UnicodeData::unicode_accented_letters{
                   $accents_stack->[$index_in_stack-1]->{'cmdname'} })) {
      return $text;
    }
  }

  if ($use_numeric_entities) {
    my $formatted_accent
      = Texinfo::Convert::Converter::xml_numeric_entity_accent($accent, $text);
    if (defined($formatted_accent)) {
      return $formatted_accent;
    }
  } else {
    my ($accent_command_entity, $accent_command_text_with_entities);
    if ($self->{'accent_entities'}->{$accent}) {
      ($accent_command_entity, $accent_command_text_with_entities)
        = @{$self->{'accent_entities'}->{$accent}};
    }
    return "&${text}$accent_command_entity;"
      if ($accent_command_entity
          and defined($accent_command_text_with_entities)
          # \z ensures that a \n at the end prevents matching, we do not
          # want an end of line in the middle of the entity
          and ($text =~ /^[$accent_command_text_with_entities]\z/));
    my $formatted_accent
      = Texinfo::Convert::Converter::xml_numeric_entity_accent($accent, $text);
    if (defined($formatted_accent)) {
      return $formatted_accent;
    }
  }

  # should only be the case of @dotless, as other commands have a diacritic
  # associated, and only if the argument is not i nor j.
  return $text;
}

sub _accent_entities_numeric_entities_accent($$$;$$$) {
  my ($self, $text, $command, $index_in_stack, $accents_stack,
      $in_upper_case) = @_;

  return _accent_entities_html_accent($self, $text, $command, $index_in_stack,
                                      $accents_stack, $in_upper_case, 1);
}

sub _convert_accent_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $format_accents;
  if ($self->get_conf('USE_NUMERIC_ENTITY')) {
    $format_accents = \&_accent_entities_numeric_entities_accent;
  } else {
    $format_accents = \&_accent_entities_html_accent;
  }
  return $self->convert_accents($command, $format_accents,
                                $self->get_conf('OUTPUT_CHARACTERS'),
                                in_upper_case($self));
}

foreach my $command (keys(%accent_commands)) {
  $default_commands_conversion{$command} = \&_convert_accent_command;
}

sub _css_string_accent($$$;$$$) {
  my ($self, $text, $command, $index_in_stack, $accents_stack,
      $in_upper_case) = @_;

  my $accent = $command->{'cmdname'};

  if ($in_upper_case and $text =~ /^\p{Word}$/) {
    $text = uc($text);
  }
  if (exists($Texinfo::UnicodeData::unicode_accented_letters{$accent})
      and exists($Texinfo::UnicodeData::unicode_accented_letters{
                                                          $accent}->{$text})) {
    return '\\' .
      $Texinfo::UnicodeData::unicode_accented_letters{$accent}->{$text}. ' ';
  }
  if (exists($Texinfo::CommandsValues::unicode_diacritics{$accent})) {
    my $diacritic = '\\'
       .$Texinfo::CommandsValues::unicode_diacritics{$accent}. ' ';
    if ($accent ne 'tieaccent') {
      return $text . $diacritic;
    } else {
      # tieaccent diacritic is naturally and correctly composed
      # between two characters
      my $remaining_text = $text;
      # we consider that letters are either characters or escaped characters
      if ($remaining_text =~ s/^([\p{L}\d]|\\[a-zA-Z0-9]+ )([\p{L}\d]|\\[a-zA-Z0-9]+ )(.*)$/$3/) {
        return $1.$diacritic.$2 . $remaining_text;
      } else {
        return $text . $diacritic;
      }
    }
  }

  # There are diacritics for every accent command except for dotless.
  # We should only get there with dotless if the argument is not recognized.
  return $text;
}

sub _css_string_convert_accent_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $format_accents = \&_css_string_accent;
  return $self->convert_accents($command, $format_accents,
                                $self->get_conf('OUTPUT_CHARACTERS'),
                                in_upper_case($self));
}

foreach my $command (keys(%accent_commands)) {
  $default_css_string_commands_conversion{$command}
    = \&_css_string_convert_accent_command;
}

# argument is formatted as code since indicateurl is in brace_code_commands
sub _convert_indicateurl_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $text;
  if (defined($args) and defined($args->[0])) {
    $text = $args->[0]->{'normal'};
  } else {
    return '';
  }

  if (!defined($text)) {
    # happens with bogus @-commands without argument, like @strong something
    return '';
  }
  if (!in_string($self)) {
    return $self->get_conf('OPEN_QUOTE_SYMBOL').
        $self->html_attribute_class('code', [$cmdname]).'>'.$text
                .'</code>'.$self->get_conf('CLOSE_QUOTE_SYMBOL');
  } else {
    return $self->get_conf('OPEN_QUOTE_SYMBOL').$text.
              $self->get_conf('CLOSE_QUOTE_SYMBOL');
  }
}

$default_commands_conversion{'indicateurl'} = \&_convert_indicateurl_command;


sub _convert_titlefont_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $text;
  if (defined($args) and defined($args->[0])) {
    $text = $args->[0]->{'normal'};
  } else {
  # happens with empty command
    return '';
  }

  return &{$self->formatting_function('format_heading_text')}($self, $cmdname,
                                                         [$cmdname], $text, 0);
}

$default_commands_conversion{'titlefont'} = \&_convert_titlefont_command;

sub _convert_U_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  if (defined($args) and defined($args->[0])) {
    my $arg_text = $args->[0]->{'normal'};
    if ($arg_text ne '') {
      # checks on the value already done in Parser, just output it here.
      return "&#x$arg_text;";
    }
  }
  return '';
}

$default_commands_conversion{'U'} = \&_convert_U_command;

sub _default_format_comment($$) {
  my ($self, $text) = @_;

  return $self->xml_comment(' '.$text);
}

# Note: has an XS override
sub _default_format_protect_text {
  my ($self, $text) = @_;

  my $result = $self->xml_protect_text($text);
  $result =~ s/\f/&#12;/g;
  return $result;
}

sub _default_css_string_format_protect_text($$) {
  my ($self, $text) = @_;

  $text =~ s/\\/\\\\/g;
  $text =~ s/\'/\\'/g;
  return $text;
}

# can be called on root commands, tree units, special elements
# and title elements.  $cmdname can be undef for special elements.
sub _default_format_heading_text($$$$$;$$$) {
  my ($self, $cmdname, $classes, $text, $level, $id, $element, $target) = @_;

  return '' if ($text !~ /\S/ and not defined($id));

  # This happens with titlefont in title for instance
  if (in_string($self)) {
    $text .= "\n" unless (defined($cmdname) and $cmdname eq 'titlefont');
    return $text;
  }

  if ($level < 1) {
    $level = 1;
  } elsif ($level > $self->get_conf('MAX_HEADER_LEVEL')) {
    $level = $self->get_conf('MAX_HEADER_LEVEL');
  }

  my $result = $self->html_attribute_class("h$level", $classes);

  if (defined($id)) {
    $result .= " id=\"$id\"";

    # The ID of this heading is likely the point the user would prefer being
    # linked to over the $target, since that's where they would be seeing a
    # copiable anchor.
    $target = $id;
  }
  $result .= '>';

  my $anchor = _get_copiable_anchor($self, $target);
  if (defined($anchor)) {
    $result .= '<span>';
  }
  $result .= $text;
  if (defined($anchor)) {
    $result .= "$anchor</span>";
  }
  $result .= "</h$level>";

  # titlefont appears inline in text, so no end of line is
  # added. The end of line should be added by the user if needed.
  $result .= "\n" unless (defined($cmdname) and $cmdname eq 'titlefont');
  $result .= $self->get_conf('DEFAULT_RULE') . "\n"
     if (defined($cmdname) and $cmdname eq 'part'
         and defined($self->get_conf('DEFAULT_RULE'))
         and $self->get_conf('DEFAULT_RULE') ne '');
  return $result;
}

sub _default_format_separate_anchor($$;$) {
  my ($self, $id, $class) = @_;

  # html_attribute_class would not work with span, so if span is
  # used, html_attribute_class should not be used
  return $self->html_attribute_class('a', [$class])." id=\"$id\"></a>";
}

# Associated to a button.  Return text to use for a link in button bar.
# Depending on USE_NODE_DIRECTIONS and xrefautomaticsectiontitle
# use section or node for link direction and string.
sub _default_panel_button_dynamic_direction($$;$$$) {
  my ($self, $direction, $source_command, $omit_rel,
      $use_first_element_in_file_directions) = @_;

  my $result;

  if ((defined($self->get_conf('USE_NODE_DIRECTIONS'))
       and $self->get_conf('USE_NODE_DIRECTIONS'))
      or (not defined($self->get_conf('USE_NODE_DIRECTIONS'))
          and $self->get_conf('USE_NODES'))) {
    $direction = 'Node'.$direction;
  }

  if ($use_first_element_in_file_directions) {
    $direction = 'FirstInFile'.$direction;
  }

  my $href = $self->from_element_direction($direction, 'href',
                                           undef, undef, $source_command);
  my $node;

  my $xrefautomaticsectiontitle = $self->get_conf('xrefautomaticsectiontitle');
  if (defined($xrefautomaticsectiontitle)
      and $xrefautomaticsectiontitle eq 'on') {
    $node = $self->from_element_direction($direction, 'section_nonumber');
  }

  if (!defined($node)) {
    $node = $self->from_element_direction($direction, 'node');
  }

  if (defined($node) and $node =~ /\S/) {
    my $hyperlink;
    if (defined($href) and $href ne '') {
      my $hyperlink_attributes = $omit_rel ? ''
        : _direction_href_attributes($self, $direction);
      $hyperlink = "<a href=\"$href\"${hyperlink_attributes}>$node</a>";
    } else {
      $hyperlink = $node;
    }
    # i18n
    my $direction_text = $self->direction_string($direction, 'text');
    $direction_text = '' if (!defined($direction_text));
    $result = $direction_text.": $hyperlink";
  }
  # 1 to communicate that a delimiter is needed for that button
  return ($result, 1);
}

# Used for button bar at the foot of a node, with "rel" and "accesskey"
# attributes omitted.
sub _default_panel_button_dynamic_direction_node_footer($$$) {
  my ($self, $direction, $source_command) = @_;

  return _default_panel_button_dynamic_direction($self, $direction,
                                                 $source_command, 1);
}

# used for button bar at the foot of a section or chapter with
# directions of first element in file used instead of the last
# element directions.
sub _default_panel_button_dynamic_direction_section_footer($$$) {
  my ($self, $direction, $source_command) = @_;

  return _default_panel_button_dynamic_direction($self, $direction,
                                                 $source_command, undef, 1);
}

# Only used if ICONS is set and the button is active.
sub _default_format_button_icon_img($$$;$) {
  my ($self, $button, $icon, $name) = @_;

  return '' if (!defined($icon));
  $button = '' if (!defined ($button));
  $name = '' if (!defined($name));
  my $alt = '';
  if ($name ne '') {
    if ($button ne '') {
      $alt = "$button: $name";
    } else {
      $alt = $name;
    }
  } else {
    $alt = $button;
  }

  my $img = $self->html_attribute_class('img', ['nav-icon']);
  return $self->close_html_lone_element(
    "$img src=\"".$self->url_protect_url_text($icon)."\" alt=\"$alt\"");
}

sub _direction_href_attributes($$) {
  my ($self, $direction) = @_;

  my $href_attributes = '';
  if ($self->get_conf('USE_ACCESSKEY')) {
    my $accesskey = $self->direction_string($direction, 'accesskey', 'string');
    if (defined($accesskey) and ($accesskey ne '')) {
      $href_attributes = " accesskey=\"$accesskey\"";
    }
  }
  my $button_rel = $self->direction_string($direction, 'rel', 'string');
  if (defined($button_rel) and ($button_rel ne '')) {
    $href_attributes .= " rel=\"$button_rel\"";
  }
  return $href_attributes;
}

my %html_default_node_directions;
foreach my $node_directions ('NodeNext', 'NodePrev', 'NodeUp') {
  $html_default_node_directions{$node_directions} = 1;
}

sub _default_format_button($$;$) {
  my ($self, $button, $source_command) = @_;

  my ($active, $passive, $need_delimiter);
  if (ref($button) eq 'CODE') {
    ($active, $need_delimiter) = &$button($self);
  } elsif (ref($button) eq 'ARRAY' and scalar(@$button == 2)) {
    my $text = $button->[1];
    my $direction = $button->[0];
    # $direction is simple text and $text is a reference on code
    if (defined($direction) and ref($direction) eq ''
        and defined($text) and (ref($text) eq 'CODE')) {
      ($active, $need_delimiter) = &$text($self, $direction, $source_command);
    # $direction is simple text and $text is also a simple text
    } elsif (defined($direction) and ref($direction) eq ''
             and defined($text) and ref($text) eq '') {
      if ($text =~ s/^->\s*//) {
        # this case is mostly for tests, to test the direction type $text
        # with the direction $direction
        $active = $self->from_element_direction($direction, $text,
                                                undef, undef, $source_command);
      }
      $need_delimiter = 1;
    }
  } elsif (defined($self->global_direction_text($button))) {
    # handle "direction" text button without output unit (Space)
    if ($self->get_conf('ICONS')) {
      my $direction_icon;
      my $active_icons = $self->get_conf('ACTIVE_ICONS');
      if (defined($active_icons)) {
        $direction_icon = $active_icons->{$button};
      }
      if (defined($direction_icon) and $direction_icon ne '') {
        my $button_name_string = $self->direction_string($button,
                                                        'button', 'string');
        $active = &{$self->formatting_function('format_button_icon_img')}($self,
                                           $button_name_string, $direction_icon);
      } else {
        $active = $self->direction_string($button, 'text');
      }
    } else {
      $active = $self->direction_string($button, 'text');
    }
    $need_delimiter = 0;
  } else {
    my $href = $self->from_element_direction($button, 'href',
                                             undef, undef, $source_command);
    if (defined($href)) {
      # button is active
      my $btitle = '';
      my $description = $self->direction_string($button, 'description', 'string');
      if (defined($description)) {
        $btitle = ' title="' . $description . '"';
      }
      if ($self->get_conf('USE_ACCESSKEY')) {
        my $accesskey = $self->direction_string($button, 'accesskey', 'string');
        if (defined($accesskey) and $accesskey ne '') {
          $btitle .= " accesskey=\"$accesskey\"";
        }
      }
      my $button_rel = $self->direction_string($button, 'rel', 'string');
      if (defined($button_rel) and $button_rel ne '') {
        $btitle .= " rel=\"$button_rel\"";
      }
      if ($self->get_conf('ICONS')) {
        my $active_icon;
        my $active_icons = $self->get_conf('ACTIVE_ICONS');
        if (defined($active_icons)) {
          $active_icon = $active_icons->{$button};
        }
        if (defined($active_icon) and $active_icon ne '') {
          my $button_name_string = $self->direction_string($button,
                                                           'button', 'string');
          $active = "<a href=\"$href\"${btitle}>".
             &{$self->formatting_function('format_button_icon_img')}($self,
                      $button_name_string, $active_icon,
                      $self->from_element_direction($button, 'string')) ."</a>";
        } else {
          # use text
          my $button_text = $self->direction_string($button, 'text');
          $button_text = '' if (!defined($button_text));
          $active = '['."<a href=\"$href\"${btitle}>".$button_text."</a>".']';
        }
      } else {
        # use text
        my $button_text = $self->direction_string($button, 'text');
        $button_text = '' if (!defined($button_text));
        $active = '['."<a href=\"$href\"${btitle}>".$button_text."</a>".']';
      }
    } else {
      # button is passive
      if ($self->get_conf('ICONS')) {
        my $passive_icon;
        my $passive_icons = $self->get_conf('PASSIVE_ICONS');
        if (defined($passive_icons)) {
          $passive_icon = $passive_icons->{$button};
        }
        if (defined($passive_icon) and $passive_icon ne '') {
          my $button_name_string = $self->direction_string($button,
                                                           'button', 'string');
          $passive = &{$self->formatting_function('format_button_icon_img')}(
                      $self, $button_name_string, $passive_icon,
                      $self->from_element_direction($button, 'string'));
        } else {
          my $button_text = $self->direction_string($button, 'text');
          $button_text = '' if (!defined($button_text));
          $passive = '['.$button_text. ']';
        }
      } else {
        my $button_text = $self->direction_string($button, 'text');
        $button_text = '' if (!defined($button_text));
        $passive = '['.$button_text. ']';
      }
    }
    $need_delimiter = 0;
  }
  if (not defined($need_delimiter)) {
    # NOTE other options could have been chosen in that case:
    # option 1: be forgiving if $need_delimiter is not set
    # if ($html_default_node_directions{$button}) {
    #   $need_delimiter = 1;
    # } else {
    #   $need_delimiter = 0;
    # }
    # option 2: be somewhat forgiving but show a backtrace
    #cluck ("need_delimiter not defined");
    # $need_delimiter = 0;
    # option3: no pity
    confess ("need_delimiter not defined");
  }
  return ($active, $passive, $need_delimiter);
}

# called for special elements and tree units
sub _default_format_navigation_panel($$$$;$$) {
  my ($self, $buttons, $cmdname, $source_command, $vertical, $in_header) = @_;

  # a string may be passed, for instance through command line, therefore
  # it is useful to test that $buttons is an array reference to avoid
  # a Perl error message
  if (ref($buttons) ne 'ARRAY') {
    return '';
  }

  # do the buttons first in case they are formatted as an empty string
  my $nr_of_buttons_shown = 0;
  my $result_buttons = '';
  foreach my $button (@$buttons) {
    my $direction;
    if (ref($button) eq 'ARRAY'
        and defined($button->[0]) and ref($button->[0]) eq '') {
      $direction = $button->[0];
    } elsif (defined($button) and ref($button) eq '') {
      $direction = $button;
    }
    # if the first button is an empty button, pass
    if (defined($direction)
        and $direction eq 'Space' and $nr_of_buttons_shown == 0) {
      next;
    }

    my ($active, $passive, $need_delimiter)
      # API info: using the API to allow for customization would be:
      #  = &{$self->formatting_function('format_button')}($self, $button,
      #                                                   $source_command);
       = &{$self->{'formatting_function'}->{'format_button'}}($self, $button,
                                                            $source_command);
    if ($self->get_conf('HEADER_IN_TABLE')) {
      $result_buttons .= '<tr>'."\n" if $vertical;
      $result_buttons .= $self->html_attribute_class('td', ['nav-button']).'>';

      if (defined($active)) {
        $result_buttons .= $active;
      } elsif (defined($passive)) {
        $result_buttons .= $passive;
      }

      $result_buttons .= "</td>\n";
      $result_buttons .= "</tr>\n" if $vertical;

      $nr_of_buttons_shown++;
    } elsif (defined($active)) {
      # only active buttons are print out when not in table
      if ($need_delimiter and $nr_of_buttons_shown > 0) {
        $result_buttons .= ', ';
      }
      $result_buttons .= $active;
      $nr_of_buttons_shown++;
    }
  }

  if ($result_buttons eq '') {
    return '';
  }

  my $result = '';

  # if $vertical/VERTICAL_HEAD_NAVIGATION, the buttons are in a vertical
  # table which is itself in the first column of a table opened in
  # header_navigation

  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= $self->html_attribute_class('table', ['nav-panel']).'>'."\n";
    $result .= "<tr>" unless $vertical;
  } else {
    $result .= $self->html_attribute_class('div', ['nav-panel']).">\n";
    $result .= "<p>\n";
  }

  $result .= $result_buttons;

  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= "</tr>" unless $vertical;
    $result .= "</table>\n";
  } else {
    $result .= "</p>\n";
    $result .= "</div>\n";
  }
  return $result;
}

sub _default_format_navigation_header($$$$) {
  my ($self, $buttons, $cmdname, $element) = @_;

  my $result = '';
  if ($self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
    $result .= $self->html_attribute_class('table',
                                           ['vertical-navigation']).'>'."\n";
    $result .= "<tr>\n";
    $result .= $self->html_attribute_class('td',
                                           ['vertical-navigation']).'>'."\n";
  }
  $result .= &{$self->formatting_function('format_navigation_panel')}($self,
                                   $buttons, $cmdname, $element,
                             $self->get_conf('VERTICAL_HEAD_NAVIGATION'), 1);
  if ($self->get_conf('VERTICAL_HEAD_NAVIGATION')) {
    $result .= '</td>
<td>
';
  } elsif ($self->get_conf('SPLIT')
           and $self->get_conf('SPLIT') eq 'node' and $result ne ''
           and defined($self->get_conf('DEFAULT_RULE'))) {
    $result .= $self->get_conf('DEFAULT_RULE')."\n";
  }
  return $result;
}

# this can only be called on root commands and associated tree units
sub _default_format_element_header($$$$) {
  my ($self, $cmdname, $command, $output_unit) = @_;

  my $result = '';

  print STDERR "FORMAT elt header "
     # uncomment to get perl object names
     #."$output_unit (@{$output_unit->{'unit_contents'}}) ".
     . "(".join('|', map{Texinfo::Common::debug_print_element($_)}
             @{$output_unit->{'unit_contents'}}) . ") ".
     Texinfo::OutputUnits::output_unit_texi($output_unit) ."\n"
        if ($self->get_conf('DEBUG'));

  # Do the heading if the command is the first command in the element
  if (($output_unit->{'unit_contents'}->[0] eq $command
       or (!exists($output_unit->{'unit_contents'}->[0]->{'cmdname'})
            and $output_unit->{'unit_contents'}->[1] eq $command))
      # and there is more than one element
      and (exists($output_unit->{'tree_unit_directions'}))) {
    my $is_top = $self->unit_is_top_output_unit($output_unit);
    my $first_in_page = 0;
    if (exists($output_unit->{'unit_filename'})
        and $self->count_elements_in_filename('current',
                           $output_unit->{'unit_filename'}) == 1) {
      $first_in_page = 1;
    }
    my $previous_is_top = 0;
    $previous_is_top = 1
      if (exists($output_unit->{'tree_unit_directions'}->{'prev'})
          and $self->unit_is_top_output_unit($output_unit->{'tree_unit_directions'}
                                                             ->{'prev'}));

    print STDERR "Header ($previous_is_top, $is_top, $first_in_page): "
     .Texinfo::Convert::Texinfo::root_heading_command_to_texinfo($command)."\n"
       if ($self->get_conf('DEBUG'));

    if ($is_top) {
      # use TOP_BUTTONS for top.
      $result .=
         &{$self->formatting_function('format_navigation_header')}($self,
                         $self->get_conf('TOP_BUTTONS'), $cmdname, $command)
           if ($self->get_conf('SPLIT') or $self->get_conf('HEADERS'));
    } else {
      my $split = $self->get_conf('SPLIT');
      if ($first_in_page and !$self->get_conf('HEADERS')) {
        if (defined($split) and $split eq 'chapter') {
          $result
           .= &{$self->formatting_function('format_navigation_header')}($self,
                        $self->get_conf('CHAPTER_BUTTONS'), $cmdname, $command);

          $result .= $self->get_conf('DEFAULT_RULE') ."\n"
            if (defined($self->get_conf('DEFAULT_RULE'))
                and !$self->get_conf('VERTICAL_HEAD_NAVIGATION'));
        } elsif (defined($split) and $split eq 'section') {
          $result
            .= &{$self->formatting_function('format_navigation_header')}($self,
                        $self->get_conf('SECTION_BUTTONS'), $cmdname, $command);
        }
      }
      if (($first_in_page or $previous_is_top)
           and $self->get_conf('HEADERS')) {
        $result
          .= &{$self->formatting_function('format_navigation_header')}($self,
                        $self->get_conf('SECTION_BUTTONS'), $cmdname, $command);
      } elsif ($self->get_conf('HEADERS')
                       or (defined($split) and $split eq 'node')) {
        # got to do this here, as it isn't done otherwise since
        # navigation_header is not called
        $result
          .= &{$self->formatting_function('format_navigation_panel')}($self,
                           $self->get_conf('SECTION_BUTTONS'), $cmdname,
                                   $command, undef, 1);
      }
    }
  }
  return $result;
}

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

sub _contents_inline_element($$$) {
  my ($self, $cmdname,
  # undef unless called from @-command formatting function
     $element) = @_;

  print STDERR "CONTENTS_INLINE $cmdname\n" if ($self->get_conf('DEBUG'));
  my $table_of_contents
   = &{$self->formatting_function('format_contents')}($self,
                                                $cmdname, $element);
  if (defined($table_of_contents) and $table_of_contents ne '') {
    my ($special_unit_variety, $special_unit, $class_base,
        $special_unit_direction)
          = $self->command_name_special_unit_information($cmdname);
    my $result = $self->html_attribute_class('div', ["region-${class_base}"]);
    my $unit_command = $special_unit->{'unit_command'};
    my $id = $self->command_id($unit_command);
    if (defined($id) and $id ne '') {
      $result .= " id=\"$id\"";
    }
    $result .= ">\n";
    my $heading = $self->command_text($unit_command);
    $heading = '' if (!defined($heading));
    $result .= &{$self->formatting_function('format_heading_text')}($self,
                                  $cmdname, [$class_base.'-heading'], $heading,
                                  $self->get_conf('CHAPTER_HEADER_LEVEL'))."\n";
    $result .= $table_of_contents . "</div>\n";
    return $result;
  }
  return '';
}

sub _convert_heading_command($$$$$) {
  my ($self, $cmdname, $element, $args, $content) = @_;

  my $result = '';

  # No situation where this could happen
  if (in_string($self)) {
    $result .= $self->command_text($element, 'string') ."\n"
      if ($cmdname ne 'node');
    $result .= $content if (defined($content));
    return $result;
  }

  my $element_id = $self->command_id($element);

  print STDERR "CONVERT elt heading "
        # uncomment next line for the perl object name
        #."$element "
        .Texinfo::Convert::Texinfo::root_heading_command_to_texinfo($element)."\n"
          if ($self->get_conf('DEBUG'));

  my $document = $self->get_info('document');
  my $sections_list;
  my $nodes_list;
  if (defined($document)) {
    $sections_list = $document->sections_list();
    $nodes_list = $document->nodes_list();
  }

  my $output_unit;
  my $section_relations;
  my $node_relations;

  if (exists($Texinfo::Commands::root_commands{$cmdname})) {
    if ($cmdname eq 'node') {
      if (defined($nodes_list) and exists($element->{'extra'})
        and $element->{'extra'}->{'node_number'}) {
        $node_relations
          = $nodes_list->[$element->{'extra'}->{'node_number'} -1];
      }
    } elsif (defined($sections_list)) {
      $section_relations
        = $sections_list->[$element->{'extra'}->{'section_number'} -1];
    }
    # All the root commands are associated to an output unit, the condition
    # on associated_unit is always true.
    if (exists($element->{'associated_unit'})) {
      $output_unit = $element->{'associated_unit'};
    }
  }

  my $element_header = '';
  if ($output_unit) {
    $element_header = &{$self->formatting_function('format_element_header')}(
                                        $self, $cmdname, $element, $output_unit);
  }

  my $toc_or_mini_toc_or_auto_menu = '';
  if ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'after_top'
      and $cmdname eq 'top'
      and defined($sections_list)
      and scalar(@{$sections_list}) > 1) {
    foreach my $content_command_name ('shortcontents', 'contents') {
      if ($self->get_conf($content_command_name)) {
        my $contents_text
          = _contents_inline_element($self, $content_command_name, undef);
        if ($contents_text ne '') {
          $toc_or_mini_toc_or_auto_menu .= $contents_text;
        }
      }
    }
  }

  my $format_menu = $self->get_conf('FORMAT_MENU');
  if ($toc_or_mini_toc_or_auto_menu eq '' and defined($section_relations)) {
    if ($format_menu eq 'sectiontoc') {
      $toc_or_mini_toc_or_auto_menu = _mini_toc($self, $section_relations);
    } elsif (($format_menu eq 'menu' or $format_menu eq 'menu_no_detailmenu')
             and exists($section_relations->{'associated_node'})) {
      my $associated_node_relations = $section_relations->{'associated_node'};
      # arguments_line type element
      my $arguments_line
        = $associated_node_relations->{'element'}->{'contents'}->[0];
      my $automatic_directions = 1;
      if (scalar(@{$arguments_line->{'contents'}}) > 1) {
        $automatic_directions = 0;
      }

      if ($automatic_directions
         and !exists($associated_node_relations->{'menus'})) {
        my $identifiers_target = $document->labels_information();

        my $menu_node;
        if ($format_menu eq 'menu') {
          $menu_node
            = Texinfo::Structuring::new_complete_menu_master_menu($self,
                                  $identifiers_target, $nodes_list,
                                  $associated_node_relations);
        } else { # $format_menu eq 'menu_no_detailmenu'
          $menu_node
            = Texinfo::Structuring::new_complete_node_menu(
                              $associated_node_relations,
                              $self->{'current_lang_translations'},
                              $self->get_conf('DEBUG'));
        }
        if (defined($menu_node)) {
          $toc_or_mini_toc_or_auto_menu
                = $self->convert_tree($menu_node, 'master menu');
        }
      }
    }
  }

  if ($self->get_conf('NO_TOP_NODE_OUTPUT')
      and exists($Texinfo::Commands::root_commands{$cmdname})) {
    my $in_skipped_node_top
      = $self->get_shared_conversion_state('top', 'in_skipped_node_top');
    $in_skipped_node_top = 0 if (!defined($in_skipped_node_top));
    if ($in_skipped_node_top == 1) {
      my $id_class = $cmdname;
      $result .= &{$self->formatting_function('format_separate_anchor')}($self,
                                                        $element_id, $id_class);
      $result .= $element_header;
      $result .= $toc_or_mini_toc_or_auto_menu;
      return $result;
    }
  }

  my $level_corrected_cmdname = $cmdname;
  my $level_set_class;
  if (exists($element->{'extra'})
      and exists($element->{'extra'}->{'section_level'})) {
    # if the level was changed, use a consistent command name
    $level_corrected_cmdname
      = Texinfo::Structuring::section_level_adjusted_command_name($element);
    if ($level_corrected_cmdname ne $cmdname) {
      $level_set_class = "${cmdname}-level-set-${level_corrected_cmdname}";
    }
  }

  # find the section starting here, can be through the associated node
  # preceding the section, or the section itself
  my $opening_section;
  my $level_corrected_opening_section_cmdname;
  if (defined($node_relations)
      and exists($node_relations->{'associated_section'})) {
    $opening_section = $node_relations->{'associated_section'}->{'element'};
    $level_corrected_opening_section_cmdname
          = Texinfo::Structuring::section_level_adjusted_command_name(
                                                             $opening_section);
  # if there is an associated node, it is not a section opening
  # the section was opened before when the node was encountered
  } elsif (defined($section_relations)
           and !exists($section_relations->{'associated_node'})) {
    $opening_section = $element;
    $level_corrected_opening_section_cmdname = $level_corrected_cmdname;
  }

  # could use empty args information also, to avoid calling command_text
  #my $empty_heading = (!scalar(@$args) or !defined($args->[0]));

  # $heading not defined may happen if the command is a @node, for example
  # if there is an error in the node.
  my $heading = $self->command_text($element);
  my $heading_level;
  # node is used as heading if there is nothing else.
  if (defined($node_relations)) {
    if (defined($output_unit) and exists($output_unit->{'unit_node'})
        and $output_unit->{'unit_node'} eq $node_relations
        and !exists($node_relations->{'associated_title_command'})) {
      if ($element->{'extra'}->{'normalized'} eq 'Top') {
        $heading_level = 0;
      } else {
        # use node
        $heading_level = 3;
      }
    }
  } elsif (exists($element->{'extra'})
           and exists($element->{'extra'}->{'section_level'})) {
    $heading_level = $element->{'extra'}->{'section_level'};
  } else {
    # for *heading* @-commands which do not have a level
    # in the document as they are not associated with the
    # sectioning tree, but still have a $heading_level
    $heading_level = Texinfo::Common::section_level($element);
  }

  my $do_heading = (defined($heading) and $heading ne ''
                    and defined($heading_level));

  # if set, the id is associated to the heading text
  my $heading_id;
  if ($opening_section) {
    my $level;
    if (exists($opening_section->{'extra'})
        and exists($opening_section->{'extra'}->{'section_level'})) {
      $level = $opening_section->{'extra'}->{'section_level'};
    } else {
      # if Structuring sectioning_structure was not called on the
      # document (cannot happen in main program or test_utils.pl tests)
      $level = Texinfo::Common::section_level($opening_section);
    }
    my $closed_strings = $self->close_registered_sections_level(
                                  $self->current_filename(), $level);
    $result .= join('', @{$closed_strings});
    $self->register_opened_section_level($self->current_filename(), $level,
                                         "</div>\n");

    # use a specific class name to mark that this is the start of
    # the section extent. It is not necessary where the section is.
    $result .= $self->html_attribute_class('div',
                 ["${level_corrected_opening_section_cmdname}-level-extent"]);
    $result .= " id=\"$element_id\""
        if (defined($element_id) and $element_id ne '');
    $result .= ">\n";
  } elsif (defined($element_id) and $element_id ne '') {
    if ($element_header ne '') {
      # case of a @node without sectioning command and with a header.
      # put the node element anchor before the header.
      # Set the class name to the command name if there is no heading,
      # else the class will be with the heading element.
      my $id_class = $cmdname;
      if ($do_heading) {
        $id_class = "${cmdname}-id";
      }
      $result .= &{$self->formatting_function('format_separate_anchor')}($self,
                                                        $element_id, $id_class);
    } else {
      $heading_id = $element_id;
    }
  }

  $result .= $element_header;

  if ($do_heading) {
    if ($self->get_conf('TOC_LINKS')
        and exists($Texinfo::Commands::root_commands{$cmdname})
        and exists($sectioning_heading_commands{$cmdname})) {
      my $content_href = $self->command_contents_href($element, 'contents');
      if (defined($content_href)) {
        $heading = "<a href=\"$content_href\">$heading</a>";
      }
    }

    my @heading_classes;
    push @heading_classes, $level_corrected_cmdname;
    if (defined($level_set_class)) {
      push @heading_classes, $level_set_class;
    }
    if (in_preformatted_context($self)) {
      my $id_str = '';
      if (defined($heading_id)) {
        $id_str = " id=\"$heading_id\"";
      }
      $result .= $self->html_attribute_class('strong', \@heading_classes)
                                   ."${id_str}>".$heading.'</strong>'."\n";
    } else {
      $result .= &{$self->formatting_function('format_heading_text')}($self,
                     $level_corrected_cmdname, \@heading_classes, $heading,
                     $heading_level +$self->get_conf('CHAPTER_HEADER_LEVEL') -1,
                     $heading_id, $element, $element_id);
    }
  } elsif (defined($heading_id)) {
    # case of a lone node and no header, and case of an empty @top
    $result .= &{$self->formatting_function('format_separate_anchor')}($self,
                                                       $heading_id, $cmdname);
  }

  $result .= $content if (defined($content));

  $result .= $toc_or_mini_toc_or_auto_menu;

  return $result;
}

foreach my $command (keys(%sectioning_heading_commands), 'node') {
  $default_commands_conversion{$command} = \&_convert_heading_command;
}

sub _convert_raw_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  if ($cmdname eq 'html') {
    return $content;
  }

  # In multiple conversions should only happen rarely, as in general, format
  # commands do not happen in inline context where most of the multiple
  # conversions are.  A possibility is in float caption.
  if (!$self->in_multiple_conversions()) {
    $self->converter_line_warn(sprintf(__("raw format %s is not converted"),
                                     $cmdname), $command->{'source_info'});
  }
  return &{$self->formatting_function('format_protect_text')}($self, $content);
}

foreach my $command (keys(%format_raw_commands)) {
  $default_commands_conversion{$command} = \&_convert_raw_command;
}

sub _convert_inline_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $format;
  if (defined($args) and defined($args->[0])
      and defined($args->[0]->{'monospacetext'})
      and $args->[0]->{'monospacetext'} ne '') {
    $format = $args->[0]->{'monospacetext'};
  } else {
    return '';
  }

  my $arg_index = undef;
  if (exists($inline_format_commands{$cmdname})) {
    if ($cmdname eq 'inlinefmtifelse' and !$self->is_format_expanded($format)) {
      $arg_index = 2;
    } elsif ($self->is_format_expanded($format)) {
      $arg_index = 1;
    }
  } elsif (exists($command->{'extra'})
           and $command->{'extra'}->{'expand_index'}) {
    $arg_index = 1;
  }
  if (defined($arg_index) and $arg_index < scalar(@$args)) {
    my $text_arg = $args->[$arg_index];
    if (defined($text_arg)) {
      if (defined($text_arg->{'normal'})) {
        return $text_arg->{'normal'};
      } elsif (defined($text_arg->{'raw'})) {
        return $text_arg->{'raw'};
      }
    }
  }
  return '';
}

foreach my $command (grep {$brace_commands{$_} eq 'inline'}
                           keys(%brace_commands)) {
  $default_commands_conversion{$command} = \&_convert_inline_command;
}

sub _indent_with_table($$$;$) {
  my ($self, $cmdname, $content, $extra_classes) = @_;

  my @classes = ($cmdname);
  push (@classes, @$extra_classes) if (defined($extra_classes));
  return $self->html_attribute_class('table', \@classes)
         .'><tr><td>'.$self->get_info('non_breaking_space').'</td><td>'.$content
                ."</td></tr></table>\n";
}

sub _convert_preformatted_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  if (!defined($content) or $content eq '') {
    return '';
  }

  if (in_string($self)) {
    return $content;
  }

  my @classes;

  # this is mainly for classes as there are purprosely no classes
  # for small*
  my $main_cmdname;
  if (exists($small_block_associated_command{$cmdname})) {
    $main_cmdname = $small_block_associated_command{$cmdname};
    push @classes, $cmdname;
  } else {
    $main_cmdname = $cmdname;
  }

  if ($cmdname eq 'example') {
    # arguments_line type element
    my $arguments_line = $command->{'contents'}->[0];
    foreach my $example_arg (@{$arguments_line->{'contents'}}) {
      # convert or remove all @-commands, using simple ascii and unicode
      # characters
      my $converted_arg
        = Texinfo::Convert::NodeNameNormalization::convert_to_normalized(
                                                               $example_arg);
      if ($converted_arg ne '') {
        push @classes, 'user-' . $converted_arg;
      }
    }
  } elsif ($main_cmdname eq 'lisp') {
    push @classes, $main_cmdname;
    $main_cmdname = 'example';
  }

  if ($self->get_conf('INDENTED_BLOCK_COMMANDS_IN_TABLE')
      and exists($indented_preformatted_commands{$cmdname})) {
    return _indent_with_table($self, $cmdname, $content, \@classes);
  } else {
    unshift @classes, $main_cmdname;
    return $self->html_attribute_class('div', \@classes)
                                   .">\n".$content.'</div>'."\n";
  }
}

foreach my $preformatted_command (keys(%preformatted_commands)) {
  $default_commands_conversion{$preformatted_command}
    = \&_convert_preformatted_command;
}

sub _convert_indented_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  if (!defined($content) or $content eq '') {
    return '';
  }

  if (in_string($self)) {
    return $content;
  }

  my @classes;

  my $main_cmdname;
  if (exists($small_block_associated_command{$cmdname})) {
    push @classes, $cmdname;
    $main_cmdname = $small_block_associated_command{$cmdname};
  } else {
    $main_cmdname = $cmdname;
  }

  if ($self->get_conf('INDENTED_BLOCK_COMMANDS_IN_TABLE')) {
    return _indent_with_table($self, $main_cmdname, $content, \@classes);
  } else {
    unshift @classes, $main_cmdname;
    return $self->html_attribute_class('blockquote', \@classes).">\n"
                        . $content . '</blockquote>'."\n";
  }
}

$default_commands_conversion{'indentedblock'} = \&_convert_indented_command;

sub _convert_verbatim_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  if (!in_string($self)) {
    return $self->html_attribute_class('pre', [$cmdname]).'>'
          .$content . '</pre>';
  } else {
    return $content;
  }
}

$default_commands_conversion{'verbatim'} = \&_convert_verbatim_command;

sub _convert_displaymath_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  if (in_string($self)) {
    return $content;
  }

  my $result = '';
  my $pre_classes = [$cmdname];

  my $use_mathjax = ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax');

  if ($use_mathjax) {
    $self->register_file_information('mathjax', 1);
    push @$pre_classes, 'tex2jax_process';
  }
  $result .= $self->html_attribute_class('pre', $pre_classes).'>';
  if ($self->get_conf('HTML_MATH')
        and $self->get_conf('HTML_MATH') eq 'mathjax') {
    $result .= "\\[$content\\]";
  } else {
    $result .= $content;
  }
  $result .= '</pre>';
  return $result;
}

$default_commands_conversion{'displaymath'} = \&_convert_displaymath_command;

sub _convert_verbatiminclude_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $verbatim_include_verbatim
    = $self->expand_verbatiminclude($command);
  if (defined($verbatim_include_verbatim)) {
    return $self->convert_tree($verbatim_include_verbatim,
                               'convert verbatiminclude');
  } else {
    return '';
  }
}

$default_commands_conversion{'verbatiminclude'}
  = \&_convert_verbatiminclude_command;

sub _convert_command_simple_block($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  return $self->html_attribute_class('div', [$cmdname]).'>'
        .$content.'</div>';
}

$default_commands_conversion{'raggedright'} = \&_convert_command_simple_block;
$default_commands_conversion{'flushleft'} = \&_convert_command_simple_block;
$default_commands_conversion{'flushright'} = \&_convert_command_simple_block;
$default_commands_conversion{'group'} = \&_convert_command_simple_block;

sub _convert_sp_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $sp_nr = 1;
  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'misc_args'})) {
    $sp_nr = $command->{'extra'}->{'misc_args'}->[0];
  }
  if ($sp_nr > 0) {
    if (in_preformatted_context($self) or in_string($self)) {
      return "\n" x $sp_nr;
    } else {
      return ($self->get_info('line_break_element')."\n") x $sp_nr;
    }
  } else {
    return '';
  }
}

$default_commands_conversion{'sp'} = \&_convert_sp_command;

sub _convert_exdent_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $arg = $self->get_pending_formatted_inline_content();
  if (defined($args) and defined($args->[0])) {
    $arg .= $args->[0]->{'normal'};
  }

  if (in_string($self)) {
    return $arg ."\n";
  }

  # FIXME do something with CSS?  Currently nothing is defined for exdent

  if (in_preformatted_context($self)) {
    return $self->html_attribute_class('pre', [$cmdname]).'>'.$arg ."\n</pre>";
  } else {
    return $self->html_attribute_class('p', [$cmdname]).'>'.$arg ."\n</p>";
  }
}

$default_commands_conversion{'exdent'} = \&_convert_exdent_command;

sub _convert_center_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  if (!defined($args) or !defined($args->[0])) {
    return '';
  }

  if (in_string($self)) {
    return $args->[0]->{'normal'}."\n";
  } else {
    return $self->html_attribute_class('div', [$cmdname]).">"
                                 .$args->[0]->{'normal'}."\n</div>";
  }
}

$default_commands_conversion{'center'} = \&_convert_center_command;

sub _convert_author_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  my $quotation_titlepage_nr = $self->get_shared_conversion_state('quotation',
                                                  'quotation_titlepage_stack');
  if (defined($quotation_titlepage_nr) and $quotation_titlepage_nr > 0) {
    my $authors_nr
      = $self->get_shared_conversion_state('quotation', 'element_authors_number',
                                           $quotation_titlepage_nr);

    if ($authors_nr < 0) {
      # in titlepage
      if (!in_string($self)) {
        return $self->html_attribute_class('strong', [$cmdname])
                    .">$args->[0]->{'normal'}</strong>"
                    .$self->get_info('line_break_element')."\n";
      } else {
        return $args->[0]->{'normal'} . "\n";
      }
    } else {
      # in quotation
      $self->set_shared_conversion_state('quotation', 'elements_authors',
                                          $quotation_titlepage_nr, $authors_nr,
                                          $command);

      $authors_nr++;
      $self->set_shared_conversion_state('quotation', 'element_authors_number',
                                         $quotation_titlepage_nr, $authors_nr);
    }
  }
  return '';
}

$default_commands_conversion{'author'} = \&_convert_author_command;

sub _convert_title_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  return '' if (!defined($args) or !defined($args->[0]));

  if (!in_string($self)) {
    return $self->html_attribute_class('h1', [$cmdname])
                            .">$args->[0]->{'normal'}</h1>\n";
  } else {
    return $args->[0]->{'normal'};
  }
}

$default_commands_conversion{'title'} = \&_convert_title_command;

sub _convert_subtitle_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  return '' if (!defined($args) or !defined($args->[0]));

  if (!in_string($self)) {
    return $self->html_attribute_class('h3', [$cmdname])
                            .">$args->[0]->{'normal'}</h3>\n";
  } else {
    return $args->[0]->{'normal'};
  }
}

$default_commands_conversion{'subtitle'} = \&_convert_subtitle_command;

sub _convert_insertcopying_command($$$) {
  my ($self, $cmdname, $command) = @_;

  my $global_commands;
  my $document = $self->get_info('document');
  if (defined($document)) {
    $global_commands = $document->global_commands_information();
  }

  if (defined($global_commands) and exists($global_commands->{'copying'})) {
    return $self->convert_tree(
      Texinfo::TreeElement::new(
       {'contents' => $global_commands->{'copying'}->{'contents'}}),
                               'convert insertcopying');
  }
  return '';
}

$default_commands_conversion{'insertcopying'}
   = \&_convert_insertcopying_command;

sub _convert_maketitle_command($$$) {
  my ($self, $cmdname, $command) = @_;

  return $self->get_info('title_titlepage');
}

$default_commands_conversion{'maketitle'}
   = \&_convert_maketitle_command;

sub _convert_listoffloats_command($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  # should probably never happen
  return '' if (in_string($self));

  my $floats;
  my $document = $self->get_info('document');
  if (defined($document)) {
    $floats = $document->floats_information();
  }
  my $listoffloats_name = $command->{'extra'}->{'float_type'};
  my $formatted_listoffloats_nr
   = $self->get_shared_conversion_state('listoffloats',
                                        'formatted_listoffloats',
                                        $listoffloats_name);
  $formatted_listoffloats_nr = 0 if (!defined($formatted_listoffloats_nr));
  $formatted_listoffloats_nr++;
  $self->set_shared_conversion_state('listoffloats', 'formatted_listoffloats',
                            $listoffloats_name, $formatted_listoffloats_nr);

  if (defined($floats) and exists($floats->{$listoffloats_name})
      and scalar(@{$floats->{$listoffloats_name}})) {
    my $result = $self->html_attribute_class('dl', [$cmdname]).">\n" ;
    foreach my $float_and_section (@{$floats->{$listoffloats_name}}) {
      my ($float, $float_section) = @$float_and_section;
      my $float_href = $self->command_href($float);
      next if (!defined($float_href));
      $result .= '<dt>';
      my $float_text = $self->command_text($float);
      if (defined($float_text) and $float_text ne '') {
        if ($float_href ne '') {
          $result .= "<a href=\"$float_href\">$float_text</a>";
        } else {
          $result .= $float_text;
        }
      }
      $result .= '</dt>';
      my $caption_element;
      my $caption_cmdname;
      my ($caption, $shortcaption)
        = Texinfo::Common::find_float_caption_shortcaption($float);

      if (defined($shortcaption)) {
        $caption_element = $shortcaption;
        $caption_cmdname = 'shortcaption';
      } elsif (defined($caption)) {
        $caption_element = $caption;
        $caption_cmdname = 'caption';
      }

      my $caption_text;
      my @caption_classes;
      if (defined($caption_element)) {
        my $multiple_formatted = 'listoffloats';
        if ($formatted_listoffloats_nr > 1) {
          $multiple_formatted .= '-'.($formatted_listoffloats_nr - 1);
        }
        $caption_text = $self->convert_tree_new_formatting_context(
          $caption_element->{'contents'}->[0], $cmdname, $multiple_formatted);
        push @caption_classes, "${caption_cmdname}-in-${cmdname}";
      } else {
        $caption_text = '';
      }
      $result .= $self->html_attribute_class('dd', \@caption_classes).'>'
                                           .$caption_text.'</dd>'."\n";
    }
    return $result . "</dl>\n";
  } else {
    return '';
  }
}

$default_commands_conversion{'listoffloats'} = \&_convert_listoffloats_command;

sub _convert_menu_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  return $content if ($cmdname eq 'detailmenu');

  $self->set_shared_conversion_state('menu', 'html_menu_entry_index', 0);

  if ($content !~ /\S/) {
    return '';
  }
  # This can probably only happen with incorrect input.  It happens with
  # menu in documentdescription.  It does not seem that it could happen
  # in other situation with a Texinfo tree parsed from Texinfo code.
  if (in_string($self)) {
    return $content;
  }

  my $begin_row = '';
  my $end_row = '';
  if (inside_preformatted($self)) {
    $begin_row = '<tr><td>';
    $end_row = '</td></tr>';
  }
  return $self->html_attribute_class('table', [$cmdname])
    .">${begin_row}\n" . $content . "${end_row}</table>\n";
}

$default_commands_conversion{'menu'} = \&_convert_menu_command;
$default_commands_conversion{'detailmenu'} = \&_convert_menu_command;

sub _convert_float_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  my ($caption_element, $prepended)
     = Texinfo::Convert::Converter::float_name_caption($self, $command);

  if (in_string($self)) {
    my $prepended_text;
    if (defined($prepended)) {
      $prepended_text
        = $self->convert_tree_new_formatting_context($prepended,
                                                     'float prepended');
    } else {
      $prepended_text = '';
    }
    my $caption_text = '';
    if (defined($caption_element) and exists($caption_element->{'contents'})
        and exists($caption_element->{'contents'}->[0]->{'contents'})) {
      $caption_text = $self->convert_tree_new_formatting_context(
                         $caption_element->{'contents'}->[0], 'float caption');
    }
    return $prepended_text.$content.$caption_text;
  }

  my $caption_command_name;
  if (defined($caption_element)) {
    $caption_command_name = $caption_element->{'cmdname'};
  }

  my $result = $self->html_attribute_class('div', [$cmdname]);

  my $id = $self->command_id($command);
  if (defined($id) and $id ne '') {
    $result .= " id=\"$id\"";
  }

  $result .= ">\n" . $content;

  my $prepended_text;
  my $caption_text;
  if (defined($prepended)) {
    # TODO add a span with a class name for the prependend information
    # if not empty?
    $prepended_text = $self->convert_tree_new_formatting_context(
     Texinfo::TreeElement::new({'cmdname' => 'strong',
                                'contents' => [
                   Texinfo::TreeElement::new({'type' => 'brace_container',
                                              'contents' => [$prepended]})]}),
                               'float number type');
    if (defined($caption_element)) {
      # register the converted prepended tree to be prepended to
      # the first paragraph in caption formatting
      $self->register_pending_formatted_inline_content($caption_command_name,
                                                       $prepended_text);
      $caption_text = $self->convert_tree_new_formatting_context(
                   $caption_element->{'contents'}->[0], 'float caption');
      my $cancelled_prepended
        = $self->cancel_pending_formatted_inline_content($caption_command_name);
      # unset if prepended text is in caption, i.e. is not cancelled
      $prepended_text = '' if (not defined($cancelled_prepended));
    }
    if ($prepended_text ne '') {
      # prepended text is not empty and did not find its way in caption
      $prepended_text = '<p>'.$prepended_text.'</p>';
    }
  } elsif (defined($caption_element)) {
    $caption_text = $self->convert_tree_new_formatting_context(
                   $caption_element->{'contents'}->[0], 'float caption');
  }

  if (defined($caption_text) and $caption_text ne '') {
    $result .= $self->html_attribute_class('div', [$caption_command_name]). '>'
                       .$caption_text.'</div>';
  } elsif (defined($prepended) and $prepended_text ne '') {
    $result .= $self->html_attribute_class('div', ['type-number-float']). '>'
                       . $prepended_text .'</div>';
  }

  return $result . '</div>';
}

$default_commands_conversion{'float'} = \&_convert_float_command;

sub _convert_quotation_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  $self->cancel_pending_formatted_inline_content($cmdname);

  my $result;
  if (!in_string($self)) {
    my @classes;

    if (exists($small_block_associated_command{$cmdname})) {
      push @classes, $small_block_associated_command{$cmdname};
    }
    push @classes, $cmdname;

    $result = $self->html_attribute_class('blockquote', \@classes).">\n"
                           . $content . "</blockquote>\n";
  } else {
    $result = $content;
  }

  my $quotation_titlepage_nr = $self->get_shared_conversion_state('quotation',
                                                'quotation_titlepage_stack');
  my $quotation_authors = [];
  if (defined($quotation_titlepage_nr) and $quotation_titlepage_nr > 0) {
    my $authors_nr
     = $self->get_shared_conversion_state('quotation', 'element_authors_number',
                                          $quotation_titlepage_nr);

    if ($authors_nr < 0) {
      print STDERR "BUG: unexpected negative element_authors_number"
                ." $authors_nr in convert_quotation_command\n";
      $authors_nr = 0;
    }
    for (my $i = 0; $i < $authors_nr; $i++) {
      my $author = $self->get_shared_conversion_state('quotation',
                     'elements_authors', $quotation_titlepage_nr, $i);

      push @$quotation_authors, $author;
    }
    $quotation_titlepage_nr--;
    $self->set_shared_conversion_state('quotation',
                                       'quotation_titlepage_stack',
                                       $quotation_titlepage_nr);
  } else {
    print STDERR "BUG: unexpected unset quotation_titlepage_stack"
                  ."in convert_quotation_command\n";
  }

  # TODO there is no easy way to mark with a class the @author
  # @-command.  Add a span or a div (@center is in a div)?
  foreach my $author (@$quotation_authors) {
    if (exists($author->{'contents'}->[0]->{'contents'})) {
      # TRANSLATORS: quotation author
      my $centered_author = $self->cdt("\@center --- \@emph{{author}}",
         {'author' => $author->{'contents'}->[0]});
      $result .= $self->convert_tree($centered_author,
                                          'convert quotation author');
    }
  }

  return $result;
}

$default_commands_conversion{'quotation'} = \&_convert_quotation_command;

sub _convert_cartouche_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  return $content if (in_string($self));

  my $title_content = '';
  if (defined($args) and defined($args->[0])
      and $args->[0]->{'normal'} ne '') {
    $title_content = "<tr><th>\n". $args->[0]->{'normal'} ."</th></tr>";
  }
  my $cartouche_content = '';
  if ($content =~ /\S/) {
    $cartouche_content = "<tr><td>\n". $content ."</td></tr>";
  }
  if ($cartouche_content ne '' or $title_content ne '') {
    return $self->html_attribute_class('table', [$cmdname])
       . ">${title_content}${cartouche_content}"
       . "</table>\n";
  }
  return $content;
}

$default_commands_conversion{'cartouche'} = \&_convert_cartouche_command;

sub _convert_itemize_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  if (in_string($self)) {
    return $content;
  }

  # arguments_line type element
  my $arguments_line = $command->{'contents'}->[0];
  my $block_line_arg = $arguments_line->{'contents'}->[0];

  my $command_as_argument_name;
  my $prepended_element
    = Texinfo::Common::itemize_line_prepended_element($block_line_arg);
  if (defined($prepended_element)) {
    $command_as_argument_name = $prepended_element->{'cmdname'};
  }

  my $mark_class_name;
  if (defined($command_as_argument_name)) {
    if ($command_as_argument_name eq 'w') {
      $mark_class_name = 'none';
    } else {
      $mark_class_name = $command_as_argument_name;
    }
  }

  if (defined($mark_class_name)
      and defined($self->css_get_selector_style('ul.mark-'.$mark_class_name))) {
    return $self->html_attribute_class('ul', [$cmdname,
                                              'mark-'.$mark_class_name])
        .">\n" . $content. "</ul>\n";
  } elsif ($self->get_conf('NO_CSS')) {
    return $self->html_attribute_class('ul', [$cmdname])
         .">\n" . $content. "</ul>\n";
  } else {
    my $css_string
      = $self->html_convert_css_string_for_list_mark($block_line_arg,
                                                     'itemize arg');
    if ($css_string ne '') {
      return $self->html_attribute_class('ul', [$cmdname])
        ." style=\"list-style-type: '".
          &{$self->formatting_function('format_protect_text')}($self,
                                                               $css_string)
             . "'\">\n" . $content. "</ul>\n";
    } else {
      return $self->html_attribute_class('ul', [$cmdname])
        .">\n" . $content. "</ul>\n";
    }
  }
}

$default_commands_conversion{'itemize'} = \&_convert_itemize_command;

sub _convert_enumerate_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  if (!defined($content) or $content eq '') {
    return '';
  } elsif (in_string($self)) {
    return $content;
  }

  my $type_attribute = '';
  my $start_attribute = '';

  my ($start, $type);
  # arguments_line type element
  my $arguments_line = $command->{'contents'}->[0];
  my $block_line_arg = $arguments_line->{'contents'}->[0];
  if (exists($block_line_arg->{'contents'})
      and exists($block_line_arg->{'contents'}->[0]->{'text'})) {
    my $specification = $block_line_arg->{'contents'}->[0]->{'text'};

    if ($specification =~ /^\d+$/ and $specification ne '1') {
      $start = $specification;
    } elsif ($specification =~ /^[A-Z]$/) {
      $start = 1 + ord($specification) - ord('A');
      $type = 'A';
    } elsif ($specification =~ /^[a-z]$/) {
      $start = 1 + ord($specification) - ord('a');
      $type = 'a';
    }
    $type_attribute = " type=\"$type\"" if (defined($type));
    $start_attribute = " start=\"$start\"" if (defined($start));
  }

  return $self->html_attribute_class('ol', [$cmdname]).$type_attribute
       .$start_attribute.">\n" . $content . "</ol>\n";
}

$default_commands_conversion{'enumerate'} = \&_convert_enumerate_command;

sub _convert_multitable_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  if (!defined($content)) {
    return '';
  }

  if (in_string($self)) {
    return $content;
  }

  if ($content ne '') {
    return $self->html_attribute_class('table', [$cmdname]).">\n"
                                     . $content . "</table>\n";
  } else {
    return '';
  }
}

$default_commands_conversion{'multitable'} = \&_convert_multitable_command;

sub _convert_xtable_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  if (!defined($content)) {
    return '';
  }

  if (in_string($self)) {
    return $content;
  }

  if ($content ne '') {
    return $self->html_attribute_class('dl', [$cmdname]).">\n"
      . $content . "</dl>\n";
  } else {
    return '';
  }
}

$default_commands_conversion{'table'} = \&_convert_xtable_command;
$default_commands_conversion{'ftable'} = \&_convert_xtable_command;
$default_commands_conversion{'vtable'} = \&_convert_xtable_command;

sub _convert_item_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  if (in_string($self)) {
    return $content;
  }
  if (exists($command->{'parent'}->{'cmdname'})
      and $command->{'parent'}->{'cmdname'} eq 'itemize') {
    if ($content =~ /\S/) {
      return '<li>' . $content . '</li>';
    } else {
      return '';
    }
  } elsif (exists($command->{'parent'}->{'cmdname'})
      and $command->{'parent'}->{'cmdname'} eq 'enumerate') {
    if ($content =~ /\S/) {
      return '<li>' . ' ' . $content . '</li>';
    } else {
      return '';
    }
  } elsif (exists($command->{'contents'})
           and exists($command->{'contents'}->[0]->{'type'})
           and $command->{'contents'}->[0]->{'type'} eq 'line_arg') {
    if (exists($command->{'contents'}->[0]->{'contents'})) {

      my $result = ($cmdname eq 'item') ? '' : '<dt>';

      my $index_entry_id = $self->command_id($command);
      my $anchor;
      if (defined($index_entry_id)) {
        $result .= "<a id=\"$index_entry_id\"></a>";
        $anchor = _get_copiable_anchor($self, $index_entry_id);
        if (defined($anchor)) {
          $result .= '<span>';
        }
      }

      my $pre_class_close;
      if (in_preformatted_context($self)) {
        my $pre_classes = $self->preformatted_classes_stack();
        foreach my $pre_class (@$pre_classes) {
          if (exists($preformatted_code_commands{$pre_class})) {
            $result .= $self->html_attribute_class('code',
                                    ['table-term-preformatted-code']).'>';
            $pre_class_close = '</code>';
            last;
          }
        }
      }
      my $table_item_tree = $self->table_item_content_tree_noxs($command);
      $table_item_tree = $command->{'contents'}->[0]
        if (!defined($table_item_tree));
      my $converted_item = $self->convert_tree($table_item_tree,
                                          'convert table_item_tree');
      $result .= $converted_item;
      if (defined($pre_class_close)) {
        $result .= $pre_class_close;
      }
      if (defined($anchor)) {
        $result .= $anchor . '</span>';
      }
      return $result . "</dt>\n";
    } else {
      return '';
    }
  } elsif ($command->{'parent'}->{'type'}
           and $command->{'parent'}->{'type'} eq 'row') {
    return &{$self->command_conversion('tab')}($self, $cmdname, $command,
                                                           $args, $content);
  }
  return '';
}

$default_commands_conversion{'item'} = \&_convert_item_command;
$default_commands_conversion{'headitem'} = \&_convert_item_command;
$default_commands_conversion{'itemx'} = \&_convert_item_command;

sub _convert_tab_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  $content =~ s/^\s*//;
  $content =~ s/\s*$//;

  if (in_string($self)) {
    return $content;
  }

  my $cell_nr = $command->{'extra'}->{'cell_number'};
  my $row = $command->{'parent'};
  my $row_cmdname = $row->{'contents'}->[0]->{'cmdname'};
  my $multitable = $row->{'parent'}->{'parent'};
  my $columnfractions
    = Texinfo::Common::multitable_columnfractions($multitable);

  my $fractions = '';
  if (defined($columnfractions)) {
    if (exists($columnfractions->{'extra'}->{'misc_args'}->[$cell_nr-1])) {
      my $percent = sprintf('%.0f',
             100. * $columnfractions->{'extra'}->{'misc_args'}->[$cell_nr-1]);
      my $width = "$percent%";
      if ($self->get_conf('_INLINE_STYLE_WIDTH')) {
        $fractions = " style=\"width: $width\"";
      } else {
        $fractions = " width=\"$width\"";
      }
    }
  }

  if ($row_cmdname eq 'headitem') {
    return "<th${fractions}>" . $content . '</th>';
  } else {
    return "<td${fractions}>" . $content . '</td>';
  }
}

$default_commands_conversion{'tab'} = \&_convert_tab_command;

sub _convert_xref_commands($$$$) {
  my ($self, $cmdname, $command, $args) = @_;

  # may happen with bogus @-commands without argument, maybe only
  # at the end of a document
  if (!defined($args)) {
    return '';
  }

  my $tree;
  my $name;
  if ($cmdname ne 'link' and $cmdname ne 'inforef'
      and defined($args->[2])
      and defined($args->[2]->{'normal'}) and $args->[2]->{'normal'} ne '') {
    $name = $args->[2]->{'normal'};
  } elsif (defined($args->[1])
           and defined($args->[1]->{'normal'}) and $args->[1]->{'normal'} ne '') {
    $name = $args->[1]->{'normal'}
  }

  my $file_arg;

  if ($cmdname eq 'link' or $cmdname eq 'inforef') {
    if (defined($args->[2])) {
      $file_arg = $args->[2];
    }
  } elsif (defined($args->[3])) {
    $file_arg = $args->[3];
  }

  my $file;
  if (defined($file_arg)
      and defined($file_arg->{'filenametext'})
      and $file_arg->{'filenametext'} ne '') {
    $file = $file_arg->{'filenametext'};
  }

  my $book;
  $book = $args->[4]->{'normal'}
    if (defined($args->[4]) and exists($args->[4]->{'normal'})
        and $args->[4]->{'normal'} ne '');

  my $arg_node = $command->{'contents'}->[0];

  # internal reference
  if ($cmdname ne 'inforef' and !defined($book) and !defined($file)
      and defined($arg_node) and exists($arg_node->{'extra'})
      and exists($arg_node->{'extra'}->{'normalized'})
      and !exists($arg_node->{'extra'}->{'manual_content'})
      and $self->label_command($arg_node->{'extra'}->{'normalized'})) {
    my $target_node
     = $self->label_command($arg_node->{'extra'}->{'normalized'});
    # This is the node if USE_NODES, otherwise this may be the sectioning
    # command (if the sectioning command is really associated to the node)
    my $target_root = $self->command_root_element_command($target_node);
    my $document = $self->get_info('document');

    my $associated_section_relations;
    my $associated_title_command;
    if (defined($document) and $target_node->{'cmdname'} eq 'node') {
      my $nodes_list = $document->nodes_list();
      my $node_relations
        = $nodes_list->[$target_node->{'extra'}->{'node_number'} -1];

      $associated_section_relations = $node_relations->{'associated_section'};
      $associated_title_command
        = $node_relations->{'associated_title_command'};
    }
    if (!defined($associated_section_relations)
        or $associated_section_relations->{'element'} ne $target_root) {
      $target_root = $target_node;
    }

    my $href;
    if (!in_string($self)) {
      $href = $self->command_href($target_root, undef, $command);
    }

    if (!defined($name)) {
      if ($self->get_conf('xrefautomaticsectiontitle') eq 'on'
          and defined($associated_title_command)
         # this condition avoids infinite recursions, indeed in that case
         # the node will be used and not the section.  There should not be
         # @*ref in nodes, and even if there are, it does not seems to be
         # possible to construct an infinite recursion with nodes only
         # as the node must both be a reference target and refer to a specific
         # target at the same time, which is not possible.
         and not _command_is_in_referred_command_stack($self,
                                               $associated_title_command)) {
        if (in_string($self)) {
          $name = $self->command_text($associated_title_command, 'string');
        } else {
          $name = $self->command_text($associated_title_command,
                                      'text_nonumber');
        }
      } elsif ($target_node->{'cmdname'} eq 'float') {
        if (!$self->get_conf('XREF_USE_FLOAT_LABEL')) {
          if (in_string($self)) {
            # not tested
            $name = $self->command_text($target_root, 'string');
          } else {
            $name = $self->command_text($target_root);
          }
        }
        if (!defined($name) or $name eq '') {
          if (defined($args->[0]->{'monospace'})) {
            $name = $args->[0]->{'monospace'};
          } else {
            $name = '';
          }
        }
      } elsif (!$self->get_conf('XREF_USE_NODE_NAME_ARG')
               and (defined($self->get_conf('XREF_USE_NODE_NAME_ARG'))
                    or !in_preformatted_context($self))
         # this condition avoids infinite recursions, example with
         # USE_NODES=0 and node referring to the section and section referring
         # to the node
              and not _command_is_in_referred_command_stack($self,
                                                            $target_root)) {
        if ($self->get_conf('xrefautomaticsectiontitle') eq 'on') {
          if (in_string($self)) {
            $name = $self->command_name($target_root, 'string');
          } else {
            $name = $self->command_name($target_root, 'text_nonumber');
          }
        } elsif (in_string($self)) {
          $name = $self->command_text($target_root, 'string');
        } else {
          $name = $self->command_text($target_root, 'text_nonumber');
        }
        #die "$target_root $target_root->{'normalized'}" if (!defined($name));
      } elsif (defined($args->[0]->{'monospace'})) {
        $name = $args->[0]->{'monospace'};
      } else {
        $name = '';
      }
    }
    my $reference = $name;
    if (defined($href)) {
      $reference = $self->html_attribute_class('a', [$cmdname])
                      ." href=\"$href\">$name</a>";
    }
    my $substrings
      = { 'reference_name'
         => Texinfo::TreeElement::new({'type' => '_converted',
                                       'text' => $reference}) };

    if ($cmdname eq 'pxref') {
      $tree = $self->cdt('see {reference_name}', $substrings);
    } elsif ($cmdname eq 'xref') {
      $tree = $self->cdt('See {reference_name}', $substrings);
    } elsif ($cmdname eq 'ref' or $cmdname eq 'link') {
      $tree = $self->cdt('{reference_name}', $substrings);
    }
  } else {
    # external reference, including unknown node without file nor book

    # We setup a label_element based on the node argument and not directly the
    # node argument to be able to use the $file argument
    my $label_element;
    my $node_content;
    if (defined($arg_node) and exists($arg_node->{'extra'})
        and exists($arg_node->{'extra'}->{'node_content'})) {
      $node_content = $arg_node->{'extra'}->{'node_content'};
      $label_element = Texinfo::TreeElement::new(
          {'extra' => {'node_content' => $node_content}});
      if (exists($arg_node->{'extra'}->{'normalized'})) {
        $label_element->{'extra'}->{'normalized'}
          = $arg_node->{'extra'}->{'normalized'};
      }
    }
    # file argument takes precedence over the file in the node (file)node entry
    if (defined($file)) {
      if (!$label_element) {
        $label_element = Texinfo::TreeElement::new({'extra' => {}});
      } elsif (!exists($label_element->{'extra'})) {
        $label_element->{'extra'} = {};
      }
      $label_element->{'extra'}->{'manual_content'} = $file_arg->{'arg_tree'};
    } elsif (defined($arg_node) and exists($arg_node->{'extra'})
             and exists($arg_node->{'extra'}->{'manual_content'})) {
      my $manual_content = $arg_node->{'extra'}->{'manual_content'};
      if (!defined($label_element)) {
        $label_element = Texinfo::TreeElement::new({'extra' => {}});
      } elsif (!exists($label_element->{'extra'})) {
        $label_element->{'extra'} = {};
      }
      $label_element->{'extra'}->{'manual_content'} = $manual_content;
      my $file_with_node_tree
       = Texinfo::TreeElement::new({'type' => '_code',
                                    'contents' => [$manual_content]});
      $file = $self->convert_tree($file_with_node_tree, 'node file in ref');
    }

    if (!defined($name)) {
      if (defined($book)) {
        if (defined($node_content)) {
          my $node_no_file_tree
            = Texinfo::TreeElement::new({'type' => '_code',
                                         'contents' => [$node_content]});
          my $node_name = $self->convert_tree($node_no_file_tree, 'node in ref');
          if (defined($node_name) and $node_name ne 'Top') {
            $name = $node_name;
          }
        }
      } else {
        if (defined($label_element)) {
          $name = $self->command_text($label_element);
        }
        if (!defined($name)
            and defined($args->[0])
            and defined($args->[0]->{'monospace'})
            and $args->[0]->{'monospace'} ne ''
            and $args->[0]->{'monospace'} ne 'Top') {
          # unknown node (and no book nor file) or @inforef without file
          $name = $args->[0]->{'monospace'};
        }
      }
    }

    my $href;
    if (defined($label_element) and !in_string($self)) {
      $href = $self->command_href($label_element, undef, $command);
    }

    my $reference;
    my $book_reference;
    if (defined($href)) {
      # attribute to distiguish links to Texinfo manuals from other links
      # and to provide manual name of target
      my $manual_name_attribute = '';
      if (defined($file)
          and not $self->get_conf('NO_CUSTOM_HTML_ATTRIBUTE')) {
        $manual_name_attribute = "data-manual=\"".
         &{$self->formatting_function('format_protect_text')}($self, $file)."\" ";
      }
      if (defined($name)) {
        $reference = "<a ${manual_name_attribute}href=\"$href\">$name</a>";
      } elsif (defined($book)) {
        $book_reference = "<a ${manual_name_attribute}href=\"$href\">$book</a>";
      }
    }
    my $substrings;
    if (defined($book) and defined($reference)) {
      $substrings = {'reference' =>
     Texinfo::TreeElement::new({'type' => '_converted', 'text' => $reference}),
                     'book' =>
        Texinfo::TreeElement::new({'type' => '_converted', 'text' => $book })};
      if ($cmdname eq 'pxref') {
        $tree = $self->cdt('see {reference} in @cite{{book}}', $substrings);
      } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
        $tree = $self->cdt('See {reference} in @cite{{book}}', $substrings);
      } else { # @ref
        $tree = $self->cdt('{reference} in @cite{{book}}', $substrings);
      }
    } elsif (defined($book_reference)) {
      $substrings = { 'book_reference' =>
          Texinfo::TreeElement::new({'type' => '_converted',
                                     'text' => $book_reference })};
      if ($cmdname eq 'pxref') {
        $tree = $self->cdt('see @cite{{book_reference}}', $substrings);
      } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
        $tree = $self->cdt('See @cite{{book_reference}}', $substrings);
      } else { # @ref
        $tree = $self->cdt('@cite{{book_reference}}', $substrings);
      }
    } elsif (defined($book) and defined($name)) {
      $substrings = {
       'section' =>
         Texinfo::TreeElement::new({'type' => '_converted', 'text' => $name}),
        'book' =>
         Texinfo::TreeElement::new({'type' => '_converted', 'text' => $book })};
      if ($cmdname eq 'pxref') {
        $tree = $self->cdt('see `{section}\' in @cite{{book}}', $substrings);
      } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
        $tree = $self->cdt('See `{section}\' in @cite{{book}}', $substrings);
      } else { # @ref
        $tree = $self->cdt('`{section}\' in @cite{{book}}', $substrings);
      }
    } elsif (defined($book)) { # should seldom or even never happen
      $substrings = {'book' =>
        Texinfo::TreeElement::new({'type' => '_converted', 'text' => $book })};
      if ($cmdname eq 'pxref') {
        $tree = $self->cdt('see @cite{{book}}', $substrings);
      } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
        $tree = $self->cdt('See @cite{{book}}', $substrings);
      } else { # @ref
        $tree = $self->cdt('@cite{{book}}', $substrings);
      }
    } elsif (defined($reference)) {
      $substrings = { 'reference' =>
            Texinfo::TreeElement::new({'type' => '_converted',
                                       'text' => $reference}) };
      if ($cmdname eq 'pxref') {
        $tree = $self->cdt('see {reference}', $substrings);
      } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
        $tree = $self->cdt('See {reference}', $substrings);
      } else { # @ref
        $tree = $self->cdt('{reference}', $substrings);
      }
    } elsif (defined($name)) {
      $substrings = { 'section' =>
        Texinfo::TreeElement::new({'type' => '_converted', 'text' => $name}) };
      if ($cmdname eq 'pxref') {
        $tree = $self->cdt('see `{section}\'', $substrings);
      } elsif ($cmdname eq 'xref' or $cmdname eq 'inforef') {
        $tree = $self->cdt('See `{section}\'', $substrings);
      } else { # @ref
        $tree = $self->cdt('`{section}\'', $substrings);
      }
    }

    if (!defined($tree)) {
      # May happen if there is no argument
      #die "external: $cmdname, ($args), '$name' '$file' '$book' '$href' '$reference'. tree undef";
      return '';
    }
  }
  return $self->convert_tree($tree, "convert xref $cmdname");
}

foreach my $command(keys(%ref_commands)) {
  $default_commands_conversion{$command} = \&_convert_xref_commands;
}

sub _convert_printindex_command($$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  return '' if (in_string($self));

  my $index_name;
  if (exists($command->{'extra'})
      and exists($command->{'extra'}->{'misc_args'})
      and defined($command->{'extra'}->{'misc_args'}->[0])) {
    $index_name = $command->{'extra'}->{'misc_args'}->[0];
  } else {
    return '';
  }
  my $index_entries_by_letter
    = $self->get_converter_indices_sorted_by_letter();
  if (!defined($index_entries_by_letter)
      or !exists($index_entries_by_letter->{$index_name})
      or !scalar(@{$index_entries_by_letter->{$index_name}})) {
    return '';
  }

  my $document = $self->get_info('document');
  my $indices_information;
  my $identifiers_target;
  if (defined($document)) {
    $indices_information = $document->indices_information();
    $identifiers_target = $document->labels_information();
  }

  #foreach my $letter_entry (@{$index_entries_by_letter->{$index_name}}) {
  #  print STDERR "IDXLETTER $letter_entry->{'letter'}\n";
  #  foreach my $index_entry (@{$letter_entry->{'entries'}}) {
  #    print STDERR "   ".join('|', keys(%$index_entry))."||| $index_entry->{'key'}\n";
  #  }
  #}
  my $index_element_id;
  my $current_output_unit = $self->current_output_unit();
  if (defined($current_output_unit)
      and exists($current_output_unit->{'unit_command'})) {
    $index_element_id
     = $self->command_id($current_output_unit->{'unit_command'});
  }
  if (!defined($index_element_id)) {
    my ($output_unit, $root_command)
        = $self->get_element_root_command_element($command);
    if (defined($root_command)) {
      $index_element_id = $self->command_id($root_command);
    }
    if (not defined($index_element_id)) {
      # to avoid duplicate names, use a prefix that cannot happen in anchors
      my $target_prefix = 't_i';
      $index_element_id = $target_prefix;
    }
  }

  my %letter_id;
  my %letter_is_symbol;
  # First collect the links that are used in entries and in letter summaries
  my $symbol_idx = 0;
  my $normalized_letter_idx = 0;

  my $no_unidecode;
  $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                        and !$self->get_conf('USE_UNIDECODE'));
  my $in_test;
  $in_test = 1 if ($self->get_conf('TEST'));

  foreach my $letter_entry (@{$index_entries_by_letter->{$index_name}}) {
    my $letter = $letter_entry->{'letter'};
    my $is_symbol = $letter !~ /^\p{Alpha}/;
    $letter_is_symbol{$letter} = $is_symbol;
    my $identifier;
    if ($is_symbol) {
      $symbol_idx++;
      $identifier = $index_element_id . "_${index_name}_symbol-$symbol_idx";
    } else {
      my $normalized_letter =
  Texinfo::Convert::NodeNameNormalization::normalize_transliterate_texinfo(
              Texinfo::TreeElement::new({'text' => $letter}),
                                              $in_test, $no_unidecode);
      my $letter_identifier = $normalized_letter;
      if ($normalized_letter ne $letter) {
        # disambiguate, as it could be another letter, case of @l, for example
        $normalized_letter_idx++;
        $letter_identifier = "${normalized_letter}-${normalized_letter_idx}";
      }
      $identifier = $index_element_id
                       . "_${index_name}_letter-${letter_identifier}";
    }
    $letter_id{$letter} = $identifier;

  }

  # FIXME not part of the API
  _new_document_context($self, $cmdname);

  my $rule = $self->get_conf('DEFAULT_RULE');
  $rule = '' if (!defined($rule));

  my %formatted_letters;
  # Next do the entries to determine the letters that are not empty
  my @letter_entries;
  my $result_index_entries = '';
  foreach my $letter_entry (@{$index_entries_by_letter->{$index_name}}) {
    my $letter = $letter_entry->{'letter'};
    my $entries_text = '';
    my $entry_nr = -1;
    my $first_entry;
    # since we normalize, a different formatting will not trigger a new
    # formatting of the main entry or a subentry level.  This is the
    # same for Texinfo TeX
    my @prev_normalized_entry_levels;
    foreach my $index_entry_ref (@{$letter_entry->{'entries'}}) {
      $entry_nr++;
      my $main_entry_element = $index_entry_ref->{'entry_element'};
      next if ($self->get_conf('NO_TOP_NODE_OUTPUT')
               and exists($main_entry_element->{'extra'}->{'element_node'})
               and $main_entry_element->{'extra'}->{'element_node'} eq 'Top');

      # to avoid double error messages, call
      # convert_tree_new_formatting_context below with a multiple_pass
      # argument if an entry was already formatted once, for example if
      # there are multiple printindex.
      my $formatted_index_entry_nr
       = $self->get_shared_conversion_state('printindex',
                                          'formatted_index_entries',
                                           $index_entry_ref);
      $formatted_index_entry_nr = 0 if (!defined($formatted_index_entry_nr));
      $formatted_index_entry_nr++;
      $self->set_shared_conversion_state('printindex',
                                          'formatted_index_entries',
                                $index_entry_ref, $formatted_index_entry_nr);

      my $entry_content_element
          = Texinfo::Common::index_content_element($main_entry_element);

      my $in_code = 0;
      $in_code = 1
       if ($indices_information->{$index_entry_ref->{'index_name'}}->{'in_code'});
      my $entry_ref_tree
        = Texinfo::TreeElement::new({'contents' => [$entry_content_element]});
      $entry_ref_tree->{'type'} = '_code' if ($in_code);


      # determine the trees and normalized main entry and subentries, to be
      # compared with the previous line normalized entries to determine
      # what is already formatted as part of the previous lines and
      # what levels should be added.  The last level is always formatted.
      my @new_normalized_entry_levels;
      my @entry_trees;
      # NOTE it seems that subentry is not followed in convert_to_normalized
      $new_normalized_entry_levels[0]
        = uc(Texinfo::Convert::NodeNameNormalization::convert_to_normalized(
             $entry_ref_tree));
      $entry_trees[0] = $entry_ref_tree;
      my $subentry_level = 1;
      my $subentries_max_level = 2;
      my @subentries_list;
      Texinfo::Common::collect_subentries($main_entry_element,
                                          \@subentries_list);
      if (scalar(@subentries_list)) {
        foreach my $subentry (@subentries_list) {
          my $subentry_tree;
          my $line_arg = $subentry->{'contents'}->[0];
          if (exists($line_arg->{'contents'})
              and scalar(@{$line_arg->{'contents'}})) {
            my @contents;
            foreach my $content (@{$line_arg->{'contents'}}) {
              push @contents, $content unless (exists($content->{'cmdname'})
                                  and $content->{'cmdname'} eq 'subentry');
            }
            $subentry_tree
              = Texinfo::TreeElement::new({'contents' => \@contents});
            $subentry_tree->{'type'} = '_code' if ($in_code);
          }
          if ($subentry_level >= $subentries_max_level) {
            # at the max, concatenate the remaining subentries
            my $other_subentries_tree
              = $self->comma_index_subentries_tree($subentry);
            if (defined($other_subentries_tree)) {
              if (defined($subentry_tree)) {
                push @{$subentry_tree->{'contents'}},
                  @{$other_subentries_tree->{'contents'}};
              } else {
                $subentry_tree = Texinfo::TreeElement::new(
                  {'contents' => [@{$other_subentries_tree->{'contents'}}]});
                $subentry_tree->{'type'} = '_code' if ($in_code);
              }
            }
          } elsif (defined($subentry_tree)) {
            push @new_normalized_entry_levels,
              uc(Texinfo::Convert::NodeNameNormalization::convert_to_normalized(
                $subentry_tree));
          }
          push @entry_trees, $subentry_tree;
          $subentry_level++;
          last if ($subentry_level > $subentries_max_level);
        }
      }
      #print STDERR join('|', @new_normalized_entry_levels)."\n";
      # level/index of the last entry
      my $last_entry_level = $subentry_level -1;
      my $with_new_formatted_entry = 0;
      # format the leading entries when there are subentries (all entries
      # except the last one), and when there is not such a subentry already
      # formatted on the previous lines.
      # Each on a line with increasing indentation, no hyperlink.
      for (my $level = 0; $level < $last_entry_level; $level++) {
        # skip levels already formatted as part of the previous lines
        if (!$with_new_formatted_entry
            and scalar(@prev_normalized_entry_levels) > $level
            and $prev_normalized_entry_levels[$level]
                 eq $new_normalized_entry_levels[$level]) {
          next;
        }
        $with_new_formatted_entry = 1;
        my $convert_info
         = "index $index_name l $letter index entry $entry_nr subentry $level";
        my $entry;
        if ($formatted_index_entry_nr > 1) {
          # call with multiple_pass argument
          $entry
           = $self->convert_tree_new_formatting_context($entry_trees[$level],
                                                        $convert_info,
                                  "index-formatted-$formatted_index_entry_nr");
        } else {
          $entry = $self->convert_tree($entry_trees[$level],
                                       $convert_info);
        }
        $entry = '<code>' .$entry .'</code>' if ($in_code);
        my @td_entry_classes = ();
        if ($level == 0) {
          push @td_entry_classes, "$cmdname-index-entry";
        } elsif ($level > 0) {
          # indent
          push @td_entry_classes, "$cmdname-index-subentry-level-$level";
        }
        $entries_text .= '<tr>'
         # TODO same class used for leading entry rows here and
         # last element of the entry with the href below.  Could be different.
         .$self->html_attribute_class('td', \@td_entry_classes).'>'
         . $entry . '</td>'
         # empty cell, no section for this line
          . "<td></td></tr>\n";
      }
      # last entry, always converted, associated to chapter/node and
      # with an hyperlink or to seeentry/seealso
      my $entry_tree = $entry_trees[$last_entry_level];

      my $referred_entry;
      my $seeentry
        = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                      'seeentry');
      if (defined($seeentry)) {
        $referred_entry = $seeentry;
      } else {
        $referred_entry
          = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                        'seealso');
      }

      # index entry with @seeentry or @seealso
      if (defined($referred_entry)) {
        my $referred_tree = Texinfo::TreeElement::new({});
        $referred_tree->{'type'} = '_code' if ($in_code);
        if (exists($referred_entry->{'contents'})) {
          $referred_tree->{'contents'} = [$referred_entry];
        }
        my $entry;
        # for @seealso, to appear where chapter/node ususally appear
        my $reference = '';
        my $delimiter = '';
        my $section_class;
        if (defined($seeentry)) {
          my $result_tree;
          if ($in_code) {
            $result_tree
          # TRANSLATORS: redirect to another index entry
          # TRANSLATORS: @: is discardable and is used to avoid a msgfmt error
        = $self->cdt('@code{{main_index_entry}}, @emph{See@:} @code{{seeentry}}',
                                        {'main_index_entry' => $entry_tree,
                                         'seeentry' => $referred_tree});
          } else {
            $result_tree
          # TRANSLATORS: redirect to another index entry
          # TRANSLATORS: @: is discardable and used to avoid a msgfmt error
               = $self->cdt('{main_index_entry}, @emph{See@:} {seeentry}',
                                        {'main_index_entry' => $entry_tree,
                                         'seeentry' => $referred_tree});
          }
          my $convert_info
              = "index $index_name l $letter index entry $entry_nr seeentry";
          if ($formatted_index_entry_nr > 1) {
            # call with multiple_pass argument
            $entry = $self->convert_tree_new_formatting_context($result_tree,
                                                                $convert_info,
                                  "index-formatted-$formatted_index_entry_nr");
          } else {
            $entry = $self->convert_tree($result_tree, $convert_info);
          }
          $section_class = "$cmdname-index-see-entry-section";
        } else {
          # TRANSLATORS: refer to another index entry
          my $reference_tree = $self->cdt('@emph{See also} {see_also_entry}',
                                       {'see_also_entry' => $referred_tree});
          my $conv_str_entry
        = "index $index_name l $letter index entry $entry_nr (with seealso)";
          my $conv_str_reference
            = "index $index_name l $letter index entry $entry_nr seealso";
          if ($formatted_index_entry_nr > 1) {
            # call with multiple_pass argument
            $entry = $self->convert_tree_new_formatting_context($entry_tree,
                                                                $conv_str_entry,
                                   "index-formatted-$formatted_index_entry_nr");
            $reference
               = $self->convert_tree_new_formatting_context($reference_tree,
                                                        $conv_str_reference,
                                "index-formatted-$formatted_index_entry_nr");
          } else {
            $entry = $self->convert_tree($entry_tree,
                                         $conv_str_entry);
            $reference = $self->convert_tree($reference_tree,
                                             $conv_str_reference);
          }
          $entry = '<code>' .$entry .'</code>' if ($in_code);
          $delimiter = $self->get_conf('INDEX_ENTRY_COLON');
          $section_class = "$cmdname-index-see-also";
        }

        my @td_entry_classes = ();
        if (defined($seeentry)) {
          push @td_entry_classes, "$cmdname-index-see-entry";
        }
        if ($last_entry_level == 0) {
          push @td_entry_classes, "$cmdname-index-entry";
        } elsif ($last_entry_level > 0) {
          push @td_entry_classes,
               "$cmdname-index-subentry-level-$last_entry_level";
        }
        $entries_text .= '<tr>'
         .$self->html_attribute_class('td', \@td_entry_classes).'>'
         . $entry .
          $delimiter . '</td>'
        .$self->html_attribute_class('td', [$section_class]).'>';
        $entries_text .= $reference;
        $entries_text .= "</td></tr>\n";

        @prev_normalized_entry_levels = @new_normalized_entry_levels;
      } else {
        my $entry;
        if (!defined($entry_tree)) {
          # can happen at least with an empty subentry
          $entry = '';
        } else {
          my $convert_info
            = "index $index_name l $letter index entry $entry_nr";
          if ($formatted_index_entry_nr > 1) {
            # call with multiple_pass argument
            $entry = $self->convert_tree_new_formatting_context($entry_tree,
                                                            $convert_info,
                               "index-formatted-$formatted_index_entry_nr");
          } else {
            $entry = $self->convert_tree($entry_tree, $convert_info);
          }
        }

        next if ($entry !~ /\S/ and $last_entry_level == 0);

        if (!defined($first_entry)) {
          $first_entry = $index_entry_ref;
        }

        @prev_normalized_entry_levels = @new_normalized_entry_levels;

        $entry = '<code>' .$entry .'</code>' if ($in_code);
        my $target_element;
        if (exists($index_entry_ref->{'entry_associated_element'})) {
          $target_element = $index_entry_ref->{'entry_associated_element'};
        } else {
          $target_element = $main_entry_element;
        }
        my $entry_href = $self->command_href($target_element);
        my $formatted_entry = "<a href=\"$entry_href\">$entry</a>";
        my @td_entry_classes = ();
        if ($last_entry_level == 0) {
          push @td_entry_classes, "$cmdname-index-entry";
        } elsif ($last_entry_level > 0) {
          # subentry
          push @td_entry_classes, "$cmdname-index-subentry-level-$last_entry_level";
        }
        $entries_text .= '<tr>'
          .$self->html_attribute_class('td', \@td_entry_classes).'>'
           . $formatted_entry . $self->get_conf('INDEX_ENTRY_COLON') . '</td>';

        my $associated_command;
        if ($self->get_conf('NODE_NAME_IN_INDEX')) {
          my $associated_command_id
            = $main_entry_element->{'extra'}->{'element_node'};
          if (defined($associated_command_id)
              and defined($identifiers_target)) {
            $associated_command = $identifiers_target->{$associated_command_id};
          }
          if (!defined($associated_command)) {
            $associated_command
              = $self->command_node($target_element);
          }
          if (!defined($associated_command)
              # do not warn if the entry is in a special region, like titlepage
              and not $main_entry_element->{'extra'}->{'element_region'}
              and $formatted_index_entry_nr == 1) {
         # NOTE $self->in_multiple_conversions() is not checked as printindex
         # should not happen in multiple tree conversion, but the error message
         # is printed for the first entry formatting only.
            $self->converter_line_warn(
                             sprintf(
           __("entry for index `%s' for \@printindex %s outside of any node"),
                                     $index_entry_ref->{'index_name'},
                                     $index_name),
                             $main_entry_element->{'source_info'});
          }
        }
        if (!defined($associated_command)) {
          $associated_command
            = $self->command_root_element_command($target_element);
          if (!defined($associated_command)) {
            # Use Top if not associated command found
            $associated_command
              = $self->global_direction_unit('Top')->{'unit_command'};
            # NOTE the warning here catches the most relevant cases of
            # index entry that is not associated to the right command, which
            # are very few in the test suite.  There is also a warning in the
            # parser with a much broader scope with possible overlap, but the
            # overlap is not a problem.
            # NODE_NAME_IN_INDEX may be undef even with USE_NODES set if the
            # converter is called as convert() as in the test suite
            if (defined($self->get_conf('NODE_NAME_IN_INDEX'))
                and not $self->get_conf('NODE_NAME_IN_INDEX')
              # do not warn if the entry is in a special region, like titlepage
                and not $main_entry_element->{'extra'}->{'element_region'}
                and $formatted_index_entry_nr == 1) {
          # NOTE $self->in_multiple_conversions() is not checked as printindex
          # should not happen in multiple tree conversion, but the error message
          # is printed for the first entry formatting only.
          # NOTE the index entry may be associated to a node in that case.
              $self->converter_line_warn(
                               sprintf(
        __("entry for index `%s' for \@printindex %s outside of any section"),
                                       $index_entry_ref->{'index_name'},
                                       $index_name),
                               $main_entry_element->{'source_info'});
            }
          }
        }

        $entries_text .=
          $self->html_attribute_class('td', ["$cmdname-index-section"]).'>';

        if (defined($associated_command)) {
          my $associated_command_href
            = $self->command_href($associated_command);
          my $associated_command_text
            = $self->command_text($associated_command);

          if (defined($associated_command_href)) {
            $entries_text
              .= "<a href=\"$associated_command_href\">"
                  ."$associated_command_text</a>";
          } elsif (defined($associated_command_text)) {
            $entries_text .= $associated_command_text;
          }
        }
        $entries_text .= "</td></tr>\n";
      }
    }
    # a letter and associated indice entries
    if ($entries_text ne '') {
      my $formatted_letter;
      my $letter_command;

      # may not be defined if there are only seeentry/seealso
      if (defined($first_entry)) {
        my $letter_text;
        ($letter_text, $letter_command)
          = Texinfo::Indices::index_entry_first_letter_text_or_command(
                                                             $first_entry);
      }

      if (defined($letter_command)
          and !exists($accent_commands{$letter_command->{'cmdname'}})
          and $letter_command->{'cmdname'} ne 'U'
          # special case, the uppercasing of that command is not done
          # if as a command, while it is done correctly in $letter
          and $letter_command->{'cmdname'} ne 'ss') {
        my $cmdname = $letter_command->{'cmdname'};
        if (exists($letter_no_arg_commands{$cmdname})
            and exists($letter_no_arg_commands{uc($cmdname)})) {
          $letter_command
            = Texinfo::TreeElement::new({'cmdname' => uc($cmdname)});
        }
        $formatted_letter = $self->convert_tree($letter_command,
                                                "index letter $letter command");
      } else {
        $formatted_letter
         = &{$self->formatting_function('format_protect_text')}($self, $letter);
      }
      $formatted_letters{$letter} = $formatted_letter;

      $result_index_entries .= '<tr>' .
        $self->html_attribute_class('th', ["index-letter-header-$cmdname",
                                     "$index_name-letter-header-$cmdname"])
           ." colspan=\"2\" id=\"$letter_id{$letter}\">".$formatted_letter
        . "</th></tr>\n" . $entries_text
        . "<tr><td colspan=\"2\">${rule}</td></tr>\n";
      push @letter_entries, $letter_entry;
    }
  }

  # Do the summary letters linking to the letters done above
  my @non_alpha = ();
  my @alpha = ();
  foreach my $letter_entry (@letter_entries) {
    my $letter = $letter_entry->{'letter'};
    my $summary_letter_link
      = $self->html_attribute_class('a',["summary-letter-$cmdname"])
       ." href=\"#$letter_id{$letter}\"><b>".$formatted_letters{$letter}
           .'</b></a>';
    if ($letter_is_symbol{$letter}) {
      push @non_alpha, $summary_letter_link;
    } else {
      push @alpha, $summary_letter_link;
    }
  }

  if (scalar(@non_alpha) + scalar(@alpha) == 0) {
    _pop_document_context($self);
    return '';
  }

  my $non_breaking_space = $self->get_info('non_breaking_space');

  # Format the summary letters
  my $join = '';
  my $non_alpha_text = '';
  my $alpha_text = '';
  if (scalar(@non_alpha) + scalar(@alpha) > 1) {
    $join = " $non_breaking_space \n".$self->get_info('line_break_element')."\n"
      if (scalar(@non_alpha) and scalar(@alpha));
    if (scalar(@non_alpha)) {
      $non_alpha_text = join("\n $non_breaking_space \n", @non_alpha) . "\n";
    }
    if (scalar(@alpha)) {
      $alpha_text = join("\n $non_breaking_space \n", @alpha)
                    . "\n $non_breaking_space \n";
    }
  }
  my $result = $self->html_attribute_class('div',
                           [$cmdname, "$index_name-$cmdname"]).">\n";
  # format the summary
  if (scalar(@non_alpha) + scalar(@alpha) > 1) {
    my $summary_header = $self->html_attribute_class('table',
            ["index-letters-header-$cmdname",
             "$index_name-letters-header-$cmdname"]).'><tr><th>'
        # TRANSLATORS: before list of letters and symbols grouping index entries
      . $self->convert_tree($self->cdt('Jump to'), 'Tr letters header text')
      . ": $non_breaking_space </th><td>" .
      $non_alpha_text . $join . $alpha_text . "</td></tr></table>\n";

    $result .= $summary_header;
  }

  # now format the index entries
  $result
   .= $self->html_attribute_class('table', ["index-entries-$cmdname",
                                    "$index_name-entries-$cmdname"]).">\n";
  $result .= "<tr><td colspan=\"2\">${rule}</td></tr>\n";
  $result .= $result_index_entries;
  $result .= "</table>\n";

  _pop_document_context($self);

  if (scalar(@non_alpha) + scalar(@alpha) > 1) {
    my $summary_footer = $self->html_attribute_class('table',
                 ["index-letters-footer-$cmdname",
                  "$index_name-letters-footer-$cmdname"]).'><tr><th>'
        # TRANSLATORS: before list of letters and symbols grouping index entries
      . $self->convert_tree($self->cdt('Jump to'), 'Tr letters footer text')
      . ": $non_breaking_space </th><td>"
      . $non_alpha_text . $join . $alpha_text . "</td></tr></table>\n";
    $result .= $summary_footer
  }
  return $result . "</div>\n";
}

$default_commands_conversion{'printindex'} = \&_convert_printindex_command;

sub _convert_informative_command($$$) {
  my ($self, $cmdname, $command) = @_;

  return '' if (in_string($self));

  Texinfo::Common::set_informative_command_value($self, $command);

  return '';
}

foreach my $informative_command (@informative_global_commands) {
  $default_commands_conversion{$informative_command}
    = \&_convert_informative_command;
}

sub _convert_contents_command($$$) {
  my ($self, $cmdname, $command) = @_;

  return '' if (in_string($self));
  $cmdname = 'shortcontents' if ($cmdname eq 'summarycontents');

  Texinfo::Common::set_informative_command_value($self, $command);

  my $document = $self->get_info('document');
  my $sections_list;
  if (defined($document)) {
    $sections_list = $document->sections_list();
  }

  if ($self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'inline'
      and ($cmdname eq 'contents' or $cmdname eq 'shortcontents')
      and $self->get_conf($cmdname)
      and defined($sections_list)
      and scalar(@{$sections_list}) > 1) {
    return _contents_inline_element($self, $cmdname, $command);
  }
  return '';
}

foreach my $contents_command (@contents_commands) {
  $default_commands_conversion{$contents_command} = \&_convert_contents_command;
}

sub _convert_def_command($$$$$) {
  my ($self, $cmdname, $command, $args, $content) = @_;

  $content = '' if (!defined($content));

  return $content if (in_string($self));

  my @classes;
  if ($cmdname ne 'defblock') {
    # The def* class is used for the def line, the first-def* class is
    # used for the whole block.
    my $command_name;
    if (exists($Texinfo::Common::def_aliases{$cmdname})) {
      $command_name = $Texinfo::Common::def_aliases{$cmdname};
      push @classes, "first-$cmdname-alias-first-$command_name";
    } else {
      $command_name = $cmdname;
    }
    unshift @classes, "first-$command_name";
  } else {
    push @classes, $cmdname;
  }

  push @classes, 'def-block';

  if (!$self->get_conf('DEF_TABLE')) {
    return $self->html_attribute_class('dl', \@classes).">\n"
                                        . $content ."</dl>\n";
  } else {
    return $self->html_attribute_class('table', \@classes).">\n"
                                       . $content . "</table>\n";
  }
}

# Keys are tree element types, values are function references to convert
# elements of that type.  Can be overridden accessing
# Texinfo::Config::GNUT_get_types_conversion, setup by
# Texinfo::Config::texinfo_register_type_formatting()
my %default_types_conversion;

foreach my $command (keys(%def_commands), 'defblock') {
  if (exists($line_commands{$command})) {
    $default_commands_conversion{$command} = \&_convert_def_line_type;
  } else {
    $default_commands_conversion{$command} = \&_convert_def_command;
  }
}


# associate same formatting function for @small* command
# as for the associated @-command
foreach my $small_command (keys(%small_block_associated_command)) {
  $default_commands_conversion{$small_command}
    = $default_commands_conversion{$small_block_associated_command{$small_command}};
}

# Can be used to check that all the relevant commands are converted
if (0) {
  foreach my $cmdname (keys(%Texinfo::Common::all_commands)) {
    if (!exists($default_commands_conversion{$cmdname})) {
      # should be @if* @*index and item_LINE
      if ($cmdname =~ /^if/ or $cmdname =~ /index$/ or $cmdname eq 'item_LINE') {}
      else
      {
        warn "MISSING $cmdname\n";
      }
    }
  }
}

sub _open_node_part_command($$$) {
  my ($self, $cmdname, $element) = @_;

  if ($self->get_conf('NO_TOP_NODE_OUTPUT')) {
    my $in_skipped_node_top
      = $self->get_shared_conversion_state('top', 'in_skipped_node_top');
    $in_skipped_node_top = 0 if (!defined($in_skipped_node_top));
    my $node_element;
    if ($cmdname eq 'node') {
      $node_element = $element;
    } elsif ($cmdname eq 'part') {
      my $document = $self->get_info('document');
      if (defined($document)) {
        my $sections_list = $document->sections_list();
        my $part_relations
          = $sections_list->[$element->{'extra'}->{'section_number'} -1];
        if (exists($part_relations->{'part_following_node'})) {
          $node_element = $part_relations->{'part_following_node'}->{'element'};
        }
      }
    }
    if (defined($node_element) or $cmdname eq 'part') {
      if (defined($node_element) and exists($node_element->{'extra'})
          and exists($node_element->{'extra'}->{'normalized'})
          and $node_element->{'extra'}->{'normalized'} eq 'Top') {
        $in_skipped_node_top = 1;
        $self->set_shared_conversion_state('top', 'in_skipped_node_top',
                                           $in_skipped_node_top);
      } elsif ($in_skipped_node_top == 1) {
        $in_skipped_node_top = -1;
        $self->set_shared_conversion_state('top', 'in_skipped_node_top',
                                           $in_skipped_node_top);
      }
    }
  }
  return '';
}

$default_commands_open{'node'} = \&_open_node_part_command;
$default_commands_open{'part'} = \&_open_node_part_command;

sub _open_quotation_titlepage_stack($$) {
  my ($self, $element_authors_number) = @_;

  my $quotation_titlepage_nr = $self->get_shared_conversion_state('quotation',
                                           'quotation_titlepage_stack');
  $quotation_titlepage_nr = 0 if (!defined($quotation_titlepage_nr));

  $quotation_titlepage_nr++;

  $self->set_shared_conversion_state('quotation', 'quotation_titlepage_stack',
                                     $quotation_titlepage_nr);


  $self->set_shared_conversion_state('quotation', 'element_authors_number',
                           $quotation_titlepage_nr, $element_authors_number);
}

sub _open_quotation_command($$$) {
  my ($self, $cmdname, $command) = @_;

  my $formatted_quotation_arg_to_prepend;
  # arguments_line type element
  my $arguments_line = $command->{'contents'}->[0];
  my $block_line_args = $arguments_line->{'contents'}->[0];
  if (exists($block_line_args->{'contents'})
      and scalar(@{$block_line_args->{'contents'}})) {
    $formatted_quotation_arg_to_prepend
     = $self->convert_tree($self->cdt('@b{{quotation_arg}:} ',
                        {'quotation_arg' => $block_line_args}),
                           "open $cmdname prepended arg");
  }
  $self->register_pending_formatted_inline_content($cmdname,
                                 $formatted_quotation_arg_to_prepend);
  _open_quotation_titlepage_stack($self, 0);

  return '';
}

$default_commands_open{'quotation'} = \&_open_quotation_command;

# associate same opening function for @small* command
# as for the associated @-command
foreach my $small_command (keys(%small_block_associated_command)) {
  if (exists($default_commands_open{$small_block_associated_command{$small_command}})) {
    $default_commands_open{$small_command}
      = $default_commands_open{$small_block_associated_command{$small_command}};
  }
}

# Keys are output units types, values are function references to convert
# output units of that type.  Can be overridden accessing
# Texinfo::Config::GNUT_get_output_units_conversion, setup by
# Texinfo::Config::texinfo_register_output_unit_formatting()
my %default_output_units_conversion;

sub default_output_unit_conversion($$) {
  my ($self, $type) = @_;

  return $default_output_units_conversion{$type};
}

sub output_unit_conversion($$) {
  my ($self, $type) = @_;

  return $self->{'output_units_conversion'}->{$type};
}

sub default_type_conversion($$) {
  my ($self, $type) = @_;

  return $default_types_conversion{$type};
}

sub type_conversion($$) {
  my ($self, $type) = @_;

  return $self->{'types_conversion'}->{$type};
}

my %default_types_open;

sub default_type_open($$) {
  my ($self, $type) = @_;

  return $default_types_open{$type};
}

# Ignored commands
foreach my $type (
            'ignorable_spaces_after_command',
            'ignorable_spaces_before_command',
            'spaces_at_end',
            'spaces_before_paragraph',
            # may be better not to ignore spaces when a : is postpended
            # and the user really wants a space
            #'space_at_end_menu_node',
            'spaces_after_close_brace') {
  $default_types_conversion{$type} = undef;
}

foreach my $type (
            'postamble_after_end',
            'preamble_before_beginning',
            'preamble_before_setfilename',
            'arguments_line') {
  $default_types_conversion{$type} = undef;
}

sub _convert_paragraph_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  $content = $self->get_associated_formatted_inline_content($element).$content;

  if (paragraph_number($self) == 1) {
    my $in_format = top_block_command($self);
    if ($in_format) {
      # no first paragraph in those environment to avoid extra spacing
      if ($in_format eq 'itemize'
          or $in_format eq 'enumerate'
          or $in_format eq 'multitable'
          # this should only happen if in @nodedescriptionblock, otherwise
          # there are no paragraphs, but preformatted
          or $in_format eq 'menu') {
        return $content;
      }
    }
  }
  return $content if (in_string($self));

  if ($content =~ /\S/) {
    my $align = $self->in_align();
    if ($align and exists($HTML_align_commands{$align})) {
      return $self->html_attribute_class('p', [$align.'-paragraph']).">"
                             .$content."</p>";
    } else {
      return "<p>".$content."</p>";
    }
  } else {
    return '';
  }
}

$default_types_conversion{'paragraph'} = \&_convert_paragraph_type;


sub _open_inline_container_type($$$) {
  my ($self, $type, $element) = @_;

  my $pending_formatted = $self->get_pending_formatted_inline_content();

  if (defined($pending_formatted)) {
    $self->associate_pending_formatted_inline_content($element, $pending_formatted);
  }
  return '';
}

$default_types_open{'paragraph'} = \&_open_inline_container_type;
$default_types_open{'preformatted'} = \&_open_inline_container_type;


sub _preformatted_class($) {
  my $self = shift;

  my $pre_class;
  my $pre_classes = $self->preformatted_classes_stack();
  foreach my $class (@$pre_classes) {
    $pre_class = $class unless (defined($pre_class)
                           and exists($preformatted_code_commands{$pre_class})
                           and !(exists($preformatted_code_commands{$class})
                                 or $class eq 'menu'));
  }
  return $pre_class.'-preformatted';
}

sub _convert_preformatted_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  $content = $self->get_associated_formatted_inline_content($element).$content;

  return '' if ($content eq '');

  if (top_block_command($self) eq 'multitable') {
    $content =~ s/^\s*//;
    $content =~ s/\s*$//;
  }

  if (in_string($self)) {
    return $content;
  }

  my $pre_class;
  # menu_entry_description is always in a preformatted container
  # in the tree, as the whole menu is meant to be an
  # environment where spaces and newlines are preserved.
  if (exists($element->{'parent'}->{'type'})
      and $element->{'parent'}->{'type'} eq 'menu_entry_description') {
    if (!inside_preformatted($self)) {
      # If not in preformatted block command,
      # we don't preserve spaces and newlines in menu_entry_description,
      # instead the whole menu_entry is in a table, so no <pre> in that situation
      return $content;
    } else {
      # if directly in description, we want to avoid the linebreak that
      # comes with pre being a block level element, so set a special class
      $pre_class = 'menu-entry-description-preformatted';
    }
  }

  $content =~ s/^\n/\n\n/; # a newline immediately after a <pre> is ignored.

  $pre_class = _preformatted_class($self) if (!defined($pre_class));
  my $result = $self->html_attribute_class('pre', [$pre_class]).'>'
                                                   . $content . '</pre>';

  return $result;
}

$default_types_conversion{'preformatted'} = \&_convert_preformatted_type;

sub _convert_balanced_braces_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  return $content;
}

$default_types_conversion{'balanced_braces'} = \&_convert_balanced_braces_type;

# use the type and not the index commands names, as they are diverse and
# can be dynamically added, so it is difficult to use as selector for output
# formatting.  The command name can be obtained here as $element->{'cmdname'}.
sub _convert_index_entry_command_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  my $index_id = $self->command_id($element);
  if (defined($index_id) and $index_id ne ''
      and !in_multi_expanded($self)
      and !in_string($self)) {
    my $result = &{$self->formatting_function('format_separate_anchor')}($self,
                                                   $index_id, 'index-entry-id');
    $result .= "\n" unless (in_preformatted_context($self));
    return $result;
  }
  return '';
}
$default_types_conversion{'index_entry_command'} = \&_convert_index_entry_command_type;

sub _convert_definfoenclose_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  # TODO add a span to mark the original command as a class?
  # Not to be done as long as definfoenclose is deprecated.
  return &{$self->formatting_function('format_protect_text')}($self,
                                      $element->{'extra'}->{'begin'})
     . $content .
    &{$self->formatting_function('format_protect_text')}($self,
                                      $element->{'extra'}->{'end'});
}

$default_types_conversion{'definfoenclose_command'}
  = \&_convert_definfoenclose_type;

# Note: has an XS override
sub _entity_text {
  my $text = shift;

  $text =~ s/---/\&mdash\;/g;
  $text =~ s/--/\&ndash\;/g;
  $text =~ s/``/\&ldquo\;/g;
  $text =~ s/''/\&rdquo\;/g;
  $text =~ s/'/\&rsquo\;/g;
  $text =~ s/`/\&lsquo\;/g;

  return $text;
}

sub _convert_text($$$$) {
  my ($self, $type, $element, $text) = @_;

  if (in_verbatim($self)) {
    # API info: using the API to allow for customization would be:
    #return &{$self->formatting_function('format_protect_text')}($self, $text);
    return _default_format_protect_text($self, $text);
  }
  return $text if (in_raw($self));

  $text = uc($text) if (in_upper_case($self));

  # API info: using the API to allow for customization would be:
  #$text = &{$self->formatting_function('format_protect_text')}($self, $text);
  $text = _default_format_protect_text($self, $text);

  # API info: for efficiency, we cache the result of the calls to configuration
  # in $self->{'use_unicode_text'}.
  # API code conforming would be:
  #if ($self->get_conf('OUTPUT_CHARACTERS')
  #    and $self->get_conf('OUTPUT_ENCODING_NAME')
  #    and $self->get_conf('OUTPUT_ENCODING_NAME') eq 'utf-8') {
  if ($self->{'use_unicode_text'}) {
    $text = Texinfo::Convert::Unicode::unicode_text($text,
                                        (in_code($self) or in_math($self)));
  } elsif (!in_code($self) and !in_math($self)) {
    if ($self->get_conf('USE_NUMERIC_ENTITY')) {
      $text = $self->xml_format_text_with_numeric_entities($text);
    } elsif ($self->get_conf('USE_ISO')) {
      $text = _entity_text($text);
    } else {
      $text =~ s/``/&quot;/g;
      $text =~ s/''/&quot;/g;
      $text =~ s/---/\x{1F}/g;
      $text =~ s/--/-/g;
      $text =~ s/\x{1F}/--/g;
    }
  }

  return $text if (in_preformatted_context($self));

  if (in_non_breakable_space($self)) {
    my $non_breaking_space = $self->get_info('non_breaking_space');
    $text =~ s/\n/ /g;
    $text =~ s/ +/$non_breaking_space/g;
  } elsif (in_space_protected($self)) {
    if (chomp($text)) {
      my $line_break_element = $self->get_info('line_break_element');
      # protect spaces in line_break_element formatting.
      # Note that this case is theoretical right now, as it is not possible
      # to redefine the line_break_element and there are no spaces
      # in the possible values.  However this could be a deficiency of the API,
      # it could be better to be able to redefine line_break_element
      $line_break_element =~ s/ /\x{1F}/g;
      $text .= $line_break_element;
    }
    # Protect spaces within text
    my $non_breaking_space = $self->get_info('non_breaking_space');
    $text =~ s/ /$non_breaking_space/g;
    # Revert protected spaces in leading html attribute
    $text =~ s/\x{1F}/ /g;
  }
  return $text;
}

$default_types_conversion{'text'} = \&_convert_text;

sub _css_string_convert_text($$$$) {
  my ($self, $type, $element, $text) = @_;

  $text = uc($text) if (in_upper_case($self));

  # need to hide \ otherwise it is protected in protect_text
  if (!in_code($self) and !in_math($self)) {
    $text =~ s/---/\x{1F}2014 /g;
    $text =~ s/--/\x{1F}2013 /g;
    $text =~ s/``/\x{1F}201C /g;
    $text =~ s/''/\x{1F}201D /g;
    $text =~ s/'/\x{1F}2019 /g;
    $text =~ s/`/\x{1F}2018 /g;
  }

  $text
   = &{$self->formatting_function('format_protect_text')}($self, $text);
  $text =~ s/\x{1F}/\\/g;

  return $text;
}
$default_css_string_types_conversion{'text'} = \&_css_string_convert_text;

sub _simplify_text_for_comparison($) {
  my $text = shift;

  $text =~ s/[^\p{Word}]//g;
  return $text;
}

sub _convert_untranslated_def_line_arg_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  my $translated;
  my $category_text = $element->{'contents'}->[0]->{'text'};
  if (exists($element->{'extra'})
      and exists($element->{'extra'}->{'translation_context'})) {
    $translated = $self->pcdt($element->{'extra'}->{'translation_context'},
                              $category_text);
  } else {
    $translated = $self->cdt($category_text);
  }
  my $result = $self->convert_tree($translated, 'translated TEXT');

  return $result;
}

$default_types_conversion{'untranslated_def_line_arg'}
   = \&_convert_untranslated_def_line_arg_type;


sub _convert_row_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  return $content if (in_string($self));

  if ($content =~ /\S/) {
    my $result = '<tr>' . $content . '</tr>';
    if (exists($element->{'contents'})
        and $element->{'contents'}->[0]->{'cmdname'} ne 'headitem') {
      # if headitem, end of line added in _convert_multitable_head_type
      $result .= "\n";
    }
    return $result;
  } else {
    return '';
  }
}
$default_types_conversion{'row'} = \&_convert_row_type;

sub _convert_multitable_head_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  return $content if (in_string($self));

  if ($content =~ /\S/) {
    return '<thead>' . $content . '</thead>' . "\n";
  } else {
    return '';
  }
}

$default_types_conversion{'multitable_head'} = \&_convert_multitable_head_type;

sub _convert_multitable_body_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  return $content if (in_string($self));
  if ($content =~ /\S/) {
    return '<tbody>' . $content . '</tbody>' . "\n";
  } else {
    return '';
  }
}

$default_types_conversion{'multitable_body'} = \&_convert_multitable_body_type;

# The node is used, not the nodedescription because it is easier to
# find the node in XS
sub _formatted_nodedescription_nr($$) {
  my ($self, $node) = @_;

  # update the number of time the node description was formatted
  my $formatted_nodedescription_nr
    = $self->get_shared_conversion_state('nodedescription',
                                    'formatted_nodedescriptions',
                                     $node);
  $formatted_nodedescription_nr = 0
     if (!defined($formatted_nodedescription_nr));
  $formatted_nodedescription_nr++;
  $self->set_shared_conversion_state('nodedescription',
                                    'formatted_nodedescriptions',
                              $node, $formatted_nodedescription_nr);
  return $formatted_nodedescription_nr;
}

sub _convert_menu_entry_type($$$) {
  my ($self, $type, $element) = @_;

  my $name_entry;
  my $menu_description;
  my $menu_entry_node;
  my $menu_entry_leading_text;
  my @menu_entry_separators;

  foreach my $arg (@{$element->{'contents'}}) {
    if ($arg->{'type'} eq 'menu_entry_leading_text') {
      $menu_entry_leading_text = $arg;
    } elsif ($arg->{'type'} eq 'menu_entry_name') {
      $name_entry = $arg;
    } elsif ($arg->{'type'} eq 'menu_entry_description') {
      $menu_description = $arg;
    } elsif ($arg->{'type'} eq 'menu_entry_separator') {
      push @menu_entry_separators, $arg;
    } elsif ($arg->{'type'} eq 'menu_entry_node') {
      $menu_entry_node = $arg;
    }
  }

  my $href;
  my $rel = '';
  my $associated_title_command;

  my $node_description;
  my $long_description = 0;
  my $formatted_nodedescription_nr;

  # external node
  my $external_node;
  if (exists($menu_entry_node->{'extra'})
      and exists($menu_entry_node->{'extra'}->{'manual_content'})) {
    $href = $self->command_href($menu_entry_node, undef, $element);
    $external_node = 1;
  # may not exist in case of menu entry node consisting only of spaces
  } elsif (exists($menu_entry_node->{'extra'})
           and exists($menu_entry_node->{'extra'}->{'normalized'})) {
    my $node = $self->label_command($menu_entry_node->{'extra'}->{'normalized'});
    if ($node) {
      my $node_relations;
      if ($node->{'cmdname'} eq 'node') {
        my $document = $self->get_info('document');
        if (defined($document)) {
          my $nodes_list = $document->nodes_list();
          $node_relations
            = $nodes_list->[$node->{'extra'}->{'node_number'} -1];

          if (exists($node_relations->{'node_description'})) {
            $node_description = $node_relations->{'node_description'};
          } elsif (exists($node_relations->{'node_long_description'})) {
            $node_description = $node_relations->{'node_long_description'};
            $long_description = 1;
          }
        }
      }
      # if !NODE_NAME_IN_MENU, we pick the associated title command element
      if (!$self->get_conf('NODE_NAME_IN_MENU') and defined($node_relations)) {
        $associated_title_command
          = $node_relations->{'associated_title_command'};
      }

      if (defined($associated_title_command)) {
        $href = $self->command_href($associated_title_command,
                                    undef, $element);
      } else {
        $href = $self->command_href($node, undef, $element);
      }
      if (exists($node->{'extra'}) and $node->{'extra'}->{'isindex'}) {
        # Mark the target as an index.  See
        # http://microformats.org/wiki/existing-rel-values#HTML5_link_type_extensions
        $rel = ' rel="index"';
      }
      if (defined($node_description)
        # not menu_description probably cannot happen
          and (not defined($menu_description)
            # empty description
            or (not exists($menu_description->{'contents'})
                or (scalar(@{$menu_description->{'contents'}}) == 1
                    # preformatted inside menu_entry_description
                    and (not (exists($menu_description->{'contents'}->[0]
                                                             ->{'contents'}))
                         or (scalar(@{$menu_description->{'contents'}->[0]
                                                         ->{'contents'}}) == 1)
                             and exists($menu_description->{'contents'}->[0]
                                                 ->{'contents'}->[0]->{'text'})
                             and $menu_description->{'contents'}->[0]
                                  ->{'contents'}->[0]->{'text'} !~ /\S/))))) {
        $formatted_nodedescription_nr
          = _formatted_nodedescription_nr($self, $node);
      }
    }
  }

  my $html_menu_entry_index
    = $self->get_shared_conversion_state('menu', 'html_menu_entry_index');
  $html_menu_entry_index = 0 if (!defined($html_menu_entry_index));
  $html_menu_entry_index++;
  $self->set_shared_conversion_state('menu', 'html_menu_entry_index',
                                    $html_menu_entry_index);
  my $accesskey = '';
  $accesskey = " accesskey=\"$html_menu_entry_index\""
    if ($self->get_conf('USE_ACCESSKEY') and $html_menu_entry_index < 10);

  my $MENU_SYMBOL = $self->get_conf('MENU_SYMBOL');
  my $MENU_ENTRY_COLON = $self->get_conf('MENU_ENTRY_COLON');

  my $in_string = in_string($self);
  if (inside_preformatted($self) or $in_string) {
    my $leading_text = $menu_entry_leading_text->{'text'};
    $leading_text =~ s/\*/$MENU_SYMBOL/;
    my $result_name_node = $leading_text;

    if (defined($name_entry)) {
      $result_name_node
        .= $self->convert_tree($name_entry,
                               "menu_arg menu_entry_name preformatted");
      my $name_separator = shift @menu_entry_separators;
      $result_name_node
        .= $self->convert_tree($name_separator,
                               "menu_arg name separator preformatted");
    }

    if (defined($menu_entry_node)) {
      my $name = $self->convert_tree(
         Texinfo::TreeElement::new({'type' => '_code',
                                    'contents' => [$menu_entry_node]}),
                       "menu_arg menu_entry_node preformatted");
      if (defined($href) and !$in_string) {
        $result_name_node .= "<a href=\"$href\"$rel$accesskey>$name</a>";
      } else {
        $result_name_node .= $name;
      }
    }
    if (scalar(@menu_entry_separators)) {
      my $node_separator = shift @menu_entry_separators;
      $result_name_node
        .= $self->convert_tree($node_separator,
                               "menu_arg node separator preformatted");
    }

    if (not $in_string) {
      my $pre_class = _preformatted_class($self);
      $result_name_node = $self->html_attribute_class('pre', [$pre_class]).'>'
                                               . $result_name_node . '</pre>';
    }

    my $description = '';
    if ($formatted_nodedescription_nr) {
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
          = 'preformatted-node-description-'.$formatted_nodedescription_nr;
      }
      $description
        .= $self->convert_tree_new_formatting_context($description_element,
                                   'menu_arg node description preformatted',
                                   $multiple_formatted, undef,
                                   'menu');
    } elsif ($menu_description) {
      $description .= $self->convert_tree($menu_description,
                                          'menu_arg description preformatted');
    }

    return $result_name_node . $description;
  }

  my $name;
  my $name_no_number;
  if (defined($associated_title_command) and defined($href)) {
    $name = $self->command_text($associated_title_command);
    if ($name ne '') {
      $name = "<a href=\"$href\"$rel$accesskey>$name</a>";
      $name_no_number
       = $self->command_text($associated_title_command, 'text_nonumber');
    }
  }
  # A leading menu symbol is only inserted if the section name is not
  # used since the section name usually comes with a section number (unless
  # NUMBER_SECTIONS is 0, or the section is unnumbered/heading/xrefname)
  if (!defined($name) or $name eq '') {
    if (defined($name_entry)) {
      $name = $self->convert_tree($name_entry, 'convert menu_entry_name');
    }
    if (!defined($name) or $name eq '') {
      if (exists($menu_entry_node->{'extra'})
          and exists($menu_entry_node->{'extra'}->{'manual_content'})) {
        $name = $self->command_text($menu_entry_node);
      } elsif (exists($menu_entry_node->{'extra'})
               and exists($menu_entry_node->{'extra'}->{'node_content'})) {
        $name = $self->convert_tree(
                 Texinfo::TreeElement::new({'type' => '_code',
            'contents' => [$menu_entry_node->{'extra'}->{'node_content'}]}),
                                    'menu_arg name');
      } else {
        $name = '';
      }
    }
    $name =~ s/^\s*//;
    $name_no_number = $name;
    if (defined($href)) {
      $name = "<a href=\"$href\"$rel$accesskey>$name</a>";
    }
    $name = "$MENU_SYMBOL ".$name;
  }
  my $description = '';
  if ($formatted_nodedescription_nr) {
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
    $description
      = $self->convert_tree_new_formatting_context($description_element,
                                            'menu_arg node description',
                                     $multiple_formatted, undef, 'menu');
  } elsif (defined($menu_description)) {
    $description = $self->convert_tree($menu_description,
                                         'menu_arg description');
  }
  my $non_breaking_space = $self->get_info('non_breaking_space');
  return '<tr>'
     .$self->html_attribute_class('td', ['menu-entry-destination']).'>'
                                           ."$name$MENU_ENTRY_COLON</td>"
    .$self->html_attribute_class('td', ['menu-entry-description']).'>'
                                ."$description</td></tr>\n";
}

$default_types_conversion{'menu_entry'} = \&_convert_menu_entry_type;

sub _convert_menu_comment_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  if (inside_preformatted($self) or in_string($self)) {
    return $content;
  } else {
    return '<tr>'.$self->html_attribute_class('th', ['menu-comment'])
      . ' colspan="2">'.$content .'</th></tr>';
  }
}

$default_types_conversion{'menu_comment'} = \&_convert_menu_comment_type;

sub _convert_before_item_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  return '' if (!defined ($content) or $content !~ /\S/);
  return $content if (in_string($self));
  my $top_block_command = top_block_command($self);
  if ($top_block_command eq 'itemize' or $top_block_command eq 'enumerate') {
    return '<li>'. $content .'</li>';
  } elsif ($top_block_command eq 'table' or $top_block_command eq 'vtable'
           or $top_block_command eq 'ftable') {
    return '<dd>'. $content .'</dd>'."\n";
  } elsif ($top_block_command eq 'multitable') {
    $content =~ s/^\s*//;
    $content =~ s/\s*$//;

    return '<tr><td>'.$content.'</td></tr>'."\n";
  }
}

$default_types_conversion{'before_item'} = \&_convert_before_item_type;

sub _convert_table_term_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  return '<dt>'.$content;
}

$default_types_conversion{'table_term'} = \&_convert_table_term_type;

sub _convert_def_line_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  if (in_string($self)) {
    # should probably never happen
    return &{$self->formatting_function('format_protect_text')}($self,
     Texinfo::Convert::Text::convert_to_text(
      $element, $self->{'convert_text_options'}));
  }

  my $index_label = '';
  my $index_id = $self->command_id($element);
  if (defined($index_id) and $index_id ne '' and !in_multi_expanded($self)) {
    $index_label = " id=\"$index_id\"";
  }
  my ($category_element, $class_element,
      $type_element, $name_element, $arguments)
         = Texinfo::Convert::Utils::definition_arguments_content($element);

  my $original_def_cmdname = $element->{'extra'}->{'original_def_cmdname'};
  my $original_command_name;
  my $alias_class;
  if (exists($Texinfo::Common::def_aliases{$original_def_cmdname})) {
    $original_command_name = $Texinfo::Common::def_aliases{$original_def_cmdname};
    $alias_class = "$original_def_cmdname-alias-$original_command_name";
  } else {
    $original_command_name = $original_def_cmdname;
  }

  my $def_command = $element->{'extra'}->{'def_command'};
  my $base_command_name;
  if (exists($Texinfo::Common::def_aliases{$def_command})) {
    $base_command_name
        = $Texinfo::Common::def_aliases{$def_command};
  } else {
    $base_command_name = $def_command;
  }

  my @classes = ();
  push @classes, $original_command_name;
  if (defined($alias_class)) {
    push @classes, $alias_class;
  }
  if ($base_command_name ne $original_command_name) {
    push @classes, "def-cmd-$base_command_name";
  }

  push @classes, 'def-line';

  my $def_call = '';
  if (defined($type_element)) {
    my $explanation = "DEF_TYPE $def_command";
    my $type_text = $self->convert_tree(
         Texinfo::TreeElement::new({'type' => '_code',
                                    'contents' => [$type_element]}),
                                        $explanation);
    if ($type_text ne '') {
      $def_call .= $self->html_attribute_class('code', ['def-type']).'>'.
          $type_text .'</code>';
    }
    if (($base_command_name eq 'deftypefn'
         or $base_command_name eq 'deftypeop')
        and $self->get_conf('deftypefnnewline')
        and $self->get_conf('deftypefnnewline') eq 'on') {
      $def_call .= $self->get_info('line_break_element') . ' ';
    } elsif ($type_text ne '') {
      $def_call .= ' ';
    }
  }

  if (defined($name_element)) {
    $def_call .= $self->html_attribute_class('strong', ['def-name']).'>'.
       $self->convert_tree(
          Texinfo::TreeElement::new({'type' => '_code',
                                     'contents' => [$name_element]}),
                           "DEF_NAME $def_command")
       .'</strong>';
  }

  if (defined($arguments)) {
    my $explanation = "DEF_ARGS $def_command";
  # arguments not only metasyntactic variables
  # (deftypefn, deftypevr, deftypeop, deftypecv)
    if (exists($Texinfo::Common::def_no_var_arg_commands{$base_command_name})) {
      my $arguments_formatted
        = $self->convert_tree(
          Texinfo::TreeElement::new({'type' => '_code',
                                     'contents' => [$arguments]}),
                              $explanation);
      if ($arguments_formatted =~ /\S/) {
        $def_call .= ' ' unless($element->{'extra'}->{'omit_def_name_space'});
        $def_call .= $self->html_attribute_class('code',
                                      ['def-code-arguments']).'>'
                          . $arguments_formatted.'</code>';
      }
    } else {
      # only metasyntactic variable arguments (deffn, defvr, deftp, defop, defcv)
      # FIXME not part of the API
      _set_code_context($self, 0);
      my $arguments_formatted = $self->convert_tree($arguments, $explanation);
      _pop_code_context($self);
      if ($arguments_formatted =~ /\S/) {
        $def_call .= ' ' unless($element->{'extra'}->{'omit_def_name_space'});
        $def_call .= $self->html_attribute_class('var',
                               ['def-var-arguments']).'>'
              . $arguments_formatted .'</var>';
      }
    }
  }

  if ($self->get_conf('DEF_TABLE')) {
    my $category_result = '';
    my $def_category_tree
      = Texinfo::Convert::Utils::definition_category_tree($element,
                                     $self->{'current_lang_translations'},
                                     $self->get_conf('DEBUG'), $self);
    $category_result
      = $self->convert_tree($def_category_tree)
        if (defined($def_category_tree));

    return $self->html_attribute_class('tr', \@classes)
      . "$index_label>".$self->html_attribute_class('td', ['call-def']).'>'
      . $def_call . '</td>'.$self->html_attribute_class('td', ['category-def'])
      . '>' . '[' . $category_result . ']' . "</td></tr>\n";
  }

  my $result = $self->html_attribute_class('dt', \@classes) . "$index_label>";

  if (defined($category_element)) {
    my $e_category_tree;
    if (defined($class_element)) {
      my $substrings = {'category' => $category_element,
                        'class' => $class_element};
      if ($base_command_name eq 'deftypeop'
          and defined($type_element)
          and $self->get_conf('deftypefnnewline')
          and $self->get_conf('deftypefnnewline') eq 'on') {
        $e_category_tree = $self->cdt('{category} on @code{{class}}:@* ',
                                      $substrings);
      } elsif ($base_command_name eq 'defop'
               or $base_command_name eq 'deftypeop') {
        $e_category_tree = $self->cdt('{category} on @code{{class}}: ',
                                      $substrings);
      } elsif ($base_command_name eq 'defcv'
               or $base_command_name eq 'deftypecv') {
        $e_category_tree = $self->cdt('{category} of @code{{class}}: ',
                                      $substrings);
      }
    } else {
      my $substrings = {'category' => $category_element};
      if (defined($type_element)
          and ($base_command_name eq 'deftypefn'
               or $base_command_name eq 'deftypeop')
          and $self->get_conf('deftypefnnewline')
          and $self->get_conf('deftypefnnewline') eq 'on') {
        # TODO if in @def* in @example and with @deftypefnnewline
        # on there is no effect of @deftypefnnewline on, as @* in
        # preformatted environment becomes an end of line, but the def*
        # line is not in a preformatted environment.  There should be
        # an explicit <br> in that case.  Probably requires changing
        # the conversion of @* in a @def* line in preformatted, nothing
        # really specific of @deftypefnnewline on.
        $e_category_tree = $self->cdt('{category}:@* ', $substrings);
      } else {
        $e_category_tree = $self->cdt('{category}: ', $substrings);
      }
    }
    if (defined($e_category_tree)) {
      my $open = $self->html_attribute_class('span', ['category-def']);
      if ($open ne '') {
        $result .= $open.'>';
      }
      my $explanation = "DEF_CATEGORY $def_command";
      $result .= $self->convert_tree($e_category_tree, $explanation);
      if ($open ne '') {
        $result .= '</span>';
      }
    }
  }

  my $anchor = _get_copiable_anchor($self, $index_id);
  if (defined($anchor)) {
    $result .= '<span>';
  }
  $result .= $def_call;
  if (defined($anchor)) {
    $result .= $anchor . '</span>';
  }
  $result .= "</dt>\n";

  return $result;
}

sub _get_copiable_anchor($$) {
  my ($self, $id) = @_;

  if (defined($id) and $id ne '' and $self->get_conf('COPIABLE_LINKS')) {
    my $paragraph_symbol = $self->get_info('paragraph_symbol');
    return $self->html_attribute_class('a', ['copiable-link'])
        ." href=\"#$id\"> $paragraph_symbol</a>";
  }
  return undef;
}

$default_types_conversion{'def_line'} = \&_convert_def_line_type;

sub _convert_def_item_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  return $content if (in_string($self));

  if ($content =~ /\S/) {
    if (! $self->get_conf('DEF_TABLE')) {
      return '<dd>' . $content . '</dd>';
    } else {
      return '<tr><td colspan="2">' . $content . '</td></tr>';
    }
  }
}

$default_types_conversion{'def_item'} = \&_convert_def_item_type;
$default_types_conversion{'inter_def_item'} = \&_convert_def_item_type;
$default_types_conversion{'before_defline'} = \&_convert_def_item_type;

sub _convert_table_definition_type($$$$) {
  my ($self, $type, $element, $content) = @_;

  $content = '' if (!defined($content));

  return $content if (in_string($self));

  if ($content =~ /\S/) {
    return '<dd>' . $content . '</dd>'."\n";
  }
}

$default_types_conversion{'table_definition'}
                                  = \&_convert_table_definition_type;
$default_types_conversion{'inter_item'}
                                  = \&_convert_table_definition_type;

# Function for converting special output units
sub _convert_special_unit_type($$$$) {
  my ($self, $type, $output_unit, $content) = @_;

  $content = '' if (!defined($content));

  if (in_string($self)) {
    return '';
  }

  my $result = '';

  my $special_unit_variety = $output_unit->{'special_unit_variety'};
  my $closed_strings = $self->close_registered_sections_level(
                                            $self->current_filename(), 0);
  $result .= join('', @{$closed_strings});

  my $special_unit_body
    .= &{$self->special_unit_body_formatting($special_unit_variety)}($self,
                                      $special_unit_variety, $output_unit);

  # This may happen with footnotes in regions that are not expanded,
  # like @copying or @titlepage
  if ($special_unit_body eq '') {
    return '';
  }

  my $unit_command = $output_unit->{'unit_command'};

  my $id = $self->command_id($unit_command);
  my $class_base
    = $self->special_unit_info('class', $special_unit_variety);
  $result .= $self->html_attribute_class('div', ["element-${class_base}"]);
  if ($id ne '') {
    $result .= " id=\"$id\"";
  }
  $result .= ">\n";
  if ($self->get_conf('HEADERS')
      # first in page
      or (exists($output_unit->{'unit_filename'})
          and $self->count_elements_in_filename('current',
                             $output_unit->{'unit_filename'}) == 1)) {
    $result .= &{$self->formatting_function('format_navigation_header')}($self,
                     $self->get_conf('MISC_BUTTONS'), undef, $unit_command);
  }
  my $heading = $self->command_text($unit_command);
  my $level = $self->get_conf('CHAPTER_HEADER_LEVEL');
  if ($special_unit_variety eq 'footnotes') {
    $level = $self->get_conf('FOOTNOTE_SEPARATE_HEADER_LEVEL');
  }
  $result .= &{$self->formatting_function('format_heading_text')}($self,
                           undef, [$class_base.'-heading'], $heading, $level)."\n";


  $result .= $special_unit_body . '</div>';
  $result .= &{$self->formatting_function('format_element_footer')}($self,
                                 $type, $output_unit, $content, $unit_command);
  return $result;
}

$default_output_units_conversion{'special_unit'}
  = \&_convert_special_unit_type;

# Function for converting the output units.  The node and associated section
# appear together in the output unit.  $OUTPUT_UNIT was created in this
# module (in _prepare_conversion_units), it's not a tree element (created
# by the parser).
# $CONTENT is the contents of the output unit, already converted.
sub _convert_unit_type($$$$) {
  my ($self, $type, $output_unit, $content) = @_;

  $content = '' if (!defined($content));

  if (in_string($self)) {
    return $content;
  }
  my $result = '';
  if (not exists($output_unit->{'tree_unit_directions'})
      or not exists($output_unit->{'tree_unit_directions'}->{'prev'})) {
    my $global_commands;

    my $document = $self->get_info('document');
    if (defined($document)) {
      $global_commands = $document->global_commands_information();
    }

    if (!(defined($global_commands)
          and exists($global_commands->{'maketitle'}))) {
      $result .= $self->get_info('title_titlepage');
    }
    if (not exists($output_unit->{'tree_unit_directions'})
        or not exists($output_unit->{'tree_unit_directions'}->{'next'})) {
      # only one unit, use simplified formatting
      $result .= $content;
      # if there is one unit it also means that there is no formatting
      # of footnotes in a separate unit.  And if footnotestyle is end
      # the footnotes won't be done in format_element_footer either.
      $result
        .= &{$self->formatting_function('format_footnotes_segment')}($self);
      $result .= $self->get_conf('DEFAULT_RULE') ."\n"
        if ($self->get_conf('PROGRAM_NAME_IN_FOOTER')
          and defined($self->get_conf('DEFAULT_RULE')));
      # do it here, as it is won't be done at end of page in
      # format_element_footer
      my $closed_strings = $self->close_registered_sections_level(
                                            $self->current_filename(), 0);
      $result .= join('', @{$closed_strings});
      return $result;
    }
  }
  $result .= $content;
  my $unit_command;
  if (exists($output_unit->{'unit_command'})) {
    $unit_command = $output_unit->{'unit_command'};
  }
  $result .= &{$self->formatting_function('format_element_footer')}($self, $type,
                                             $output_unit, $content, $unit_command);

  return $result;
}

$default_output_units_conversion{'unit'} = \&_convert_unit_type;

sub _contents_shortcontents_in_title($) {
  my $self = shift;

  my $result = '';

  my $document = $self->get_info('document');
  my $sections_list;
  if (defined($document)) {
    $sections_list = $document->sections_list();
  }

  if (defined($sections_list)
      and scalar(@{$sections_list}) > 1
      and $self->get_conf('CONTENTS_OUTPUT_LOCATION') eq 'after_title') {
    foreach my $cmdname ('shortcontents', 'contents') {
      if ($self->get_conf($cmdname)) {
        my $contents_text = _contents_inline_element($self, $cmdname, undef);
        if ($contents_text ne '') {
          $result .= $contents_text;
          my $rule = $self->get_conf('DEFAULT_RULE');
          if (defined($rule)) {
            $result .= $rule ."\n";
          }
        }
      }
    }
  }
  return $result;
}

sub _format_maketile($$) {
  my ($self, $document) = @_;

  my $document_info
    = Texinfo::Convert::Utils::get_document_documentinfo($document);

  if (defined($document_info)) {
    my @contents;
    my $titlepage_text
      = $self->html_attribute_class('div', ['maketitle-titlepage']).">\n";
    foreach my $cmdname ('title', 'subtitle', 'author') {
      if (exists($document_info->{$cmdname})) {
        push @contents, @{$document_info->{$cmdname}};
      }
    }
    my $element = Texinfo::TreeElement::new({'contents' => \@contents});
    # we do not need to collect the author commands in titlepage, so
    # we use a little trick to initialize the authors number to -1
    # to mean that we are in titlepage
    _open_quotation_titlepage_stack($self, -1);
    my $quotation_titlepage_nr = $self->get_shared_conversion_state('quotation',
                                                  'quotation_titlepage_stack');
    $titlepage_text .= $self->convert_tree($element, 'format maketitle');
    $quotation_titlepage_nr--;
    $self->set_shared_conversion_state('quotation',
                                       'quotation_titlepage_stack',
                                       $quotation_titlepage_nr);
    $titlepage_text .= "</div>\n";
    return $titlepage_text;
  }
  return undef;
}

# Convert @titlepage.  Falls back to simpletitle.
sub _default_format_titlepage($) {
  my $self = shift;

  my $titlepage_text;
  my $global_commands;

  my $document = $self->get_info('document');
  if (defined($document)) {
    $global_commands = $document->global_commands_information();
  }

  if (defined($global_commands) and exists($global_commands->{'titlepage'})) {
    # we do not need to collect the author commands in titlepage, so
    # we use a little trick to initialize the authors number to -1
    # to mean that we are in titlepage
    _open_quotation_titlepage_stack($self, -1);
    $titlepage_text = $self->convert_tree(
      Texinfo::TreeElement::new(
       {'contents' => $global_commands->{'titlepage'}->{'contents'}}),
                                          'convert titlepage');
    my $quotation_titlepage_nr = $self->get_shared_conversion_state('quotation',
                                                  'quotation_titlepage_stack');
    $quotation_titlepage_nr--;
    $self->set_shared_conversion_state('quotation',
                                       'quotation_titlepage_stack',
                                       $quotation_titlepage_nr);
  } elsif (defined($global_commands)
           and exists($global_commands->{'maketitle'})
           and defined($document)) {
    $titlepage_text = _format_maketile($self, $document);
  } else {
    my $simpletitle_tree = $self->get_info('simpletitle_tree');
    if (defined($simpletitle_tree)) {
      my $simpletitle_command_name
       = $self->get_info('simpletitle_command_name');
      my $title_text
       = $self->convert_tree_new_formatting_context($simpletitle_tree,
                                     "$simpletitle_command_name simpletitle");
      $titlepage_text
        = &{$self->formatting_function('format_heading_text')}($self,
                                                $simpletitle_command_name,
                                  [$simpletitle_command_name], $title_text, 0);
    }
  }
  my $result = '';
  if (defined($titlepage_text)) {
    $result .= $titlepage_text;
    my $rule = $self->get_conf('DEFAULT_RULE');
    if (defined($rule)) {
      $result .= $rule."\n";
    }
  }
  $result .= _contents_shortcontents_in_title($self);
  return $result;
}

sub _default_format_title_titlepage($) {
  my $self = shift;

  if ($self->get_conf('SHOW_TITLE')) {
    if ($self->get_conf('USE_TITLEPAGE_FOR_TITLE')) {
      return &{$self->formatting_function('format_titlepage')}($self);
    } else {
      my $result = '';
      my $simpletitle_tree = $self->get_info('simpletitle_tree');
      if (defined($simpletitle_tree)) {
        my $simpletitle_command_name
              = $self->get_info('simpletitle_command_name');
        my $title_text
         = $self->convert_tree_new_formatting_context($simpletitle_tree,
                                     "$simpletitle_command_name simpletitle");
        $result
          .= &{$self->formatting_function('format_heading_text')}($self,
                                              $simpletitle_command_name,
                            [$simpletitle_command_name], $title_text, 0);
      }
      $result .= _contents_shortcontents_in_title($self);
      return $result;
    }
  }
  return '';
}

# for output units, both normal and special
sub _default_format_element_footer($$$$;$) {
  my ($self, $type, $output_unit, $content, $command) = @_;

  my $result = '';
  my $is_top = $self->unit_is_top_output_unit($output_unit);
  my $next_is_top = (exists($output_unit->{'tree_unit_directions'}->{'next'})
                     and $self->unit_is_top_output_unit(
                            $output_unit->{'tree_unit_directions'}->{'next'}));
  my $next_is_special
      = (exists($output_unit->{'tree_unit_directions'}->{'next'})
         and exists($output_unit->{'tree_unit_directions'}->{'next'}
                                                            ->{'unit_type'})
         and $output_unit->{'tree_unit_directions'}->{'next'}
                                       ->{'unit_type'} eq 'special_unit');

  my $is_end_page = (!exists($output_unit->{'tree_unit_directions'}->{'next'})
       or (exists($output_unit->{'unit_filename'})
           and $output_unit->{'unit_filename'}
               ne $output_unit->{'tree_unit_directions'}->{'next'}
                                                  ->{'unit_filename'}
           and $self->count_elements_in_filename('remaining',
                         $output_unit->{'unit_filename'}) == 1));

  my $is_special = (defined($output_unit->{'unit_type'})
                    and $output_unit->{'unit_type'} eq 'special_unit');

  my $split = $self->get_conf('SPLIT');
  if (($is_end_page or $next_is_top or $next_is_special or $is_top)
       and $self->get_conf('VERTICAL_HEAD_NAVIGATION')
       and (!defined($split) or $split ne 'node'
            or $self->get_conf('HEADERS') or $is_special or $is_top)) {
   $result .= "</td>
</tr>
</table>"."\n";
  }

  my $buttons;

  if ($is_end_page) {
    my $closed_strings = $self->close_registered_sections_level(
                                            $self->current_filename(), 0);
    $result .= join('', @{$closed_strings});

    my $split = $self->get_conf('SPLIT');

    # setup buttons for navigation footer
    if (($is_top or $is_special)
        and ($split or !$self->get_conf('MONOLITHIC'))
        and (($self->get_conf('HEADERS')
              or (defined($split) and $split ne 'node')))) {
      if ($is_top) {
        $buttons = $self->get_conf('TOP_FOOTER_BUTTONS');
      } else {
        $buttons = $self->get_conf('MISC_BUTTONS');
      }
    } elsif (defined($split) and $split eq 'section') {
      $buttons = $self->get_conf('SECTION_FOOTER_BUTTONS');
    } elsif (defined($split) and $split eq 'chapter') {
      $buttons = $self->get_conf('CHAPTER_FOOTER_BUTTONS');
    } elsif (defined($split) and $split eq 'node') {
      if ($self->get_conf('HEADERS')) {
        my $no_footer_word_count;
        if ($self->get_conf('WORDS_IN_PAGE')) {
          $content = '' if (!defined($content));
          # NOTE it would have been better to skip a leading space, but
          # it cannot happen as the content should start with an HTML element.
          # splitting at [\h\v] may have been relevant, but then the result
          # would be different from XS code result and could give different
          # results in perl in some cases.
          # NOTE it seems that NO-BREAK SPACE and NEXT LINE (NEL) may
          # not be in \h and \v in some case, but not sure when.
          # It is supposed to be explained but it is not very clear
          # https://perldoc.perl.org/perlrecharclass#Whitespace
          # [\h\v]+ does not match on solaris 11 with perl 5.10.1, not sure
          # why.
          #my @cnt = split(/[\h\v]+/, $content);
          # Use an explicit list to match the same in all versions of perl.
          # TODO starting in Perl v5.14 could be replaced by \s\cK (with /a)
          # TODO starting in Perl v5.18 could be replaced by \s (with /a)
          my @cnt = split(/[\t\n\f\r \cK]+/, $content);
          if (scalar(@cnt) < $self->get_conf('WORDS_IN_PAGE')) {
            $no_footer_word_count = 1;
          }
        }
        $buttons = $self->get_conf('NODE_FOOTER_BUTTONS')
           unless ($no_footer_word_count);
      }
    }
  }
  # NOTE the following condition is almost a duplication of the
  # condition appearing in end_page except that the file counter
  # needs not to be 1
  if (!exists($output_unit->{'tree_unit_directions'}->{'next'})
      or (exists($output_unit->{'unit_filename'})
          and $output_unit->{'unit_filename'}
           ne $output_unit->{'tree_unit_directions'}->{'next'}
                          ->{'unit_filename'})) {
    my $footnotestyle = $self->get_conf('footnotestyle');
    if (!defined($footnotestyle) or $footnotestyle ne 'separate') {
      $result
        .= &{$self->formatting_function('format_footnotes_segment')}($self);
    }
  }

  if ($buttons or !$is_end_page
      or $self->get_conf('PROGRAM_NAME_IN_FOOTER')) {
    my $rule;
    my $split = $self->get_conf('SPLIT');
    if (!$is_end_page and ($is_top or $next_is_top or ($next_is_special
                                                    and !$is_special))) {
      $rule = $self->get_conf('BIG_RULE');
    } elsif (!$buttons or $is_top or $is_special
             or ($is_end_page and defined($split)
                 and ($split eq 'chapter' or $split eq 'section'))
             or (defined($split) and $split eq 'node'
                 and $self->get_conf('HEADERS'))) {
      $rule = $self->get_conf('DEFAULT_RULE');
    }
    $result .= "$rule\n" if (defined($rule) and $rule ne '');
  }

  if ($buttons) {
    my $cmdname;
    $cmdname = $command->{'cmdname'} if (defined($command)
                                         and exists($command->{'cmdname'}));
    $result .= &{$self->formatting_function('format_navigation_panel')}($self,
                                                    $buttons, $cmdname, $command);
  }
  return $result;
}

# if $document_global_context is set, it means that the formatting
# is not done within the document formatting flow, but the formatted
# output may still end up in the document.  In particular for
# command_text() which caches its computations.
sub _new_document_context($$;$$) {
  my ($self, $context, $document_global_context, $block_command) = @_;

  push @{$self->{'document_context'}},
          {'context' => $context,
           'formatting_context' => [{'context_name' => '_format'}],
           'composition_context' => [''],
           'preformatted_context' => [0],
           'inside_preformatted' => 0,
           'monospace' => [0],
           'document_global_context' => $document_global_context,
           'block_commands' => [],
          };
  if (defined($document_global_context)) {
    $self->{'document_global_context'}++;
  }
  if (defined($block_command)) {
    push @{$self->{'document_context'}->[-1]->{'block_commands'}},
            $block_command;
  }
}

sub _pop_document_context($) {
  my $self = shift;

  my $context = pop @{$self->{'document_context'}};
  if (defined($context->{'document_global_context'})) {
    $self->{'document_global_context'}--;
  }
}

sub _set_code_context($$) {
  my ($self, $code) = @_;

  push @{$self->{'document_context'}->[-1]->{'monospace'}}, $code;
}

sub _pop_code_context($) {
  my $self = shift;

  pop @{$self->{'document_context'}->[-1]->{'monospace'}};
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

  $self->{'multiple_conversions'}++;
  push @{$self->{'multiple_pass'}}, $multiple_pass;
}

sub _unset_multiple_conversions($) {
  my $self = shift;

  $self->{'multiple_conversions'}--;
  pop @{$self->{'multiple_pass'}};
}

# can be set through Texinfo::Config::texinfo_register_file_id_setting_function
my %customizable_file_id_setting_references;
foreach my $customized_reference ('external_target_split_name',
                'external_target_non_split_name',
                'label_target_name', 'node_file_name',
                'sectioning_command_target_name', 'unit_file_name',
                'special_unit_target_file_name') {
  $customizable_file_id_setting_references{$customized_reference} = 1;
}

# Functions accessed with e.g. 'format_heading_text'.
# used in Texinfo::Config
%default_formatting_references = (
     'format_begin_file' => \&_default_format_begin_file,
     'format_button' => \&_default_format_button,
     'format_button_icon_img' => \&_default_format_button_icon_img,
     'format_css_lines' => \&_default_format_css_lines,
     'format_comment' => \&_default_format_comment,
     'format_contents' => \&_default_format_contents,
     'format_element_header' => \&_default_format_element_header,
     'format_element_footer' => \&_default_format_element_footer,
     'format_end_file' => \&_default_format_end_file,
     'format_footnotes_segment' => \&_default_format_footnotes_segment,
     'format_footnotes_sequence' => \&_default_format_footnotes_sequence,
     'format_single_footnote' => \&_default_format_single_footnote,
     'format_heading_text' => \&_default_format_heading_text,
     'format_navigation_header' => \&_default_format_navigation_header,
     'format_navigation_panel' => \&_default_format_navigation_panel,
     'format_node_redirection_page' => \&_default_format_node_redirection_page,
     'format_program_string' => \&_default_format_program_string,
     'format_protect_text' => \&_default_format_protect_text,
     'format_separate_anchor' => \&_default_format_separate_anchor,
     'format_titlepage' => \&_default_format_titlepage,
     'format_title_titlepage' => \&_default_format_title_titlepage,
     'format_translate_message' => undef,
);

# not up for customization
%default_css_string_formatting_references = (
  'format_protect_text' => \&_default_css_string_format_protect_text,
);

%defaults_format_special_unit_body_contents = (
  'contents' => \&_default_format_special_body_contents,
  'about' => \&_default_format_special_body_about,
  'footnotes' => \&_default_format_special_body_footnotes,
  'shortcontents' => \&_default_format_special_body_shortcontents,
);

sub _reset_unset_no_arg_commands_formatting_context($$$$;$) {
  my ($self, $cmdname, $reset_context, $ref_context, $translate) = @_;

  # should never happen as unset is set at configuration
  if (!exists($self->{'no_arg_commands_formatting'}->{$cmdname}->{$reset_context})) {
    $self->{'no_arg_commands_formatting'}->{$cmdname}->{$reset_context} = {};
    $self->{'no_arg_commands_formatting'}->{$cmdname}->{$reset_context}->{'unset'} = 1;
  }
  my $no_arg_command_context
     = $self->{'no_arg_commands_formatting'}->{$cmdname}->{$reset_context};
  if (defined($ref_context)) {
    if ($no_arg_command_context->{'unset'}) {
      foreach my $key (keys(%{$self->{'no_arg_commands_formatting'}->{$cmdname}->{$ref_context}})) {
        # both 'translated_converted' and (possibly translated) 'text' are
        # reused
        $no_arg_command_context->{$key}
          = $self->{'no_arg_commands_formatting'}->{$cmdname}->{$ref_context}->{$key}
      }
    }
  }
  if ($translate
      and exists($no_arg_command_context->{'translated_tree'})
      and not exists($no_arg_command_context->{'translated_converted'})) {
    my $translated_tree
      = $no_arg_command_context->{'translated_tree'};
    my $translation_result;
    my $explanation
       = "Translated NO ARG \@$cmdname ctx $reset_context";
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
      _new_document_context($self, $context_str);
      _set_string_context($self);
      $translation_result = $self->convert_tree($translated_tree,
                                                $explanation);
      _pop_document_context($self);
    } elsif ($reset_context eq 'css_string') {
      $translation_result = $self->html_convert_css_string($translated_tree,
                                                           $context_str);
    }
    $no_arg_command_context->{'text'}
      = $translation_result;
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

my %htmlxref_entries = (
 'node' => [ 'node', 'section', 'chapter', 'mono' ],
 'section' => [ 'section', 'chapter','node', 'mono' ],
 'chapter' => [ 'chapter', 'section', 'node', 'mono' ],
 'mono' => [ 'mono', 'chapter', 'section', 'node' ],
);

# $FILES is an array reference of file names binary strings.
sub _parse_htmlxref_files($$) {
  my ($self, $files) = @_;

  my $htmlxref = {};

  foreach my $file (@$files) {
    my $fname = $file;
    if ($self->get_conf('TEST')) {
      my ($volume, $directories);
      # strip directories for out-of-source builds reproducible file names
      ($volume, $directories, $fname) = File::Spec->splitpath($file);
    }
    print STDERR "html refs config file: $file\n" if ($self->get_conf('DEBUG'));
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

# converter state
#
#   No API
#  all_directions          # determined parallelly in C
#  deprecated_config_directories
#
#     API exists
#
#   Get through converter set_global_document_commands with 'before'.  No
#   specific API to set, but can use get_conf or force_conf in setup handler
#  commands_init_conf
#
#  shared_conversion_state
#   Set through the shared_conversion_state API (among others):
#  explained_commands         # used only in an @-command conversion function
#
#     API converter_info get_info
#  document_name
#  destination_directory
#  paragraph_symbol
#  line_break_element
#  non_breaking_space
#  simpletitle_tree
#  simpletitle_command_name
#  title_string
#  title_tree
#  documentdescription_string
#  copying_comment
#  jslicenses
#
#     API exists
#  current_filename
#  current_output_unit
#  index_entries
#  index_entries_by_letter
#
#    API exists in Texinfo::Config for setting, not for getting
#  stage_handlers
#
#    API exists
#  css_element_class_styles
#  css_import_lines
#  css_rule_lines
#
#    API exists
#  file_id_setting
#  commands_conversion
#  commands_open
#  types_conversion
#  types_open
#
#    API exists for setting, not for getting and used in commands_conversion
#  customized_no_arg_commands_formatting
#  no_arg_commands_formatting
#  style_commands_formatting
#
#    API exists
#  code_types
#  pre_class_types
#
#    API exists
#  document_context
#
#    API exists
#  pending_closes
#
#    API exists
#  pending_footnotes
#
#    API exists
#  pending_inline_content
#  associated_inline_content
#
#    API exists
#  multiple_conversions
#
#    API exists
#  targets         for directions.  Keys are elements references, values are
#                  target information hash references described above before
#                  the API functions used to access this information.
#  special_targets
#  global_units_directions
#
#    API exists for setting, not getting
#  customized_direction_strings
#  directions_strings
#  translated_direction_strings
#
#    API exists
#  special_unit_info
#  translated_special_unit_info
#
#    API exists
#  elements_in_file_count    # the number of output units in file
#  file_counters             # begin at elements_in_file_count decrease
#                            # each time the unit is closed
#
#     API exists
#  document_global_context_css
#  page_css
#
#     API exists
#  files_information
#
#     No API, converter internals
#  document_units
#  out_filepaths          (partially common with Texinfo::Converter)
#  seen_ids
#  options_latex_math
#  htmlxref
#  check_htmlxref_already_warned
#  referred_command_stack
#
#    from Converter
#  labels

my %special_characters = (
  'paragraph_symbol' => ['&para;', '00B6'],
  'left_quote' => ['&lsquo;', '2018'],
  'right_quote' => ['&rsquo;', '2019'],
  'bullet' => ['&bull;', '2022'],
  'non_breaking_space' => [$xml_named_entity_nbsp, '00A0'],
);

sub _XS_html_converter_initialize_beginning($) {
}

sub _XS_html_converter_get_customization($$$$$$$$$$$$$$$$$$$) {
}

# this allows to get some debugging output for the file without setting
# the customization variable.
my $debug;  # whether to print debugging output

sub converter_initialize($) {
  my $self = shift;

  # beginning of initialization done either in Perl or XS
  if ($self->{'converter_descriptor'} and $XS_convert) {
    _XS_html_converter_initialize_beginning($self);
  } else {
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
  }

  $self->{'output_units_conversion'} = {};
  my $customized_output_units_conversion
    = Texinfo::Config::GNUT_get_output_units_conversion();
  $customized_output_units_conversion = {}
    if (!defined($customized_output_units_conversion));
  foreach my $type (keys(%default_output_units_conversion)) {
    if (exists($customized_output_units_conversion->{$type})) {
      $self->{'output_units_conversion'}->{$type}
          = $customized_output_units_conversion->{$type};
    } else {
      $self->{'output_units_conversion'}->{$type}
          = $default_output_units_conversion{$type};
    }
  }

  $self->{'types_conversion'} = {};
  my $customized_types_conversion
    = Texinfo::Config::GNUT_get_types_conversion();
  $customized_types_conversion = {}
    if (!defined($customized_types_conversion));
  foreach my $type (keys(%default_types_conversion)) {
    if (exists($customized_types_conversion->{$type})) {
      $self->{'types_conversion'}->{$type}
          = $customized_types_conversion->{$type};
    } else {
      $self->{'types_conversion'}->{$type}
          = $default_types_conversion{$type};
    }
  }

  $self->{'types_open'} = {};
  my $customized_types_open = Texinfo::Config::GNUT_get_types_open();
  $customized_types_open = {} if (!defined($customized_types_open));
  foreach my $type (keys(%default_types_conversion)) {
    if (exists($customized_types_open->{$type})) {
      $self->{'types_open'}->{$type}
          = $customized_types_open->{$type};
    } elsif (exists($default_types_open{$type})) {
      $self->{'types_open'}->{$type}
           = $default_types_open{$type};
    }
  }

  $self->{'code_types'} = {};
  foreach my $type (keys(%default_code_types)) {
    $self->{'code_types'}->{$type} = $default_code_types{$type};
  }
  $self->{'pre_class_types'} = {};
  foreach my $type (keys(%default_pre_class_types)) {
    $self->{'pre_class_types'}->{$type} = $default_pre_class_types{$type};
  }

  my $customized_code_types = Texinfo::Config::GNUT_get_types_code_info();
  if (defined($customized_code_types)) {
    foreach my $type (keys(%$customized_code_types)) {
      $self->{'code_types'}->{$type} = $customized_code_types->{$type};
    }
  }

  my $customized_pre_class_types = Texinfo::Config::GNUT_get_types_pre_class();
  if (defined($customized_pre_class_types)) {
    foreach my $type (keys(%$customized_pre_class_types)) {
      $self->{'pre_class_types'}->{$type}
         = $customized_pre_class_types->{$type};
    }
  }

  $self->{'upper_case_commands'} = {};
  foreach my $command (keys(%default_upper_case_commands)) {
    $self->{'upper_case_commands'}->{$command}
     = $default_upper_case_commands{$command};
  }
  my $customized_upper_case_commands
    = Texinfo::Config::GNUT_get_upper_case_commands_info();
  if (defined($customized_upper_case_commands)) {
    foreach my $command (keys(%$customized_upper_case_commands)) {
      $self->{'upper_case_commands'}->{$command}
        = $customized_upper_case_commands->{$command};
    }
  }

  $self->{'commands_conversion'} = {};
  my $customized_commands_conversion
     = Texinfo::Config::GNUT_get_commands_conversion();
  $customized_commands_conversion = {}
    if (!defined($customized_commands_conversion));
  foreach my $command (keys(%line_commands), keys(%brace_commands),
     keys (%block_commands), keys(%nobrace_commands)) {
    if (exists($customized_commands_conversion->{$command})) {
      $self->{'commands_conversion'}->{$command}
          = $customized_commands_conversion->{$command};
    } else {
      my $format_menu = $self->get_conf('FORMAT_MENU');
      if ($format_menu ne 'menu' and $format_menu ne 'menu_no_detailmenu'
          and ($command eq 'menu' or $command eq 'detailmenu')) {
        $self->{'commands_conversion'}->{$command} = undef;
      } elsif (exists($format_raw_commands{$command})
               and !$self->{'expanded_formats'}->{$command}) {
        $self->{'commands_conversion'}->{$command} = undef;
      } elsif (exists($default_commands_conversion{$command})) {
        $self->{'commands_conversion'}->{$command}
           = $default_commands_conversion{$command};
      }
    }
  }

  $self->{'commands_open'} = {};
  my $customized_commands_open
     = Texinfo::Config::GNUT_get_commands_open();
  $customized_commands_open = {} if (!defined($customized_commands_open));
  foreach my $command (keys(%line_commands), keys(%brace_commands),
     keys (%block_commands), keys(%nobrace_commands)) {
    if (exists($customized_commands_open->{$command})) {
      $self->{'commands_open'}->{$command}
          = $customized_commands_open->{$command};
    } elsif (exists($default_commands_open{$command})) {
      $self->{'commands_open'}->{$command}
           = $default_commands_open{$command};
    }
  }

  # get all the customization
  my %style_commands_customized_formatting_info;
  foreach my $command (keys(%default_style_commands_formatting)) {
    foreach my $context (@style_commands_contexts) {
      my $style_commands_formatting_info
        = Texinfo::Config::GNUT_get_style_command_formatting($command, $context);
      if (defined($style_commands_formatting_info)) {
        if (!exists($style_commands_customized_formatting_info{$command})) {
          $style_commands_customized_formatting_info{$command} = {};
        }
        $style_commands_customized_formatting_info{$command}->{$context}
          = $style_commands_formatting_info;
      }
    }
  }

  $self->{'style_commands_formatting'} = {};
  foreach my $command (keys(%default_style_commands_formatting)) {
    $self->{'style_commands_formatting'}->{$command} = {};
    foreach my $context (@style_commands_contexts) {
      if (exists($style_commands_customized_formatting_info{$command})
          and $style_commands_customized_formatting_info{$command}->{$context}) {
        $self->{'style_commands_formatting'}->{$command}->{$context}
          = $style_commands_customized_formatting_info{$command}->{$context};
      } elsif (exists($default_style_commands_formatting{$command}->{$context})) {
        $self->{'style_commands_formatting'}->{$command}->{$context}
          = $default_style_commands_formatting{$command}->{$context};
      }
    }
  }

  my %customized_accent_entities;

  foreach my $accent_command
     (keys(%Texinfo::Convert::Converter::xml_accent_entities)) {
    my ($accent_command_entity, $accent_command_text_with_entities)
      = Texinfo::Config::GNUT_get_accent_command_formatting($accent_command);
    if (defined($accent_command_entity)
        or defined($accent_command_text_with_entities)) {
      $customized_accent_entities{$accent_command} = [$accent_command_entity,
                                           $accent_command_text_with_entities];
    }
  }

  $self->{'accent_entities'} = {};
  foreach my $accent_command
     (keys(%Texinfo::Convert::Converter::xml_accent_entities)) {
    $self->{'accent_entities'}->{$accent_command} = [];

    my ($accent_command_entity, $accent_command_text_with_entities);
    if (exists($customized_accent_entities{$accent_command})) {
      ($accent_command_entity, $accent_command_text_with_entities)
        = @{$customized_accent_entities{$accent_command}};
    }

    if (not defined($accent_command_entity)
        and defined($Texinfo::Convert::Converter::xml_accent_text_with_entities{
                                                              $accent_command})) {
      $accent_command_entity
       = $Texinfo::Convert::Converter::xml_accent_entities{$accent_command};
    }
    if (not defined($accent_command_text_with_entities)
        and defined($Texinfo::Convert::Converter::xml_accent_text_with_entities{
                                                             $accent_command})) {
      $accent_command_text_with_entities
  = $Texinfo::Convert::Converter::xml_accent_text_with_entities{$accent_command};
    }
    # an empty string means no formatting
    if (defined($accent_command_entity)) {
      $self->{'accent_entities'}->{$accent_command} = [$accent_command_entity,
                                           $accent_command_text_with_entities];
    }
  }
  #print STDERR Data::Dumper->Dump([$self->{'accent_entities'}]);

  # get customization only at that point, as the defaults may be changed
  # with the encoding
  my $customized_no_arg_commands_formatting = {};
  foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
    $customized_no_arg_commands_formatting->{$command} = {};
    foreach my $context (@no_args_commands_contexts) {
      my $no_arg_command_customized_formatting
        = Texinfo::Config::GNUT_get_no_arg_command_formatting($command,
                                                              $context);
      if (defined($no_arg_command_customized_formatting)) {
        $customized_no_arg_commands_formatting->{$command}->{$context}
           = $no_arg_command_customized_formatting;
      }
    }
  }

  $self->{'customized_no_arg_commands_formatting'}
    = $customized_no_arg_commands_formatting;

  $self->{'file_id_setting'} = {};
  my $customized_file_id_setting_references
    = Texinfo::Config::GNUT_get_file_id_setting_references();
  if (defined($customized_file_id_setting_references)) {
    # first check the validity of the names
    foreach my $custom_file_id_setting
       (sort(keys(%{$customized_file_id_setting_references}))) {
      if (!exists($customizable_file_id_setting_references{
                                           $custom_file_id_setting})) {
        $self->converter_document_warn(
                       sprintf(__("Unknown file and id setting function: %s"),
                               $custom_file_id_setting));
      } else {
        $self->{'file_id_setting'}->{$custom_file_id_setting}
          = $customized_file_id_setting_references->{$custom_file_id_setting};
      }
    }
  }

  my $customized_formatting_references
       = Texinfo::Config::GNUT_get_formatting_references();
  # first check that all the customized_formatting_references
  # are in default_formatting_references
  if (defined($customized_formatting_references)) {
    foreach my $custom_formatting_ref
       (sort(keys(%{$customized_formatting_references}))) {
      if (!exists($default_formatting_references{$custom_formatting_ref})) {
        $self->converter_document_warn(
              sprintf(__("Unknown formatting function: %s"),
                                          $custom_formatting_ref));
      }
    }
  } else {
    $customized_formatting_references = {};
  }

  $self->{'formatting_function'} = {};
  foreach my $formatting_reference (keys(%default_formatting_references)) {
    if (defined($customized_formatting_references->{$formatting_reference})) {
      $self->{'formatting_function'}->{$formatting_reference}
       = $customized_formatting_references->{$formatting_reference};
    } else {
      $self->{'formatting_function'}->{$formatting_reference}
       = $default_formatting_references{$formatting_reference};
    }
  }

  my $customized_special_unit_info
    = Texinfo::Config::GNUT_get_special_unit_info();
  $customized_special_unit_info = {}
     if (!defined($customized_special_unit_info));

  $self->{'special_unit_info'} = {};
  foreach my $type (keys(%default_special_unit_info)) {
    $self->{'special_unit_info'}->{$type} = {};
    foreach my $special_unit_variety
                      (keys(%{$default_special_unit_info{$type}})) {
      if (exists($customized_special_unit_info->{$type})
          and exists($customized_special_unit_info
                          ->{$type}->{$special_unit_variety})) {
        $self->{'special_unit_info'}->{$type}->{$special_unit_variety}
         = $customized_special_unit_info->{$type}->{$special_unit_variety};
      } else {
        $self->{'special_unit_info'}->{$type}->{$special_unit_variety}
          = $default_special_unit_info{$type}->{$special_unit_variety};
      }
    }
  }

  $self->{'translated_special_unit_info'} = {};
  foreach my $type (keys(%default_translated_special_unit_info)) {
    $self->{'special_unit_info'}->{$type} = {};
    $self->{'special_unit_info'}->{$type.'_tree'} = {};
    $self->{'translated_special_unit_info'}->{$type.'_tree'} = [$type, {}];
    foreach my $special_unit_variety
                 (keys(%{$default_translated_special_unit_info{$type}})) {
      if (exists($customized_special_unit_info->{$type})
          and exists($customized_special_unit_info
                          ->{$type}->{$special_unit_variety})) {
        $self->{'translated_special_unit_info'}->{$type.'_tree'}
                                               ->[1]->{$special_unit_variety}
         = $customized_special_unit_info->{$type}->{$special_unit_variety};
      } else {
        $self->{'translated_special_unit_info'}->{$type.'_tree'}
                                               ->[1]->{$special_unit_variety}
          = $default_translated_special_unit_info{$type}
                                                   ->{$special_unit_variety};
      }
    }
  }

  my $customized_special_unit_body
     = Texinfo::Config::GNUT_get_formatting_special_unit_body_references();

  $self->{'special_unit_body'} = {};
  foreach my $special_unit_variety (keys(%defaults_format_special_unit_body_contents)) {
    $self->{'special_unit_body'}->{$special_unit_variety}
      = $defaults_format_special_unit_body_contents{$special_unit_variety};
  }
  foreach my $special_unit_variety (keys(%$customized_special_unit_body)) {
    $self->{'special_unit_body'}->{$special_unit_variety}
      = $customized_special_unit_body->{$special_unit_variety};
  }

  # "directions" not associated to output units, but associated to text.
  $self->{'global_texts_directions'} = {};
  $self->{'global_texts_directions'}->{'Space'} = 1;

  $self->{'all_directions'} = {};
  foreach my $direction (@all_directions_except_special_units) {
    $self->{'all_directions'}->{$direction} = 1;
  }

  $self->{'customized_text_directions'}
    = Texinfo::Config::GNUT_get_text_directions();

  if (defined($self->{'customized_text_directions'})) {
    foreach my $direction (keys(%{$self->{'customized_text_directions'}})) {
      if (!exists($self->{'all_directions'}->{$direction})) {
        $self->{'global_texts_directions'}->{$direction} = 1;
        $self->{'all_directions'}->{$direction} = 1;
      }
    }
  }

  $self->{'customized_global_directions'}
    = Texinfo::Config::GNUT_get_global_directions();

  if (defined($self->{'customized_global_directions'})) {
    foreach my $direction (keys(%{$self->{'customized_global_directions'}})) {
      $self->{'all_directions'}->{$direction} = 1;
    }
  }

  # customized_global_directions are not used further here, as the output
  # unit need to be found with the document

  foreach my $variety (keys(%{$self->{'special_unit_info'}->{'direction'}})) {
    my $direction = $self->{'special_unit_info'}->{'direction'}->{$variety};
    if (defined($direction)) {
      $self->{'all_directions'}->{$direction} = 1;
    }
  }
  #print STDERR join('|', sort(keys(%all_directions)))."\n";

  my $customized_direction_strings
      = Texinfo::Config::GNUT_get_direction_string_info();
  $customized_direction_strings = {}
    if (!defined($customized_direction_strings));

  # Fill the translated direction strings information, corresponding to:
  #   - strings already converted
  #   - strings not already converted
  # Each of those types of translated strings are translated later on
  # and the translated values are put in $self->{'direction_strings'}.
  $self->{'translated_direction_strings'} = {};
  foreach my $string_type (keys(%default_translated_directions_strings)) {
    $self->{'translated_direction_strings'}->{$string_type} = {};
    foreach my $direction (keys(%{$self->{'all_directions'}})) {
      if (exists($customized_direction_strings->{$string_type})
          and exists($customized_direction_strings->{$string_type}->{$direction})) {
        $self->{'translated_direction_strings'}->{$string_type}->{$direction}
          = $customized_direction_strings->{$string_type}->{$direction};
      } else {
        if (exists($default_translated_directions_strings{$string_type}
                                                     ->{$direction})
            and exists($default_translated_directions_strings{$string_type}
                                           ->{$direction}->{'converted'})) {
          $self->{'translated_direction_strings'}->{$string_type}
                  ->{$direction} = {'converted' => {}};
          foreach my $context ('normal', 'string') {
            $self->{'translated_direction_strings'}->{$string_type}
                     ->{$direction}->{'converted'}->{$context}
               = $default_translated_directions_strings{$string_type}
                                                 ->{$direction}->{'converted'};
          }
        } else {
          $self->{'translated_direction_strings'}->{$string_type}->{$direction}
            = $default_translated_directions_strings{$string_type}->{$direction};
        }
      }
    }
  }

  # the customization information are not used further here, as
  # substitute_html_non_breaking_space is used and it depends on the document
  $self->{'customized_direction_strings'} = $customized_direction_strings;

  $self->{'stage_handlers'} = Texinfo::Config::GNUT_get_stage_handlers();


  # XS parser initialization
  if ($self->{'converter_descriptor'} and $XS_convert) {

    _XS_html_converter_get_customization($self,
                             \%default_formatting_references,
                             \%default_css_string_formatting_references,
                             \%default_commands_open,
                             \%default_commands_conversion,
                             \%default_css_string_commands_conversion,
                             \%default_types_open,
                             \%default_types_conversion,
                             \%default_css_string_types_conversion,
                             \%default_output_units_conversion,
                             \%defaults_format_special_unit_body_contents,
                             $customized_upper_case_commands,
                             $customized_code_types,
                             $customized_pre_class_types,
                             \%customized_accent_entities,
                             \%style_commands_customized_formatting_info,
                             $customized_no_arg_commands_formatting,
                             $customized_special_unit_info,
                             $customized_direction_strings
                            );
  }

  return $self;
}

# remove data that leads to cycles related to output units
# and references to output units.
sub converter_reset($) {
  my $self = shift;

  # remove references to output units
  if (exists($self->{'global_units_directions'})) {
    %{$self->{'global_units_directions'}} = ();
  }

  # Cannot do that, the content is still needed by the Converter
  #@{$self->{'document_units'}} = ();
  $self->{'document_units'} = [];
}

# remove data that leads to cycles.
sub converter_destroy($) {
  my $self = shift;

  delete $self->{'current_node'};

  if (exists($self->{'converter_info'})) {
    foreach my $key ('document', 'simpletitle_tree', 'title_tree') {
      delete $self->{'converter_info'}->{$key};
    }
  }

  delete $self->{'current_root_command'};

  # a separate cache used if the user defines the translate_message function.
  delete $self->{'translation_cache'};

  # remove shared conversion states pointing to elements
  if (exists($self->{'shared_conversion_state'})) {
    if (exists($self->{'shared_conversion_state'}->{'nodedescription'})
        and exists($self->{'shared_conversion_state'}->{'nodedescription'}
                               ->{'formatted_nodedescriptions'})) {
      delete $self->{'shared_conversion_state'}->{'nodedescription'}
                               ->{'formatted_nodedescriptions'};
    }
    if (exists($self->{'shared_conversion_state'}->{'quotation'})
        and exists($self->{'shared_conversion_state'}->{'quotation'}
                                       ->{'elements_authors'})) {
      delete $self->{'shared_conversion_state'}->{'quotation'}
                                       ->{'elements_authors'};
    }
  }

  if (exists($self->{'no_arg_commands_formatting'})) {
    foreach my $cmdname (keys(%{$self->{'no_arg_commands_formatting'}})) {
      my $no_arg_command_ctx = $self->{'no_arg_commands_formatting'}->{$cmdname};
      foreach my $context (keys(%{$no_arg_command_ctx})) {
        my $tree = $no_arg_command_ctx->{$context}->{'translated_tree'};
        if (defined($tree)) {
          # always a copy
          Texinfo::ManipulateTree::tree_remove_parents($tree);
        }
      }
    }
  }

  # could have been better to remove references to trees only, but it
  # requires analysing the key names.
  delete $self->{'special_unit_info'};
  delete $self->{'translated_special_unit_info'};

  if (exists($self->{'targets'})) {
    foreach my $command (keys(%{$self->{'targets'}})) {
      my $target = $self->{'targets'}->{$command};
      # can be tree elements or results of translations through cdt
      delete $target->{'tree'};
      delete $target->{'tree_nonumber'};
      # tree elements
      delete $target->{'name_tree'};
      delete $target->{'name_tree_nonumber'};
      delete $target->{'root_element_command'};
      delete $target->{'node_command'};
    }
  }
}

sub _XS_html_convert_tree($$;$) {
  return undef;
}

# the entry point for _convert
sub convert_tree($$;$) {
  my ($self, $tree, $explanation) = @_;

  # No XS, convert_tree is not called on trees registered in XS
  #my $XS_result = _XS_html_convert_tree($self, $tree, $explanation);
  #return $XS_result if (defined($XS_result));

  # when formatting accents, goes through xml_accent without
  # explanation, as explanation is not in the standard API, but
  # otherwise the coverage of explanations should be pretty good
  #cluck if (! defined($explanation));
  #print STDERR "CONVERT_TREE".(defined($explanation) ? " ".$explanation : '')."\n"
  #    if ($self->get_conf('DEBUG'));
  return _convert($self, $tree, $explanation);
}

# Protect an url, in which characters with specific meaning in url are
# considered to have their specific meaning.
sub url_protect_url_text($$) {
  my ($self, $input_string) = @_;

  # turn end of lines to spaces, as it is most likely what is expected
  # rather than a percent encoded end of line.
  $input_string =~ s/[\n\r]+/ /g;
  # percent encode character string.  It is better use UTF-8 irrespective
  # of the actual charset of the HTML output file, according to the tests done.
  my $href = encode("UTF-8", $input_string);
  # protect 'ligntly', do not protect unreserved and reserved characters + the % itself
  $href =~ s/([^^A-Za-z0-9\-_.!~*'()\$&+,\/:;=\?@\[\]\#%])/ sprintf "%%%02x", ord $1 /eg;
  return &{$self->formatting_function('format_protect_text')}($self, $href);
}

# Protect a file path used in an url.  Characters appearing in file paths
# are not protected.   All the other characters that can be percent
# protected are protected, including characters with specific meaning in url.
sub url_protect_file_text($$) {
  my ($self, $input_string) = @_;

  # turn end of lines to spaces, as it is most likely what is expected.
  $input_string =~ s/[\n\r]+/ /g;
  # percent encode character string.  It is better use UTF-8 irrespective
  # of the actual charset of the HTML output file, according to the tests done.
  my $href = encode("UTF-8", $input_string);
  # protect everything that can be special in url except ~, / and : that could
  # appear in file names and does not have much risk in being incorrectly
  # interpreted (for :, the interpretation as a scheme delimiter may be possible).
  $href =~ s/([^^A-Za-z0-9\-_.~\/:])/ sprintf "%%%02x", ord $1 /eg;
  return &{$self->formatting_function('format_protect_text')}($self, $href);
}

sub _normalized_to_id($) {
  my $id = shift;

  if (!defined($id)) {
    cluck "_normalized_to_id id not defined";
    return '';
  }
  $id =~ s/^([0-9_])/g_t$1/;
  return $id;
}

sub _default_format_css_lines($;$) {
  my ($self, $filename) = @_;

  return '' if ($self->get_conf('NO_CSS'));

  my $css_refs = $self->get_conf('CSS_REFS');
  my $css_element_classes = $self->html_get_css_elements_classes($filename);
  my $css_import_lines = $self->css_get_info('imports');
  my $css_rule_lines = $self->css_get_info('rules');

  return '' if !@$css_import_lines and !@$css_element_classes
                 and !@$css_rule_lines
                 and (!defined($css_refs) or !@$css_refs);

  my $css_text = "<style type=\"text/css\">\n";
  $css_text .= join('', @$css_import_lines) . "\n"
    if (@$css_import_lines);
  foreach my $element_class (@$css_element_classes) {
    my $css_style = $self->css_get_selector_style($element_class);
    $css_text .= "$element_class {$css_style}\n"
      if defined($css_style);
  }
  $css_text .= join('', @$css_rule_lines) . "\n"
    if (@$css_rule_lines);
  $css_text .= "</style>\n";
  foreach my $ref (@$css_refs) {
    $css_text .= $self->close_html_lone_element(
         '<link rel="stylesheet" type="text/css" href="'.
                $self->url_protect_url_text($ref).'"')."\n";
  }
  return $css_text;
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
      $css_file_path = Texinfo::Common::locate_include_file($css_file,
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
  foreach my $line (@css_import_lines) {
    $self->css_add_info('imports', $line);
  }
  foreach my $line (@css_rule_lines) {
    $self->css_add_info('rules', $line);
  }
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
      = Texinfo::Convert::NodeNameNormalization::convert_to_identifier(
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


sub _new_sectioning_command_target($$) {
  my ($self, $command) = @_;

  my ($normalized_name, $filename)
    = $self->normalized_sectioning_command_filename($command);

  my $target_base = _normalized_to_id($normalized_name);
  if ($target_base !~ /\S/ and $command->{'cmdname'} eq 'top') {
    # @top is allowed to be empty.  In that case it gets this target name
    $target_base = 'SEC_Top';
    $normalized_name = $target_base;
  }
  my $nr=1;
  my $target = $target_base;
  if ($target_base ne '') {
    $target = _unique_target($self, $target_base);
  } else {
    $target = '';
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
  if ($self->get_conf('DEBUG')) {
    print STDERR "Register $command->{'cmdname'} $target\n";
  }
  $self->{'targets'}->{$command} = {
                           'target' => $target,
                           'section_filename' => $filename,
                          };
  _register_id($self, $target);
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

# This set with two different codes
#  * the target information, id and normalized filename of 'identifiers_target',
#    ie everything that may be the target of a ref: @node, @float label,
#    @anchor, @namedanchor.
#  * The target information of sectioning elements
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
                                                              ->{'normalized'},
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
        } elsif ($self->get_conf('DEBUG')) {
          warn "user-defined node file name undef for `$node_filename'\n";
        }
      }
      if ($self->get_conf('DEBUG')) {
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

sub _html_get_tree_root_element($$;$);

# If $FIND_CONTAINER is set, the element that holds the command output
# is found, otherwise the element that holds the command is found.  This is
# mostly relevant for footnote only.
# If no known root element type is found, the returned root element is undef,
# and not set to the element at the tree root
sub _html_get_tree_root_element($$;$) {
  my ($self, $command, $find_container) = @_;

  # can be used to debug/understand what is going on
  #my $debug = 1;

  my $current = $command;
  #print STDERR "START ".Texinfo::Common::debug_print_element($current)."\n" if ($debug);

  my ($output_unit, $root_command);
  while (1) {
    if (exists($current->{'type'})
       and $current->{'type'} eq 'special_unit_element') {
      return ($current->{'associated_unit'}, $current);
    }
    if (exists($current->{'cmdname'})) {
      if (exists($root_commands{$current->{'cmdname'}})) {
        $root_command = $current;
        #print STDERR "CMD ROOT $current->{'cmdname'}\n" if ($debug);
      } elsif (exists($block_commands{$current->{'cmdname'}})
               and $block_commands{$current->{'cmdname'}} eq 'region') {
        if ($current->{'cmdname'} eq 'copying'
            and exists($self->{'document'})) {
          my $global_commands
              = $self->{'document'}->global_commands_information();
          if (defined($global_commands)
              and exists($global_commands->{'insertcopying'})) {
            foreach my $insertcopying (@{$global_commands
                                                        ->{'insertcopying'}}) {
              #print STDERR "INSERTCOPYING\n" if ($debug);
              my ($output_unit, $root_command)
                = _html_get_tree_root_element($self, $insertcopying,
                                                     $find_container);
              return ($output_unit, $root_command)
                if (defined($output_unit) or defined($root_command));
            }
          }
        } elsif ($current->{'cmdname'} eq 'titlepage'
                 and $self->get_conf('USE_TITLEPAGE_FOR_TITLE')
                 and $self->get_conf('SHOW_TITLE')) {
          #print STDERR "FOR titlepage document_units [0]\n" if ($debug);
          return ($self->{'document_units'}->[0],
                  $self->{'document_units'}->[0]->{'unit_command'});
        }
        die "Problem $output_unit, $root_command" if (defined($output_unit)
                                                  or defined($root_command));
        return (undef, undef);
      } elsif ($find_container) {
        # @footnote and possibly @*contents when a separate element is set
        my ($special_unit_variety, $special_unit, $class_base,
            $special_unit_direction)
         = $self->command_name_special_unit_information($current->{'cmdname'});
        if (defined($special_unit)) {
          #print STDERR "SPECIAL $current->{'cmdname'}: $special_unit_variety ($special_unit_direction)\n" if ($debug);
          return ($special_unit, undef);
        }
      }
    }
    if (exists($current->{'associated_unit'})) {
      #print STDERR "ASSOCIATED_UNIT ".Texinfo::Common::debug_print_output_unit($current->{'associated_unit'})."\n" if ($debug);
      return ($current->{'associated_unit'}, $root_command);
    } elsif (exists($current->{'parent'})) {
      #print STDERR "PARENT ".Texinfo::Common::debug_print_element($current->{'parent'})."\n" if ($debug);
      $current = $current->{'parent'};
    } else {
      #print STDERR "UNKNOWN ROOT ".Texinfo::Common::debug_print_element($current)."\n" if ($debug);
      return (undef, $root_command);
    }
  }
}

sub _html_set_pages_files($$$$$$$$) {
  my ($self, $output_units, $special_units, $associated_output_units,
      $output_file, $destination_directory, $output_filename,
      $document_name) = @_;

  $self->initialize_output_units_files();

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
    my $node_top;
    $node_top = $identifiers_target->{'Top'}
                               if (defined($identifiers_target));

    my $top_node_filename = $self->top_node_filename($document_name);
    my $node_top_output_unit;
    if (defined($node_top) and defined($top_node_filename)) {
      $node_top_output_unit = $node_top->{'associated_unit'};
      die "BUG: No output unit for top node" if (!defined($node_top_output_unit));
      push @filenames_order, $top_node_filename;
      $unit_file_name_paths{$node_top_output_unit} = $top_node_filename;
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
      next if ($node_top_output_unit and $output_unit eq $node_top_output_unit);

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
                or !exists($root_command->{'extra'}->{'normalized'})
                or !exists($identifiers_target->{
                           $root_command->{'extra'}->{'normalized'}})) {
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
                and !defined($node_top) and defined($top_node_filename)) {
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
            if ($file_nr == 0 and !defined($node_top)
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
             if ($self->get_conf('DEBUG'));
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
                 if ($self->get_conf('DEBUG'));
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

# $ROOT is a parsed Texinfo tree.  Return a list of the "elements" we need to
# output in the HTML file(s).  Each "element" is what can go in one HTML file,
# such as the content between @node lines in the Texinfo source.
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

sub _set_special_units_targets_files($$$) {
  my ($self, $special_units, $document_name) = @_;

  my $extension = '';
  $extension = $self->get_conf('EXTENSION')
    if (defined($self->get_conf('EXTENSION')));

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

    if ($self->get_conf('DEBUG')) {
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
    if ($self->get_conf('DEBUG')) {
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

sub _prepare_special_units_directions($$) {
  my ($self, $special_units) = @_;

  return unless(defined($special_units));

  foreach my $special_unit (@$special_units) {
    $special_unit->{'directions'}->{'This'} = $special_unit;
  }
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
          # FIXME check that relative directions are not replaced by
          # global_units_directions (as done in C)?  It may not be an issue.

        # Determine the document unit corresponding to the direction
        # node name Texinfo code

        # Parse the customized direction node name Texinfo code
        my $node_element;
        my $parser = Texinfo::Parser::parser({'NO_INDEX' => 1,
                                              'NO_USER_COMMANDS' => 1,});
        my $tree = $parser->parse_texi_line($node_texi_name, undef, 1);
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
       = Texinfo::Convert::NodeNameNormalization::convert_to_identifier($tree);
          if ($normalized_node ne '' and $normalized_node =~ /[^-]/) {
            $node_element = $self->label_command($normalized_node);
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
    print STDERR "GLOBAL DIRECTIONS:\n";
    foreach my $global_direction (@global_directions_order) {
      if (defined($self->global_direction_unit($global_direction))) {
        my $global_unit = $self->global_direction_unit($global_direction);
        print STDERR " $global_direction"
            # uncomment to get the perl object name
            # ."($global_unit)"
     .': '. Texinfo::OutputUnits::output_unit_texi($global_unit)."\n";
      }
    }
    print STDERR "\n";
  }

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

sub _prepare_index_entries_targets($) {
  my $self = shift;

  my $indices_information;
  if (exists($self->{'document'})) {
    $indices_information = $self->{'document'}->indices_information();
  }

  if (defined($indices_information)) {
    my $no_unidecode;
    $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                          and !$self->get_conf('USE_UNIDECODE'));
    my $in_test;
    $in_test = 1 if ($self->get_conf('TEST'));

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
          = Texinfo::Common::index_content_element($main_entry_element, 1);
        # construct element to convert to a normalized identifier to use as
        # hrefs target
        my $normalize_index_element = Texinfo::TreeElement::new(
           {'contents' => [$entry_reference_content_element]});

        my $subentries_tree
         = $self->comma_index_subentries_tree($main_entry_element, ' ');

        if (defined($subentries_tree)) {
          push @{$normalize_index_element->{'contents'}},
                    @{$subentries_tree->{'contents'}};
        }

        my $normalized_index =
          Texinfo::Convert::NodeNameNormalization::normalize_transliterate_texinfo(
             $normalize_index_element, $in_test, $no_unidecode);
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
        if ($self->get_conf('DEBUG'));
    }
  }
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

# returns file base name, extension and anchor associated to node
# (anchor, float...) command adhering strictly to the HTML Xref specification.
# The $CROSSREF_EXTENSION argument should be the external crossreference
# filename extension, if undef, the $EXTENSION argument is used.
sub standard_label_id_file($$$$$) {
  my ($self, $normalized, $label_element, $crossref_extension,
      $extension) = @_;

  my $target;
  my $filename;
  if (!defined($normalized) and defined($label_element)) {
    $normalized
      = Texinfo::Convert::NodeNameNormalization::convert_to_identifier(
        $label_element);
  }
  my $options = \%Texinfo::Options::converter_customization_options;

  if (defined($normalized)) {
    $target = _normalized_to_id($normalized);

    # use default, not user-defined value
    my $basefilename_length = $options->{'BASEFILENAME_LENGTH'};
    $filename = substr($normalized, 0, $basefilename_length);
  } else {
    $target = '';
    $filename = '';
  }
  # to find out the Top node, one could check $normalized
  if (defined($self->{'file_id_setting'}->{'label_target_name'})) {
    $target = &{$self->{'file_id_setting'}->{'label_target_name'}}($self,
                             $normalized, $label_element, $target);
  }

  my $file_extension = '';
  my $external_extension = $crossref_extension;
  $external_extension = $extension
    if (not defined($external_extension));
  $file_extension = '.' . $external_extension
    if (defined($external_extension) and $external_extension ne '');

  return ($filename, $file_extension, $target);
}

sub _external_node_href($$$) {
  my ($self, $external_node,
  # for messages only
     $source_command) = @_;

  my $normalized = $external_node->{'extra'}->{'normalized'};
  my $node_contents = $external_node->{'extra'}->{'node_content'};
  #print STDERR "external_node: ".join('|', keys(%$external_node))."\n";
  my ($target_filebase, $external_file_extension, $target)
     = $self->standard_label_id_file($normalized, $node_contents,
                               $self->get_conf('EXTERNAL_CROSSREF_EXTENSION'),
                                     $defaults{'EXTENSION'});

  # always undef if conversion is called through convert()
  my $default_target_split = $self->get_conf('EXTERNAL_CROSSREF_SPLIT');

  # initialize to $default_target_split
  my $is_target_split;
  if ($default_target_split) {
    $is_target_split = 1;
  } else {
    $is_target_split = 0;
  }
  # used if !$is_target_split
  my $file = '';
  # used if $is_target_split
  my $directory = '';
  if (exists($external_node->{'extra'}->{'manual_content'})) {
    Texinfo::Convert::Text::set_options_code($self->{'convert_text_options'});
    my $manual_name = Texinfo::Convert::Text::convert_to_text(
                            $external_node->{'extra'}->{'manual_content'},
                            $self->{'convert_text_options'});
    Texinfo::Convert::Text::reset_options_code($self->{'convert_text_options'});
    if ($self->get_conf('IGNORE_REF_TO_TOP_NODE_UP') and $target eq '') {
      my $top_node_up = $self->get_conf('TOP_NODE_UP');
      if (defined($top_node_up) and "($manual_name)" eq $top_node_up) {
        return '';
      }
    }
    my $manual_base = $manual_name;
    # in 2023 there were manuals with .info.  Warning added in 2024.
    if ($manual_base =~ s/(\.info?)$//) {
      $self->converter_line_warn(sprintf(__(
                    "do not set %s suffix in reference for manual `%s'"),
                                         $1, $manual_name),
                             $source_command->{'source_info'});
    }
    $manual_base =~ s/^.*\///;
    my $split_found;
    my $htmlxref_href;
    my $htmlxref_mode = $self->get_conf('HTMLXREF_MODE');

    if (!defined($htmlxref_mode) or $htmlxref_mode ne 'none') {
      if (exists($self->{'htmlxref'}->{$manual_base})) {
        my $htmlxref_info = $self->{'htmlxref'}->{$manual_base};
        my $document_split = $self->get_conf('SPLIT');
        $document_split = 'mono' if (!$document_split);
        foreach my $split_ordered (@{$htmlxref_entries{$document_split}}) {
          if (exists($htmlxref_info->{$split_ordered})) {
            $split_found = $split_ordered;
            if ($htmlxref_info->{$split_ordered} ne '') {
              $htmlxref_href
               = $self->url_protect_url_text($htmlxref_info->{$split_ordered});
            }
            last;
          }
        }
      }
      if (defined($split_found)) {
        if ($split_found eq 'mono') {
          $is_target_split = 0;
        } else {
          $is_target_split = 1;
        }
      } else { # nothing specified for that manual, use default
        if ($self->get_conf('CHECK_HTMLXREF')) {
          if (defined($source_command) and $source_command->{'source_info'}) {
            if (!_check_htmlxref_already_warned($self, $manual_name,
                                         $source_command->{'source_info'})) {
              $self->converter_line_warn(sprintf(__(
              "no HTML cross-references entry found for `%s'"), $manual_name),
                               $source_command->{'source_info'});
            }
          } else {
            if (!_check_htmlxref_already_warned($self, $manual_name, undef)) {
              $self->converter_document_warn(sprintf(__(
                "no HTML cross-references entry found for `%s'"), $manual_name),
                );
              cluck;
            }
          }
        }
      }
    }

    if ($is_target_split) {
      if (defined($htmlxref_href)) {
        $directory = $htmlxref_href;
      } else {
        if (defined($self->get_conf('EXTERNAL_DIR'))) {
          $directory = $self->get_conf('EXTERNAL_DIR')."/$manual_base";
        } elsif ($self->get_conf('SPLIT')) {
          $directory = "../$manual_base";
        }
        my $output_format = $self->get_conf('TEXINFO_OUTPUT_FORMAT');
        if (defined($output_format) and $output_format ne '') {
          $directory .= '_'.$output_format;
        }
        $directory = $self->url_protect_file_text($directory);
      }
      $directory .= "/";
    } else {# target not split
      if (defined($htmlxref_href)) {
        $file = $htmlxref_href;
      } else {
        if (defined($self->get_conf('EXTERNAL_DIR'))) {
          $file = $self->get_conf('EXTERNAL_DIR')."/$manual_base";
        } elsif ($self->get_conf('SPLIT')) {
          $file = "../$manual_base";
        } else {
          $file = $manual_base;
        }
        $file .= $external_file_extension;

        $file = $self->url_protect_file_text($file);
      }
    }
  }

  if ($is_target_split) {
    my $file_name;
    if (($target eq 'Top' or $target eq '')
        and defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
      $file_name = $self->get_conf('TOP_NODE_FILE_TARGET');
    } else {
      $file_name = $target_filebase . $external_file_extension;
    }
    if (defined($self->{'file_id_setting'}->{'external_target_split_name'})) {
      ($target, $directory, $file_name)
        = &{$self->{'file_id_setting'}->{'external_target_split_name'}}($self,
                             $normalized, $external_node, $target,
                             $directory, $file_name);
      $directory = '' if (!defined($directory));
      $file_name = '' if (!defined($file_name));
      $target = '' if (!defined($target));
    }
    my $result = $directory . $file_name;
    if ($target ne '') {
      $result .= '#' . $target;
    }
    return $result;
  } else {
    if ($target eq '') {
      $target = 'Top';
    }
    if (defined($self->{'file_id_setting'}->{
                          'external_target_non_split_name'})) {
      ($target, $file)
       = &{$self->{'file_id_setting'}->{'external_target_non_split_name'}}($self,
                             $normalized, $external_node, $target, $file);
      $file = '' if (!defined($file));
      $target = '' if (!defined($target));
    }
    my $result = $file;
    if ($target ne '') {
      $result .= '#' . $target;
    }
    return $result;
  }
}

# Output a list of the nodes immediately below this one
sub _mini_toc($$) {
  my ($self, $section_relations) = @_;

  my $result = '';
  my $entry_index = 0;

  if (defined($section_relations)
      and exists($section_relations->{'section_children'})
      and scalar(@{$section_relations->{'section_children'}})) {
    $result .= $self->html_attribute_class('ul', ['mini-toc']).">\n";

    foreach my $section_relations
                         (@{$section_relations->{'section_children'}}) {
      my $section = $section_relations->{'element'};
      # using command_text leads to the same HTML formatting, but does not give
      # the same result for the other files, as the formatting is done in a
      # global context, while taking the tree first and calling convert_tree
      # converts in the current page context.
      #my $text = $self->command_text($section, 'text_nonumber');
      my $tree = $self->command_tree($section, 1);
      # happens with empty sectioning command
      next if (!defined($tree));
      my $text = $self->convert_tree($tree, "mini_toc \@$section->{'cmdname'}");

      $entry_index++;
      my $accesskey = '';
      $accesskey = " accesskey=\"$entry_index\""
        if ($self->get_conf('USE_ACCESSKEY') and $entry_index < 10);

      my $href = $self->command_href($section);
      if ($text ne '') {
        $result .= "<li>";
        if (defined($href)) {
          $result .= "<a href=\"$href\"$accesskey>$text</a>";
        } else {
          $result .= $text;
        }
        $result .= "</li>\n";
      }
    }
    $result .= "</ul>\n";
  }
  return $result;
}

sub _default_format_contents($$;$$) {
  my ($self, $cmdname, $command, $filename) = @_;

  $filename = $self->current_filename() if (!defined($filename));

  my $document = $self->get_info('document');
  my $sections_list;
  my $sectioning_root;
  if (defined($document)) {
    $sections_list = $document->sections_list();
    $sectioning_root = $document->sectioning_root();
  }
  return ''
   if (!defined($sections_list) or !scalar(@$sections_list)
       # this should not happen with $sections_list as set from Structuring
       # sectioning_structure, but could happen with another source.
       # We consider that if sectioning_root is set as usual, all the
       # fields are set consistently with what sectioning_structure would
       # have set.
       or !defined($sectioning_root));

  my $is_contents;
  $is_contents = 1 if ($cmdname eq 'contents');

  my $min_root_level = $sectioning_root->{'section_children'}->[0]
                                ->{'element'}->{'extra'}->{'section_level'};
  my $max_root_level = $min_root_level;
  foreach my $top_relations (@{$sectioning_root->{'section_children'}}) {
    my $top_section = $top_relations->{'element'};
    $min_root_level = $top_section->{'extra'}->{'section_level'}
      if ($top_section->{'extra'}->{'section_level'} < $min_root_level);
    $max_root_level = $top_section->{'extra'}->{'section_level'}
      if ($top_section->{'extra'}->{'section_level'} > $max_root_level);
  }
  # chapter level elements are considered top-level here.
  $max_root_level = 1 if ($max_root_level < 1);
  #print STDERR "ROOT_LEVEL Max: $max_root_level, Min: $min_root_level\n";
  my @toc_ul_classes;
  push @toc_ul_classes, 'toc-numbered-mark'
    if ($self->get_conf('NUMBER_SECTIONS'));

  my $result = '';
  if ($is_contents and !defined($self->get_conf('BEFORE_TOC_LINES'))
      or (!$is_contents
          and !defined($self->get_conf('BEFORE_SHORT_TOC_LINES')))) {
    $result .= $self->html_attribute_class('div', [$cmdname]).">\n";
  } elsif($is_contents) {
    $result .= $self->get_conf('BEFORE_TOC_LINES');
  } else {
    $result .= $self->get_conf('BEFORE_SHORT_TOC_LINES');
  }

  my $has_toplevel_contents;
  if (@{$sectioning_root->{'section_children'}} > 1) {
    $result .= $self->html_attribute_class('ul', \@toc_ul_classes) .">\n";
    $has_toplevel_contents = 1;
  }

  my $link_to_toc = (!$is_contents and $self->get_conf('SHORT_TOC_LINK_TO_TOC')
                     and ($self->get_conf('contents'))
                     and ($self->get_conf('CONTENTS_OUTPUT_LOCATION') ne 'inline'
                          or _has_contents_or_shortcontents($self)));

  foreach my $top_relations (@{$sectioning_root->{'section_children'}}) {
    my $section_relations = $top_relations;
 SECTION:
    while (defined($section_relations)) {
      my $section = $section_relations->{'element'};
      if ($section->{'cmdname'} ne 'top') {
        my $text = $self->command_text($section);
        my $href;
        if ($link_to_toc) {
          $href = $self->command_contents_href($section, 'contents', $filename);
        } else {
          $href = $self->command_href($section, $filename);
        }
        my $toc_id = $self->command_contents_target($section, $cmdname);
        if ($text ne '') {
          # no indenting for shortcontents
          $result .= (' ' x
            (2*($section->{'extra'}->{'section_level'} - $min_root_level)))
              if ($is_contents);
          $result .= "<li>";
          if ($toc_id ne '' or defined($href)) {
            $result .= "<a";
            if ($toc_id ne '') {
              $result .= " id=\"$toc_id\"";
            }
            if (defined($href)) {
              $result .= " href=\"$href\"";
            }
            if (exists($section_relations->{'associated_node'})
                and $section_relations->{'associated_node'}
                            ->{'element'}->{'extra'}->{'isindex'}) {
              $result .= ' rel="index"';
            }
            $result .= ">$text</a>";
          } else {
            $result .= $text;
          }
        }
      } elsif (exists($section_relations->{'section_children'})
               and scalar(@{$section_relations->{'section_children'}})
               and $has_toplevel_contents) {
        $result .= "<li>";
      }
      # for shortcontents don't do child if child is not toplevel
      if (exists($section_relations->{'section_children'})
          and ($is_contents
               or $section->{'extra'}->{'section_level'} < $max_root_level)) {
        # no indenting for shortcontents
        $result .= "\n"
         . ' ' x (2*($section->{'extra'}->{'section_level'} - $min_root_level))
            if ($is_contents);
        $result .= $self->html_attribute_class('ul', \@toc_ul_classes) .">\n";
        $section_relations = $section_relations->{'section_children'}->[0];
      } elsif (exists($section_relations->{'section_directions'})
               and exists($section_relations->{'section_directions'}->{'next'})
               and $section->{'cmdname'} ne 'top') {
        $result .= "</li>\n";
        last if ($section_relations eq $top_relations);
        $section_relations
           = $section_relations->{'section_directions'}->{'next'};
      } else {
        #last if ($section eq $top_section);
        if ($section_relations eq $top_relations) {
          $result .= "</li>\n" unless ($section->{'cmdname'} eq 'top');
          last;
        }
        while (exists($section_relations->{'section_directions'})
               and exists($section_relations->{'section_directions'}->{'up'})) {
          $section_relations
            = $section_relations->{'section_directions'}->{'up'};
          $section = $section_relations->{'element'};

          $result .= "</li>\n"
           . ' ' x (2*($section->{'extra'}->{'section_level'} - $min_root_level))
            . "</ul>";
          if ($section_relations eq $top_relations) {
            $result .= "</li>\n" if ($has_toplevel_contents);
            last SECTION;
          }
          if (exists($section_relations->{'section_directions'})
              and exists($section_relations->{'section_directions'}
                                                             ->{'next'})) {
            $result .= "</li>\n";
            $section_relations
              = $section_relations->{'section_directions'}->{'next'};
            last;
          }
        }
      }
    }
  }
  if (scalar(@{$sectioning_root->{'section_children'}}) > 1) {
    $result .= "\n</ul>";
  }
  if ($is_contents and !defined($self->get_conf('AFTER_TOC_LINES'))
      or (!$is_contents
           and !defined($self->get_conf('AFTER_SHORT_TOC_LINES')))) {
    $result .= "\n</div>\n";
  } elsif ($is_contents) {
    $result .= $self->get_conf('AFTER_TOC_LINES');
  } else {
    $result .= $self->get_conf('AFTER_SHORT_TOC_LINES');
  }
  return $result;
}

sub _default_format_program_string($) {
  my $self = shift;

  if (defined($self->get_conf('PROGRAM'))
      and $self->get_conf('PROGRAM') ne ''
      and defined($self->get_conf('PACKAGE_URL'))) {
    return $self->convert_tree(
      $self->cdt('This document was generated on @emph{@today{}} using @uref{{program_homepage}, @emph{{program}}}.',
         { 'program_homepage' => Texinfo::TreeElement::new(
                {'text' => $self->get_conf('PACKAGE_URL')}),
           'program' => Texinfo::TreeElement::new(
                      {'text' => $self->get_conf('PROGRAM')}) }),
                              'Tr program string program');
  } else {
    return $self->convert_tree(
      $self->cdt('This document was generated on @emph{@today{}}.'),
                               'Tr program string date');
  }
}

sub _default_format_end_file($$$) {
  my ($self, $filename, $output_unit) = @_;

  my $result = '';
  if ($self->get_conf('PROGRAM_NAME_IN_FOOTER')) {
    $result .= "<p>\n  ";
    my $open = $self->html_attribute_class('span', ['program-in-footer']);
    $result .= $open.'>' if ($open ne '');

    my $program_string
      = &{$self->formatting_function('format_program_string')}($self);
    $result .= $program_string;

    $result .= '</span>' if ($open ne '');
    $result .= "\n</p>";
  }
  $result .= "\n\n";

  my $pre_body_close = $self->get_conf('PRE_BODY_CLOSE');
  $result .= $pre_body_close if (defined($pre_body_close));

  my $jslicenses = $self->get_info('jslicenses');
  if (defined($jslicenses)
      and ((exists($jslicenses->{'infojs'})
            and scalar(keys %{$jslicenses->{'infojs'}}))
           or (($self->get_file_information('mathjax', $filename)
                or !$self->get_conf('SPLIT'))
               and (exists($jslicenses->{'mathjax'})
                    and scalar(keys %{$jslicenses->{'mathjax'}}))))) {
    my $js_setting = $self->get_conf('JS_WEBLABELS');
    my $js_path = $self->get_conf('JS_WEBLABELS_FILE');
    if (defined($js_setting) and defined($js_path)
        and ($js_setting eq 'generate' or $js_setting eq 'reference')) {
      $result .=
        '<a href="'.$self->url_protect_url_text($js_path).'" rel="jslicense"><small>'
        .$self->convert_tree($self->cdt('JavaScript license information'),
                             'Tr JS license header')
        .'</small></a>';
    }
  }

  return "$result
</body>
</html>
";
}

sub _root_html_element_attributes_string($) {
  my $self = shift;

  if (defined($self->get_conf('HTML_ROOT_ELEMENT_ATTRIBUTES'))
      and $self->get_conf('HTML_ROOT_ELEMENT_ATTRIBUTES') ne '') {
    return ' '.$self->get_conf('HTML_ROOT_ELEMENT_ATTRIBUTES');
  }
  return '';
}

# This is used for normal output files and other files, like
# redirection file headers.  $COMMAND is the tree element for
# a @node that is being output in the file.
sub _file_header_information($$;$) {
  my ($self, $command, $filename) = @_;

  my $title;
  my $command_description;
  if (defined($command)) {
    my $command_string = $self->command_text($command, 'string');
    if (defined($command_string) and $command_string ne ''
        and $command_string ne $self->get_info('title_string')) {
      my $element_tree;
      my $associated_title_command;
      if ($self->get_conf('SECTION_NAME_IN_TITLE')
          and exists($command->{'cmdname'})
          and $command->{'cmdname'} eq 'node') {
        my $document = $self->get_info('document');
        if (defined($document)) {
          my $nodes_list = $document->nodes_list();
          my $node_relations
            = $nodes_list->[$command->{'extra'}->{'node_number'} -1];
          $associated_title_command
            = $node_relations->{'associated_title_command'};
        }
      }
      if (defined($associated_title_command)) {
        # associated section arguments_line type element
        my $arguments_line
          = $associated_title_command->{'contents'}->[0];
        # line_arg type element containing the sectioning command line argument
        $element_tree = $arguments_line->{'contents'}->[0];
      } else {
        # this should not happen, as the command_string should be empty already
        $element_tree = $self->command_tree($command);
      }
      # TRANSLATORS: sectioning element title for the page header
      my $title_tree = $self->cdt('{element_text} ({title})',
                                  {'title' => $self->get_info('title_tree'),
                                   'element_text' => $element_tree });

      my $context_str = 'file_header_title-element-';
      if (exists($command->{'cmdname'})) {
        $context_str .= '@'.$command->{'cmdname'};
      } elsif (exists($command->{'type'})) {
        $context_str .= $command->{'type'};
      }
      # NOTE 'element_title' is not unique although this could be called
      # for each file.  We are in string context, though, so it is
      # probably not important.
      $title
        = $self->convert_tree_new_formatting_context(
                  Texinfo::TreeElement::new({'type' => '_string',
                                             'contents' => [$title_tree]}),
                                                     $context_str,
                                                     'element_title');
    }
    $command_description = $self->command_description($command, 'string');
  }
  $title = $self->get_info('title_string') if (!defined($title));

  my $keywords = $command_description;
  $keywords = $title if (not defined($keywords) or $keywords eq '');

  my $description = $self->get_info('documentdescription_string');
  $description = $command_description
    if (not defined($description) or $description eq '');
  $description = $title
    if (not defined($description) or $description eq '');
  $description = $self->close_html_lone_element(
    "<meta name=\"description\" content=\"$description\"" )
      if ($description ne '');
  my $encoding = '';
  $encoding
     = $self->close_html_lone_element(
        "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=".
          $self->get_conf('OUTPUT_ENCODING_NAME')."\"" )
    if (defined($self->get_conf('OUTPUT_ENCODING_NAME'))
        and ($self->get_conf('OUTPUT_ENCODING_NAME') ne ''));

  my $date = '';
  if ($self->get_conf('DATE_IN_HEADER')) {
    my $today
      = $self->convert_tree_new_formatting_context(
           Texinfo::TreeElement::new({'cmdname' => 'today'}),
                                                   'DATE_IN_HEADER');
    $date =
      $self->close_html_lone_element(
        "<meta name=\"date\" content=\"$today\"")."\n";
  }

  my $css_lines = &{$self->formatting_function('format_css_lines')}($self,
                                                                  $filename);

  my $doctype = $self->get_conf('DOCTYPE');
  $doctype = '' if (!defined($doctype));
  my $root_html_element_attributes
           = _root_html_element_attributes_string($self);
  my $body_attributes = $self->get_conf('BODY_ELEMENT_ATTRIBUTES');
  $body_attributes = '' if (!defined($body_attributes));
  if ($self->get_conf('HTML_MATH') and $self->get_conf('HTML_MATH') eq 'mathjax'
      and $self->get_file_information('mathjax', $filename)) {
    $body_attributes .= ' class="tex2jax_ignore"';
  }
  my $copying_comment = $self->get_info('copying_comment');
  $copying_comment = ''
       if (not defined($copying_comment));
  my $after_body_open = $self->get_conf('AFTER_BODY_OPEN');
  $after_body_open = '' if (!defined($after_body_open));
  my $program_and_version = $self->get_conf('PACKAGE_AND_VERSION');
  $program_and_version = '' if (!defined($program_and_version));
  my $program_homepage = $self->get_conf('PACKAGE_URL');
  $program_homepage = '' if (!defined($program_homepage));
  my $program = $self->get_conf('PROGRAM');
  my $generator = '';
  if (defined($program) and $program ne '') {
    $generator =
      $self->close_html_lone_element(
        "<meta name=\"Generator\" content=\"$program\"") . "\n";
  }

  my $extra_head = '';
  $extra_head = $self->get_conf('EXTRA_HEAD')
    if (defined($self->get_conf('EXTRA_HEAD')));

  if (defined($self->get_conf('INFO_JS_DIR'))) {
    if (!$self->get_conf('SPLIT')) {
      $self->converter_document_error(
        sprintf(__("%s not meaningful for non-split output"),
                   'INFO_JS_DIR'));
    } else {
      my $jsdir = $self->get_conf('INFO_JS_DIR');
      if ($jsdir eq '.') {
        $jsdir = '';
      } else {
        $jsdir =~ s,/*$,/,; # append a single slash
      }

      my $protected_jsdir = $self->url_protect_url_text($jsdir);

      $extra_head .= $self->close_html_lone_element(
        '<link rel="stylesheet" type="text/css" href="'.
                     $protected_jsdir.'info.css"')."\n"
        .'<script src="'.$protected_jsdir
                      .'modernizr.js" type="text/javascript"></script>'."\n"
        .'<script src="'.$protected_jsdir
                      .'info.js" type="text/javascript"></script>';
    }
  }
  if ((defined($self->get_conf('HTML_MATH'))
       and $self->get_conf('HTML_MATH') eq 'mathjax')
      and ($self->get_file_information('mathjax', $filename))) {
    my $mathjax_script = $self->get_conf('MATHJAX_SCRIPT');

    my $default_mathjax_configuration =
"  options: {
    skipHtmlTags: {'[-]': ['pre']},       // do not skip pre
    ignoreHtmlClass: 'tex2jax_ignore',
    processHtmlClass: 'tex2jax_process'
  },
  tex: {
    processEscapes: false,      // do not use \\\$ to produce a literal dollar sign
    processEnvironments: false, // do not process \\begin{xxx}...\\end{xxx} outside math mode
    processRefs: false,         // do not process \\ref{...} outside of math mode
    displayMath: [             // start/end delimiter pairs for display math
      ['\\\\[', '\\\\]']
    ],
  },";

    $extra_head .=
"<script type='text/javascript'>
MathJax = {
$default_mathjax_configuration
};
";

    my $mathjax_configuration = $self->get_conf('MATHJAX_CONFIGURATION');
    if (defined($mathjax_configuration)) {
      $extra_head .=
"var MathJax_conf = {
$mathjax_configuration
};

for (let component in MathJax_conf) {
  if (!MathJax.hasOwnProperty(component)) {
    MathJax[component] = MathJax_conf[component];
  } else {
    for (let field in MathJax_conf[component]) {
      MathJax[component][field] = MathJax_conf[component][field];
    }
  }
}
";
    }

    $extra_head .= '</script><script type="text/javascript" id="MathJax-script" async
  src="'.$self->url_protect_url_text($mathjax_script).'">
</script>';

  }

  return ($title, $description, $keywords, $encoding, $date, $css_lines,
          $doctype, $root_html_element_attributes, $body_attributes,
          $copying_comment, $after_body_open, $extra_head,
          $program_and_version, $program_homepage, $program, $generator);
}

sub _get_links($$$$) {
  my ($self, $filename, $output_unit, $node_command) = @_;

  my $links = '';
  if ($self->get_conf('USE_LINKS')) {
    my $link_directions = $self->get_conf('LINKS_DIRECTIONS');
    return $links if (!defined($link_directions));
    foreach my $link_direction (@$link_directions) {
      my $link_href = $self->from_element_direction($link_direction, 'href',
                                    $output_unit, $filename, $node_command);
      #print STDERR "$link_direction -> "
      #            .(defined($link_href) ? $link_href : 'UNDEF')."\n";
      if (defined($link_href) and $link_href ne '') {
        my $link_string = $self->from_element_direction($link_direction,
                                                'string', $output_unit);
        my $link_title = '';
        $link_title = " title=\"$link_string\"" if (defined($link_string));
        my $rel = '';
        my $button_rel
          = $self->direction_string($link_direction, 'rel', 'string');
        $rel = " rel=\"".$button_rel.'"' if (defined($button_rel));
        $links .= $self->close_html_lone_element(
                    "<link href=\"$link_href\"${rel}${link_title}")."\n";
      }
    }
  }
  return $links;
}

sub _default_format_begin_file($$$) {
  my ($self, $filename, $output_unit) = @_;

  my ($node_command, $command_for_title);
  if (defined($output_unit)) {
    if (exists($output_unit->{'unit_node'})) {
      $node_command = $output_unit->{'unit_node'}->{'element'};
    }

    my $element_command = $output_unit->{'unit_command'};
    if ($self->get_conf('SPLIT') and defined($element_command)) {
      $command_for_title = $element_command;
    }
  }

  my ($title, $description, $keywords, $encoding, $date, $css_lines, $doctype,
      $root_html_element_attributes, $body_attributes, $copying_comment,
      $after_body_open, $extra_head, $program_and_version, $program_homepage,
      $program, $generator)
        = _file_header_information($self, $command_for_title, $filename);

  my $links = _get_links($self, $filename, $output_unit, $node_command);

  my $keywords_output = '';
  if (defined($keywords)) {
    $keywords_output = $self->close_html_lone_element(
        "<meta name=\"keywords\" content=\"$keywords\"")."\n";
  }

  my $result = "$doctype
<html${root_html_element_attributes}>
<!-- Created by $program_and_version, $program_homepage -->
<head>
$encoding
$copying_comment<title>$title</title>

$description\n".
    $keywords_output.
    $self->close_html_lone_element(
      "<meta name=\"resource-type\" content=\"document\"")."\n".
     $self->close_html_lone_element(
      "<meta name=\"distribution\" content=\"global\"") . "\n" .
    ${generator} . ${date} .
    $self->close_html_lone_element(
      "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"")."\n".
"
${links}$css_lines
$extra_head
</head>

<body $body_attributes>
$after_body_open";

  return $result;
}

sub _default_format_node_redirection_page($$;$) {
  my ($self, $command, $filename) = @_;

  my $name = $self->command_text($command);
  my $href = $self->command_href($command, $filename);
  my $direction = "<a href=\"$href\">$name</a>";
  my $string = $self->convert_tree(
    $self->cdt('The node you are looking for is at {href}.',
      { 'href' =>
        Texinfo::TreeElement::new({'type' => '_converted',
                                   'text' => $direction })}),
      'Tr redirection sentence');

  my ($title, $description, $keywords, $encoding, $date, $css_lines, $doctype,
      $root_html_element_attributes, $body_attributes, $copying_comment,
      $after_body_open, $extra_head, $program_and_version, $program_homepage,
      $program, $generator) = _file_header_information($self, $command,
                                                              $filename);

  my $keywords_output = '';
  if (defined($keywords)) {
    $keywords_output = $self->close_html_lone_element(
        "<meta name=\"keywords\" content=\"$keywords\"")."\n";
  }

  my $result = "$doctype
<html${root_html_element_attributes}>
<!-- Created by $program_and_version, $program_homepage -->
<!-- This file redirects to the location of a node or anchor -->
<head>
$encoding
$copying_comment<title>$title</title>

$description\n".
   $keywords_output.
   $self->close_html_lone_element(
     "<meta name=\"resource-type\" content=\"document\"")."\n".
   $self->close_html_lone_element(
     "<meta name=\"distribution\" content=\"global\"") . "\n" .
   ${generator} . ${date} . "$css_lines\n".
   $self->close_html_lone_element(
     "<meta http-equiv=\"Refresh\" content=\"0; url=$href\"")."\n".
   $self->close_html_lone_element(
     "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"")."\n".
"$extra_head
</head>

<body $body_attributes>
$after_body_open
<p>$string</p>
</body>
";
  return $result;
}

sub _default_format_single_footnote($$$$$$) {
  my ($self, $command, $footid, $number_in_doc, $href, $mark) = @_;

  my $footnote_text
      = $self->convert_tree_new_formatting_context($command->{'contents'}->[0],
                            "$command->{'cmdname'} $number_in_doc $footid");
  chomp ($footnote_text);
  $footnote_text .= "\n";

  return $self->html_attribute_class('h5', ['footnote-body-heading']) . '>'.
     "<a id=\"$footid\" href=\"$href\">($mark)</a></h5>\n" . $footnote_text;
}

sub _default_format_footnotes_sequence($) {
  my $self = shift;

  my $pending_footnotes = $self->get_pending_footnotes();
  my $result = '';
  foreach my $pending_footnote_info_array (@$pending_footnotes) {
    my ($command, $footid, $docid, $number_in_doc,
        $footnote_location_filename, $multi_expanded_region)
          = @$pending_footnote_info_array;
    my $footnote_location_href = $self->footnote_location_href($command, undef,
                                           $docid, $footnote_location_filename);

    my $footnote_mark;
    if ($self->get_conf('NUMBER_FOOTNOTES')) {
      $footnote_mark = $number_in_doc;
    } else {
      $footnote_mark = $self->get_conf('NO_NUMBER_FOOTNOTE_SYMBOL');
      $footnote_mark = '' if (!defined($footnote_mark));
    }

    # NOTE the @-commands in @footnote that are formatted differently depending
    # on in_multi_expanded($self) cannot know that the original context
    # of the @footnote in the main document was $multi_expanded_region.
    # We do not want to set multi_expanded in customizable code.  However, it
    # could be possible to set a shared_conversion_state based on $multi_expanded_region
    # and have all the conversion functions calling in_multi_expanded($self)
    # also check the shared_conversion_state.  The special situations
    # with those @-commands in @footnote in multi expanded
    # region do not justify this additional code and complexity.  The consequences
    # should only be redundant anchors HTML elements.

    $result .= &{$self->formatting_function('format_single_footnote')}($self,
                                           $command, $footid, $number_in_doc,
                                     $footnote_location_href, $footnote_mark);
  }
  return $result;
}

sub _default_format_footnotes_segment($) {
  my $self = shift;

  my $foot_lines
    = &{$self->formatting_function('format_footnotes_sequence')}($self);
  return '' if ($foot_lines eq '');
  my $class = $self->special_unit_info('class', 'footnotes');
  my $result = $self->html_attribute_class('div', [$class.'-segment']).">\n";
  $result .= $self->get_conf('DEFAULT_RULE') . "\n"
     if (defined($self->get_conf('DEFAULT_RULE'))
         and $self->get_conf('DEFAULT_RULE') ne '');
  my $footnote_heading_tree = $self->special_unit_info('heading_tree',
                                                          'footnotes');
  my $footnote_heading;
  if (defined($footnote_heading_tree)) {
    $footnote_heading
      = $self->convert_tree($footnote_heading_tree,
                            'convert footnotes special heading');
  } else {
    $footnote_heading = '';
  }
  my $level = $self->get_conf('FOOTNOTE_END_HEADER_LEVEL');
  $result .= &{$self->formatting_function('format_heading_text')}($self, undef,
                          [$class.'-heading'], $footnote_heading, $level)."\n";
  $result .= $foot_lines;
  $result .= "</div>\n";
  return $result;
}

sub _default_format_special_body_about($$$) {
  my ($self, $special_type, $element) = @_;

  my $about = '';
  if ($self->get_conf('PROGRAM_NAME_IN_ABOUT')) {
    $about .= "<p>\n  ";
    $about .= &{$self->formatting_function('format_program_string')}($self);
    $about .= "\n</p>\n";
  }

  $about .= "<p>\n";

  my $buttons = $self->get_conf('SECTION_BUTTONS');

  if (!defined($buttons)) {
    $about .= $self->convert_tree(
      $self->cdt('There are no buttons for this document.')). "\n";
    $about .= "</p>\n";
    return $about;
  }

  $about .= $self->convert_tree(
    $self->cdt('  The buttons in the navigation panels have the following meaning:'),
                               'ABOUT')
            . "\n";
  my $table = $self->html_attribute_class('table', ['direction-about']).'>';
  $about .= <<EOT;
</p>
$table
  <tr>
EOT
  my $button_th = $self->html_attribute_class('th',
                                              ['button-direction-about']).'>';
  my $name_th = $self->html_attribute_class('th',
                                               ['name-direction-about']).'>';
  my $description_th = $self->html_attribute_class('th',
                                           ['description-direction-about']).'>';
  my $example_th = $self->html_attribute_class('th',
                                           ['example-direction-about']).'>';
   # TRANSLATORS: direction column header in the navigation help
  $about .= "    $button_th "
                . $self->convert_tree($self->cdt('Button'), 'ABOUT')
   ." </th>\n".
   # TRANSLATORS: button label column header in the navigation help
   "    $name_th " . $self->convert_tree($self->cdt('Name'), 'ABOUT')
   . " </th>\n" .
   # TRANSLATORS: direction description column header in the navigation help
   "    $description_th " . $self->convert_tree($self->cdt('Go to'), 'ABOUT')
   . " </th>\n" .
   # TRANSLATORS: section reached column header in the navigation help
   "    $example_th "
       . $self->convert_tree($self->cdt('From 1.2.3 go to'), 'ABOUT')
   ."</th>\n". "  </tr>\n";

  my $active_icons;
  if ($self->get_conf('ICONS')) {
    $active_icons = $self->get_conf('ACTIVE_ICONS');
  }

  foreach my $button_spec (@{$buttons}) {
    next if (defined($self->global_direction_text($button_spec))
             or ref($button_spec) eq 'CODE'
             or ref($button_spec) eq 'SCALAR'
             or (ref($button_spec) eq 'ARRAY' and scalar(@$button_spec) != 2));
    my $direction;
    if (ref($button_spec) eq 'ARRAY') {
      $direction = $button_spec->[0];
    } else {
      $direction = $button_spec;
    }
    $about .= "  <tr>\n    ".$self->html_attribute_class('td',
                                          ['button-direction-about']) .'>';
    # if the button spec is an array we do not know what the button
    # looks like, so we do not show the button but still show explanations.
    if (ref($button_spec) ne 'ARRAY') {
      if ($active_icons and $active_icons->{$direction}) {
        my $button_name_string
          = $self->direction_string($direction, 'button', 'string');
        $about
         .= &{$self->formatting_function('format_button_icon_img')}($self,
                         $button_name_string, $active_icons->{$direction})
      } else {
        my $direction_text = $self->direction_string($direction, 'text');
        $direction_text = '' if (!defined($direction_text));
        $about .= ' ['. $direction_text .'] ';
      }
    }
    $about .= "</td>\n";
    # same order for getting the direction strings as in C code
    my $button_name = $self->direction_string($direction, 'button');
    $button_name = '' if (!defined($button_name));
    my $direction_description
      = $self->direction_string($direction, 'description');
    $direction_description = '' if (!defined($direction_description));
    my $direction_example = $self->direction_string($direction, 'example');
    $direction_example = '' if (!defined($direction_example));
    my $description_td = $self->html_attribute_class('td',
                                        ['description-direction-about']).'>';
    my $example_td = $self->html_attribute_class('td',
                                            ['example-direction-about']).'>';
    $about .=
'    '.$self->html_attribute_class('td', ['name-direction-about']).'>'
    ."$button_name</td>
    ${description_td}$direction_description</td>
    ${example_td}$direction_example</td>
  </tr>
";
  }

  $about .= <<EOT;
</table>

<p>
EOT
  $about .= $self->convert_tree(
    $self->cdt('  where the @strong{ Example } assumes that the current position is at @strong{ Subsubsection One-Two-Three } of a document of the following structure:'),
                                'ABOUT') . "\n";

#  where the <strong> Example </strong> assumes that the current position
#  is at <strong> Subsubsection One-Two-Three </strong> of a document of
#  the following structure:
  $about .= <<EOT;
</p>

<ul>
EOT
  my $non_breaking_space = $self->get_info('non_breaking_space');
  # TRANSLATORS: example name of section for section 1
  $about .= '  <li> 1. ' . $self->convert_tree($self->cdt('Section One'),
                                               'ABOUT') . "\n" .
"    <ul>\n" .
       # TRANSLATORS: example name of section for section 1.1
'      <li>1.1 ' . $self->convert_tree($self->cdt('Subsection One-One'),
                                       'ABOUT') . "\n";
  $about .= <<EOT;
        <ul>
          <li>...</li>
        </ul>
      </li>
EOT
  $about .= '      <li>1.2 ' .
                 # TRANSLATORS: example name of section for section 1.2
            $self->convert_tree($self->cdt('Subsection One-Two'), 'ABOUT')
                                                                    . "\n" .
"        <ul>\n" .
'          <li>1.2.1 ' .
                 # TRANSLATORS: example name of section for section 1.2.1
    $self->convert_tree($self->cdt('Subsubsection One-Two-One'), 'ABOUT')
                                                              . "</li>\n" .
'          <li>1.2.2 ' .
                 # TRANSLATORS: example name of section for section 1.2.2
    $self->convert_tree($self->cdt('Subsubsection One-Two-Two'), 'ABOUT')
                                                              . "</li>\n" .
'          <li>1.2.3 ' .
                 # TRANSLATORS: example name of section for section 1.2.3
        $self->convert_tree($self->cdt('Subsubsection One-Two-Three'),
                            'ABOUT')
                  . " $non_breaking_space $non_breaking_space\n"
.
'            <strong>&lt;== ' .
   $self->convert_tree($self->cdt('Current Position'), 'ABOUT')
                                                 . " </strong></li>\n" .
'          <li>1.2.4 ' .
                 # TRANSLATORS: example name of section for section 1.2.4
  $self->convert_tree($self->cdt('Subsubsection One-Two-Four'), 'ABOUT')
                                                                . "</li>\n" .
"        </ul>\n" .
"      </li>\n" .
'      <li>1.3 ' .
                 # TRANSLATORS: example name of section for section 1.3
          $self->convert_tree($self->cdt('Subsection One-Three'), 'ABOUT')
                                                                    . "\n";
  $about .= <<EOT;
        <ul>
          <li>...</li>
        </ul>
      </li>
EOT
  $about .= '      <li>1.4 ' .
                 # TRANSLATORS: example name of section for section 1.4
         $self->convert_tree($self->cdt('Subsection One-Four'), 'ABOUT')
                                                                 . "</li>\n";

  $about .= <<EOT;
    </ul>
  </li>
</ul>
EOT
  return $about;
}

sub _default_format_special_body_contents($$$) {
  my ($self, $special_type, $element) = @_;

  return &{$self->formatting_function('format_contents')}($self, 'contents');
}

sub _default_format_special_body_shortcontents($$$) {
  my ($self, $special_type, $element) = @_;

  return &{$self->formatting_function('format_contents')}($self,
                                                          'shortcontents');
}

sub _default_format_special_body_footnotes($$$) {
  my ($self, $special_type, $element) = @_;

  return &{$self->formatting_function('format_footnotes_sequence')}($self);
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

sub _has_contents_or_shortcontents($) {
  my $self = shift;

  my $global_commands;

  my $document = $self->get_info('document');
  if (defined($document)) {
    $global_commands = $document->global_commands_information();
  }

  foreach my $cmdname ('contents', 'shortcontents') {
    if (defined($global_commands) and exists($global_commands->{$cmdname})) {
      return 1;
    }
  }
  return 0;
}

# to be called before starting conversion.
# NOTE not called directly by convert_tree, which means that convert_tree
# needs to be called from a converter which would have had this function
# called already.

# This function initializes states that are initialized either in XS
# or in Perl.  Called as early as possible in the conversion functions.
# $CONTEXT is the first conversion context name.
# $DOCUMENT is the converted Texinfo parsed document.
sub conversion_initialization($$;$) {
  my ($self, $context, $document) = @_;

  $self->{'converter_info'} = {};

  if (defined($document)) {
    $self->set_document($document);
    $self->{'converter_info'}->{'document'} = $document;
  }

  $self->{'shared_conversion_state'} = {};

  $self->{'document_context'} = [];

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

  $self->{'css_rule_lines'} = [];
  $self->{'css_import_lines'} = [];

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

  my $non_breaking_space = $self->get_info('non_breaking_space');

  if ($non_breaking_space ne $xml_named_entity_nbsp) {
    foreach my $space_command (' ', "\t", "\n", 'tie') {
      $conf_default_no_arg_commands_formatting_normal->{$space_command}->{'text'}
        = $non_breaking_space;
    }
  }

  if ($self->get_conf('USE_NUMERIC_ENTITY')) {
    foreach my $command (keys(%Texinfo::Convert::Unicode::unicode_entities)) {
      $conf_default_no_arg_commands_formatting_normal->{$command}->{'text'}
       = $Texinfo::Convert::Unicode::unicode_entities{$command};
    }
  }

  $conf_default_no_arg_commands_formatting_normal->{'*'}->{'text'}
    = $self->get_info('line_break_element');

  # NOTE need to be before the call to css_set_selector_style just below
  %{$self->{'css_element_class_styles'}} = %default_css_element_class_styles;

  # initialized here and not with the converter because it may depend on
  # the document encoding.
  $self->{'no_arg_commands_formatting'} = {};
  foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
    $self->{'no_arg_commands_formatting'}->{$command} = {};
    foreach my $context (@no_args_commands_contexts) {
      my $no_arg_command_customized_formatting
        = $self->{'customized_no_arg_commands_formatting'}
                                             ->{$command}->{$context};
      if (defined($no_arg_command_customized_formatting)) {
        $self->{'no_arg_commands_formatting'}->{$command}->{$context}
           = $no_arg_command_customized_formatting;
      } else {
        my $context_default_default_no_arg_commands_formatting
          = $default_no_arg_commands_formatting{$context};
        if ($context eq 'normal') {
          $context_default_default_no_arg_commands_formatting
           = $conf_default_no_arg_commands_formatting_normal;
        }
        if (defined($context_default_default_no_arg_commands_formatting
                                                              ->{$command})) {
          if ($self->get_conf('OUTPUT_CHARACTERS')
              and Texinfo::Convert::Unicode::brace_no_arg_command(
                         $command, $self->get_conf('OUTPUT_ENCODING_NAME'))) {
            $self->{'no_arg_commands_formatting'}->{$command}->{$context}
              = { 'text' => Texinfo::Convert::Unicode::brace_no_arg_command(
                           $command, $self->get_conf('OUTPUT_ENCODING_NAME'))};
            # reset CSS for itemize command arguments
            if ($context eq 'css_string'
                and exists($brace_commands{$command})
                and $command ne 'bullet' and $command ne 'w'
                and not $special_list_mark_css_string_no_arg_command{$command}) {
              my $css_string
                = $self->{'no_arg_commands_formatting'}
                                    ->{$command}->{$context}->{'text'};
              $css_string = '"'.$css_string.'"';

              css_set_selector_style($self, "ul.mark-$command",
                                     "list-style-type: $css_string");
            }
          } else {
            $self->{'no_arg_commands_formatting'}->{$command}->{$context}
              = $context_default_default_no_arg_commands_formatting->{$command};
          }
        } else {
          $self->{'no_arg_commands_formatting'}->{$command}->{$context}
            = {'unset' => 1};
        }
      }
    }
  }

  # set sane defaults in case there is none and the default formatting
  # function is used
  foreach my $command (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
    if (exists($self->{'commands_conversion'}->{$command})
        and $self->{'commands_conversion'}->{$command}
            eq $default_commands_conversion{$command}) {
      _complete_no_arg_commands_formatting($self, $command);
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

  $self->{'check_htmlxref_already_warned'} = {}
    if ($self->get_conf('CHECK_HTMLXREF'));

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
  $self->{'current_filename'} = undef;
}

sub _html_convert_convert($$$$) {
  my ($self, $document, $output_units, $special_units) = @_;

  my $result = '';

  $self->{'current_filename'} = '';

  my $unit_nr = 0;
  # NOTE there is no rule before the footnotes special element in
  # case of separate footnotes in this setting.
  foreach my $output_unit (@$output_units, @$special_units) {
    print STDERR "\nC UNIT $unit_nr\n" if ($self->get_conf('DEBUG'));
    my $output_unit_text = $self->convert_output_unit($output_unit,
                                               "convert unit $unit_nr");
    $result .= $output_unit_text;
    $unit_nr++;
  }
  $self->{'current_filename'} = undef;
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

sub convert_output_unit($$;$) {
  my ($self, $output_unit,
  # only used for debug
      $explanation) = @_;

  $debug = $self->get_conf('DEBUG') if !defined($debug);

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
      my $tree = $self->command_tree($command);
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
      my $tree = $self->command_tree($command);
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

  my $index_entries_by_letter
    = $self->get_converter_indices_sorted_by_letter();
  if (defined($index_entries_by_letter)) {
    my $indices_information;
    if (exists($self->{'document'})) {
      $indices_information = $self->{'document'}->indices_information();
    }

    foreach my $index_name (sort(keys(%{$index_entries_by_letter}))) {
      foreach my $letter_entry (@{$index_entries_by_letter->{$index_name}}) {
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
            = Texinfo::Common::index_content_element($main_entry_element);
          my @contents = ($entry_reference_content_element);
          my $subentries_tree
            = $self->comma_index_subentries_tree($main_entry_element);
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
            $Texinfo::ModulePath::converterdatadir, 'js'));
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

  my $default_document_language = $self->get_conf('documentlanguage');

  $self->set_global_document_commands('preamble', ['documentlanguage']);

  my $preamble_document_language = $self->get_conf('documentlanguage');

  if (not (!defined($default_document_language)
           and !defined($preamble_document_language))
      and (!defined($default_document_language)
           or !defined($preamble_document_language)
           or $default_document_language ne $preamble_document_language)) {
    _translate_names($self);
  }

  # prepare title.  fulltitle uses more possibility than simpletitle for
  # title, including @-commands found in @titlepage only.  Therefore
  # simpletitle is more in line with what makeinfo in C did.

  _prepare_simpletitle($self);

  my $global_commands;
  if (exists($self->{'document'})) {
    $global_commands = $self->{'document'}->global_commands_information();
  }

  my $fulltitle_tree;
  if (defined($global_commands)) {
    foreach my $fulltitle_command ('settitle', 'title',
                                   'shorttitlepage') {
      if (exists($global_commands->{$fulltitle_command})) {
        my $command = $global_commands->{$fulltitle_command};
        next if (!exists($command->{'contents'}->[0]->{'contents'}));
        $fulltitle_tree = $command->{'contents'}->[0];
        last;
      }
    }
    if (!defined($fulltitle_tree) and exists($global_commands->{'top'})) {
      # arguments_line type element
      my $arguments_line = $global_commands->{'top'}->{'contents'}->[0];
      my $line_arg = $arguments_line->{'contents'}->[0];
      if (exists($line_arg->{'contents'})) {
        $fulltitle_tree = $line_arg;
      }
    }
    if (!defined($fulltitle_tree) and exists($global_commands->{'titlefont'})
        and exists($global_commands->{'titlefont'}->[0]->{'contents'})
        and exists($global_commands->{'titlefont'}->[0]->{'contents'}->[0]
                                                        ->{'contents'})) {
      $fulltitle_tree = $global_commands->{'titlefont'}->[0];
    }
  }

  my $html_title_string;
  my $title_tree;
  if (defined($fulltitle_tree)) {
    $title_tree = $fulltitle_tree;
    $html_title_string
      = $self->convert_tree_new_formatting_context(
                    Texinfo::TreeElement::new({'type' => '_string',
                                       'contents' => [$title_tree]}),
                                                   'title_string');
    if ($html_title_string !~ /\S/) {
      $html_title_string = undef;
    }
  }
  if (!defined($html_title_string)) {
    my $default_title = $self->cdt('Untitled Document');
    $title_tree = $default_title;
    $self->{'converter_info'}->{'title_tree'} = $title_tree;
    $self->{'converter_info'}->{'title_string'}
      = $self->convert_tree_new_formatting_context(
                  Texinfo::TreeElement::new({'type' => '_string',
                                     'contents' => [$title_tree]}),
                                                   'title_string');

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
      = $self->convert_tree_new_formatting_context(
           Texinfo::TreeElement::new({'type' => '_string',
                                      'contents' => [$tmp],}),
                                                   'documentdescription');
    chomp($documentdescription_string);
    $self->{'converter_info'}->{'documentdescription_string'}
      = $documentdescription_string;
  }

  # TODO document that this stage handler is called with end of preamble
  # documentlanguage when it is certain that this will not change ever.
  my $init_status = _run_stage_handlers($self, $stage_handlers,
                                        $self->{'document'}, 'init');
  unless ($init_status < $handler_fatal_error_level
          and $init_status > -$handler_fatal_error_level) {
    return 0;
  }

  _prepare_title_titlepage($self, $output_file, $output_filename,
                                  $output_units);

  $self->set_global_document_commands('before', ['documentlanguage']);

  if (not (!defined($default_document_language)
           and !defined($preamble_document_language))
      and (!defined($default_document_language)
           or !defined($preamble_document_language)
           or $default_document_language ne $preamble_document_language)) {
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

  my $text_output = '';
  if ($output_file eq '') {
    $self->{'current_filename'} = $output_filename;
    my $body = '';
    my $unit_nr = 0;
    # NOTE there is no rule before the footnotes special element in
    # case of separate footnotes in this setting.
    foreach my $output_unit (@$output_units, @$special_units) {
      print STDERR "\nUNIT NO-PAGE $unit_nr\n" if ($self->get_conf('DEBUG'));
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

    $self->{'current_filename'} = undef;
  } else {
    # output with pages
    print STDERR "DO Units with filenames\n"
      if ($self->get_conf('DEBUG'));
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
          if ($self->get_conf('DEBUG'));
        $body = $self->convert_output_unit($output_unit,
                                           "output s-unit $unit_nr");
        if ($body eq '') {
          $body = undef;
        }
      } else {
        print STDERR "\nUNIT $unit_nr\n" if ($self->get_conf('DEBUG'));
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
            return undef;
          }
        }
      }
    }
    delete $self->{'current_filename'};
  }
  return $text_output;
}

# as a function for XS override
sub _prepare_node_redirection_page($$$) {
  my ($self, $target_element, $redirection_filename) = @_;

  $self->{'current_filename'} = $redirection_filename;

  my $redirection_page
   = &{$self->formatting_function('format_node_redirection_page')}($self,
                                    $target_element, $redirection_filename);
  $self->{'current_filename'} = undef;

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
  $self->{'current_filename'} = undef;
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
      my $normalized = $target_element->{'extra'}->{'normalized'};
      # NOTE 'node_filename' is not used for Top, TOP_NODE_FILE_TARGET
      # is.  The other manual must use the same convention to get it
      # right.  We do not do 'node_filename' as a redirection file
      # either.
      if ($normalized eq 'Top'
          and defined($self->get_conf('TOP_NODE_FILE_TARGET'))) {
        $node_filename = $self->get_conf('TOP_NODE_FILE_TARGET');
      } else {
        my ($target_filebase, $external_file_extension, $id)
          = $self->standard_label_id_file($normalized, $label_element,
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
               Texinfo::Convert::Texinfo::convert_to_texinfo(
                  Texinfo::TreeElement::new(
                       {'contents' => $label_element->{'contents'}})),
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
                 Texinfo::Convert::Texinfo::convert_to_texinfo(
                    Texinfo::TreeElement::new(
                       {'contents' => $label_element->{'contents'}}))
                 ),
              $conflicting_node->{'source_info'}, 1);
          } elsif ($file_info_type eq 'redirection') {
            my $conflicting_node = $file_source->{'file_info_element'};
            my $conflicting_label_element
                 = $file_source->{'file_info_label_element'};
            $self->converter_line_warn(
               sprintf(__("conflict with \@%s `%s' redirection file"),
                 $conflicting_node->{'cmdname'},
                 Texinfo::Convert::Texinfo::convert_to_texinfo(
                  Texinfo::TreeElement::new(
                   {'contents' => $conflicting_label_element->{'contents'}}))
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
                 Texinfo::Convert::Texinfo::convert_to_texinfo(
                   Texinfo::TreeElement::new(
                             {'contents' => $line_arg->{'contents'}})),
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
        my $no_unidecode;
        $no_unidecode = 1 if (defined($self->get_conf('USE_UNIDECODE'))
                              and !$self->get_conf('USE_UNIDECODE'));

        my $in_test;
        $in_test = 1 if ($self->get_conf('TEST'));

        my $translit_filename
   = Texinfo::Convert::NodeNameNormalization::normalize_transliterate_texinfo(
        Texinfo::TreeElement::new(
          {'contents' => $label_element->{'contents'}}), $in_test,
            $no_unidecode);

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

      foreach my $redirection_filename (@redirection_files) {
        $redirection_filenames{$redirection_filename} = $target_element;
        $files_source_info->{$redirection_filename}
            = {'file_info_type' => 'redirection',
               'file_info_element' => $target_element,
               'file_info_path' => undef,
               'file_info_label_element' => $label_element};

        my $redirection_page
          = _prepare_node_redirection_page ($self, $target_element,
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

  $self->{'current_filename'} = undef;

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
  $self->set_global_document_commands('preamble', ['documentlanguage']);
  my $body_lang = $self->get_conf('documentlanguage');
  if (!defined($body_lang)) {
    $body_lang = '';
  }
  $self->set_conf('BODY_ELEMENT_ATTRIBUTES', 'lang="'.$body_lang.'"');
  $self->set_global_document_commands('before', ['documentlanguage']);

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
           'http://www.gnu.org/licenses/gpl-3.0.html',
           'js/info.js' ],
       'js/modernizr.js' =>
          [ 'Expat',
            'http://www.jclark.com/xml/copying.txt',
            'js/modernizr.js' ]};
  }

  $self->{'converter_info'}->{'jslicenses'} = $jslicenses;

  _prepare_css($self);

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

sub _open_command_update_context($$) {
  my ($self, $command_name) = @_;

  my $convert_to_latex;

  if (exists($brace_commands{$command_name})
      and $brace_commands{$command_name} eq 'context') {
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
  if (exists($brace_commands{$command_name})
      and $brace_commands{$command_name} eq 'context') {
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
  if ($type_name eq '_string') {
    $self->{'document_context'}->[-1]->{'string'}++;
  }
}

sub _convert_type_update_context($$) {
  my ($self, $type_name) = @_;

  if ($self->{'code_types'}->{$type_name}) {
    pop @{$self->{'document_context'}->[-1]->{'monospace'}};
  }
  if ($type_name eq '_string') {
    $self->{'document_context'}->[-1]->{'string'}--;
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

# Convert tree element $ELEMENT, and return HTML text for the output files.
# $EXPLANATION is only used for debug.
sub _convert($$;$);
sub _convert($$;$) {
  my ($self, $element, $explanation) = @_;

  if (!defined($element)) {
    cluck('BUG: _convert: element UNDEF');
    return '';
  }

  # to help debug and trace
  my $command_type = '';
  if (exists($element->{'cmdname'})) {
    $command_type = "\@$element->{'cmdname'} ";
  }
  if (exists($element->{'type'})) {
    $command_type .= $element->{'type'};
  }

  $debug = $self->get_conf('DEBUG') if !defined($debug);
  # cache return value of get_conf for speed

  if ($debug) {
    #cluck() if (!defined($explanation));
    $explanation = 'NO EXPLANATION' if (!defined($explanation));
    my $contexts_str = _debug_print_html_contexts($self);
    print STDERR "ELEMENT($explanation) ".$contexts_str.", ->";
    print STDERR " cmd: $element->{'cmdname'},"
                               if (exists($element->{'cmdname'}));
    print STDERR " type: $element->{'type'}" if (exists($element->{'type'}));
    if (exists($element->{'text'})) {
      if ($element->{'text'} eq '') {
        print STDERR ' text(EMPTY)';
      } else {
        my $text = $element->{'text'};
        $text =~ s/\n/\\n/;
        print STDERR " text: $text";
      }
    }
    print STDERR "\n";
  }

  if (ref($element) ne 'HASH' and ref($element) ne 'Texinfo::TreeElement') {
    cluck "_convert: tree element not a HASH\n";
    return '';
  }

  if ((exists($element->{'type'})
        and exists($self->{'types_conversion'}->{$element->{'type'}})
        and !defined($self->{'types_conversion'}->{$element->{'type'}}))
       or (exists($element->{'cmdname'})
            and exists($self->{'commands_conversion'}->{$element->{'cmdname'}})
            and !defined($self->{'commands_conversion'}->{$element->{'cmdname'}}))) {
    if ($debug) {
      print STDERR "IGNORED $command_type\n";
    }
    return '';
  }

  # Process text
  if (exists($element->{'text'})) {
    my $result;
    # already converted to html, keep it as is
    if (exists($element->{'type'}) and $element->{'type'} eq '_converted') {
      $result = $element->{'text'};
    } else {
      $result = &{$self->{'types_conversion'}->{'text'}} ($self,
                                                      $element->{'type'},
                                                      $element,
                                                      $element->{'text'});
    }
    print STDERR "DO TEXT => `$result'\n" if $debug;
    return $result;
  }

  # commands like @deffnx have both a cmdname and a def_line type.  It is
  # better to consider them as a def_line type, as the whole point of the
  # def_line type is to handle the same the def*x and def* line formatting.
  if (exists($element->{'cmdname'})
      and !((exists($element->{'type'})
             and $element->{'type'} eq 'definfoenclose_command')
            or (exists($element->{'type'})
                and $element->{'type'} eq 'index_entry_command'))) {
    my $command_name = $element->{'cmdname'};

    my $data_command_name;
    if ($command_name eq 'item'
        and exists($element->{'contents'})
        and exists($element->{'contents'}->[0]->{'type'})
        and $element->{'contents'}->[0]->{'type'} eq 'line_arg') {
      $data_command_name = 'item_LINE';
    } else {
      $data_command_name = $command_name;
    }

    if (exists($root_commands{$command_name})) {
      $self->{'current_root_command'} = $element;
    }
    if (exists($self->{'commands_conversion'}->{$command_name})) {
      my $convert_to_latex
        = _open_command_update_context($self, $command_name);
      my $result = '';
      if (defined($self->{'commands_open'}->{$command_name})) {
        $result .= &{$self->{'commands_open'}->{$command_name}}($self,
                                                 $command_name, $element);
      }
      my $content_formatted = '';
      if (exists($element->{'contents'})
          and (exists($root_commands{$command_name})
               or exists($block_commands{$command_name})
               or $command_name eq 'tab' or $command_name eq 'headitem'
               or $data_command_name eq 'item')) {
        if ($convert_to_latex) {
          # displaymath
          $content_formatted
           = Texinfo::Convert::LaTeX::convert_to_latex_math(undef,
            Texinfo::TreeElement::new({'contents' => $element->{'contents'}}),
                                         $self->{'options_latex_math'});
        } else {
          my $contents_nr = scalar(@{$element->{'contents'}});
          for (my $idx = 0; $idx < $contents_nr; $idx++) {
            $content_formatted
                .= _convert($self, $element->{'contents'}->[$idx],
                            "$command_type c[$idx]");
          }
        }
      }
      my $args_formatted;
          # contents could be not set for brace commands without braces
      if ((exists($brace_commands{$command_name})
           and exists($element->{'contents'}))
          or (exists($line_commands{$command_name})
              and $line_commands{$command_name} eq 'line')
          or (($command_name eq 'item' or $command_name eq 'itemx')
              and exists($element->{'contents'})
              and exists($element->{'contents'}->[0]->{'type'})
              and $element->{'contents'}->[0]->{'type'} eq 'line_arg')
          or ($command_name eq 'quotation'
              or $command_name eq 'smallquotation')
          or $command_name eq 'float'
          or $command_name eq 'cartouche') {
        my $arguments_list;
        if (exists($element->{'contents'}->[0]->{'type'})
            and $element->{'contents'}->[0]->{'type'} eq 'arguments_line') {
          $arguments_list = $element->{'contents'}->[0]->{'contents'};
        } else {
          $arguments_list = $element->{'contents'};
        }

        $args_formatted = [];
        my @args_specification;
        @args_specification = @{$html_default_commands_args{$command_name}}
          if (exists($html_default_commands_args{$command_name}));
        my $spec_nr = scalar(@args_specification);
        my $arg_idx = -1;
        foreach my $arg (@{$arguments_list}) {
          $arg_idx++;
          my $arg_spec;
          if ($arg_idx < $spec_nr) {
            $arg_spec = $args_specification[$arg_idx];
          }
          if (!exists($arg->{'contents'})) {
            push @$args_formatted, undef;
            next;
          }
          # NOTE here commands with empty array reference in array
          # reference associated to command in html_default_commands_args
          # do not have $arg_spec reset to normal, such that their argument
          # is not converted here
          $arg_spec = ['normal'] if (!defined($arg_spec));
          my $arg_formatted = {'arg_tree' => $arg};
          foreach my $arg_type (@$arg_spec) {
            my $explanation = "$command_type A[$arg_idx]$arg_type";
            if ($arg_type eq 'normal') {
              if ($convert_to_latex) {
                $arg_formatted->{'normal'}
                 = Texinfo::Convert::LaTeX::convert_to_latex_math(undef, $arg,
                                                $self->{'options_latex_math'});
              } else {
                $arg_formatted->{'normal'}
                  = _convert($self, $arg, $explanation);
              }
            } elsif ($arg_type eq 'monospace') {
              _set_code_context($self, 1);
              $arg_formatted->{$arg_type} = _convert($self, $arg, $explanation);
              _pop_code_context($self);
            } elsif ($arg_type eq 'string') {
              _new_document_context($self, $command_type);
              _set_string_context($self);
              $arg_formatted->{$arg_type} = _convert($self, $arg, $explanation);
              #_unset_string_context($self);
              _pop_document_context($self);
            } elsif ($arg_type eq 'monospacestring') {
              _new_document_context($self, $command_type);
              _set_code_context($self, 1);
              _set_string_context($self);
              $arg_formatted->{$arg_type} = _convert($self, $arg, $explanation);
              #_unset_string_context($self);
              _pop_code_context($self);
              _pop_document_context($self);
            } elsif ($arg_type eq 'monospacetext') {
              Texinfo::Convert::Text::set_options_code(
                                            $self->{'convert_text_options'});
              $arg_formatted->{$arg_type}
                = Texinfo::Convert::Text::convert_to_text($arg,
                                            $self->{'convert_text_options'});
              Texinfo::Convert::Text::reset_options_code(
                                            $self->{'convert_text_options'});
            } elsif ($arg_type eq 'filenametext') {

              Texinfo::Convert::Text::set_options_code(
                                            $self->{'convert_text_options'});
              # Always use encoded characters for file names
              Texinfo::Convert::Text::set_options_encoding_if_not_ascii($self,
                                            $self->{'convert_text_options'});
              $arg_formatted->{$arg_type}
                = Texinfo::Convert::Text::convert_to_text($arg,
                                            $self->{'convert_text_options'});
              Texinfo::Convert::Text::reset_options_code(
                                            $self->{'convert_text_options'});
              Texinfo::Convert::Text::reset_options_encoding(
                                            $self->{'convert_text_options'});
            } elsif ($arg_type eq 'url') {
              Texinfo::Convert::Text::set_options_code(
                                            $self->{'convert_text_options'});
              # set the encoding to UTF-8 to always have a string that
              # is suitable for percent encoding.
              Texinfo::Convert::Text::set_options_encoding(
                                $self->{'convert_text_options'}, 'utf-8');
              $arg_formatted->{$arg_type}
                 = Texinfo::Convert::Text::convert_to_text($arg,
                                            $self->{'convert_text_options'});
              Texinfo::Convert::Text::reset_options_code(
                                            $self->{'convert_text_options'});
              Texinfo::Convert::Text::reset_options_encoding(
                                            $self->{'convert_text_options'});
            } elsif ($arg_type eq 'raw') {
              _set_raw_context($self);
              $arg_formatted->{$arg_type} = _convert($self, $arg, $explanation);
              _unset_raw_context($self);
            }
          }
          push @$args_formatted, $arg_formatted;
        }
      }

      _convert_command_update_context($self, $command_name);

      # TODO remove some time in the future of 2024, it is not used
      # in texi2any and have never been documented.  It may be used in 3rd
      # party codes, though.
      if ($element->{'cmdname'} eq 'node') {
        $self->{'current_node'} = $element;
      }
      # args are formatted, now format the command itself
      if (defined($args_formatted)) {
        if (!defined($self->{'commands_conversion'}->{$command_name})) {
          print STDERR "No command_conversion for $command_name\n";
        } else {
          $result .= &{$self->{'commands_conversion'}->{$command_name}}($self,
                  $command_name, $element, $args_formatted, $content_formatted);
        }
      } else {
        $result .= &{$self->{'commands_conversion'}->{$command_name}}($self,
                $command_name, $element, undef, $content_formatted);
      }
      if ($command_name eq 'documentlanguage') {
        _translate_names($self);
      }
      return $result;
    } else {
      print STDERR "Command not converted: $command_name\n"
       if ($self->get_conf('VERBOSE') or $self->get_conf('DEBUG'));
      if (exists($root_commands{$command_name})) {
        delete $self->{'current_root_command'};
      }
      return '';
    }
  } elsif (exists($element->{'type'})) {

    my $result = '';
    my $type_name = $element->{'type'};

    _open_type_update_context($self, $type_name);

    if (defined($self->{'types_open'}->{$type_name})) {
      $result .= &{$self->{'types_open'}->{$type_name}}($self,
                                             $type_name, $element);
    }

    my $content_formatted = '';
    if ($type_name eq 'definfoenclose_command') {
      if (exists($element->{'contents'})) {
        $content_formatted = _convert($self, $element->{'contents'}->[0],
                                             "DEFINFOENCLOSE_ARG");
      }
    } elsif (exists($element->{'contents'})
             and $type_name ne 'untranslated_def_line_arg') {
      my $content_idx = 0;
      foreach my $content (@{$element->{'contents'}}) {
        $content_formatted
          .= _convert($self, $content, "$command_type c[$content_idx]");
        $content_idx++;
      }
    }

    _convert_type_update_context($self, $type_name);

    if (defined($self->{'types_conversion'}->{$type_name})) {
      $result .= &{$self->{'types_conversion'}->{$type_name}} ($self,
                                                 $type_name,
                                                 $element,
                                                 $content_formatted);
    } else {
      $result .= $content_formatted;
    }
    print STDERR "DO type ($type_name) => `$result'\n" if $debug;
    return $result;
    # no type, no cmdname, but contents.
  } elsif (exists($element->{'contents'})) {
    # this happens inside accents, for section/node names, for @images.
    my $content_formatted = '';
    my $content_idx = 0;
    foreach my $content (@{$element->{'contents'}}) {
      $content_formatted .= _convert($self, $content,
                                            "$command_type C[$content_idx]");
      $content_idx++;
    }
    print STDERR "UNNAMED HOLDER => `$content_formatted'\n" if $debug;
    return $content_formatted;
  } else {
    print STDERR "UNNAMED empty\n" if $debug;
    if (defined($self->{'types_conversion'}->{''})) {
      return &{$self->{'types_conversion'}->{''}} ($self, $element);
    } else {
      return '';
    }
  }
  print STDERR "DEBUG: HERE!($element)\n";
}

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

1;

# The documentation of the customization API is in the texi2any_api
# Texinfo manual.  POD format is not suitable for such a documentation, because
# of the module documentation style, the language limitations, and also because
# the customization API involves multiple modules as well as the main program.

__END__
# Automatically generated from Convert_format_template.pod

=head1 NAME

Texinfo::Convert::HTML - Convert Texinfo tree to HTML

=head1 SYNOPSIS

  my $converter
    = Texinfo::Convert::HTML->converter({'NUMBER_SECTIONS' => 0});

  # output to files
  $converter->output($document);
  # no header nor footer output
  my $converted = $converter->convert($document);

  $converter->output_internal_links(); # HTML only

=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

Texinfo::Convert::HTML converts a Texinfo tree to HTML.

=head1 METHODS

=over

=item $converter = Texinfo::Convert::HTML->converter($options)

Initialize converter from Texinfo to HTML.

The I<$options> hash reference holds Texinfo customization options for the
converter.  These options should be Texinfo customization options
that can be passed to the converter.  Most of the customization options are
described in the Texinfo manual or in the customization API manual.  Those
customization options, when appropriate, override the document content.

See L<Texinfo::Convert::Converter> for more information.

=item $converter->output($document)

Convert a Texinfo parsed document I<$document> and output the result in files as
described in the Texinfo manual.

=item $result = $converter->convert($document)

Convert a Texinfo parsed document I<$document> and return the resulting output.

=item $result = $converter->convert_tree($tree)

Convert a Texinfo tree portion I<$tree> and return the resulting
output.  This function does not try to output a full document but only
portions.  In general it is better to call this function when conversion
is already ongoing, as it requires an association to a document and a suitably
initialized converter formatting state.

=item $result = $converter->output_internal_links()
X<C<output_internal_links>>

Returns text representing the links in the document.  The format should
follow the C<--internal-links> option of the C<texi2any>
specification.  This is only supported in (and relevant for) HTML.

=back

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
