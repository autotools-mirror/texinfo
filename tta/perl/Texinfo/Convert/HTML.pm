# HTML.pm: output tree as HTML.  XS loading and functions only implemented
#                                in Perl, without XS override
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
#
# The documentation of the HTML customization API which is both
# used and implemented in the current file and in HTMLNonXS.pm is in the
# texi2any_api manual.
#
# Formatting and conversion functions that can be replaced by user-defined
# functions should only use documented functions to pass information
# and formatted content, such that users can overrides them independently
# without risking unwanted results.  Also in formatting functions, the state of
# the converter should only be accessed through functions, such as in_math,
# in_preformatted_context, preformatted_classes_stack and similar functions.
# A few cases of direct access to converter hash keys are possible as
# described in the customization API manual (for example
# for no_arg_commands_formatting).
#
# Original author: Patrice Dumas <pertusus@free.fr>

# ALTIMP C/convert/*html*.[ch]


package Texinfo::Convert::HTML;

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

use Encode qw(encode);

use Texinfo::XSLoader;

use Texinfo::Commands;
use Texinfo::Options;
use Texinfo::CommandsValues;
use Texinfo::UnicodeData;
use Texinfo::HTMLData;
use Texinfo::HTMLDataCSS;

use Texinfo::TreeElement;

use Texinfo::Common;
use Texinfo::Indices;

use Texinfo::Config;
use Texinfo::Convert::Unicode;
use Texinfo::Convert::Texinfo;
use Texinfo::Convert::Utils;
use Texinfo::Convert::Text;
use Texinfo::Convert::NodeNameNormalization;
use Texinfo::ManipulateTree;
use Texinfo::Structuring;
use Texinfo::OutputUnits;

use Texinfo::Convert::Converter;

# used to convert Texinfo to LaTeX math in @math and @displaymath
# for further conversion by softwares that only convert LaTeX.
# NOTE mathjax does not implement some constructs output by the
# Texinfo::Convert::LaTeX converter.  Examples in 2022:
# \mathord{\text{}} \textsl{} \copyright{} \mathsterling{}
use Texinfo::Convert::LaTeX;

require Exporter;

our @ISA = qw(Texinfo::Convert::Converter);

our $VERSION = '7.3dev';

our %HTML_align_commands;

# Load XS interface or interface Perl implementation
BEGIN {
  # needs to be defined before loading Texinfo::Convert::HTMLNonXS
  foreach my $align_command
                ('raggedright', 'flushleft', 'flushright', 'center') {
    $HTML_align_commands{$align_command} = 1;
  }

  # Main conversion XS and NonXS interfaces loading
  Texinfo::XSLoader::init (
    "Texinfo::Convert::HTML",
    "Texinfo::Convert::HTMLNonXS",
    'ConvertHTMLXS',
    undef,
    ['texinfo', 'texinfoxs', 'texinfo-convert', 'texinfo-convertxs'],
  );
}

# Small functions override that do not depend on the Texinfo tree
# being parsed with native code C implementation.
my %XS_overrides = (
  "Texinfo::Convert::HTML::_default_format_protect_text"
    => "Texinfo::MiscXS::default_format_protect_text",
  "Texinfo::Convert::HTML::_entity_text"
    => "Texinfo::MiscXS::entity_text",
);

# Extra initialization for functions override for the first time this
# module is loaded.
my $module_loaded = 0;
sub import {
  if (!$module_loaded) {
    foreach my $sub (keys %XS_overrides) {
      Texinfo::XSLoader::override($sub, $XS_overrides{$sub});
    }
    $module_loaded = 1;
  }
  # The usual import method
  goto &Exporter::import;
}

# How converter state is accessed.  Information on function API to set and/or
# get, and whether interface is available as XS (which means nonXS
# implementation in HTMLNonXS.pm).  Details in customization API manual.
#
#  commands_init_conf
#   API XS Converter set_global_document_commands
#    Get through converter set_global_document_commands with 'before'.  Set
#    based on commands associated customization values set at the beginning
#    of conversion.
#
#  shared_conversion_state
#   API partial XS shared_conversion_state functions
#
#  converter_info
#   API XS get get_info
#    list of available_converter_info in HTMLNonXS
#
#  sorted index_entries
#  sorted index_entries_by_letter
#   API XS Converter get get_converter_indices_sorted_by_index
#                        get_converter_indices_sorted_by_letter
#
#  stage_handlers
#   API set Texinfo::Config
#
#  files_css_import_lines
#  files_css_rule_lines
#   command-line
#
#  css_element_class_styles
#  css_import_lines
#  css_rule_lines
#   API XS css_add_info, css_set_selector_style...
#
#  file_id_setting
#  commands_conversion
#  commands_open
#  types_conversion
#  types_open
#   API set Texinfo::Config get HTML functions default_command_conversion
#                               command_conversion...
#
#  customized_no_arg_commands_formatting   # used for no_arg_commands_formatting
#   API set Texinfo::Config
#  no_arg_commands_formatting
#   direct user access
#  style_commands_formatting
#   API set Texinfo::Config direct user access
#
#  code_types
#  pre_class_types
#   API set Texinfo::Config direct internal access
#
#  current_filename
#  current_output_unit
#  document_context
#  pending_closes
#  pending_footnotes
#  pending_inline_content
#  associated_inline_content
#  multiple_pass
#  document_global_context_css
#  page_css
#  files_information
#  referred_command_stack
#  check_htmlxref_already_warned
#   API XS _open_command_update_context _pop_document_context
#          associate_pending_formatted_inline_content,
#          html_attribute_class...
#
#  targets
#  special_targets
#   API set Texinfo::Config get partial XS footnote_location_target
#                                          command_filename...
#
#  global_units_directions             # defaults set before conversion
#  global_texts_directions             # defaults set before conversion
#   API Texinfo::Config set XS get global_direction_text global_direction_unit
#
#  customized_direction_strings
#   API set Texinfo::Config
#  translated_direction_strings    # based on customized_direction_strings
#  directions_strings              # based on *_direction_strings
#   API get direction_string
#
#  special_unit_info                   # set in parallel in C
#   API get XS set Texinfo::Config
#
#  translated_special_unit_info_texinfo
#   API set Texinfo::Config
#  translated_special_unit_info_tree     # based on translated_special_unit_info_texinfo
#   API get XS _internal_command_text special_unit_info_text output_internal_links
#
#  elements_in_file_count    # the number of output units in file
#  file_counters             # begin at elements_in_file_count decrease
#                            # each time the unit is closed
#   API XS get count_elements_in_filename set before conversion and in output
#
#
#  all_directions                    # determined parallelly in C
#   direct user access
#  deprecated_config_directories     # passed from main program
#   direct user access
#
#  document_units
#  out_filepaths          (partially common with Texinfo::Converter)
#  seen_ids
#  options_latex_math
#  htmlxref
#   direct access internal


my %nobrace_commands = %Texinfo::Commands::nobrace_commands;
my %line_commands = %Texinfo::Commands::line_commands;
my %nobrace_symbol_text = %Texinfo::CommandsValues::nobrace_symbol_text;
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
my %default_index_commands = %Texinfo::Commands::default_index_commands;
my %small_block_associated_command = %Texinfo::Common::small_block_associated_command;

foreach my $def_command (keys(%def_commands)) {
  $formatted_line_commands{$def_command} = 1
     if (exists($line_commands{$def_command}));
}

my %format_raw_commands;
foreach my $block_command (keys(%block_commands)) {
  if ($block_commands{$block_command} eq 'format_raw') {
    $format_raw_commands{$block_command} = 1;
  }
}


# values for integer and string options in code generated from
# Texinfo/Convert/converters_defaults.txt
my $regular_defaults = Texinfo::Options::get_regular_options('html_converter');

our %defaults = (
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



# API for html formatting

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

  my ($image_file, $image_extension, $used_inc_dir, $image_path_encoding);
  # this variable is bytes encoded in the filesystem encoding
  my $image_path;
  my $extension;
  # NOTE should be consistent with $image_basefile formatting
  if (defined($args->[4]) and defined($args->[4]->{'filenametext'})) {
    $extension = $args->[4]->{'filenametext'};
    unshift @extensions, ("$extension", ".$extension");
  }
  foreach my $tried_extension (@extensions) {
    my ($file_name, $file_name_encoding)
      = $self->encoded_input_file_name($image_basefile.$tried_extension);
    my ($located_image_path, $use_inc_dir)
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
      $used_inc_dir = $use_inc_dir;
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
          $image_path_encoding, $used_inc_dir);
}

# flags used to specify the conversion contexts.  Use flags to avoid
# passing multiple arguments or hashes, and also could be easier for
# passing to C.
our $CTXF_string = 0x0001;
our $CTXF_code = 0x0002;
our $CTXF_normal = 0x0004;

my %default_css_string_commands_conversion;
my %default_css_string_types_conversion;
my %default_css_string_formatting_references;

sub _html_convert_css_string($$$) {
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
  _new_document_context($self, $css_string_context_str, $CTXF_string);
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

our %special_list_mark_css_string_no_arg_command = (
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
  foreach my $cmdname (keys(%special_list_mark_css_string_no_arg_command)) {
    $saved_css_string_no_arg_command->{$cmdname}
      = $self->{'no_arg_commands_formatting'}->{$cmdname}->{'css_string'};
    $self->{'no_arg_commands_formatting'}->{$cmdname}->{'css_string'}
      = $special_list_mark_css_string_no_arg_command{$cmdname};
  }
  my $result = _html_convert_css_string($self, $element, $explanation);
  foreach my $cmdname (keys(%special_list_mark_css_string_no_arg_command)) {
    $self->{'no_arg_commands_formatting'}->{$cmdname}->{'css_string'}
      = $saved_css_string_no_arg_command->{$cmdname};
  }
  return $result;
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



# API for links and elements directions formatting.

# Functions that do not have an XS override.  The reason why there is no
# XS override is that the tree elements with {'extra'}->{'manual_content'}
# cannot easily be found in the C tree based on the Perl tree element.

sub _normalized_to_id($) {
  my $id = shift;

  if (!defined($id)) {
    cluck "_normalized_to_id id not defined";
    return '';
  }
  $id =~ s/^([0-9_])/g_t$1/;
  return $id;
}

# returns file base name, extension and anchor associated to node
# (anchor, float...) command adhering strictly to the HTML Xref specification.
# The $CROSSREF_EXTENSION argument should be the external crossreference
# filename extension, if undef, the $EXTENSION argument is used.
sub _standard_label_id_file($$$$$) {
  my ($self, $normalized, $label_element, $crossref_extension,
      $extension) = @_;

  my $target;
  my $filename;
  if (!defined($normalized) and defined($label_element)) {
    $normalized
      = Texinfo::Convert::NodeNameNormalization::convert_to_node_identifier(
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

our %htmlxref_entries = (
 'node' => [ 'node', 'section', 'chapter', 'mono' ],
 'section' => [ 'section', 'chapter','node', 'mono' ],
 'chapter' => [ 'chapter', 'section', 'node', 'mono' ],
 'mono' => [ 'mono', 'chapter', 'section', 'node' ],
);

sub _external_node_href($$$) {
  my ($self, $external_node,
  # for messages only
     $source_command) = @_;

  my $normalized = $external_node->{'extra'}->{'normalized'};
  my $node_contents = $external_node->{'extra'}->{'node_content'};
  #print STDERR "external_node: ".join('|', keys(%$external_node))."\n";
  my ($target_filebase, $external_file_extension, $target)
     = _standard_label_id_file($self, $normalized, $node_contents,
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

our %contents_command_special_unit_variety = (
  'contents' => 'contents',
  'shortcontents' => 'shortcontents',
  'summarycontents' => 'shortcontents',
);

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

    my $tree = Texinfo::TreeElement::new(
       {'contents' => [Texinfo::TreeElement::new({'text' => '('}),
                       $command->{'extra'}->{'manual_content'},
                       Texinfo::TreeElement::new({'text' => ')'})]});
    if (exists($command->{'extra'}->{'node_content'})) {
      push @{$tree->{'contents'}}, $command->{'extra'}->{'node_content'};
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

    my $context_type = $CTXF_code;
    if ($type eq 'string' or $type eq 'string_nonumber') {
      $context_type |= $CTXF_string;
    }

    # NOTE the multiple pass argument is not unicized, and no global
    # context argument is given because this external node manual label
    # should in general be converted only once.
    # In addition, regarding multiple pass, it is unlikely for
    # @-commands which should better be converted only once to be present.
    my $result
      = $self->convert_tree_new_formatting_context($tree,
                                               $context_str, $context_type,
                                               'command_text-manual_content');

    return $result;
  }

  return _internal_command_text($self, $command, $type);
}

# Return text to be used for $COMMAND using the name rather than the
# label/identifier, when the distinction exists.
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

# This function could have had an XS override.  However
# there is no equivalent function is C, the corresponding
# code being inlined, and the functions called are overriden.
# Therefore, an XS override would not be very interesting.
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
      #print STDERR "ASSOCIATED_UNIT ".Texinfo::OutputUnits::debug_print_output_unit($current->{'associated_unit'})."\n" if ($debug);
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

# No XS, the C data element cannot in general be retrieved.
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
       . Texinfo::OutputUnits::debug_print_output_unit($target_unit)
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




# API for misc conversion and formatting functions

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
our %default_commands_conversion;

sub default_command_conversion($$) {
  my ($self, $cmdname) = @_;

  return $default_commands_conversion{$cmdname};
}

sub command_conversion($$) {
  my ($self, $cmdname) = @_;

  return $self->{'commands_conversion'}->{$cmdname};
}

my %default_commands_open;

sub default_command_open($$) {
  my ($self, $cmdname) = @_;

  return $default_commands_open{$cmdname};
}

# The default shared conversion states are accessed and set through
# XS, if enabled, but user added shared conversion states are only
# in Perl.

our %default_shared_conversion_states = (
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

# used in user-defined code
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

# class, direction, order, file_string, target
my %default_special_unit_info
  = %{ Texinfo::HTMLData::get_default_special_unit_info() };

# heading
my %default_translated_special_unit_info
  = %{ Texinfo::HTMLData::get_default_translated_special_unit_info() };

my $direction_orders = Texinfo::HTMLData::get_directions_order();
# 'global', 'text', 'relative', 'file'
my @all_directions_except_special_units;
foreach my $direction_order (@$direction_orders) {
  push @all_directions_except_special_units, @$direction_order;
}
my @global_directions_order = @{$direction_orders->[0]};
my @text_directions_order = @{$direction_orders->[1]};

#print STDERR join('|', @all_directions_except_special_units)."\n";

# translation contexts should be consistent with
# %direction_type_translation_context.  If the direction is not used
# as is, it should also be taken into account in direction_string().
# For now 'This' becomes 'This (current section)'.
my %default_translated_directions_strings
   = %{ Texinfo::HTMLData::get_default_translated_directions_strings() };

my @style_commands_contexts = ('normal', 'preformatted');

our @no_args_commands_contexts
    = ('normal', 'preformatted', 'string', 'css_string');


# a small package providing an API for the argument of
# format_translate_message.  The idea is to be able to change the
# argument of format_translate_message, for example if a instead of
# a lang_info, a translations_lang is used, without a need to change
# user code.

package Texinfo::Convert::HTML::Language;

sub new($) {
  my $lang_info = shift;

  bless $lang_info;
  return $lang_info;
}

sub bcp47_tag($) {
  my $self = shift;

  return $self->{'bcp47_locale'};
}

sub xpg_locale($) {
  my $self = shift;

  if (!exists($self->{'xpg_locale'})) {
    $self->{'xpg_locale'}
      = Texinfo::Translations::get_lang_info_xpg_locale($self);
  }
  return $self->{'xpg_locale'};
}

package Texinfo::Convert::HTML;

my $unknown_lang_info
  = Texinfo::Convert::HTML::Language::new({'bcp47_locale' => ''});

# redefined functions
#
# based on Texinfo::Translations::cache_translate_string, additionally
# calls user defined function.
sub _html_cache_translate_string($$$;$) {
  my ($self, $string, $lang_translations, $translation_context) = @_;

  my $debug_level = $self->get_conf('DEBUG');
  $debug_level = 0 if (!defined($debug_level));
  if (defined($self->{'formatting_function'}->{'format_translate_message'})) {
    my $lang_info;
    if (defined($lang_translations)) {
      $lang_info
        = Texinfo::Convert::HTML::Language::new($lang_translations->[0]);
    } else {
      $lang_info = $unknown_lang_info;
    }

    my $translated_string
      = &{$self->{'formatting_function'}->{'format_translate_message'}}($self,
                                           $string, $lang_info,
                                           $translation_context);

    if (defined($translated_string)) {
      my $translations;
      my $cached_lang = $lang_info->{'bcp47_locale'};
      if (!exists($self->{'translation_cache'}->{$cached_lang})) {
        $self->{'translation_cache'}->{$cached_lang} = {};
      }
      $translations = $self->{'translation_cache'}->{$cached_lang};

      # reuse the tree if the translation matches the cached translation
      # otherwise setup a new translation (without tree).
      my $translation_context_str;
      if (defined($translation_context)) {
        $translation_context_str = $translation_context;
      } else {
        $translation_context_str = '';
      }

      my $invalidated_cache;
      my $strings_cache = $translations->{$translation_context_str};
      if (defined($strings_cache)) {
        my $translated_string_tree = $strings_cache->{$string};
        if (defined($translated_string_tree)) {
          if ($translated_string_tree->[0] eq $translated_string) {
            if ($debug_level >= 2) {
              print STDERR "UserCacheT [$cached_lang] hit ".
                  "'$string-$translation_context_str' '$translated_string'\n";
            }
            return $translated_string_tree;
          } elsif ($debug_level >= 2) {
            $invalidated_cache = 1;
            # if the string has changed, the cache is invalidated by
            # resetting the cached string array reference just below.
            if (scalar(@$translated_string_tree) > 1) {
              print STDERR "UserCacheT [$cached_lang] invalid tree ".
                  "'$string-$translation_context_str' '$translated_string'"
                  ." (old $translated_string_tree->[0])\n";
            } else {
              print STDERR "UserCacheT [$cached_lang] invalid translation ".
                  "'$string-$translation_context_str' '$translated_string'"
                  ." (old $translated_string_tree->[0])\n";
            }
          }
        }
      } else {
        $strings_cache = {};
        $translations->{$translation_context_str} = $strings_cache;
      }

      if ($debug_level >= 2 and not $invalidated_cache) {
        print STDERR "UserCacheT [$cached_lang] new ".
                "'$string-$translation_context_str' '$translated_string'\n";
      }
      my $result = [$translated_string];

      $strings_cache->{$string} = $result;

      return $result;
    }
  }

  return Texinfo::Translations::cache_translate_string($string,
                            $lang_translations, $translation_context,
                            $debug_level);
}

# redefine generic Converter functions to pass a customized
# cache_translate_string function
sub cdt($$;$$) {
  my ($self, $string, $replaced_substrings, $translation_context) = @_;

  return Texinfo::Translations::gdt($string,
                                    $self->{'current_lang_translations'},
                                    $replaced_substrings,
                                    $translation_context,
                                    $self->get_conf('DEBUG'), $self,
                                    \&_html_cache_translate_string);
}

sub cdt_string($$;$$) {
  my ($self, $string, $replaced_substrings, $translation_context) = @_;

  return Texinfo::Translations::gdt_string($string,
                                    $self->{'current_lang_translations'},
                                    $replaced_substrings,
                                    $translation_context,
                                    $self->get_conf('DEBUG'), $self,
                                    \&_html_cache_translate_string);
}

sub element_cdt($$$;$$) {
  my ($self, $string, $element, $replaced_substrings,
      $translation_context) = @_;

  my $element_lang_translations
          = Texinfo::Translations::new_element_language_translation(
                       $Texinfo::Translations::converters_translation_cache,
                            $element);
  return Texinfo::Translations::gdt($string, $element_lang_translations,
                                    $replaced_substrings,
                                    $translation_context,
                                    $self->get_conf('DEBUG'), $self,
                                    \&_html_cache_translate_string);
}



# setup conversion information and conversion and formatting functions.

our %default_css_element_class_styles
  = %{ Texinfo::HTMLDataCSS::get_base_default_css_info() };

$default_css_element_class_styles{'pre.format-preformatted'}
  = $default_css_element_class_styles{'pre.display-preformatted'};

my %default_pre_class_types;
$default_pre_class_types{'menu_comment'} = 'menu-comment';

my %indented_preformatted_commands;
foreach my $indented_format ('example', 'display', 'lisp') {
  $indented_preformatted_commands{$indented_format} = 1;
  $indented_preformatted_commands{"small$indented_format"} = 1;

  # div.lisp is output as div.example
  if ($indented_format ne 'lisp') {
    $default_css_element_class_styles{"div.$indented_format"}
      = 'margin-left: 3.2em';
  }
}

# types that are in code style in the default case.
my %default_code_types = (
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

my %accent_commands;

foreach my $accent_command (keys(%brace_commands)) {
  if ($brace_commands{$accent_command} eq 'accent') {
    $accent_commands{$accent_command} = 1;
    $html_default_commands_args{$accent_command} = [[]];
  }
}

my %kept_line_commands;

my @informative_global_commands = ('documentlanguage',
  'documentscript', 'footnotestyle',
  'xrefautomaticsectiontitle', 'deftypefnnewline');

my @contents_commands = ('contents', 'shortcontents', 'summarycontents');

foreach my $line_command (@informative_global_commands,
        'documentlanguagevariant',
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
our %default_no_arg_commands_formatting = (
  'normal' => {},
  'preformatted' => {},
  'string' => {},
  # more internal
  'css_string' => {},
);

foreach my $cmdname (keys(%Texinfo::Convert::Converter::xml_text_entity_no_arg_commands_formatting)) {
  $default_no_arg_commands_formatting{'normal'}->{$cmdname} =
 {'text' =>
  $Texinfo::Convert::Converter::xml_text_entity_no_arg_commands_formatting{
                                                                     $cmdname}};
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

foreach my $cmdname (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  if (exists($css_no_arg_commands{$cmdname})) {
    $default_no_arg_commands_formatting{'css_string'}->{$cmdname}
      = {'text' => $css_no_arg_commands{$cmdname}}
        if (defined($css_no_arg_commands{$cmdname}));
  } elsif (exists($Texinfo::Convert::Unicode::unicode_map{$cmdname})) {
    my $char_nr = hex($Texinfo::Convert::Unicode::unicode_map{$cmdname});
    my $css_string;
    if ($char_nr < 128) { # 7bit ascii
      $css_string = chr($char_nr);
    } else {
      $css_string = "\\$Texinfo::Convert::Unicode::unicode_map{$cmdname} ";
    }
    $default_no_arg_commands_formatting{'css_string'}->{$cmdname}
       = {'text' => $css_string};
  } elsif (exists($nobrace_symbol_text{$cmdname})) {
    $default_no_arg_commands_formatting{'css_string'}->{$cmdname}
      = {'text' => $nobrace_symbol_text{$cmdname}};
  } elsif (exists($Texinfo::CommandsValues::text_brace_no_arg_commands{$cmdname})) {
    # complete the commands not in unicode maps: TeX, enddots, LaTeX, tie
    $default_no_arg_commands_formatting{'css_string'}->{$cmdname}
     = {'text' => $Texinfo::CommandsValues::text_brace_no_arg_commands{$cmdname}};
  } else {
    warn "BUG: $cmdname: no css_string\n";
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

# used to show the built-in CSS rules.  Called form main prorgam.
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
  my ($self, $specification, $cmdname) = @_;

  my $text = '';
  # note that there could be HTML elements in text
  if (exists($specification->{'text'})) {
    $text = $specification->{'text'};
  }

  if (exists($specification->{'element'})) {
    return $self->html_attribute_class($specification->{'element'}, [$cmdname])
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

foreach my $cmdname(keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  $default_commands_conversion{$cmdname} = \&_convert_no_arg_command;
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

foreach my $cmdname(keys(%{$default_no_arg_commands_formatting{'normal'}})) {
  $default_css_string_commands_conversion{$cmdname}
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
foreach my $cmdname (@all_style_commands) {
  # indicateurl is formatted with a specific function
  next if ($cmdname eq 'indicateurl');
  $default_style_commands_formatting{$cmdname} = {};
  # default is no element.
  foreach my $context (@style_commands_contexts) {
    $default_style_commands_formatting{$cmdname}->{$context} = {}
  }
  if (exists($style_commands_element{$cmdname})) {
    my $html_element = $style_commands_element{$cmdname};
    foreach my $context (@style_commands_contexts) {
      $default_style_commands_formatting{$cmdname}->{$context}
                           = {'element' => $html_element};
    }
  }
  if (exists($quoted_style_commands{$cmdname})) {
    foreach my $context (@style_commands_contexts) {
      $default_style_commands_formatting{$cmdname}->{$context}->{'quote'} = 1;
    }
  }
  $default_commands_conversion{$cmdname} = \&_convert_style_command;
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

  # in_multiple_conversions returning true while multi_expanded_region returns
  # undef happens when expanding target and heading commands text.  Therefore
  # if in_multiple_conversions was used, the output could be different.
  # Note, however, that an anchor on a sectioning command line is never output
  # because the sectioning command line is copied to be combined with
  # the sectioning number through a translation and the copy is not registered
  # as a target element and command_id will return undef.
  # An anchor on a @node line can be output (it is invalid Texinfo) and it
  # would be different for that case if in_multiple_conversions was used.
  if (!multi_expanded_region($self) and !in_string($self)) {
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
  my $multi_expanded_region = multi_expanded_region($self);
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
    my ($image_file, $image_extension, $image_path, $image_path_encoding,
        $used_inc_dir)
      = $self->html_image_file_location_name($cmdname, $command,
                                             $image_basefile, $args);
    if (not defined($image_path)) {
      # it would have been relevant to output the message only if
      # if not ($self->in_multiple_conversions())
      # However, @image formatted multiple times should be
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
    } elsif (defined($image_path) and $used_inc_dir
             and $self->get_conf('COPY_IMAGES')) {
      # copy image file if it does not already exist
      my ($volume, $directories, $image_basefile_name)
        = File::Spec->splitpath($image_file);
      my $destination_directory = '';
      if (exists($self->{'converter_info'}->{'destination_directory'})) {
        $destination_directory
          = $self->{'converter_info'}->{'destination_directory'};
      }
      my $image_destination_directory = '';
      if ($destination_directory ne '') {
        $image_destination_directory .= $destination_directory . '/';
      }
      if (defined($directories) and $directories ne '') {
        $image_destination_directory .= $directories . '/';
      }
      if ($image_destination_directory ne '') {
        my ($encoded_destination_directory, $dir_encoding)
          = $self->encoded_output_file_name($image_destination_directory);

        my $succeeded
          = $self->create_destination_directory($encoded_destination_directory,
                                                $image_destination_directory);
        if (!$succeeded) {
          $image_basefile_name = undef;
        }
      }
      if (defined($image_basefile_name)) {
        my $image_destination_path_name
          = $image_destination_directory . $image_basefile_name;
        my ($encoded_image_dest_path_name, $image_dest_path_encoding)
            = $self->encoded_output_file_name($image_destination_path_name);
        if (! -e $encoded_image_dest_path_name) {
          my $copy_succeeded = copy($image_path, $encoded_image_dest_path_name);
          if (not $copy_succeeded) {
            my $image_path_text;
            if (defined($image_path_encoding)) {
              $image_path_text = decode($image_path_encoding, $image_path);
            } else {
              $image_path_text = $image_path;
            }
            $self->converter_document_error(sprintf(__(
                   "could not copy `%s' to `%s': %s"),
                      $image_path_text, $image_destination_path_name, $!));
          }
        }
      }
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

foreach my $cmdname (keys(%accent_commands)) {
  $default_commands_conversion{$cmdname} = \&_convert_accent_command;
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

foreach my $cmdname (keys(%accent_commands)) {
  $default_css_string_commands_conversion{$cmdname}
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

    $result = '';
    my $open = $self->html_attribute_class('span', ['nav-label']);
    if ($open ne '') {
      $result .= $open.'>';
    }
    $result .= $direction_text.': ';
    if ($open ne '') {
      $result .= '</span>';
    }
    $open = $self->html_attribute_class('span', ['nav-link']);
    if ($open ne '') {
      $result .= $open.'>';
    }
    $result .= $hyperlink;
    if ($open ne '') {
      $result .= '</span>';
    }
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

      my $open = $self->html_attribute_class('span', ['nav-button']);
      if ($open ne '') {
        $result_buttons .= $open.'>';
      }
      $result_buttons .= $active;
      if ($open ne '') {
        $result_buttons .= '</span>';
      }

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
    $result .= $self->html_attribute_class('p', ['nav-panel']).">\n";
  }

  $result .= $result_buttons;

  if ($self->get_conf('HEADER_IN_TABLE')) {
    $result .= "</tr>" unless $vertical;
    $result .= "</table>\n";
  } else {
    $result .= "</p>\n";
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
      if ($element->{'extra'}->{'identifier'} eq 'Top') {
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
    # for *heading* @-commands which do not have a level in the document
    # as they are not associated with the sectioning tree, but still
    # have a $heading_level.  For all sectioning elements if
    # Structuring sectioning_structure was not called on the
    # document (cannot happen in main program nor test_utils.pl based tests)
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
      # document (cannot happen in main program nor test_utils.pl based tests)
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

foreach my $cmdname (keys(%sectioning_heading_commands), 'node') {
  $default_commands_conversion{$cmdname} = \&_convert_heading_command;
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

foreach my $cmdname (keys(%format_raw_commands)) {
  $default_commands_conversion{$cmdname} = \&_convert_raw_command;
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

foreach my $cmdname (grep {$brace_commands{$_} eq 'inline'}
                           keys(%brace_commands)) {
  $default_commands_conversion{$cmdname} = \&_convert_inline_command;
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
      if (defined($caption_element) and exists($caption_element->{'contents'})) {
        my $multiple_formatted = 'listoffloats';
        if ($formatted_listoffloats_nr > 1) {
          $multiple_formatted .= '-'.($formatted_listoffloats_nr - 1);
        }
        $caption_text = $self->convert_tree_new_formatting_context(
          $caption_element->{'contents'}->[0], $cmdname, undef,
          $multiple_formatted);
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

  my ($caption_element, $prepended) = $self->float_name_caption($command);

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
    if (defined($caption_element) and exists($caption_element->{'contents'})) {
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
    if (defined($caption_element) and exists($caption_element->{'contents'})) {
      # Allows an empty/spaces only caption.
      # Register the converted prepended tree to be prepended to
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
  #my $cancelled = $self->cancel_pending_formatted_inline_content($cmdname);
  #if ($self->get_conf('DEBUG') >= 2 and defined($cancelled)) {
  #  print STDERR "CANCELLED _convert_quotation_command: $cancelled\n";
  #  print STDERR "  tree: "
  #    .Texinfo::ManipulateTree::tree_print_details($command)."\n";
  #}

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

  my ($specification, $surplus)
    = Texinfo::Common::simple_arg_text($block_line_arg);
  if (defined($specification)) {
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
    if (!Texinfo::Common::empty_spaces_argument($command->{'contents'}->[0])) {

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
      my $table_item_tree = $self->table_item_content_tree($command);
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

sub _convert_xref_command($$$$) {
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
      and $self->converter_find_identifier_target(
                             $arg_node->{'extra'}->{'normalized'})) {
    my $target_node
     = $self->converter_find_identifier_target(
                                    $arg_node->{'extra'}->{'normalized'});
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
         and not command_is_in_referred_command_stack($self,
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
              and not command_is_in_referred_command_stack($self,
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
      $file = $self->set_context_convert_tree($manual_content, $CTXF_code,
                                              'node file in ref');
    }

    if (!defined($name)) {
      if (defined($book)) {
        if (defined($node_content)) {
          my $node_name = $self->set_context_convert_tree($node_content,
                                                 $CTXF_code, 'node in ref');
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

foreach my $cmdname(keys(%ref_commands)) {
  $default_commands_conversion{$cmdname} = \&_convert_xref_command;
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

  my $sorted_indexes_by_letter
    = $self->get_converter_indices_sorted_by_letter();
  if (!defined($sorted_indexes_by_letter)
      or !exists($sorted_indexes_by_letter->{$index_name})
      or !scalar(@{$sorted_indexes_by_letter->{$index_name}})) {
    return '';
  }

  my $document = $self->get_info('document');
  my $indices_information;
  if (defined($document)) {
    $indices_information = $document->indices_information();
  }

  #foreach my $letter_entry (@{$sorted_indexes_by_letter->{$index_name}}) {
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

  foreach my $letter_entry (@{$sorted_indexes_by_letter->{$index_name}}) {
    my $letter = $letter_entry->{'letter'};
    my $is_symbol = $letter !~ /^\p{Alpha}/;
    $letter_is_symbol{$letter} = $is_symbol;
    my $identifier;
    if ($is_symbol) {
      $symbol_idx++;
      $identifier = $index_element_id . "_${index_name}_symbol-$symbol_idx";
    } else {
      my $normalized_letter =
        Texinfo::Convert::NodeNameNormalization::convert_to_identifier(
              Texinfo::TreeElement::new({'text' => $letter}));
      $identifier = $index_element_id
                       . "_${index_name}_letter-${normalized_letter}";
    }
    $letter_id{$letter} = $identifier;

  }

  my $rule = $self->get_conf('DEFAULT_RULE');
  $rule = '' if (!defined($rule));

  my %formatted_letters;
  # Next do the entries to determine the letters that are not empty
  my @letter_entries;
  my $result_index_entries = '';
  foreach my $letter_entry (@{$sorted_indexes_by_letter->{$index_name}}) {
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
        = $self->converter_index_content_element($main_entry_element);

      my $entry_index_name = $index_entry_ref->{'index_name'};
      my $in_code = 0;
      $in_code = 1
       if ($indices_information->{$entry_index_name}->{'in_code'});
      my $entry_ref_tree
        = Texinfo::TreeElement::new({'contents' => [$entry_content_element]});


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
          }
          if ($subentry_level >= $subentries_max_level) {
            # at the max, concatenate the remaining subentries
            my $other_subentries_tree
              = Texinfo::Convert::Utils::comma_index_subentries_tree($subentry);
            if (defined($other_subentries_tree)) {
              if (defined($subentry_tree)) {
                push @{$subentry_tree->{'contents'}},
                  @{$other_subentries_tree->{'contents'}};
              } else {
                $subentry_tree = Texinfo::TreeElement::new(
                  {'contents' => [@{$other_subentries_tree->{'contents'}}]});
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
      my $formatting_context;
      if ($in_code) {
        $formatting_context = $CTXF_code;
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
                                          $convert_info, $formatting_context,
                                  "index-formatted-$formatted_index_entry_nr");
        } else {
          if ($in_code) {
            $entry = $self->set_context_convert_tree($entry_trees[$level],
                                                $CTXF_code, $convert_info);
          } else {
            $entry = $self->convert_tree($entry_trees[$level],
                                         $convert_info);
          }
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
                                         'seeentry' => $referred_entry});
          } else {
            $result_tree
          # TRANSLATORS: redirect to another index entry
          # TRANSLATORS: @: is discardable and used to avoid a msgfmt error
               = $self->cdt('{main_index_entry}, @emph{See@:} {seeentry}',
                                        {'main_index_entry' => $entry_tree,
                                         'seeentry' => $referred_entry});
          }
          my $convert_info
              = "index $index_name l $letter index entry $entry_nr seeentry";
          if ($formatted_index_entry_nr > 1) {
            # call with multiple_pass argument
            $entry = $self->convert_tree_new_formatting_context($result_tree,
                                                     $convert_info, undef,
                                  "index-formatted-$formatted_index_entry_nr");
          } else {
            $entry = $self->convert_tree($result_tree, $convert_info);
          }
          $section_class = "$cmdname-index-see-entry-section";
        } else {
          my $reference_tree;
          if ($in_code) {
            # TRANSLATORS: refer to another index entry
            $reference_tree
                = $self->cdt('@emph{See also} @code{{see_also_entry}}',
                                       {'see_also_entry' => $referred_entry});
          } else {
            # TRANSLATORS: refer to another index entry
            $reference_tree
                = $self->cdt('@emph{See also} {see_also_entry}',
                                       {'see_also_entry' => $referred_entry});
          }
          my $conv_str_entry
        = "index $index_name l $letter index entry $entry_nr (with seealso)";
          my $conv_str_reference
            = "index $index_name l $letter index entry $entry_nr seealso";
          if ($formatted_index_entry_nr > 1) {
            # call with multiple_pass argument
            $entry = $self->convert_tree_new_formatting_context($entry_tree,
                                         $conv_str_entry, $formatting_context,
                                   "index-formatted-$formatted_index_entry_nr");
            $reference
               = $self->convert_tree_new_formatting_context($reference_tree,
                                                 $conv_str_reference, undef,
                                "index-formatted-$formatted_index_entry_nr");
          } else {
            if ($in_code) {
              $entry = $self->set_context_convert_tree($entry_tree,
                                           $CTXF_code, $conv_str_entry);
            } else {
              $entry = $self->convert_tree($entry_tree,
                                           $conv_str_entry);
            }

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
                                       $convert_info, $formatting_context,
                               "index-formatted-$formatted_index_entry_nr");
          } else {
            if ($in_code) {
              $entry = $self->set_context_convert_tree($entry_tree,
                                            $CTXF_code, $convert_info);
            } else {
              $entry = $self->convert_tree($entry_tree, $convert_info);
            }
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
          if (defined($associated_command_id)) {
            $associated_command
              = $self->converter_find_identifier_target(
                                                $associated_command_id);
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
          = $self->index_entry_first_letter_text_or_command($first_entry);
      }

      if (defined($letter_command)
          and !(exists($brace_commands{$letter_command->{'cmdname'}})
                and $brace_commands{$letter_command->{'cmdname'}} eq 'accent')
          and $letter_command->{'cmdname'} ne 'U'
          # special case, the uppercasing of that command is not done
          # if as a command, while it is done correctly in $letter
          and $letter_command->{'cmdname'} ne 'ss') {
        my $cmdname = $letter_command->{'cmdname'};
        if (exists($letter_no_arg_commands{$cmdname})
            and $cmdname ne uc($cmdname)
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

sub _convert_documentlanguagevariant_command($$$) {
  my ($self, $cmdname, $command) = @_;

  return '';
}

$default_commands_conversion{'documentlanguagevariant'}
  = \&_convert_documentlanguagevariant_command;

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

foreach my $cmdname (keys(%def_commands), 'defblock') {
  if (exists($line_commands{$cmdname})) {
    $default_commands_conversion{$cmdname} = \&_convert_def_line_type;
  } else {
    $default_commands_conversion{$cmdname} = \&_convert_def_command;
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
          and exists($node_element->{'extra'}->{'identifier'})
          and $node_element->{'extra'}->{'identifier'} eq 'Top') {
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
  if (!Texinfo::Common::empty_spaces_argument($block_line_args)) {
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
            'spaces_at_end',
            'spaces_before_paragraph',
            # may be better not to ignore spaces when a : is postpended
            # and the user really wants a space
            #'space_at_end_menu_node',
            'spaces_after_close_brace',
            'spaces_before_argument',
            'spaces_after_argument'
    ) {
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
  # since in_multiple_conversions returning true while multi_expanded_region
  # returns undef can only happen when expanding target and heading commands
  # text, in which there should not be index commands, using one function
  # or the other in the conddition should not give a different result.
  if (defined($index_id) and $index_id ne ''
      and !in_multiple_conversions($self)
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
  if (exists($menu_entry_node->{'extra'})
      and exists($menu_entry_node->{'extra'}->{'manual_content'})) {
    $href = $self->command_href($menu_entry_node, undef, $element);
  # may not exist in case of menu entry node consisting only of spaces
  } elsif (exists($menu_entry_node->{'extra'})
           and exists($menu_entry_node->{'extra'}->{'normalized'})) {
    my $node = $self->converter_find_identifier_target(
                           $menu_entry_node->{'extra'}->{'normalized'});
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
                               'menu_arg menu_entry_name preformatted');
      my $name_separator = shift @menu_entry_separators;
      $result_name_node
        .= $self->convert_tree($name_separator,
                               'menu_arg name separator preformatted');
    }

    if (defined($menu_entry_node)) {
      my $name = $self->set_context_convert_tree($menu_entry_node,
                  $CTXF_code, 'menu_arg menu_entry_node preformatted');
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
                               'menu_arg node separator preformatted');
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
                                   undef, $multiple_formatted, undef,
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
        $name = $self->set_context_convert_tree(
                     $menu_entry_node->{'extra'}->{'node_content'},
                               $CTXF_code, 'menu_arg name');
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
                                     'menu_arg node description', undef,
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
  # since in_multiple_conversions returning true while multi_expanded_region
  # returns undef can only happen when expanding target and heading commands
  # text, in which there should not be @def*, using one function
  # or the other in the conddition should not give a different result.
  if (defined($index_id) and $index_id ne ''
      and !in_multiple_conversions($self)) {
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
    my $type_text = $self->set_context_convert_tree($type_element,
                                          $CTXF_code, $explanation);
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
    my $def_name_text = $self->set_context_convert_tree($name_element,
                                  $CTXF_code, "DEF_NAME $def_command");

    $def_call .= $self->html_attribute_class('strong', ['def-name']).'>'.
       $def_name_text .'</strong>';
  }

  if (defined($arguments)) {
    my $explanation = "DEF_ARGS $def_command";
  # arguments not only metasyntactic variables
  # (deftypefn, deftypevr, deftypeop, deftypecv)
    if (exists($Texinfo::Common::def_no_var_arg_commands{$base_command_name})) {
      my $arguments_formatted = $self->set_context_convert_tree($arguments,
                                                   $CTXF_code, $explanation);
      if ($arguments_formatted =~ /\S/) {
        $def_call .= ' ' unless($element->{'extra'}->{'omit_def_name_space'});
        $def_call .= $self->html_attribute_class('code',
                                      ['def-code-arguments']).'>'
                          . $arguments_formatted.'</code>';
      }
    } else {
      # only metasyntactic variable arguments (deffn, defvr, deftp, defop, defcv)
      # Has an effect only for @def* in @example and similar block
      # commands that sets code expansion.
      my $arguments_formatted = $self->set_context_convert_tree($arguments,
                                                 $CTXF_normal, $explanation);
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
    # we do not need to collect the author commands in documentinfo, so
    # we use a little trick to initialize the authors number to -1
    # to mean that we are in documentinfo
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
      my $text = $self->command_text($section, 'text_nonumber');
      # could happen with empty sectioning command
      next if (!defined($text) or $text eq '');

      $entry_index++;
      my $accesskey = '';
      $accesskey = " accesskey=\"$entry_index\""
        if ($self->get_conf('USE_ACCESSKEY') and $entry_index < 10);

      my $href = $self->command_href($section);
      $result .= "<li>";
      if (defined($href)) {
        $result .= "<a href=\"$href\"$accesskey>$text</a>";
      } else {
        $result .= $text;
      }
      $result .= "</li>\n";
    }
    $result .= "</ul>\n";
  }
  return $result;
}

# No equivalent function in C, corresponding code is inlined
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

  my $title_string = $self->get_info('title_string');
  if (defined($command)) {
    my $command_string;
    if ($self->get_conf('SECTION_NAME_IN_TITLE')
        and exists($command->{'cmdname'})
        and $command->{'cmdname'} eq 'node') {
      my $associated_title_command;
      my $document = $self->get_info('document');
      if (defined($document)) {
        my $nodes_list = $document->nodes_list();
        my $node_relations
          = $nodes_list->[$command->{'extra'}->{'node_number'} -1];
        $associated_title_command
          = $node_relations->{'associated_title_command'};

        if (defined($associated_title_command)) {
          $command_string
            = $self->command_text($associated_title_command, 'string');
        }
      }
    }
    if (!defined($command_string) or $command_string eq '') {
      # happens for @node and special_unit_element.
      # Also for @anchor and @namedanchor for redirection files.
      # TODO use command_name?  If SECTION_NAME_IN_TITLE?
      $command_string = $self->command_text($command, 'string');
    }
    if (defined($command_string) and $command_string ne ''
        and $command_string ne $title_string) {
      # TRANSLATORS: sectioning element title for the page header
      my $title_tree = $self->cdt('{element_text} ({title})',
                                  {'title' =>
                      Texinfo::TreeElement::new({'text' => $title_string,
                                                 'type' => '_converted'}),
                                   'element_text' =>
                      Texinfo::TreeElement::new({'text' => $command_string,
                                                 'type' => '_converted'})});

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
        = $self->convert_tree_new_formatting_context($title_tree,
                                  $context_str, $CTXF_string, 'element_title');
    }
    $command_description = $self->command_description($command, 'string');
  }
  $title = $title_string if (!defined($title));

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

  my $date = $self->get_info('date_in_header');
  $date = '' if (!defined($date));

  my $css_lines = &{$self->formatting_function('format_css_lines')}($self,
                                                                  $filename);

  my $doctype = $self->get_conf('DOCTYPE');
  $doctype = '' if (!defined($doctype));
  my $root_html_element_attributes
           = _root_html_element_attributes_string($self);
  my $body_attributes = $self->get_conf('BODY_ELEMENT_ATTRIBUTES');
  if (!defined($body_attributes)) {
    $body_attributes = '';
  } elsif ($body_attributes =~ /^[^ ]/) {
    $body_attributes = ' '.$body_attributes;
  }
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

  my $documentinfo_metadata = $self->get_info('documentinfo_metadata');
  $documentinfo_metadata = '' if (not defined($documentinfo_metadata));

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
          $program_and_version, $program_homepage, $program, $generator,
          $documentinfo_metadata);
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
      $program, $generator, $documentinfo_metadata)
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
   $documentinfo_metadata.
"
${links}$css_lines
$extra_head
</head>

<body$body_attributes>
$after_body_open";

  return $result;
}

sub _default_format_node_redirection_page($$;$) {
  my ($self, $command, $filename) = @_;

  # TODO use command_name?  Only if xrefautomaticsectiontitle is on?
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
      $program, $generator, $documentinfo_metadata)
        = _file_header_information($self, $command, $filename);

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
   $documentinfo_metadata.
"$extra_head
</head>

<body$body_attributes>
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
    # on multi_expanded_region($self) cannot know that the original context
    # of the @footnote in the main document was $multi_expanded_region.
    # We do not want to set multi_expanded in customizable code.  However, it
    # could be possible to set a shared_conversion_state based on $multi_expanded_region
    # and have all the conversion functions calling multi_expanded_region($self)
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
  my $footnote_heading = $self->special_unit_info_text('heading', 'footnotes');
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
      $self->cdt('There are no buttons for this document.'), 'ABOUT'). "\n";
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

# can be set through Texinfo::Config::texinfo_register_file_id_setting_function
my %customizable_file_id_setting_references;
foreach my $customized_reference ('external_target_split_name',
                'external_target_non_split_name',
                'label_target_name', 'node_file_name',
                'redirection_file_names',
                'sectioning_command_target_name',
                'special_unit_target_file_name', 'unit_file_name') {
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



# converter API implementation for function without XS overrides.

sub converter_initialize($) {
  my $self = shift;

  # beginning of initialization done either in Perl or XS
  _html_converter_initialize_beginning($self);

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
  foreach my $cmdname (keys(%default_upper_case_commands)) {
    $self->{'upper_case_commands'}->{$cmdname}
     = $default_upper_case_commands{$cmdname};
  }
  my $customized_upper_case_commands
    = Texinfo::Config::GNUT_get_upper_case_commands_info();
  if (defined($customized_upper_case_commands)) {
    foreach my $cmdname (keys(%$customized_upper_case_commands)) {
      $self->{'upper_case_commands'}->{$cmdname}
        = $customized_upper_case_commands->{$cmdname};
    }
  }

  $self->{'commands_conversion'} = {};
  my $customized_commands_conversion
     = Texinfo::Config::GNUT_get_commands_conversion();
  $customized_commands_conversion = {}
    if (!defined($customized_commands_conversion));
  foreach my $cmdname (keys(%line_commands), keys(%brace_commands),
     keys (%block_commands), keys(%nobrace_commands)) {
    if (exists($customized_commands_conversion->{$cmdname})) {
      $self->{'commands_conversion'}->{$cmdname}
          = $customized_commands_conversion->{$cmdname};
    } else {
      my $format_menu = $self->get_conf('FORMAT_MENU');
      if ($format_menu ne 'menu' and $format_menu ne 'menu_no_detailmenu'
          and ($cmdname eq 'menu' or $cmdname eq 'detailmenu')) {
        $self->{'commands_conversion'}->{$cmdname} = undef;
      } elsif (exists($format_raw_commands{$cmdname})
               and !$self->{'expanded_formats'}->{$cmdname}) {
        $self->{'commands_conversion'}->{$cmdname} = undef;
      } elsif (exists($default_commands_conversion{$cmdname})) {
        $self->{'commands_conversion'}->{$cmdname}
           = $default_commands_conversion{$cmdname};
      }
    }
  }

  $self->{'commands_open'} = {};
  my $customized_commands_open
     = Texinfo::Config::GNUT_get_commands_open();
  $customized_commands_open = {} if (!defined($customized_commands_open));
  foreach my $cmdname (keys(%line_commands), keys(%brace_commands),
     keys (%block_commands), keys(%nobrace_commands)) {
    if (exists($customized_commands_open->{$cmdname})) {
      $self->{'commands_open'}->{$cmdname}
          = $customized_commands_open->{$cmdname};
    } elsif (exists($default_commands_open{$cmdname})) {
      $self->{'commands_open'}->{$cmdname}
           = $default_commands_open{$cmdname};
    }
  }

  # get all the customization
  my %style_commands_customized_formatting_info;
  foreach my $cmdname (keys(%default_style_commands_formatting)) {
    foreach my $context (@style_commands_contexts) {
      my $style_commands_formatting_info
        = Texinfo::Config::GNUT_get_style_command_formatting($cmdname, $context);
      if (defined($style_commands_formatting_info)) {
        if (!exists($style_commands_customized_formatting_info{$cmdname})) {
          $style_commands_customized_formatting_info{$cmdname} = {};
        }
        $style_commands_customized_formatting_info{$cmdname}->{$context}
          = $style_commands_formatting_info;
      }
    }
  }

  $self->{'style_commands_formatting'} = {};
  foreach my $cmdname (keys(%default_style_commands_formatting)) {
    $self->{'style_commands_formatting'}->{$cmdname} = {};
    foreach my $context (@style_commands_contexts) {
      if (exists($style_commands_customized_formatting_info{$cmdname})
          and $style_commands_customized_formatting_info{$cmdname}->{$context}) {
        $self->{'style_commands_formatting'}->{$cmdname}->{$context}
          = $style_commands_customized_formatting_info{$cmdname}->{$context};
      } elsif (exists($default_style_commands_formatting{$cmdname}->{$context})) {
        $self->{'style_commands_formatting'}->{$cmdname}->{$context}
          = $default_style_commands_formatting{$cmdname}->{$context};
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
  foreach my $cmdname (keys(%{$default_no_arg_commands_formatting{'normal'}})) {
    $customized_no_arg_commands_formatting->{$cmdname} = {};
    foreach my $context (@no_args_commands_contexts, 'translated_to_convert') {
      my $no_arg_command_customized_formatting
        = Texinfo::Config::GNUT_get_no_arg_command_formatting($cmdname,
                                                              $context);
      if (defined($no_arg_command_customized_formatting)) {
        $customized_no_arg_commands_formatting->{$cmdname}->{$context}
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

  # Note that with XS this information is not actually used, as
  # it is only accessed through functions that are overriden
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

  # Note that with XS this information is not actually used, as
  # it is only accessed through functions that are overriden
  $self->{'translated_special_unit_info_texinfo'} = {};
  $self->{'translated_special_unit_info_tree'} = {};
  foreach my $type (keys(%default_translated_special_unit_info)) {
    $self->{'translated_special_unit_info_texinfo'}->{$type} = {};
    $self->{'translated_special_unit_info_tree'}->{$type} = {};
    foreach my $special_unit_variety
                 (keys(%{$default_translated_special_unit_info{$type}})) {
      if (exists($customized_special_unit_info->{$type})
          and exists($customized_special_unit_info
                          ->{$type}->{$special_unit_variety})) {
        $self->{'translated_special_unit_info_texinfo'}->{$type}
                                                 ->{$special_unit_variety}
         = $customized_special_unit_info->{$type}->{$special_unit_variety};
      } else {
        $self->{'translated_special_unit_info_texinfo'}->{$type}
                                               ->{$special_unit_variety}
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
  foreach my $direction (@text_directions_order) {
    $self->{'global_texts_directions'}->{$direction} = 1;
  }

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
      if (exists($self->{'all_directions'}->{$direction})
          and not grep {$_ eq $direction} @global_directions_order) {
        $self->converter_document_warn(sprintf(__(
                "keep direction %s, do not set to `%s'"), $direction,
                 $self->{'customized_global_directions'}->{$direction})
                );
        delete $self->{'customized_global_directions'}->{$direction};
      } else {
        $self->{'all_directions'}->{$direction} = 1;
      }
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

  return $self;
}

# remove data that leads to cycles related to output units and references
# to output units.
sub converter_release_output_units($) {
  my $self = shift;

  # remove references to output units
  if (exists($self->{'global_units_directions'})) {
    %{$self->{'global_units_directions'}} = ();
  }

  # Cannot do that, the content is still needed by the Converter
  #@{$self->{'document_units'}} = ();
  $self->{'document_units'} = [];
}

# remove data that leads to cycles and references to elements.
sub converter_destroy($) {
  my $self = shift;

  if (exists($self->{'converter_info'})) {
    foreach my $key ('document', 'simpletitle_tree', 'title_tree') {
      delete $self->{'converter_info'}->{$key};
    }
  }

  delete $self->{'current_node'};
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
      if (defined($no_arg_command_ctx->{'translated_tree'})) {
        my $tree = $no_arg_command_ctx->{'translated_tree'};
        # always a copy
        Texinfo::ManipulateTree::tree_remove_parents($tree);
      }
    }
  }

  delete $self->{'translated_special_unit_info_tree'};

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

# wrapper around convert_tree setting some context
sub set_context_convert_tree($$$;$) {
  my ($self, $tree, $context_type, $explanation) = @_;

  my $code_context_set;
  if (defined($context_type)) {
    if ($context_type & $CTXF_code) {
      _set_code_context($self, 1);
      $code_context_set = 1;
    } elsif ($context_type & $CTXF_normal) {
      _set_code_context($self, 0);
      $code_context_set = 1;
    }
  }
  my $result = $self->convert_tree($tree, $explanation);

  if ($code_context_set) {
    _pop_code_context($self);
  }
  return $result;
}

# Call convert_tree out of the main conversion flow.
sub convert_tree_new_formatting_context($$$;$$$$) {
  my ($self, $tree, $context_string, $context_type, $multiple_pass,
      $document_global_context, $block_command) = @_;

  _new_document_context($self, $context_string, $context_type,
                        $document_global_context, $block_command);

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

# the entry point for _convert
sub convert_tree($$;$) {
  my ($self, $tree, $explanation) = @_;

  # when formatting accents, goes through xml_accent without
  # explanation, as explanation is not in the standard API, but
  # otherwise the coverage of explanations should be pretty good
  #cluck if (! defined($explanation));
  #print STDERR "CONVERT_TREE".(defined($explanation) ? " ".$explanation : '')."\n"
  #    if ($self->get_conf('DEBUG'));
  return _convert($self, $tree, $explanation);
}

# implementation of convert_tree.

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

  # cache return value of get_conf for speed
  my $debug = $self->get_conf('DEBUG');

  if ($debug) {
    #cluck() if (!defined($explanation));
    $explanation = 'NO EXPLANATION' if (!defined($explanation));
    my $contexts_str = _debug_print_html_contexts($self);
    print STDERR "ELEMENT($explanation) ".$contexts_str
        . ": " . Texinfo::Common::debug_print_element($element) . "\n";
  }

  if (ref($element) ne 'HASH' and ref($element) ne 'Texinfo::TreeElement') {
    cluck "_convert: tree element not a HASH\n";
    return '';
  }

  # Process text
  if (exists($element->{'text'})) {
    if (exists($element->{'type'})
        and exists($self->{'types_conversion'}->{$element->{'type'}})
        and !defined($self->{'types_conversion'}->{$element->{'type'}})) {
      if ($debug) {
        print STDERR "IGNORE TEXT $command_type\n";
      }
      return '';
    }
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
          if (Texinfo::Common::empty_spaces_argument($arg)) {
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
              _new_document_context($self, $command_type, $CTXF_string);
              $arg_formatted->{$arg_type} = _convert($self, $arg, $explanation);
              #_unset_string_context($self);
              _pop_document_context($self);
            } elsif ($arg_type eq 'monospacestring') {
              _new_document_context($self, $command_type,
                                    $CTXF_string | $CTXF_code);
              $arg_formatted->{$arg_type} = _convert($self, $arg, $explanation);
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
        $self->converter_set_documentlanguage(
                                  $self->get_conf('documentlanguage'));
        _translate_names($self);
      } elsif ($command_name eq 'documentscript') {
        $self->converter_set_documentscript(
                                  $self->get_conf('documentscript'));
        _translate_names($self);
      } elsif ($command_name eq 'documentlanguagevariant') {
        my $language_variants
          = Texinfo::Common::documentlanguagevariant_variants($element);
        $self->converter_set_documentlanguagevariant($language_variants);
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

1;

# The documentation of the customization API is in the texi2any_api
# Texinfo manual, which also includes documentation of functions and
# data from multiple modules.

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
