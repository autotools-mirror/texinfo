# Plaintext.pm: output tree as text with filling.  Implementation of
#               functions with an XS interface
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
# Names of methods overriden in Texinfo::Convert::Info begin with format_.

package Texinfo::Convert::Plaintext;

use 5.006;

# See comment at start of HTML.pm
use if $] >= 5.012, feature => qw(unicode_strings);

use if $] >= 5.014, re => '/a';

use strict;
use warnings;

# To check if there is no erroneous autovivification
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck confess);
use Encode;

use Texinfo::Commands;
use Texinfo::CommandsValues;
use Texinfo::Common;
use Texinfo::Indices;

use Texinfo::TreeElement;

use Texinfo::Convert::Texinfo;

use Texinfo::Structuring;
use Texinfo::OutputUnits;
use Texinfo::Convert::Utils;
use Texinfo::Convert::Text;
use Texinfo::Convert::Converter;
use Texinfo::Convert::Paragraph qw(add_end_sentence add_next add_pending_word
       add_text allow_end_sentence end_line remove_end_sentence
       set_frenchspacing set_space_protection);

# commands that are of use for formatting.
my %formatted_line_commands = %Texinfo::Commands::formatted_line_commands;
my %formatted_nobrace_commands = %Texinfo::Commands::formatted_nobrace_commands;
my %formattable_line_commands = %Texinfo::Commands::formattable_line_commands;
my %brace_commands = %Texinfo::Commands::brace_commands;


my $NO_NUMBER_FOOTNOTE_SYMBOL = '*';

# documentlanguage is used through cdt().
my @informative_global_commands = ('paragraphindent', 'firstparagraphindent',
 'exampleindent',
 'frenchspacing', 'footnotestyle', 'documentlanguage', 'documentscript',
 'deftypefnnewline');

my %informative_commands;
foreach my $informative_command (@informative_global_commands) {
  $informative_commands{$informative_command} = 1;
}

# used to pass to Texinfo::Convert::Info
sub get_informative_global_commands($) {
  my $self = shift;

  return @informative_global_commands;
}

my %brace_no_arg_commands;
foreach my $command (keys(%brace_commands)) {
  $brace_no_arg_commands{$command} = 1
    if ($brace_commands{$command} eq 'noarg');
}
my %line_commands = %Texinfo::Commands::line_commands;
my %nobrace_commands = %Texinfo::Commands::nobrace_commands;
my %sectioning_heading_commands = %Texinfo::Commands::sectioning_heading_commands;
my %def_commands = %Texinfo::Commands::def_commands;
my %ref_commands = %Texinfo::Commands::ref_commands;
my %block_commands = %Texinfo::Commands::block_commands;
my %root_commands = %Texinfo::Commands::root_commands;
my %preformatted_commands = %Texinfo::Commands::preformatted_commands;
my %math_commands = %Texinfo::Commands::math_commands;
my %preformatted_code_commands = %Texinfo::Commands::preformatted_code_commands;
my %default_index_commands = %Texinfo::Commands::default_index_commands;
my %letter_no_arg_commands = %Texinfo::Commands::letter_no_arg_commands;

my %nobrace_symbol_text = %Texinfo::CommandsValues::nobrace_symbol_text;
my %explained_commands = %Texinfo::Commands::explained_commands;
my %inline_format_commands = %Texinfo::Commands::inline_format_commands;
my %brace_code_commands       = %Texinfo::Commands::brace_code_commands;

my @contents_commands = ('contents', 'shortcontents', 'summarycontents');

foreach my $kept_command (keys (%informative_commands), @contents_commands,
  keys (%default_index_commands), keys(%formattable_line_commands),
  'documentlanguagevariant') {
  $formatted_line_commands{$kept_command} = 1;
}

# formatted/formattable @-commands not formatted in Plaintext/Info
foreach my $non_formatted_line_command ('page', 'need', 'vskip',
   'subtitle', 'title', 'maketitle') {
  delete $formatted_line_commands{$non_formatted_line_command};
}

foreach my $def_command (keys(%def_commands)) {
  $formatted_line_commands{$def_command} = 1
    if (exists($line_commands{$def_command}));
}

# There are 6 stacks that define the context.
# context:   relevant for alignement of text.  Set in math, footnote,
#            listoffloats, flush_commands, preformatted_context_commands
#            (preformatted + menu + verbatim), and raw commands if
#            on top level.
# format_context: used for the count of paragraphs and for the indentation.
#            Set in footnote, for all commands relevant for indenting, like
#            @*table, @itemize, @enumerate, preformatted commands,
#            @*quotation, @def*, and also menu commands, @flushleft,
#            @flushright, @float, in multitable cell and raw commands if at
#            toplevel.
# text_element_context: for the max columns and the counter in the line
#            position (although the counter in the line is taken over by
#            the formatter once a formatter is opened).
#            Set in footnote and in multitable cells.
# formatters: a formatter environment has stacks for formatting context.
#            Also holds a container, an objects that does the counting
#            of columns, actual indentation.  In general, it is better not
#            to have formatters in parallel, but it may happen.
# count_context: holds the lines count of the index commands and the
#            stream of converted text and anchors.
#            It is set for out of document formatting to avoid
#            counting lines in that case and keep converted output separate,
#            but it is also set when it has to be modified afterwards, for
#            aligned commands or multitable cells for example.
# document_context: Used to keep track if we are in a multitable and gather
#                   authors elements in quotations.

# formatters have their own stack
# in container
# 'upper_case'
# 'var'
# 'font_type_stack'
#
# paragraph number incremented with paragraphs, center, listoffloats
# and block commands except: html and such, group, raggedright, menu*, float

my %menu_commands;

my %format_raw_commands;
foreach my $block_command (keys(%block_commands)) {
  $menu_commands{$block_command} = 1
    if ($block_commands{$block_command} eq 'menu');
  $format_raw_commands{$block_command} = 1
    if ($block_commands{$block_command} eq 'format_raw');
}

my %preformatted_context_commands = (%preformatted_commands,
                                     %format_raw_commands);
foreach my $preformatted_command ('verbatim', keys(%menu_commands)) {
  $preformatted_context_commands{$preformatted_command} = 1;
}

my %ignored_line_commands;
foreach my $line_command (keys(%line_commands)) {
  $ignored_line_commands{$line_command} = 1
    unless (exists($formatted_line_commands{$line_command}));
}

my %ignored_nobrace_commands;
foreach my $nobrace_command (keys(%nobrace_commands)) {
  $ignored_nobrace_commands{$nobrace_command} = 1
    unless (exists($formatted_nobrace_commands{$nobrace_command}));
}

my %ignored_commands = (%ignored_line_commands, %ignored_nobrace_commands);
foreach my $ignored_brace_commands ('caption', 'shortcaption',
                                    'hyphenation', 'sortas', 'errormsg',
                                    'seeentry', 'seealso') {
  $ignored_commands{$ignored_brace_commands} = 1;
}

my %item_indent_format_length = ('enumerate' => 2,
    'itemize' => 3,
    'table' => 0,
    'vtable' => 0,
    'ftable' => 0,
 );

my $default_indent_length = 5;

my %example_indented_commands;
foreach my $indented_command (keys(%preformatted_commands)) {
  $example_indented_commands{$indented_command} = 1;
}

foreach my $non_indented ('format', 'smallformat') {
  delete $example_indented_commands{$non_indented};
}

my %indented_commands = %example_indented_commands;
foreach my $indented_command (keys(%item_indent_format_length),
           'quotation', 'smallquotation',
           'indentedblock', 'smallindentedblock',
           'defblock', keys(%def_commands)) {
  $indented_commands{$indented_command} = 1
    if (exists($block_commands{$indented_command}));
}

my %format_context_commands = %indented_commands;

foreach my $format_context_command (keys(%menu_commands), 'verbatim',
 'flushleft', 'flushright', 'multitable', 'float') {
  $format_context_commands{$format_context_command} = 1;
}

foreach my $block_math_command (keys(%math_commands)) {
  if (exists($block_commands{$block_math_command})) {
    $preformatted_context_commands{$block_math_command} = 1;
    $format_context_commands{$block_math_command} = 1;
  }
}

my %flush_commands = (
  'flushleft'  => 1,
  'flushright' => 1
);

# commands that leads to advancing the paragraph number.  This is mostly
# used to determine the first line, in fact.
my %advance_paragraph_count_commands;
foreach my $command (keys(%block_commands)) {
  next if (exists($menu_commands{$command})
            or $block_commands{$command} eq 'raw');
  $advance_paragraph_count_commands{$command} = 1;
}

# group and raggedright do more than not advancing para, they should also
# be transparent with respect to paragraph number counting.
foreach my $not_advancing_para ('group', 'raggedright',
  'titlepage', 'copying', 'documentdescription', 'documentinfo',
   'publication', 'float') {
  delete $advance_paragraph_count_commands{$not_advancing_para};
}

foreach my $advancing_para('center', 'verbatim', 'listoffloats') {
  $advance_paragraph_count_commands{$advancing_para} = 1;
}

foreach my $ignored_block_commands ('ignore', 'macro', 'rmacro', 'linemacro',
   'copying', 'documentdescription', 'documentinfo', 'publication',
   'titlepage', 'direntry', 'nodedescriptionblock') {
  $ignored_commands{$ignored_block_commands} = 1;
}

my %punctuation_no_arg_commands;
foreach my $punctuation_command('enddots', 'exclamdown', 'questiondown') {
  $punctuation_no_arg_commands{$punctuation_command} = 1;
}

my %upper_case_commands = (
 'sc' => 1,
 'var' => 1
);

my %ignorable_space_types;
foreach my $type (
            'ignorable_spaces_after_command',
            'spaces_at_end',
            # not ignored as menu manual formatting is kept as is
            #'space_at_end_menu_node',
            'spaces_after_close_brace',
            'spaces_before_argument',
            'spaces_after_argument'
    ) {
  $ignorable_space_types{$type} = 1;
}

my %ignored_types;
foreach my $type (
            'postamble_after_end',
            'preamble_before_beginning',
            'preamble_before_setfilename',
            'arguments_line') {
  $ignored_types{$type} = 1;
}

my %style_map = (
  'strong' => ['*', '*'],
  'emph'   => ['_', '_'],
  'key'    => ['<', '>'],
  'sub'    => ['_{', '}'],
  'sup'    => ['^{', '}']
);

# math is special
my %asis_commands;
for my $asis_command ('asis', 'w', 'b', 'i', 't', 'r', 'slanted', 'sansserif',
                     'verb', 'clicksequence', 'headitemfont', 'dmn') {
  $asis_commands{$asis_command} = 1;
}

my %quoted_commands;
# %non_quoted_commands_when_nested have no quote when in code command contexts
my %non_quoted_commands_when_nested;

for my $quoted_command ('cite', 'code', 'command', 'env', 'file',
                        'indicateurl', 'kbd', 'option', 'samp') {
  $quoted_commands{$quoted_command} = 1;
  if ($brace_code_commands{$quoted_command}) {
    $non_quoted_commands_when_nested{$quoted_command} = 1;
  }
}
# always quoted even when nested
delete $non_quoted_commands_when_nested{'samp'};
delete $non_quoted_commands_when_nested{'indicateurl'};

my %double_quoted_commands = ('dfn' => 1);

# Commands producing styles that are output in node names and index entries.
my %index_style_commands;
for my $index_style_command ('strong', 'emph', 'sub', 'sup', 'key') {
  $index_style_commands{$index_style_command} = 1;
}


# in those commands, there is no addition of double space after a dot.
# math is special
my %no_punctuation_munging_commands;
foreach my $command ('cite', 'dmn', keys(%brace_code_commands)) {
  $no_punctuation_munging_commands{$command} = 1;
}

# values for integer and string options in code generated from
# Texinfo/Convert/converters_defaults.txt
my $regular_defaults = Texinfo::Options::get_regular_options('plaintext');
my %defaults = ( %{$regular_defaults} );

# define converter here such that the function is replaced by the XS
# interface.
sub converter($;$) {
  my ($class, $conf) = @_;
  return Texinfo::Convert::Converter::converter($class, $conf);
}

sub destroy_formatter($) {
  my $formatter = shift;

  Texinfo::Convert::Paragraph::destroy($formatter->{'container'});
  $formatter = undef;
}

sub push_top_formatter($$) {
  my ($self, $top_context) = @_;

  push @{$self->{'context'}}, $top_context;
  push @{$self->{'format_context'}}, {
                                     'cmdname' => '_top_format',
                                     'context_indent_len' => 0,
                                     'paragraph_count' => 0,
                                   };
  push @{$self->{'text_element_context'}}, {
                                     'max' => $self->{'fillcolumn'},
                                     'counter' => 0,
                                   };
  push @{$self->{'document_context'}}, {
                                     'in_multitable' => 0,
                                     'quotations_authors' => []
                                   };

  # This is not really meant to be used, as contents should open
  # their own formatters, however it happens that there is some text
  # outside any content that needs to be formatted, as @sp for example.
  push @{$self->{'formatters'}}, new_formatter($self, 'line');
  $self->{'formatters'}->[-1]->{'_top_formatter'} = 1;
}

sub pop_top_formatter($) {
  my $self = shift;

  my $old_context = pop @{$self->{'context'}};
  destroy_formatter(pop @{$self->{'formatters'}});
  pop @{$self->{'format_context'}};
  pop @{$self->{'text_element_context'}};
  pop @{$self->{'document_context'}};

  return $old_context;
}

sub converter_defaults($;$) {
  return \%defaults;
}

sub _setup_output_encoding($) {
  my $self = shift;

  my $encoding
      = Texinfo::Common::processing_output_encoding(
                               $self->{'output_encoding_name'});
  # TODO currently encoding cannot be ascii unless directly
  # specified as OUTPUT_ENCODING_NAME customization variable as
  # ascii documentencoding is mapped to us-ascii as input encoding
  # (either explicitly in C or through Encode mime_name in Perl)
  # and then us-ascii is mapped to iso-8859-1 output perl encoding
  # through Texinfo::Common::encoding_name_conversion_map.
  if (!defined($encoding) or $encoding eq 'ascii') {
    return;
  }
  my $Encode_encoding_object = Encode::find_encoding($encoding);
  if (!defined($Encode_encoding_object)) {
    Carp::croak "Unknown encoding '$encoding'";
  }
  $self->{'encoding_object'} = $Encode_encoding_object;
}

sub conversion_initialization($;$) {
  my ($self, $document) = @_;

  $self->set_document($document);

  $self->{'seenmenus'} = {};
  $self->{'index_entry_info'} = {};

  $self->{'footnote_index'} = 0;
  $self->{'pending_footnotes'} = [];
  $self->{'index_entry_node_colon'} = {};
  $self->{'index_entries_no_node'} = {};
  $self->{'seen_node_descriptions'} = {};

  # If a tree is reused, for example is converted twice, it could
  # be possible and more efficient to reuse the converted node names.
  # However, in that case, the error messages emitted during their
  # conversion will not be emitted at each conversion, which seems
  # to be preferrable.
  $self->{'node_names_text'} = {};

  delete $self->{'outside_of_any_node_text'};

  delete $self->{'current_node'};

  delete $self->{'encoding_object'};

  # for INFO_MATH_IMAGES
  #$self->{'elements_images'};

  $self->set_global_document_commands('before', \@informative_global_commands);
  $self->set_global_document_commands('before', \@contents_commands);

  # disable encoding in output_files related code, as the strings passed
  # from Info or plaintext to write to files are already encoded.
  Texinfo::Convert::Utils::output_files_disable_output_encoding
    ($self->{'output_files'}, 1);

  $self->{'open_quote'} = "'";
  $self->{'close_quote'} = "'";
  $self->{'open_double_quote'} = '"';
  $self->{'close_double_quote'} = '"';

  if ($self->get_conf('ENABLE_ENCODING')) {
    my $enabled_encoding = $self->get_conf('OUTPUT_ENCODING_NAME');
    if (defined($enabled_encoding)) {
      $self->{'enabled_encoding'} = $enabled_encoding;
      if ($enabled_encoding eq 'utf-8') {
        # cache this to avoid redoing calls to get_conf
        $self->{'to_utf8'} = 1;
        # Directed single quotes
        $self->{'open_quote'} = "\x{2018}";
        $self->{'close_quote'} = "\x{2019}";
        # Directed double quotes
        $self->{'open_double_quote'} = "\x{201C}";
        $self->{'close_double_quote'} = "\x{201D}";
      }
    }
  }
  if (defined($self->get_conf('OPEN_QUOTE_SYMBOL'))) {
    $self->{'open_quote'} = $self->get_conf('OPEN_QUOTE_SYMBOL');
  }
  if (defined($self->get_conf('CLOSE_QUOTE_SYMBOL'))) {
    $self->{'close_quote'} = $self->get_conf('CLOSE_QUOTE_SYMBOL');
  }

  if (defined($self->get_conf('OPEN_DOUBLE_QUOTE_SYMBOL'))) {
    $self->{'open_double_quote'} = $self->get_conf('OPEN_DOUBLE_QUOTE_SYMBOL');
  }
  if (defined($self->get_conf('CLOSE_DOUBLE_QUOTE_SYMBOL'))) {
    $self->{'close_double_quote'} = $self->get_conf('CLOSE_DOUBLE_QUOTE_SYMBOL');
  }

  # some caching to avoid calling get_conf
  $self->{'ascii_glyph'} = $self->get_conf('ASCII_GLYPH');
  $self->{'output_encoding_name'} = $self->get_conf('OUTPUT_ENCODING_NAME');
  $self->{'debug'} = $self->get_conf('DEBUG');

  # initialize context stacks
  $self->{'context'} = [];
  $self->{'format_context'} = [];
  push @{$self->{'count_context'}}, {'lines' => 0,
                                     'index_entry_locations' => [],
                                     'pending_text' => [['']],
  };

  $self->push_top_formatter('_Root_context');
}

sub converter_initialize($) {
  my $self = shift;

  $self->{'warn_strong_note'} = $self->format_warn_strong_note();

  %{$self->{'ignored_commands'}} = %ignored_commands;

  foreach my $format (keys(%format_raw_commands)) {
    $self->{'ignored_commands'}->{$format} = 1
       unless ($self->{'expanded_formats'}->{$format});
  }

  if ($self->get_conf('ASCII_PUNCTUATION')) {
    $self->set_conf('ASCII_DASHES_AND_QUOTES', 1);
    $self->set_conf('ASCII_GLYPH', 1);
    $self->set_conf('OPEN_QUOTE_SYMBOL', '\'');
    $self->set_conf('CLOSE_QUOTE_SYMBOL', '\'');
    $self->set_conf('OPEN_DOUBLE_QUOTE_SYMBOL', '"');
    $self->set_conf('CLOSE_DOUBLE_QUOTE_SYMBOL', '"');
  }
  if ($self->get_conf('ASCII_DASHES_AND_QUOTES')) {
    # cache to avoid calling get_conf
    $self->{'ascii_dashes_and_quotes'} = 1;
  } else {
    $self->{'ascii_dashes_and_quotes'} = 0;
  }
  if (defined($self->get_conf('FILLCOLUMN'))) {
    $self->{'fillcolumn'} = $self->get_conf('FILLCOLUMN');
  } else {
    $self->{'fillcolumn'}
      = $Texinfo::Options::converter_cmdline_options{'FILLCOLUMN'};
  }

  if ($self->get_conf('INFO_SPECIAL_CHARS_QUOTE')) {
    $self->{'info_special_chars_quote'}
       = $self->get_conf('INFO_SPECIAL_CHARS_QUOTE');
    if (!defined($self->get_conf('INFO_SPECIAL_CHARS_WARNING'))) {
      $self->set_conf('INFO_SPECIAL_CHARS_WARNING', 0);
    }
  } else {
    $self->{'info_special_chars_quote'} = 0;
    if (!defined($self->get_conf('INFO_SPECIAL_CHARS_WARNING'))) {
      $self->set_conf('INFO_SPECIAL_CHARS_WARNING', 1);
    }
  }
  if ($self->get_conf('INFO_SPECIAL_CHARS_WARNING')) {
    $self->{'info_special_chars_warning'}
       = $self->get_conf('INFO_SPECIAL_CHARS_WARNING');
  } else {
    $self->{'info_special_chars_warning'} = 0;
  }

  return $self;
}

sub converter_destroy($) {
  my $self = shift;

  delete $self->{'index_entry_info'};
  delete $self->{'current_node'};
  delete $self->{'elements_images'};
}

sub conversion_finalization($) {
  my $self = shift;

  $self->pop_top_formatter();

  my $count_contexts_nr = scalar(@{$self->{'count_context'}});
  if ($count_contexts_nr != 1) {
    $self->present_bug_message("Remaining count_context at finalization (".
                        $count_contexts_nr . ")\n");
  }

  if ($count_contexts_nr > 0) {
    splice(@{$self->{'count_context'}}, 0, $count_contexts_nr);
  }

  delete $self->{'target_locations'};
}

sub count_context_bug_message($$$) {
  my ($self, $precision, $output_unit) = @_;

  if (scalar(@{$self->{'count_context'}}) != 1) {
    my $output_unit_text;
    if ($output_unit) {
      $output_unit_text
         = Texinfo::OutputUnits::output_unit_texi($output_unit);
    } else {
      $output_unit_text = '';
    }
    $self->present_bug_message("Too much count_context ${precision}(".
      scalar(@{$self->{'count_context'}}). "): ". $output_unit_text,
                               $output_unit->{'unit_command'});
    die;
  }
}

sub convert_output_unit($$) {
  my ($self, $output_unit) = @_;

  if (exists($output_unit->{'unit_contents'})) {
    foreach my $content (@{$output_unit->{'unit_contents'}}) {
      _convert($self, $content);
    }
  }
  $self->count_context_bug_message('', $output_unit);
  $self->process_footnotes($output_unit);
  _adjust_final_locations($self);
  $self->count_context_bug_message('footnotes ', $output_unit);

  return;
}

sub convert($$) {
  my ($self, $document) = @_;

  $self->conversion_initialization($document);

  my $result = '';

  my $output_units = Texinfo::OutputUnits::split_by_node($document);
  $self->register_output_units_lists([$output_units]);

  foreach my $output_unit (@$output_units) {
    convert_output_unit($self, $output_unit);
    $result .= _stream_final_result($self);
  }

  $self->conversion_finalization();

  return $result;
}

# use file_counters and out_filepaths converter states.
sub output($$) {
  my ($self, $document) = @_;

  $self->conversion_initialization($document);

  my $output_units;

  if (defined($self->get_conf('OUTFILE'))
      and ($Texinfo::Common::null_device_file{$self->get_conf('OUTFILE')}
           or $self->get_conf('OUTFILE') eq '-'
           or $self->get_conf('OUTFILE') eq '')) {
    if ($self->get_conf('SPLIT')) {
      $self->converter_document_warn(
               sprintf(__("%s: output incompatible with split"),
                                   $self->get_conf('OUTFILE')));
      $self->force_conf('SPLIT', '');
    }
  }
  if ($self->get_conf('SPLIT')) {
    $self->set_conf('NODE_FILES', 1);
  }

  my ($output_file, $destination_directory, $output_filename,
       $document_name)
      = $self->determine_files_and_directory(
                          $self->get_conf('TEXINFO_OUTPUT_FORMAT'));
  my ($encoded_destination_directory, $dir_encoding)
    = $self->encoded_output_file_name($destination_directory);
  my $succeeded
    = $self->create_destination_directory($encoded_destination_directory,
                                          $destination_directory);
  unless ($succeeded) {
    $self->conversion_finalization();
    return undef;
  }

  if ($self->get_conf('USE_NODES')) {
    $output_units = Texinfo::OutputUnits::split_by_node($document);
  } else {
    $output_units = Texinfo::OutputUnits::split_by_section($document);
  }

  my $nodes_list = $document->nodes_list();
  # Do not call _cache_node_names as only the node names used in index
  # formatting are needed, therefore we may generate names that are
  # not used if we call the function.
  #_cache_node_names($self, $nodes_list);

  Texinfo::OutputUnits::split_pages($output_units, $nodes_list,
                                    $self->get_conf('SPLIT'));

  $self->register_output_units_lists([$output_units]);

  # determine file names associated with the different pages
  if ($output_file ne '') {
    $self->set_output_units_files($output_units, $output_file,
                                   $destination_directory,
                                   $output_filename, $document_name);
    _setup_output_encoding($self);
  }

  # Now do the output
  my $fh;
  if (!defined($output_units->[0]->{'unit_filename'})) {
    # no page
    my $output = '';
    my $outfile_name;
    my $encoded_outfile_name;
    if ($output_file ne '') {
      if ($self->get_conf('SPLIT')) {
        my $top_node_file_name = $self->top_node_filename($document_name);
        if ($destination_directory ne '') {
          $outfile_name = join('/', ($destination_directory,
                                     $top_node_file_name));
        } else {
          $outfile_name = $top_node_file_name;
        }
      } else {
        $outfile_name = $output_file;
      }
      print STDERR "DO No pages, output in $outfile_name\n"
        if ($self->{'debug'});
      my $path_encoding;
      ($encoded_outfile_name, $path_encoding)
        = $self->encoded_output_file_name($outfile_name);
      my $open_error_message;
      # the third return information, set if the file has already been used
      # in this files_information is not checked as this cannot happen.
      ($fh, $open_error_message)
           = Texinfo::Convert::Utils::output_files_open_out(
                    $self->output_files_information(),
                    $encoded_outfile_name, undef,
                    $self->get_conf('OUTPUT_ENCODING_NAME'));
      if (!defined($fh)) {
        $self->converter_document_error(
                 sprintf(__("could not open %s for writing: %s"),
                                      $outfile_name, $open_error_message));
        $self->conversion_finalization();
        return undef;
      }
    } else {
      print STDERR "DO No pages, string output\n"
        if ($self->{'debug'});
    }

    foreach my $output_unit (@$output_units) {
      $self->convert_output_unit($output_unit);
      my $output_unit_text = _stream_final_result($self);
      $output .= $self->write_or_return($output_unit_text, $fh);
    }
    # Do not close STDOUT now.
    # This avoids a Perl warning, "Filehandle STDOUT reopened as FH only for
    # input", which happens if STDOUT is closed and then the file descriptor
    # of STDOUT (typically 1) is reused for another filehandle opened in input
    # only.
    # It is a good idea to keep STDOUT open such that a call to open does
    # not reuse the STDOUT file descriptor, as open is expected to reuse the
    # lowest-numbered file descriptor not currently open, so we keep it open
    # and the main program should close it.
    if (defined($fh) and $outfile_name ne '-') {
      Texinfo::Convert::Utils::output_files_register_closed(
                  $self->output_files_information(), $encoded_outfile_name);
      if (!close($fh)) {
        $self->converter_document_error(
                 sprintf(__("error on closing %s: %s"),
                                      $outfile_name, $!));
      }
    }
    if ($output_file eq '') {
      $self->conversion_finalization();
      return $output;
    }
  } else {
    # output with pages
    print STDERR "DO Elements with filenames\n"
      if ($self->{'debug'});
    my %files_filehandle;

    foreach my $output_unit (@$output_units) {
      my $output_unit_filename = $output_unit->{'unit_filename'};
      my $out_filepath = $self->{'out_filepaths'}->{$output_unit_filename};
      my $file_fh;
      # open the file and output the elements
      if (!exists($files_filehandle{$output_unit_filename})) {
        my $error_message;
        ($file_fh, $error_message) = Texinfo::Convert::Utils::output_files_open_out(
                             $self->output_files_information(),
                             $out_filepath, undef,
                             $self->get_conf('OUTPUT_ENCODING_NAME'));
        if (!defined($file_fh)) {
          $self->converter_document_error(
                sprintf(__("could not open %s for writing: %s"),
                       $out_filepath, $error_message));
          $self->conversion_finalization();
          return undef;
        }
        $files_filehandle{$output_unit_filename} = $file_fh;
      } else {
        $file_fh = $files_filehandle{$output_unit_filename};
      }
      $self->convert_output_unit($output_unit);
      my $output_unit_text = _stream_final_result($self);
      print $file_fh $output_unit_text;
      $self->{'file_counters'}->{$output_unit_filename}--;
      if ($self->{'file_counters'}->{$output_unit_filename} == 0) {
        # Do not close STDOUT now such that the file descriptor is not reused
        # by open, which uses the lowest-numbered file descriptor not open,
        # for another filehandle.  Closing STDOUT is handled by the caller.
        if ($out_filepath ne '-') {
          Texinfo::Convert::Utils::output_files_register_closed(
            $self->output_files_information(), $out_filepath);
          if (!close($file_fh)) {
            $self->converter_document_error(
                     sprintf(__("error on closing %s: %s"),
                                  $out_filepath, $!));
            $self->conversion_finalization();
            return undef;
          }
        }
      }
    }
  }
  $self->conversion_finalization();
  return undef;
}

my $end_sentence = quotemeta('.?!');
my $after_punctuation = quotemeta('"\')]');

sub _protect_sentence_ends($) {
  my $text = shift;

  # Avoid suppressing end of sentence, by inserting a control character
  # in front of the full stop.  The choice of BS for this is arbitrary.
  # Note that the use of ?: is not crucial but since we do not use the
  # grouping value, setting no backtracking could be more efficient.
  $text =~ s/(?<=[^\p{Upper}])
             (?=[$end_sentence][$after_punctuation]*(?:\s|$))
             /\x08/xg;

  # Also insert a control character at end of string, to protect a full stop
  # that may follow later.

  #$text =~ s/(?<=[^\p{Upper}\s][$after_punctuation]*)$/\x08/;
  # Perl doesn't support "variable length lookbehind"

  $text = reverse $text;
  $text =~ s/^(?=[$after_punctuation]*(?:[^\p{Upper}\s]))/\x08/;
  $text = reverse $text;

  return $text;
}

my %dash_text = ('---' => '--', '--' => '-');

sub _process_text_internal($) {
  my $text = shift;

  # \x{1F} is a control character, ^_ that should not be present in Texinfo
  # manuals, this is why it had been choosen here.  It is used in Info, though
  # so it can happen in tests.  Not using any placeholder is better anyway
  # and simple timing showed no difference.  The use of a placeholder could
  # be reinstated but with another control character if something faster is
  # needed and using a placeholder is faster.  However, as long as there is
  # an XS override for the functions, this is probably unneeded.
  #$text =~ s/---/\x{1F}/g;
  #$text =~ s/--/-/g;
  #$text =~ s/\x{1F}/--/g;
  $text =~ s/(---|--)/$dash_text{$1}/g;
  $text =~ s/``/"/g;
  $text =~ s/\'\'/"/g;
  $text =~ s/`/'/g;

  return $text;
}

sub new_formatter($$;$$$) {
  my ($self, $type,
      $indent_length, $indent_length_next, $formatter_conf) = @_;

  my $container_conf = {};

  # TODO this is not true, there is some debugging output in the C code.
  # There is no corresponding debugging output in the C code.
  # need to be uncommented and only if debug > 1
  #$container_conf->{'debug'} = 1 if (defined($self->{'debug'})
  #                                   and $self->{'debug'} > 1);
  #$container_conf->{'debug'} = 1;

  $container_conf->{'indent_length'} = (defined($indent_length) ? $indent_length
           : $self->{'format_context'}->[-1]->{'context_indent_len'});

  $container_conf->{'indent_length_next'} = $indent_length_next;

  my $frenchspacing_conf = $self->get_conf('frenchspacing');

  $container_conf->{'frenchspacing'} = 1
    if ($frenchspacing_conf eq 'on');

  $container_conf->{'counter'}
    = $self->{'text_element_context'}->[-1]->{'counter'};

  my $container;
  if ($type eq 'paragraph') {
    $container_conf->{'max'} = $self->{'text_element_context'}->[-1]->{'max'};
    if ($flush_commands{$self->{'context'}->[-1]}) {
      $container_conf->{'ignore_columns'} = 1;
      $container_conf->{'keep_end_lines'} = 1;
    }
    # nothing else to change/set
  } elsif ($type eq 'line') {
    $container_conf->{'max'} = 10000001;
    $container_conf->{'keep_end_lines'} = 1;
    $container_conf->{'no_final_newline'} = 1;
    $container_conf->{'add_final_space'} = 1;
  } elsif ($type eq 'unfilled') {
    $container_conf->{'max'} = 10000000;
    $container_conf->{'ignore_columns'} = 1;
    $container_conf->{'keep_end_lines'} = 1;
    $container_conf->{'frenchspacing'} = 1;
    $container_conf->{'unfilled'} = 1;
    $container_conf->{'no_final_newline'} = 1;
  } else {
    die "Unknown container type $type\n";
  }
  $container = Texinfo::Convert::Paragraph::new($container_conf);

  my $formatter = {'container' => $container,
                   'upper_case_stack' => [{}],
                   'font_type_stack' => [{}],
                   'w' => 0,
                   'frenchspacing_stack' => [ $frenchspacing_conf ],
                   'suppress_styles' => undef,
                   'no_added_eol' => undef};
  if (defined($formatter_conf)) {
    $formatter->{'suppress_styles'} = $formatter_conf->{'suppress_styles'};
    $formatter->{'no_added_eol'} = $formatter_conf->{'no_added_eol'};
  }

  if ($type eq 'unfilled') {
    foreach my $context (reverse(@{$self->{'context'}})) {
      if (exists($menu_commands{$context})) {
        last;
      } elsif (exists($preformatted_code_commands{$context})
               or exists($format_raw_commands{$context})
               or exists($math_commands{$context})) {
        $formatter->{'font_type_stack'}->[-1]->{'monospace'} = 1;
        $formatter->{'font_type_stack'}->[-1]->{'code_command'} = 1
          if (exists($preformatted_code_commands{$context})
              or exists($math_commands{$context}));
        last;
      }
    }
  }
  return $formatter;
}

# intercept messages, in case some Texinfo is processed twice
sub plaintext_line_warn($$$$) {
  my ($self, $configuration_information, $text, $error_location_info) = @_;

  if (!$self->{'silent'}) {
    $self->converter_line_warn($text, $error_location_info);
  }
}

sub plaintext_line_error($$$$) {
  my ($self, $configuration_information, $text, $error_location_info) = @_;

  if (!$self->{'silent'}) {
    $self->converter_line_error($text, $error_location_info);
  }
}

sub _add_lines_count($$) {
  my ($self, $lines_count) = @_;

  $self->{'count_context'}->[-1]->{'lines'} += $lines_count;
}

sub add_target_location($$) {
  my ($self, $element) = @_;

  my $anchor_info = {'conv_type' => 'anchor', 'anchor' => $element};

  my $count_context = $self->{'count_context'}->[-1];
  if (scalar(@{$count_context->{'pending_text'}->[-1]}) == 1) {
    push @{$count_context->{'pending_text'}->[-1]}, $anchor_info;
  } else {
    push @{$count_context->{'pending_text'}}, ['', $anchor_info];
  }
  push @{$count_context->{'pending_text'}}, [''];
  return;
}

# Used at the end of an output unit.  Decrement any location line counters
# if equal to the current line count, as this could be past the end of a
# node.
sub _adjust_final_locations($) {
  my $self = shift;

  my $index_entry_locations
    = $self->{'count_context'}->[-1]->{'index_entry_locations'};
  if (scalar(@$index_entry_locations) > 0) {
    my $i = scalar(@$index_entry_locations) - 1;
    my $final_lines = $self->{'count_context'}->[-1]->{'lines'};
    # return if $final_lines == 0;
    while ($i >= 0) {
      if ($index_entry_locations->[$i]->{'lines'} == $final_lines) {
        $index_entry_locations->[$i]->{'lines'}--;
        $i--;
      } else {
        last;
      }
    }
  }
}

sub add_quoted_image($$;$) {
  my ($self, $quoted_image, $trailing_text) = @_;

  my $image_info = {'conv_type' => 'quoted_image'};
  push @{$self->{'count_context'}->[-1]->{'pending_text'}},
       [$quoted_image, $image_info], [$trailing_text];
}

sub _stream_output($$) {
  my ($self, $text) = @_;

  my $count_context = $self->{'count_context'}->[-1];
  my $pending_text = $count_context->{'pending_text'}->[-1];
  $pending_text->[0] .= $text;

  if (defined($pending_text->[1])) {
    confess("anchor location modified by adding: '$text'");
  }

  return;
}

# Use instead of _stream_output to count the number of newlines
# in the added text.
sub _stream_output_count_nl($$) {
  my ($self, $text) = @_;

  my $count_context = $self->{'count_context'}->[-1];
  my $container = $self->{'formatters'}->[-1]->{'container'};

  # count number of newlines in $text
  my $count = Texinfo::Convert::Paragraph::end_line_count($container);
  $count_context->{'lines'} += $count;

  _stream_output($self, $text);

  return;
}

# Pass $TEXT to add_text and output the resulting text.  Used for
# concision in calling code.
sub _stream_output_add_text($$) {
  my ($self, $text) = @_;

  my $container = $self->{'formatters'}->[-1]->{'container'};
  my $output = add_text($container, $text);

  _stream_output_count_nl($self, $output);

  return;
}

# Pass $TEXT to add_next and output the resulting text.  Used for
# concision in calling code.
sub _stream_output_add_next($$) {
  my ($self, $text) = @_;

  my $container = $self->{'formatters'}->[-1]->{'container'};
  my $output = add_next($container, $text);

  _stream_output_count_nl($self, $output);

  return;
}

# the SELF argument is used to find the method in the Info module.
# Anchors are silently ignored.
sub _pending_to_text($$) {
  my ($self, $pending) = @_;

  my $result = '';
  foreach my $pending_string (@$pending) {
    $result .= $pending_string->[0];
  }
  return $result;
}

# Anchors are silently ignored.
sub _stream_to_text($) {
  my $self = shift;

  my $count_context = $self->{'count_context'}->[-1];
  my $result = _pending_to_text($self, $count_context->{'pending_text'});
  # this is not really useful, as the count context is popped right after,
  # but it marks that input pending text is to be reset here.
  $count_context->{'pending_text'} = [];
  return $result;
}

# gather both text and anchors
# Images are ignored.
sub _stream_to_text_anchor($) {
  my $self = shift;

  my $count_context = $self->{'count_context'}->[-1];
  my $pending = $count_context->{'pending_text'};

  my @anchors = ();
  my $result = '';
  foreach my $pending_string (@$pending) {
    $result .= $pending_string->[0];
    if (defined($pending_string->[1])
        and ($pending_string->[1]->{'conv_type'} eq 'anchor')) {
      push @anchors, $pending_string->[1]->{'anchor'};
    }
  }
  $count_context->{'pending_text'} = [];
  return ($result, \@anchors);
}

sub _encode_string($$) {
  my ($self, $string) = @_;

  if (!exists($self->{'encoding_object'})) {
    return $string;
  } else {
    return $self->{'encoding_object'}->encode($string);
  }
}

sub _stream_encode($$) {
  my ($self, $pending) = @_;

  my $string = '';
  foreach my $pending_string (@$pending) {
    if (!exists($self->{'encoding_object'})) {
      $string .= $pending_string->[0];
      if (exists($self->{'target_locations'})) {
        $self->{'bytes'} += length($pending_string->[0]);
      }
    } else {
      my $encoded = $self->{'encoding_object'}->encode($pending_string->[0]);
      $string .= $encoded;
      if (exists($self->{'target_locations'})) {
        $self->{'bytes'} += length($encoded);
      }
    }
    if (defined($pending_string->[1])
        and $pending_string->[1]->{'conv_type'} eq 'anchor'
        and exists($self->{'target_locations'})) {
      push @{$self->{'target_locations'}}, {
             'target_element' => $pending_string->[1]->{'anchor'},
             'bytes' => $self->{'bytes'}
      };
    }
  }

  return $string;
}

sub _stream_final_result($) {
  my $self = shift;

  my $count_context = $self->{'count_context'}->[-1];

  my $new_encoded
    = _stream_encode($self, $count_context->{'pending_text'});
  $count_context->{'pending_text'} = [['']];
  return $new_encoded;
}

sub convert_line($$;$$$) {
  my ($self, $converted, $indent_length, $indent_length_next,
      $formatter_conf) = @_;

  my $formatter = new_formatter($self, 'line', $indent_length,
                                $indent_length_next, $formatter_conf);
  push @{$self->{'formatters'}}, $formatter;
  _convert($self, $converted);
  my $end_line = Texinfo::Convert::Paragraph::end($formatter->{'container'});
  _stream_output($self, $end_line);
  my $count = Texinfo::Convert::Paragraph::counter($formatter->{'container'});
  destroy_formatter(pop @{$self->{'formatters'}});
  return $count;
}

# for debugging
sub _debug_print_pending($) {
  my $pending_texts = shift;

  my @strings;
  foreach my $pending (@$pending_texts) {
    my $result = $pending->[0];
    if (defined($pending->[1])) {
      if ($pending->[1]->{'conv_type'} eq 'anchor') {
        $result .= '['
         . Texinfo::Convert::Texinfo::target_element_to_texi_label(
             $pending->[1]->{'anchor'}).']';
      } elsif ($pending->[1]->{'conv_type'} eq 'quoted_image') {
        $result .= '{'.length($pending->[0]).'}';
      }
    }
    push @strings, $result;
  }
  return #"$pending_texts ".
          join('|', @strings);
}

# convert with a line formatter in a new count context, not changing
# the current context.  return the result of the conversion.
sub convert_line_new_context($$;$$$) {
  my ($self, $converted, $indent_length, $indent_length_next,
      $formatter_conf) = @_;

  push @{$self->{'count_context'}}, {'lines' => 0,
                                     'pending_text' => [['']]};
  my $count = convert_line($self, $converted, $indent_length,
                           $indent_length_next, $formatter_conf);

  my $pending_text = $self->{'count_context'}->[-1]->{'pending_text'};
  pop @{$self->{'count_context'}};

  die if (!scalar(@{$self->{'count_context'}}));

  return ($pending_text, $count);
}

sub _update_locations_counts($$$) {
  my ($self, $parent_counts, $counts) = @_;

  my $lines = $parent_counts->{'lines'};

  foreach my $location (@{$counts->{'index_entry_locations'}}) {
    $location->{'lines'} += $lines;
  }

  push @{$parent_counts->{'index_entry_locations'}},
       @{$counts->{'index_entry_locations'}};
}

# Called at the beginning of a line.  Add a blank line if the output does
# not already end in one.
sub _add_newline_if_needed($) {
  my $self = shift;

  my $pending_texts = $self->{'count_context'}->[-1]->{'pending_text'};
  my $nr_pending = scalar(@{$pending_texts});
  if ($nr_pending > 0) {
    my $pending_text = '';
    for (my $i = $nr_pending - 1; $i >= 0; $i--) {
      $pending_text = $pending_texts->[$i]->[0] . $pending_text;
      if (length($pending_text) >= 2) {
        if (substr($pending_text, -2) ne "\n\n") {
          _stream_output($self, "\n");
          _add_lines_count($self, 1);
        }
        return;
      }
    }
  }

  return;
}

# Ensure the output ends in a newline character.
sub _ensure_end_of_line($) {
  my $self = shift;

  my $pending_texts = $self->{'count_context'}->[-1]->{'pending_text'};

  my $nr_pending = scalar(@$pending_texts);
  my $with_location;
  for (my $i = $nr_pending - 1; $i >= 0; $i--) {
    if (defined($pending_texts->[$i]->[1])) {
      $with_location = 1;
    }
    if ($pending_texts->[$i]->[0] ne '') {
      if ($pending_texts->[$i]->[0] !~ /\n\z/) {
        if (!$with_location) {
          $pending_texts->[$i]->[0] .= "\n";
        } else {
      # add new pending text to keep the anchor/image before the end of line
          push @$pending_texts, ["\n"];
        }
        _add_lines_count($self, 1);
        $self->{'text_element_context'}->[-1]->{'counter'} = 0;
      }
      return;
    }
  }
  return;
}


my $node_names_formatter;

# convert and cache a node name.  $NODE is a node element.
sub node_name($$) {
  my ($self, $node) = @_;

  if (!exists($self->{'node_names_text'}->{$node})) {
    # if node names are set by _cache_node_name, they are not
    # converted here, except for nodes dynamically added for footnotes.
    my $label_element = Texinfo::Common::get_label_element($node);
    if (!defined($label_element)) {
      # node direction to an external node
      $label_element = $node->{'extra'}->{'node_content'};
    }
    my $node_text = Texinfo::TreeElement::new({'type' => '_code',
                                       'contents' => [$label_element]});

    my ($result, $width);
    push @{$self->{'count_context'}}, {'lines' => 0,
                                     'pending_text' => [['']]};
    if (!defined($node_names_formatter)) {
      # FIXME $self could affect the result through frenchspacing
      $node_names_formatter = new_formatter($self, 'line', 0, undef,
                  {'suppress_styles' => 1, 'no_added_eol' => 1,});
    }
    my $formatter = $node_names_formatter;
    push @{$self->{'formatters'}}, $formatter;

    _convert($self, $node_text);
    _stream_output($self,
      Texinfo::Convert::Paragraph::add_pending_word($formatter->{'container'}));
    $result = _stream_to_text($self);
    $width = Texinfo::Convert::Paragraph::counter($formatter->{'container'});

    # reset counters
    Texinfo::Convert::Paragraph::end_line($formatter->{'container'});

    pop @{$self->{'formatters'}};
    pop @{$self->{'count_context'}};
    $self->{'node_names_text'}->{$node}
      = {'text' => Texinfo::Common::normalize_top_node_name($result),
         'width' => $width };
  }
  return ($self->{'node_names_text'}->{$node}->{'text'},
          $self->{'node_names_text'}->{$node}->{'width'});
}

# the advantage of using that function is that we know that nodes only
# are processed and the $label_element can be obtained more simply
# than when the node is setup by a call to node_name().
sub _cache_node_names($$) {
  my ($self, $nodes_list) = @_;

  my $node_names_hash = $self->{'node_names_text'};

  if (!defined($node_names_formatter)) {
    $node_names_formatter = new_formatter($self, 'line', 0, undef,
               {'suppress_styles' => 1, 'no_added_eol' => 1,});
  }
  my $formatter = $node_names_formatter;

  push @{$self->{'formatters'}}, $formatter;

  foreach my $node_relations (@{$nodes_list}) {
    my $node = $node_relations->{'element'};
    my $label_element;
    $label_element = $node->{'contents'}->[0]->{'contents'}->[0];
    my $node_text = Texinfo::TreeElement::new({'type' => '_code',
                                       'contents' => [$label_element]});

    push @{$self->{'count_context'}}, {'lines' => 0,
                                       'pending_text' => [['']]};
    _convert($self, $node_text);
    _stream_output($self,
      Texinfo::Convert::Paragraph::add_pending_word($formatter->{'container'}));
    my $result = _stream_to_text($self);
    my $width = Texinfo::Convert::Paragraph::counter($formatter->{'container'});

    pop @{$self->{'count_context'}};

    $node_names_hash->{$node}
      = {'text' => Texinfo::Common::normalize_top_node_name($result),
         'width' => $width };
    # reset counters
    Texinfo::Convert::Paragraph::end_line($formatter->{'container'});
  }
  pop @{$self->{'formatters'}};
}


sub _open_code($) {
  my $formatter = shift;

  if (!$formatter->{'font_type_stack'}->[-1]->{'monospace'}) {
    push @{$formatter->{'font_type_stack'}}, {'monospace' => 1};
  } else {
    $formatter->{'font_type_stack'}->[-1]->{'monospace'}++;
  }
  push @{$formatter->{'frenchspacing_stack'}}, 'on';
  set_frenchspacing($formatter->{'container'}, 1);
}

sub _close_code($) {
  my $formatter = shift;

  $formatter->{'font_type_stack'}->[-1]->{'monospace'}--;
  pop @{$formatter->{'font_type_stack'}}
    if !$formatter->{'font_type_stack'}->[-1]->{'monospace'};
  pop @{$formatter->{'frenchspacing_stack'}};
  my $frenchspacing = 0;
  $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
  set_frenchspacing($formatter->{'container'}, $frenchspacing);
}

my $footnote_indent = 3;
sub process_footnotes($;$) {
  my ($self, $output_unit) = @_;

  my $formatter = new_formatter($self, 'line'); # may not be used
  push @{$self->{'formatters'}}, $formatter;

  if (scalar(@{$self->{'pending_footnotes'}})) {
    my $node_element;
    my $label_element;
    if (defined($output_unit) and exists($output_unit->{'unit_command'})) {
      $node_element = $output_unit->{'unit_command'};
      # We only do new nodes with nodes, not with sectioning command
      # without node that can be a target to cross-references.
      # TODO if doing plaintext, and not Info shouldn't all the
      # footnote be formatted without a separate node and with the
      # --- footnotes --- separator?
      if ($node_element->{'cmdname'} eq 'node'
          and exists($node_element->{'extra'})
          and exists($node_element->{'extra'}->{'identifier'})) {
        # arguments_line type element
        my $arguments_line = $node_element->{'contents'}->[0];
        $label_element = $arguments_line->{'contents'}->[0];
      }
    }

    _add_newline_if_needed($self);
    my $footnotestyle = $self->get_conf('footnotestyle');
    if (!defined($footnotestyle) or $footnotestyle ne 'separate'
        # no node label happens only in very special cases, such as
        # a @footnote in @copying and @insertcopying (and USE_NODES=0?)
        or !defined($label_element)) {
      my $footnotes_header = "   ---------- Footnotes ----------\n\n";
      _stream_output($self, $footnotes_header);
      _add_lines_count($self, 2);
    } else {
      my $footnotes_node_arg
            = Texinfo::TreeElement::new({'type' => 'line_arg',
                             'contents' => [$label_element,
                        Texinfo::TreeElement::new({'text' => '-Footnotes'})]});
      my $footnotes_node = Texinfo::TreeElement::new({
        'cmdname' => 'node',
        'contents' => [Texinfo::TreeElement::new({'type' => 'arguments_line',
                                      'contents' => [$footnotes_node_arg],})],
        'extra' => {'is_target' => 1,
                'identifier'
                  => $node_element->{'extra'}->{'identifier'}.'-Footnotes',
                   }
      });
      my $footnotes_node_relations = {
         'element' => $footnotes_node,
         'node_directions' => {'up' => $node_element},
      };
      $self->format_node($footnotes_node, $footnotes_node_relations);
      $self->{'current_node'} = $footnotes_node;
    }

    while (@{$self->{'pending_footnotes'}}) {
      my $footnote_info = shift @{$self->{'pending_footnotes'}};
      my $footnote_number = $footnote_info->{'number'};

      # If nested within another footnote and footnotestyle is separate,
      # the element here will be the parent element and not the footnote
      # element, while the pxref will point to the name with the
      # footnote node taken into account.  Not really problematic as
      # nested footnotes are not right.
      if (defined($label_element) and defined($self->{'target_locations'})) {
        my $footnote_anchor_postfix = "-Footnote-$footnote_number";
        my $footnote_anchor_arg
          = Texinfo::Common::non_leading_trailing_tree($label_element);
        $footnote_anchor_arg->{'type'} = 'brace_arg';
        push @{$footnote_anchor_arg->{'contents'}},
               Texinfo::TreeElement::new({'text' => $footnote_anchor_postfix});
        my $footnote_anchor = Texinfo::TreeElement::new({'cmdname' => 'anchor',
                                    'contents' => [$footnote_anchor_arg],
                                    'extra' => {'is_target' => 1,
                                                'identifier'
       => $node_element->{'extra'}->{'identifier'}.$footnote_anchor_postfix},
                            });
        $self->add_target_location($footnote_anchor);
      }
      # this pushes on 'context', 'formatters', 'format_context',
      # 'text_element_context' and 'document_context'
      $self->push_top_formatter('footnote');
      my $formatted_footnote_number;
      if ($self->get_conf('NUMBER_FOOTNOTES')) {
        $formatted_footnote_number = $footnote_number;
      } else {
        $formatted_footnote_number = $NO_NUMBER_FOOTNOTE_SYMBOL;
      }
      my $footnote_text = ' ' x $footnote_indent
               . "($formatted_footnote_number) ";
      $self->{'text_element_context'}->[-1]->{'counter'} +=
         Texinfo::Convert::Unicode::string_width($footnote_text);
      _stream_output($self, $footnote_text);

      my $footnote_element = $footnote_info->{'footnote_element'};
      if (exists($footnote_element->{'contents'})) {
        _convert($self, $footnote_element->{'contents'}->[0]);
      }
      _add_newline_if_needed($self);

      my $old_context = $self->pop_top_formatter();
      die if ($old_context ne 'footnote');
    }
  }
  $self->{'footnote_index'} = 0;

  _stream_output_count_nl($self,
                 Texinfo::Convert::Paragraph::end($formatter->{'container'}));
  destroy_formatter(pop @{$self->{'formatters'}});

  return;
}

sub _compute_spaces_align_line($$$) {
  my ($line_width, $max_column, $direction) = @_;

  my $prepended_spaces;
  if ($line_width >= $max_column) {
    $prepended_spaces = 0;
  } elsif ($direction eq 'center') {
    # if no int we may end up with floats...
    $prepended_spaces = int(($max_column -1 - $line_width) /2);
  } else {
    $prepended_spaces = ($max_column -1 - $line_width);
  }
  return $prepended_spaces;
}

# split $PENDING_TEXTS pending text at new lines in lines of pending texts.
# The input is not supposed to be used after that.
sub collect_pending_texts_lines($) {
  my $pending_texts = shift;

  my @lines;
  my $current_line = [];
  foreach my $pending_text (@$pending_texts) {
    my @pending_lines;
    if (defined($pending_text->[1])
        and ($pending_text->[1]->{'conv_type'} eq 'quoted_image'
             or $pending_text->[1]->{'conv_type'} eq 'protected_text')) {
      push @pending_lines, $pending_text;
    } elsif ($pending_text->[0] eq '') {
      # need a separate case, as split does not return an empty string.
      # keep empty cells or aligned text only if there is an anchor
      if (defined($pending_text->[1])) {
        push @pending_lines, $pending_text;
      }
    } else {
      @pending_lines = map {[$_]} split(/^/, $pending_text->[0]);

      if (defined($pending_text->[1])) {
        my $last_pending_line = $pending_lines[-1];
        push @$last_pending_line, $pending_text->[1];
      }
    }
    foreach my $pending_line (@pending_lines) {
      push @$current_line, $pending_line;
      if ($pending_line->[0] =~ /\n$/) {
        push @lines, $current_line;
        $current_line = [];
      }
    }
  }
  if (scalar(@$current_line) > 0) {
    push @lines, $current_line;
  }
  return \@lines;
}

sub _align_lines($$$$) {
  my ($self, $pending_texts, $max_column, $direction) = @_;

  my $lines = collect_pending_texts_lines($pending_texts);

  my $line_index = 0;
  foreach my $line (@$lines) {
    for (my $j = 0; $j < scalar(@$line); $j++) {
      my $pending_text = $line->[$j];
      last if (defined($pending_text->[1])
               and $pending_text->[1]->{'conv_type'} eq 'protected_text');
      $pending_text->[0] =~ s/^(\s*)//;
      if ($pending_text->[0] ne '') {
        last;
      }
    }
    for (my $j = scalar(@$line); $j > 0; $j--) {
      my $pending_text = $line->[$j -1];
      chomp($pending_text->[0]);
      last if (defined($pending_text->[1])
               and $pending_text->[1]->{'conv_type'} eq 'protected_text');
      $pending_text->[0] =~ s/(\s*)$//;
      if ($pending_text->[0] ne '') {
        last;
      }
    }
    my $line_width = _pending_texts_width($line);
    # NOTE a lone @anchor is followed by a spaces_after_close_brace
    # ignored type containing the end of line,
    # such that the end of line is removed.  Therefore the @anchor is
    # on the same line as the next text.  If there is an end of line,
    # it is outside of a paragraph and therefore converted as if not in
    # an aligned environment, which is also ok.  Therefore has_anchor
    # can only be set with text on the line before the anchor, followed
    # by an empty line.
    my $has_anchor = 0;
    if ($line_width == 0) {
      $has_anchor = _pending_text_has_anchor($line);
    }
    if ($line_width > 0 || $has_anchor) {
      my $prepended_spaces
       = _compute_spaces_align_line($line_width, $max_column, $direction);
      if ($prepended_spaces > 0) {
        _stream_output($self, ' ' x $prepended_spaces);
      }
      push @{$self->{'count_context'}->[-1]->{'pending_text'}}, @$line;
      if (defined($line->[-1]->[1])) {
        # add an empty text if the last pending is the anchor such that
        # it does not have its location modified
        push @{$self->{'count_context'}->[-1]->{'pending_text'}}, [''];
      }
    }

    # do not add an end of line for the last line, leave it to the caller.
    # For @center it is more consistent because the end of line is in an
    # ignored text element.
    # For flushright, it means that it is possible to ignore a fully
    # empty @flushright (although this is not really important).
    if ($line_index < scalar(@$lines) -1) {
      _stream_output($self, "\n");
    }

    $line_index++;
  }
}

sub _align_environment($$$) {
  my ($self, $max, $align) = @_;

  my $counts = pop @{$self->{'count_context'}};
  _align_lines($self, $counts->{'pending_text'}, $max, $align);

  _update_locations_counts($self, $self->{'count_context'}->[-1],
                           $counts);

  $self->{'count_context'}->[-1]->{'lines'} += $counts->{'lines'};
}

sub format_warn_strong_note($) {
  return 0;
}

sub _section_element_heading($$$$) {
  my ($self, $section_element, $heading_element, $numbered) = @_;

  my $heading_e = Texinfo::TreeElement::new({'type' => '_frenchspacing',
                               'contents' => [$heading_element]});

  my $tree;
  if (exists($section_element->{'extra'})
      and defined($section_element->{'extra'}->{'section_heading_number'})
      and ($numbered or !defined($numbered))) {
    my $number = Texinfo::TreeElement::new({
              'text' => $section_element->{'extra'}->{'section_heading_number'}});

    if ($section_element->{'cmdname'} eq 'appendix'
        and $section_element->{'extra'}->{'section_level'} == 1) {
      $tree = $self->cdt(
                 'Appendix {number} {section_title}',
                 {'number' => $number, 'section_title' => $heading_e});
    } else {
      $tree = $self->cdt(
                 '{number} {section_title}',
                 {'number' => $number, 'section_title' => $heading_e});
    }
  } else {
    $tree = $heading_e;
  }

  my ($pending, $columns) = $self->convert_line_new_context($tree);
  return ($pending, $columns);
}

# format @contents or @shortcontents
sub format_contents($$$) {
  my ($self, $sectioning_root, $contents_or_shortcontents) = @_;

  my $contents = 1 if ($contents_or_shortcontents eq 'contents');

  # no sections
  return if (!defined($sectioning_root)
                     or !exists($sectioning_root->{'section_children'}));

  my $root_level = $sectioning_root->{'section_children'}->[0]
                                ->{'element'}->{'extra'}->{'section_level'};
  foreach my $top_relations (@{$sectioning_root->{'section_children'}}) {
    my $top_section = $top_relations->{'element'};
    $root_level = $top_section->{'extra'}->{'section_level'}
      if ($top_section->{'extra'}->{'section_level'} < $root_level);
  }

  my $lines_count = 0;
  # This is done like that because the tree may not be well formed if
  # there is a @part after a @chapter for example.
  foreach my $top_relations (@{$sectioning_root->{'section_children'}}) {
    my $section_relations = $top_relations;
 SECTION:
    while ($section_relations) {
      my $section = $section_relations->{'element'};
      my $repeat_count
        = 2 * ($section->{'extra'}->{'section_level'} - ($root_level+1));

      if ($repeat_count > 0) {
        _stream_output($self, ' ' x $repeat_count);
      }

      # arguments_line type element
      my $arguments_line = $section->{'contents'}->[0];
      my $line_arg = $arguments_line->{'contents'}->[0];

      my ($pending, undef)
        = _section_element_heading($self, $section, $line_arg,
                  ($self->get_conf('NUMBER_SECTIONS')
                   or !defined($self->get_conf('NUMBER_SECTIONS'))));

      my $text = _pending_to_text($self, $pending);
      chomp($text);
      $text .= "\n";
      _stream_output($self, $text);
      $lines_count++;

      if (exists($section_relations->{'section_children'})
          and (defined($contents)
               or $section->{'extra'}->{'section_level'} < $root_level+1)) {
        $section_relations = $section_relations->{'section_children'}->[0];
      } elsif (exists($section_relations->{'section_directions'})
               and exists($section_relations->{'section_directions'}->{'next'})) {
        last if ($section_relations eq $top_relations);
        $section_relations
          = $section_relations->{'section_directions'}->{'next'};
      } else {
        last if ($section_relations eq $top_relations);
        while (exists($section_relations->{'section_directions'})
               and exists($section_relations->{'section_directions'}->{'up'})) {
          $section_relations
            = $section_relations->{'section_directions'}->{'up'};
          last SECTION if ($section_relations eq $top_relations);
          if (exists($section_relations->{'section_directions'})
              and exists($section_relations->{'section_directions'}->{'next'})) {
            $section_relations
              = $section_relations->{'section_directions'}->{'next'};
            last;
          }
        }
      }
    }
  }
  _add_lines_count($self, $lines_count);
  return;
}

sub _menu($$) {
  my ($self, $menu_command) = @_;

  if ($menu_command->{'cmdname'} eq 'menu') {
    _stream_output($self, "* Menu:\n\n");
    _add_lines_count($self, 2);
    if (exists($self->{'current_node'})) {
      $self->{'seenmenus'}->{$self->{'current_node'}} = 1;
    }
  }
  return;
}

my $index_length_to_node = 41;

sub process_printindex($$;$) {
  my ($self, $printindex, $in_info) = @_;

  my $index_name;

  if (exists($printindex->{'extra'}) and
      exists($printindex->{'extra'}->{'misc_args'})
      and defined($printindex->{'extra'}->{'misc_args'}->[0])) {
    $index_name = $printindex->{'extra'}->{'misc_args'}->[0];
  } else {
    return;
  }

  if (!exists($self->{'document'})) {
    return;
  }

  my $indices_information = $self->{'document'}->indices_information();
  my $sorted_indexes;
  if (defined($indices_information)) {
    $sorted_indexes = $self->get_converter_indices_sorted_by_index();
  }

  if (!defined($sorted_indexes) or !exists($sorted_indexes->{$index_name})) {
    return;
  }

  my $sorted_index = $sorted_indexes->{$index_name};

  if (!scalar(@{$sorted_index})) {
    return;
  }

  my $identifiers_target = $self->{'document'}->labels_information();

  # first determine the line numbers for the spacing of their formatting
  my %line_nrs;
  my %entry_nodes;
  my $max_index_line_nr_string_length = 0;
  my %ignored_entries;
  # number of index entries that refer to something else than an index entry
  # in a node.  Corresponding with @seeentry or @seealso
  my $reference_entries_nr = 0;

  foreach my $entry (@{$sorted_index}) {
    my $main_entry_element = $entry->{'entry_element'};

    my $seeentry
     = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                   'seeentry');
    if (defined($seeentry)) {
      $reference_entries_nr++;
      next;
    }

    my $seealso
     = Texinfo::Common::index_entry_referred_entry($main_entry_element,
                                                   'seealso');
    if (defined($seealso)) {
      $reference_entries_nr++;
      next;
    }

    my $line_nr;

    my $index_entry_info;
    if (exists($self->{'index_entry_info'}->{$main_entry_element})) {
      $index_entry_info = $self->{'index_entry_info'}->{$main_entry_element};
      $line_nr = $index_entry_info->{'location'}->{'lines'};
    } elsif ($main_entry_element->{'extra'}->{'element_region'}) {
      # ignore index entries in special regions that haven't been seen
      $ignored_entries{$entry} = 1;
      next;
    }

    my $node;
    # priority given to the location determined dynamically as the
    # index entry may be in footnote.
    if (defined($index_entry_info)
        and exists($index_entry_info->{'node'})) {
      $node = $index_entry_info->{'node'};
    } elsif (exists($main_entry_element->{'extra'}->{'element_node'})) {
      $node = $identifiers_target->{
                        $main_entry_element->{'extra'}->{'element_node'}};
    }
    $entry_nodes{$entry} = $node;
    if (!defined($node)) {
      $line_nr = 0;
    } elsif ($in_info) {
      if (!defined($line_nr)) {
        $line_nr = 4;
      } elsif ($line_nr < 3) {
        $line_nr = 3;
      }
    } else {
      $line_nr = 0 if (!defined($line_nr));
    }
    my $index_line_nr_string_length =
      Texinfo::Convert::Unicode::string_width($line_nr);
    $max_index_line_nr_string_length = $index_line_nr_string_length
     if ($max_index_line_nr_string_length < $index_line_nr_string_length);
    $line_nrs{$entry} = $line_nr;
  }

  return if (scalar(keys(%line_nrs)) + $reference_entries_nr == 0);

  _add_newline_if_needed($self);
  if ($in_info) {
    my $info_printindex_magic = "\x{00}\x{08}[index\x{00}\x{08}]\n";
    _stream_output($self, $info_printindex_magic);
    _add_lines_count($self, 1);
  }
  my $heading = "* Menu:\n\n";

  _stream_output($self, $heading);
  _add_lines_count($self, 2);

  # this is used to count entries that are the same
  my %entry_counts = ();

  # Use the same line formatter for all the index entries.  This is
  # slightly faster than making a new one for each entry.
  my $formatter = new_formatter($self, 'line', 0, undef,
    { 'suppress_styles' => 1, 'no_added_eol' => 1 } );
  push @{$self->{'formatters'}}, $formatter;

  foreach my $entry (@{$sorted_index}) {
    next if (exists($ignored_entries{$entry}));

    my $main_entry_element = $entry->{'entry_element'};
    my $entry_index_name = $entry->{'index_name'};
    my $entry_content_element
      = $self->converter_index_content_element($main_entry_element);

    my $entry_tree
     = Texinfo::TreeElement::new({'contents' => [$entry_content_element]});
    if ($indices_information->{$entry_index_name}->{'in_code'}) {
      $entry_tree->{'type'} = '_code';
    } else {
      $entry_tree->{'type'} = '_frenchspacing';
    }
    my $subentries_tree
       = Texinfo::Convert::Utils::comma_index_subentries_tree(
                                                   $main_entry_element);
    if (defined($subentries_tree)) {
      push @{$entry_tree->{'contents'}}, $subentries_tree;
    }

    # Convert entry text in a new context in order to capture result.
    my $entry_text;

    push @{$self->{'count_context'}}, {'lines' => 0,
                                       'pending_text' => [['']]};
    _convert($self, $entry_tree);
    _stream_output_count_nl($self,
                   Texinfo::Convert::Paragraph::end($formatter->{'container'}));
    $entry_text = _stream_to_text($self);
    pop @{$self->{'count_context'}};

    next if ($entry_text !~ /\S/);

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

    if (defined($referred_entry)) {
      my $line_width = 0;
      my $referred_tree = Texinfo::TreeElement::new({});
      $referred_tree->{'type'} = '_code'
        if ($indices_information->{$entry_index_name}->{'in_code'});
      $referred_tree->{'contents'} = [$referred_entry];

      # indent with the same width as '* ', but do not use * such that the
      # info readers never find a cross reference for @seeentry or @seealso
      _stream_output($self, '  ');
      $line_width += 2;
      my $reference_tree;
      if (defined($seeentry)) {
        $reference_tree
      = $self->cdt('{main_index_entry}, See@: {seeentry}',
                                        {'main_index_entry' => $entry_tree,
                                         'seeentry' => $referred_tree});
      } else {
        my $entry_line = "$entry_text: ";
        $line_width += Texinfo::Convert::Unicode::string_width($entry_line);
        _stream_output($self, $entry_line);
        if ($line_width < $index_length_to_node) {
          my $spaces = ' ' x ($index_length_to_node - $line_width);
          _stream_output($self, $spaces);
          $line_width += length($spaces);
        }
        $reference_tree = $self->cdt('See also {see_also_entry}',
                           {'see_also_entry' => $referred_tree});
      }
      _convert($self, $reference_tree);
      _stream_output_count_nl($self,
             Texinfo::Convert::Paragraph::end($formatter->{'container'}));
      _stream_output($self, ".\n");
      _add_lines_count($self, 1);
      next;
    }

    # No need for protection, the Info readers should find the last : on
    # the line.  : in the node following the index entry node should be
    # protected, however, as done below, such that : in the node are not
    # mistaken as being part of the index entry.
    if ($entry_text =~ /:/ and $self->get_conf('INDEX_SPECIAL_CHARS_WARNING')) {
      my $entry_cmdname = $main_entry_element->{'cmdname'};
      $entry_cmdname
        = $main_entry_element->{'extra'}->{'original_def_cmdname'}
           if (!defined($entry_cmdname));
      $self->plaintext_line_warn($self,
        sprintf(__("Index entry in \@%s with : produces invalid Info: %s"),
                $entry_cmdname,
                Texinfo::Convert::Texinfo::convert_to_texinfo($entry_tree)),
                        $main_entry_element->{'source_info'});
    }

    my $entry_nr = '';
    if (!exists($entry_counts{$entry_text})) {
      $entry_counts{$entry_text} = 0;
    } else {
      $entry_counts{$entry_text}++;
      $entry_nr = ' <'.$entry_counts{$entry_text}.'>';
    }
    my $entry_line = "* $entry_text${entry_nr}: ";
    _stream_output($self, $entry_line);

    my $line_width = Texinfo::Convert::Unicode::string_width($entry_line);
    if ($line_width < $index_length_to_node) {
      my $spaces = ' ' x ($index_length_to_node - $line_width);
      _stream_output($self, $spaces);
      $line_width += length($spaces);
    }
    my $node = $entry_nodes{$entry};

    if (!defined($node)) {
      # cache the transformation to text and byte counting, as
      # it is likely that there is more than one such entry
      if (!$self->{'outside_of_any_node_text'}) {
        my $tree = $self->cdt('(outside of any node)');
        my ($pending, $width) = $self->convert_line_new_context($tree);
        $self->{'outside_of_any_node_text'} = _pending_to_text($self, $pending);
        $self->{'outside_of_any_node_text_width'} = $width;
      }
      _stream_output($self, $self->{'outside_of_any_node_text'});
      $line_width += $self->{'outside_of_any_node_text_width'};

      # TODO when outside of sectioning commands this message was already
      # done by the Parser.
      # Warn, only once.
      if (!exists($self->{'index_entries_no_node'}->{$entry})) {
        $self->plaintext_line_warn($self,
           sprintf(__("entry for index `%s' outside of any node"),
                      $index_name), $main_entry_element->{'source_info'});
        $self->{'index_entries_no_node'}->{$entry} = 1;
      }
    } else {
      my ($node_name, $width) = $self->node_name($node);

      # protect characters that need to be protected in menu node entry
      # after menu entry name and also :, as the Info readers
      # should consider text up to : to be part of the index entry.
      if ($node_name =~ /([,\t:]|\.\s)/) {
        my $warned_char = $1;
        if ($self->{'info_special_chars_warning'}) {
          # Warn only once
          if (! exists($self->{'index_entry_node_colon'}->{$node_name})) {
            $self->plaintext_line_warn($self, sprintf(__(
             "node name with index entries should not contain `%s'"),
                                            $warned_char),
                           $node->{'source_info'});
          }
          $self->{'index_entry_node_colon'}->{$node_name} = 1;
        }
        if ($self->{'info_special_chars_quote'}) {
          my $pre_quote = "\x{7f}";
          my $post_quote = $pre_quote;
          $node_name = $pre_quote . $node_name . $post_quote;
        }
      }
      _stream_output($self, $node_name);
      $line_width += $width;
    }
    _stream_output($self, '.');
    $line_width++;

    my $line_nr = $line_nrs{$entry};
    my $line_nr_spaces
             = sprintf("%${max_index_line_nr_string_length}d", $line_nr);
    my $line_part = "(line ${line_nr_spaces})";
    my $line_part_width = Texinfo::Convert::Unicode::string_width($line_part);

    if ($line_width + $line_part_width +1 > $self->{'fillcolumn'}) {
      $line_part = "\n" . ' ' x ($self->{'fillcolumn'} - $line_part_width)
           . "$line_part\n";
      _add_lines_count($self, 1);
    } else {
      $line_part
        = ' ' x ($self->{'fillcolumn'} - $line_part_width - $line_width)
           . "$line_part\n";
    }
    _add_lines_count($self, 1);
    _stream_output($self, $line_part);
  }
  destroy_formatter(pop @{$self->{'formatters'}});

  _stream_output($self, "\n");
  _add_lines_count($self, 1);
}

sub format_printindex($$) {
  my ($self, $printindex) = @_;

  $self->process_printindex($printindex);
  return;
}

sub format_ref($$$) {
  my ($self, $cmdname, $element) = @_;

  # no args may happen with bogus @-commands without argument, maybe only
  # at the end of a document
  return if (!exists($element->{'contents'}));

  my @args;
  foreach my $arg (@{$element->{'contents'}}) {
    if (Texinfo::Common::empty_spaces_argument($arg)) {
      push @args, undef;
    } else {
      push @args, $arg;
    }
  }
  my $node_arg = $element->{'contents'}->[0];

  # normalize node name, to get a ref with the right formatting
  # NOTE as a consequence, the line numbers appearing in case of errors
  # correspond to the node lines numbers, and not the @ref.
  my $label_element;
  my $target_element;

  my $identifiers_target;
  if (exists($self->{'document'})) {
    $identifiers_target = $self->{'document'}->labels_information();
  }

  if (exists($node_arg->{'extra'})
      and !exists($node_arg->{'extra'}->{'manual_content'})
      # excludes external nodes, as only internal refs get an extra normalized
      and defined($node_arg->{'extra'}->{'normalized'})
      # exclude external nodes again, in case internal refs get normalized
      and !defined($args[3])
      and !defined($args[4])
      and defined($identifiers_target)
      and exists($identifiers_target->{$node_arg->{'extra'}->{'normalized'}})) {
    $target_element
      = $identifiers_target->{$node_arg->{'extra'}->{'normalized'}};
    $label_element
      = Texinfo::Common::get_label_element($target_element);
    # cannot happen, target of references must have contents
    if (defined($label_element) and !exists($label_element->{'contents'})) {
      $label_element = undef;
      $target_element = undef;
    }
  }
  if (!defined($label_element)) {
    # may still be undef if node argument is empty
    $label_element = $args[0];
  }

  # if it a reference to a float with a label, $args[1] is
  # set to '$type $number' or '$number' if there is no type.
  if (! defined($args[1])
      and defined($target_element) and exists($target_element->{'cmdname'})
      and $target_element->{'cmdname'} eq 'float') {
    my $name = $self->float_type_number($target_element);
    $args[1] = $name;
  }

  if ($cmdname eq 'inforef' and scalar(@args) >= 3) {
    $args[3] = $args[2];
    $args[2] = undef;
  }

  my $name;
  if (defined($args[1])) {
    $name = $args[1];
  } elsif (defined($args[2])) {
    $name = $args[2];
  }

  my $file;
  my $book;
  if (defined($args[3])) {
    $file = Texinfo::TreeElement::new({'type' => '_stop_upper_case',
             'contents' => [Texinfo::TreeElement::new({'type' => '_code',
                                                  'contents' => [$args[3]]})],
            });
  } elsif (defined($args[4])) {
    $book = $args[4];
  }

  my $node;
  if (defined($label_element)) {
    $node = Texinfo::TreeElement::new({'type' => '_stop_upper_case',
                   'contents' => [
                     Texinfo::TreeElement::new({'type' => '_code',
                      'contents' => [
                       Texinfo::TreeElement::new({'type' => '_suppress_styles',
                        'contents' => [$label_element]})]})]});
  }

  my $tree;
  if (defined($node)) {
    if (defined($file)) {
      if (defined($name)) {
        my $substrings = {'name' => $name, 'file' => $file,
                          'node' => $node};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {name}: ({file}){node}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {name}: ({file}){node}', $substrings);
        } else {
          $tree = $self->cdt('{name}: ({file}){node}', $substrings);
        }
      } else {
        my $substrings = {'file' => $file, 'node' => $node};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See ({file}){node}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see ({file}){node}', $substrings);
        } else {
          $tree = $self->cdt('({file}){node}', $substrings);
        }
      }
    } elsif (defined($book)) {
      if (defined($name)) {
        my $substrings = {'name' => $name, 'book' => $book,
                          'node' => $node};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {name}: {node} in @cite{{book}}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {name}: {node} in @cite{{book}}', $substrings);
        } else {
          $tree = $self->cdt('{name}: {node} in @cite{{book}}', $substrings);
        }
      } else {
        my $substrings = {'book' => $book, 'node' => $node};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {node} in @cite{{book}}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {node} in @cite{{book}}', $substrings);
        } else {
          $tree = $self->cdt('{node} in @cite{{book}}', $substrings);
        }
      }
    } else {
      if (defined($name)) {
        my $substrings = {'name' => $name,
                          'node' => $node};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {name}: {node}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {name}: {node}', $substrings);
        } else {
          $tree = $self->cdt('{name}: {node}', $substrings);
        }
      } else {
        my $substrings = {'node' => $node};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {node}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {node}', $substrings);
        } else {
          $tree = $self->cdt('{node}', $substrings);
        }
      }
    }
  } else {
    if (defined($file)) {
      if (defined($name)) {
        my $substrings = {'name' => $name, 'file' => $file};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {name}({file})', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {name}({file})', $substrings);
        } else {
          $tree = $self->cdt('{name}({file})', $substrings);
        }
      } else {
        my $substrings = {'file' => $file};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See ({file})', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see ({file})', $substrings);
        } else {
          $tree = $self->cdt('({file})', $substrings);
        }
      }
    } elsif (defined($book)) {
      if (defined($name)) {
        my $substrings = {'name' => $name, 'book' => $book};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {name} in @cite{{book}}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {name} in @cite{{book}}', $substrings);
        } else {
          $tree = $self->cdt('{name} in @cite{{book}}', $substrings);
        }
      } else {
        my $substrings = {'book' => $book};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See @cite{{book}}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see @cite{{book}}', $substrings);
        } else {
          $tree = $self->cdt('@cite{{book}}', $substrings);
        }
      }
    } else {
      if (defined($name)) {
        my $substrings = {'name' => $name};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {name}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {name}', $substrings);
        } else {
          $tree = $self->cdt('{name}', $substrings);
        }
      } else {
        # case of a completely empty @*ref.
        my $substrings = {'node'
                           => Texinfo::TreeElement::new({'text' => 'Top'})};
        if ($cmdname eq 'xref' or $cmdname eq 'inforef') {
          $tree = $self->cdt('See {node}', $substrings);
        } elsif ($cmdname eq 'pxref') {
          $tree = $self->cdt('see {node}', $substrings);
        } else {
          $tree = $self->cdt('{node}', $substrings);
        }
      }
    }
  }

  _convert($self, $tree);
}

sub format_node($$;$) {
  my ($self, $node, $node_relations) = @_;
}

# no error in plaintext
sub format_error_outside_of_any_node($$) {
#  my ($self, $element) = @_;
}

sub format_anchor($$) {
#  my ($self, $anchor) = @_;
}

my $listoffloat_entry_length = 41;

sub stream_image_formatted_text($$$$) {
  my ($self, $element, $basefile, $text) = @_;

  my $lines_count;
  if (defined($text)) {
    my @lines = split (/^/, $text);
    # remove last end of line.  Do that after splitting the lines or the
    # last line, if empty, may not be gathered.
    chomp($lines[-1]);
    # the last line is part of the image but does not have a new line
    $lines_count = scalar(@lines) -1;
    foreach my $line (@lines) {
      my $line_info = {'conv_type' => 'protected_text'};
      push @{$self->{'count_context'}->[-1]->{'pending_text'}},
        [$line, $line_info];
    }
    push @{$self->{'count_context'}->[-1]->{'pending_text'}}, [''];
  } else {
    my $result;
    if (scalar(@{$element->{'contents'}}) >= 4
        and not Texinfo::Common::empty_spaces_argument(
                                    $element->{'contents'}->[3])) {
      $result = '[' .Texinfo::Convert::Text::convert_to_text(
         $element->{'contents'}->[3], $self->{'convert_text_options'}) .']';
    } else {
      $self->plaintext_line_warn($self, sprintf(__(
                    "could not find \@image file `%s.txt' nor alternate text"),
                             $basefile), $element->{'source_info'});
      $result = '['.$basefile.']';
    }
    $lines_count = ($result =~ tr/\n/\n/);
    _stream_output($self, $result);
  }
  return $lines_count;
}

sub format_image_element($$) {
  my ($self, $element) = @_;

  if (exists($element->{'contents'})
      and not Texinfo::Common::empty_spaces_argument(
                                     $element->{'contents'}->[0])) {
    Texinfo::Convert::Text::set_options_code(
                                 $self->{'convert_text_options'});
    my $basefile = Texinfo::Convert::Text::convert_to_text(
                                      $element->{'contents'}->[0],
                                      $self->{'convert_text_options'});
    Texinfo::Convert::Text::reset_options_code(
                                 $self->{'convert_text_options'});
    my ($text, $width) = $self->txt_image_text($element, $basefile);
    my $lines_count
      = $self->stream_image_formatted_text($element, $basefile, $text);
    return $lines_count;
  }
  return 0;
}

# should not be called, only the Info format counterpart should be called
# since it is not called by Plaintext format_image_element and is only
# called for INFO_MATH_IMAGES, which should do nothing in Plaintext.
sub format_image($$$;$) {
  my ($self, $image_file, $image_text, $alt_text) = @_;

  return $image_text;
}

# insert an image, but not as part of @image formatting.  It is better
# to have a different code, as there is no .txt file read, instead the
# $IMAGE_TEXT argument is used.
# Currently for INFO_MATH_IMAGES, therefore only called for Info.
# $IMAGE_FILE is a character string.
# $DPI is the dots per inch of the image, if given.
# $DEPTH is pixels below text baseline, if given.
sub _insert_image($$$;$$) {
  my ($self, $image_file, $image_text, $dpi, $depth) = @_;

  chomp($image_text);
  my $line_count = ($image_text =~ tr/\n/\n/);

  # NOTE no alt info set, not clear to what it could be set?
  my $result = $self->format_image($image_file, $image_text, undef,
                                   $dpi, $depth);

  $self->add_quoted_image($result, '');

  return $line_count;
}

my %underline_symbol = (
  0 => '*',
  1 => '*',
  2 => '=',
  3 => '-',
  4 => '.'
);

sub _pending_is_spaces($) {
  my $pending_texts = shift;

  foreach my $pending (@$pending_texts) {
    if ($pending->[0] =~ /\S/) {
      return 0;
    }
  }
  return 1;
}

sub _pending_is_empty($) {
  my $pending_texts = shift;

  foreach my $pending (@$pending_texts) {
    if ($pending->[0] ne '') {
      return 0;
    }
  }
  return 1;
}

# assumed width for quoted images or images in general.  There is no
# good way to know what is shown in Info reader, text, alt or image.
my $IMAGE_WIDTH = 3;

sub _pending_texts_width($) {
  my $pending_texts = shift;

  my $width = 0;
  foreach my $pending (@$pending_texts) {
    if (defined($pending->[1])
        and $pending->[1]->{'conv_type'} eq 'quoted_image') {
      $width += $IMAGE_WIDTH;
    } else {
      $width += Texinfo::Convert::Unicode::string_width($pending->[0]);
    }
  }
  return $width;
}

sub _pending_text_has_anchor($) {
  my $pending_texts = shift;

  foreach my $pending (@$pending_texts) {
    if (defined($pending->[1]) and $pending->[1]->{'conv_type'} eq 'anchor') {
      return 1;
    }
  }
  return 0;
}

# Stream the text of an underlined heading, possibly indented.
sub _text_heading($$$;$$$) {
  my ($self, $current, $heading_element, $numbered, $indented_len,
      $no_last_new_line) = @_;

  my ($pending, $columns)
     = _section_element_heading($self, $current, $heading_element,
                           ($numbered or !defined($numbered)));

  return 0 if (_pending_is_spaces($pending));

  push @{$self->{'count_context'}->[-1]->{'pending_text'}}, @$pending;

  _stream_output($self, "\n");

  if (defined($indented_len) and $indented_len > 0) {
    _stream_output($self, ' ' x $indented_len);
  } else {
    $indented_len = 0;
  }
  my $section_level;
  if (!exists($current->{'extra'})
      or !exists($current->{'extra'}->{'section_level'})) {
    $section_level = Texinfo::Common::section_level($current);
  } else {
    $section_level = $current->{'extra'}->{'section_level'};
  }
  # $text is indented if indented_len is set, so $indented_len needs to
  # be subtracted to have the width of the heading only.
  my $underlined_text = ($underline_symbol{$section_level}
                x ($columns - $indented_len));
  $underlined_text .= "\n" if (!$no_last_new_line);
  _stream_output($self, $underlined_text);
  return 1;
}

sub _get_form_feeds($) {
  my $form_feeds = shift;

  $form_feeds =~ s/^[^\f]*//;
  $form_feeds =~ s/[^\f]$//;
  return $form_feeds;
}

sub _convert_def_line($$) {
  my ($self, $element) = @_;

  my ($category, $class, $type, $name, $arguments)
    = Texinfo::Convert::Utils::definition_arguments_content($element);
  if (defined($category) or defined($class)
      or defined($type) or defined($name)) {
    my $tree;
    my $cmdname;
    if (exists(
         $Texinfo::Common::def_aliases{$element->{'extra'}->{'def_command'}})) {
      $cmdname
       = $Texinfo::Common::def_aliases{$element->{'extra'}->{'def_command'}};
    } else {
      $cmdname = $element->{'extra'}->{'def_command'};
    }
    my $formatted_name;
    if (defined($name)) {
      $formatted_name
       = Texinfo::TreeElement::new({'type' => '_code', 'contents' => [$name]});
    } else {
      $formatted_name = Texinfo::TreeElement::new({'text' => ''});
    }
    my $formatted_arguments;
    if (defined($arguments)) {
      $formatted_arguments = Texinfo::TreeElement::new({'type' => '_code',
                                                'contents' => [$arguments]});
    }

    my $omit_def_name_space = $element->{'extra'}->{'omit_def_name_space'};

    if ($cmdname eq 'defline'
        or $cmdname eq 'deffn'
        or $cmdname eq 'defvr'
        or $cmdname eq 'deftp'
        or (($cmdname eq 'deftypefn'
             or $cmdname eq 'deftypevr')
            and !defined($type))) {
      if (defined($arguments)) {
        my $strings = {
         'category' => $category,
         'name' => $formatted_name,
         'arguments' => $formatted_arguments};
        if ($omit_def_name_space) {
          $tree = $self->cdt('@tie{}--- {category}: {name}{arguments}',
                             $strings);
        } else {
          $tree = $self->cdt('@tie{}--- {category}: {name} {arguments}',
                             $strings);
        }
      } else {
        $tree = $self->cdt('@tie{}--- {category}: {name}', {
             'category' => $category,
             'name' => $formatted_name});
      }
    } elsif ($cmdname eq 'deftypeline'
             or $cmdname eq 'deftypefn'
             or $cmdname eq 'deftypevr') {
      if (defined($arguments)) {
        my $strings = {
          'category' => $category,
          'name' => $formatted_name,
          'type' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$type]}),
          'arguments' => $formatted_arguments};
        if ($self->get_conf('deftypefnnewline')
            and $self->get_conf('deftypefnnewline') eq 'on'
            and $cmdname eq 'deftypefn') {
          if ($omit_def_name_space) {
            $tree
              = $self->cdt('@tie{}--- {category}:@*{type}@*{name}{arguments}',
                           $strings);
          } else {
            $tree
              = $self->cdt('@tie{}--- {category}:@*{type}@*{name} {arguments}',
                           $strings);
          }
        } else {
          if ($omit_def_name_space) {
            $tree
              = $self->cdt('@tie{}--- {category}: {type} {name}{arguments}',
                           $strings);
          } else {
            $tree
              = $self->cdt('@tie{}--- {category}: {type} {name} {arguments}',
                           $strings);
          }
        }
      } else {
        my $strings = {
         'category' => $category,
         'type' => Texinfo::TreeElement::new({'type' => '_code',
                                              'contents' => [$type]}),
         'name' => $formatted_name};
        if ($self->get_conf('deftypefnnewline')
            and $self->get_conf('deftypefnnewline') eq 'on'
            and $cmdname eq 'deftypefn') {
          $tree = $self->cdt('@tie{}--- {category}:@*{type}@*{name}',
                             $strings);
        } else {
          $tree = $self->cdt('@tie{}--- {category}: {type} {name}',
                             $strings);
        }
      }
    } elsif ($cmdname eq 'defcv'
             or ($cmdname eq 'deftypecv'
                 and !defined($type))) {
      if (defined($arguments)) {
        my $strings = {
         'category' => $category,
         'name' => $formatted_name,
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'arguments' => $formatted_arguments};
        if ($omit_def_name_space) {
          $tree
           = $self->cdt('@tie{}--- {category} of {class}: {name}{arguments}',
                        $strings);
        } else {
          $tree
           = $self->cdt('@tie{}--- {category} of {class}: {name} {arguments}',
                        $strings);
        }
      } else {
        $tree = $self->cdt('@tie{}--- {category} of {class}: {name}', {
         'category' => $category,
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'name' => $formatted_name});
      }
    } elsif ($cmdname eq 'defop'
             or ($cmdname eq 'deftypeop'
                 and !defined($type))) {
      if (defined($arguments)) {
        my $strings = {
         'category' => $category,
         'name' => $formatted_name,
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'arguments' => $formatted_arguments};
        if ($omit_def_name_space) {
          $tree
            = $self->cdt('@tie{}--- {category} on {class}: {name}{arguments}',
                         $strings);
        } else {
          $tree
            = $self->cdt('@tie{}--- {category} on {class}: {name} {arguments}',
                         $strings);
        }
      } else {
        $tree = $self->cdt('@tie{}--- {category} on {class}: {name}', {
         'category' => $category,
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'name' => $formatted_name});
      }
    } elsif ($cmdname eq 'deftypeop') {
      if (defined($arguments)) {
        my $strings = {
         'category' => $category,
         'name' => $formatted_name,
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'type' => Texinfo::TreeElement::new({'type' => '_code',
                                              'contents' => [$type]}),
         'arguments' => $formatted_arguments};
        if ($self->get_conf('deftypefnnewline')
            and $self->get_conf('deftypefnnewline') eq 'on') {
          if ($omit_def_name_space) {
            $tree
              = $self->cdt(
               '@tie{}--- {category} on {class}:@*{type}@*{name}{arguments}',
                           $strings);
          } else {
            $tree
              = $self->cdt(
               '@tie{}--- {category} on {class}:@*{type}@*{name} {arguments}',
                           $strings);
          }
        } else {
          if ($omit_def_name_space) {
            $tree
              = $self->cdt(
             '@tie{}--- {category} on {class}: {type} {name}{arguments}',
                           $strings);
          } else {
            $tree
              = $self->cdt(
              '@tie{}--- {category} on {class}: {type} {name} {arguments}',
                           $strings);
          }
        }
      } else {
        my $strings = {
         'category' => $category,
         'type' => Texinfo::TreeElement::new({'type' => '_code',
                                              'contents' => [$type]}),
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'name' => $formatted_name};
        if ($self->get_conf('deftypefnnewline')
            and $self->get_conf('deftypefnnewline') eq 'on') {
          $tree
            = $self->cdt('@tie{}--- {category} on {class}:@*{type}@*{name}',
                         $strings);
        } else {
          $tree
            = $self->cdt('@tie{}--- {category} on {class}: {type} {name}',
                         $strings);
        }
      }
    } elsif ($cmdname eq 'deftypecv') {
      if (defined($arguments)) {
        my $strings = {
         'category' => $category,
         'name' => $formatted_name,
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'type' => Texinfo::TreeElement::new({'type' => '_code',
                                              'contents' => [$type]}),
         'arguments' => $formatted_arguments};
        if ($omit_def_name_space) {
          $tree
            = $self->cdt(
                 '@tie{}--- {category} of {class}: {type} {name}{arguments}',
                         $strings);
        } else {
          $tree
            = $self->cdt(
               '@tie{}--- {category} of {class}: {type} {name} {arguments}',
                         $strings);
        }
      } else {
        my $strings = {
         'category' => $category,
         'type' => Texinfo::TreeElement::new({'type' => '_code',
                                              'contents' => [$type]}),
         'class' => Texinfo::TreeElement::new({'type' => '_code',
                                               'contents' => [$class]}),
         'name' => $formatted_name};
        $tree
          = $self->cdt('@tie{}--- {category} of {class}: {type} {name}',
                         $strings);
      }
    }

    my $def_paragraph = new_formatter($self, 'paragraph',
      $self->{'format_context'}->[-2]->{'context_indent_len'},
      $self->{'format_context'}->[-1]->{'context_indent_len'}
         + $default_indent_length,
      { 'suppress_styles' => 1 }
     );
    push @{$self->{'formatters'}}, $def_paragraph;

    _convert($self, $tree);
    _stream_output_count_nl($self,
      Texinfo::Convert::Paragraph::end($def_paragraph->{'container'}));

    destroy_formatter(pop @{$self->{'formatters'}});
    $self->{'text_element_context'}->[-1]->{'counter'} = 0;
  }
}

#my $description_align_column = 32;
# computed as 32/72, rounded up
my $description_align_column_factor = 0.45;

sub _convert($$);

# Convert the Texinfo tree under $ROOT to plain text.
sub _convert($$) {
  my ($self, $element) = @_;

  if (!defined($element)) {
    cluck("BUG? Plaintext _convert element undef\n");
  }

  #print STDERR "CTPI "
  # .Texinfo::ManipulateTree::element_print_details($element)."\n";

  my $formatter = $self->{'formatters'}->[-1];

  my $type = $element->{'type'};

  if (exists($element->{'text'})) {
    # First handle empty lines. This has to be done before the handling
    # of text below to be sure that an empty line is always processed
    # especially
    if (defined($type)) {
      if ($type eq 'empty_line'
          or $type eq 'after_menu_description_line') {
        $self->{'text_element_context'}->[-1]->{'counter'} = 0;
        if ($element->{'text'} =~ /\f/) {
          my $result = _get_form_feeds($element->{'text'});
          _stream_output($self, $result);
        }
        if (exists(
             $preformatted_context_commands{$self->{'context'}->[-1]})) {
          _stream_output_add_text($self, "\n");
        } else {
          # TODO was inlined before for efficiency
          _add_newline_if_needed($self);
        }
        return;
      # ignoreable spaces
      } elsif (exists($ignorable_space_types{$type})) {
        if ($type eq 'spaces_after_close_brace'
            and $element->{'text'} =~ /\f/) {
          my $result = _get_form_feeds($element->{'text'});
          _stream_output($self, $result);
        }
        return;
      }
    }

    # process text
    # '_top_formatter' is only set in the formatter setup when calling
    # push_top_formatter.  It should be setup in containers that
    # contains paragraphs, lines and blocks, but no inline content.
    # Formatters created by new_formatter() when encountering paragraphs,
    # lines and blocks do not set that key, the formatting of text should
    # be done in those formatters.
    if (!$formatter->{'_top_formatter'}) {
      if (defined($type) and $type eq 'raw') {
        _stream_output_add_next($self, $element->{'text'});
      } else {
        # Convert ``, '', `, ', ---, -- in $COMMAND->{'text'} to their
        # output, possibly coverting to upper case as well.
        my $text = $element->{'text'};

        if ($formatter->{'upper_case_stack'}->[-1]->{'upper_case'}) {
          $text = _protect_sentence_ends($text);
          $text = uc($text);
        }
        if (!$self->{'ascii_dashes_and_quotes'} and $self->{'to_utf8'}) {
          $text = Texinfo::Convert::Unicode::unicode_text($text,
                      $formatter->{'font_type_stack'}->[-1]->{'monospace'});
        } elsif (!$formatter->{'font_type_stack'}->[-1]->{'monospace'}) {
          $text = _process_text_internal($text);
        }

        # TODO was inlined before for efficiency
        _stream_output_add_text($self, $text);
      }
    } elsif (defined($type) and $type eq 'spaces_before_paragraph') {
      my $indent = $self->get_conf('paragraphindent');
      if ($indent == -2) { # 'asis'
        _stream_output($self, $element->{'text'});
      }
      # TODO if not asis, output _get_form_feeds($element->{'text'})?
    # ignore text outside of any format, but warn if ignored text not empty
    } else {
      if (defined($type)) {
        $self->present_bug_message("unexpected text element type: $type",
                                   $element);
      }
      if ($element->{'text'} =~ /\S/) {
        $self->present_bug_message(
                          "ignored text not empty `$element->{'text'}'",
                                   $element);
      } else {
        # miscellaneous normal text top-level whitespace, after a no
        # paragraph command with spaces after brace not ignored:
        # @image, @titlefont, @*
        _stream_output_add_text($self, $element->{'text'});
      }
    }
    return;
  }

  return if (defined($type) and exists($ignored_types{$type}));

  my $cmdname = $element->{'cmdname'};
  if (defined($cmdname)) {
    return if (exists($self->{'ignored_commands'}->{$cmdname}));

    if (exists($brace_commands{$cmdname})
        and $brace_commands{$cmdname} eq 'inline'
        and $cmdname ne 'inlinefmtifelse') {
      if (exists($inline_format_commands{$cmdname})) {
        if (!exists($element->{'extra'})
             or !exists($element->{'extra'}->{'format'})
             or !$self->{'expanded_formats'}
                         ->{$element->{'extra'}->{'format'}}) {
          return;
        }
      } else {
        if (!exists($element->{'extra'})
             or !defined($element->{'extra'}->{'expand_index'})) {
          return;
        }
      }
    }
  }

  if (exists($element->{'extra'})
      and exists($element->{'extra'}->{'index_entry'})
      and !$self->{'multiple_pass'} and !$self->{'in_copying_header'}) {

    # Save the line offset.

    my $location = {
        'lines' => $self->{'count_context'}->[-1]->{'lines'},
      };
    push @{$self->{'count_context'}->[-1]->{'index_entry_locations'}},
      $location;

    my $index_entry_info = {'location' => $location};

    # this covers the special case for index entry not associated with a
    # node but seen.  This will be an index entry in @copying,
    # in @insertcopying.
    # This also covers the case of an index entry in a node added by a
    # @footnote with footnotestyle separate.
    if (exists($self->{'current_node'})) {
      $index_entry_info->{'node'} = $self->{'current_node'};
    }
    $self->{'index_entry_info'}->{$element} = $index_entry_info;
  }

  if (defined($type) and $type eq 'index_entry_command') {
    return;
  }

  my $cell;
  my $preformatted;
  if (defined($cmdname)) {
    if (exists($brace_commands{$cmdname})
        and $brace_commands{$cmdname} eq 'accent') {
      my $encoding = $self->{'enabled_encoding'};
      my $sc;
      if ($formatter->{'upper_case_stack'}->[-1]->{'upper_case'}) {
        $sc = 1;
      }
      my $accented_text
         = Texinfo::Convert::Text::text_accents($element, $encoding, $sc);
      _stream_output_add_text($self, $accented_text);

      my $accented_text_original;
      if ($formatter->{'upper_case_stack'}->[-1]->{'upper_case'}) {
        $accented_text_original
         = Texinfo::Convert::Text::text_accents($element, $encoding);

        if ($accented_text_original ne '') {
          if ($accented_text_original !~ /\p{Upper}/
              or $formatter->{'upper_case_stack'}->[-1]->{'var'}
              or $formatter->{'font_type_stack'}->[-1]->{'monospace'}) {
            allow_end_sentence($formatter->{'container'});
          }
        }
      }

      # in case the text added ends with punctuation.
      # If the text is empty (likely because of an error) previous
      # punctuation will be cancelled, we don't want that.
      remove_end_sentence($formatter->{'container'})
        if ($accented_text ne '');
      return;
    } elsif (defined($type) and $type eq 'definfoenclose_command') {
      _stream_output_count_nl($self,
                       add_next($formatter->{'container'},
                                $element->{'extra'}->{'begin'}, 1));
      if (exists($element->{'contents'})) {
        _convert($self, $element->{'contents'}->[0]);
      }
      _stream_output_count_nl($self,
                       add_next($formatter->{'container'},
                                $element->{'extra'}->{'end'}, 1));
      return;
    } elsif (exists($brace_commands{$cmdname})) {
      my ($is_quoted_command, $is_double_quoted_command, $is_asis_command);
      if (exists($style_map{$cmdname})
            or ($is_quoted_command = exists($quoted_commands{$cmdname}))
            or ($is_double_quoted_command
                = exists($double_quoted_commands{$cmdname}))
            or ($is_asis_command = exists($asis_commands{$cmdname}))) {
        if (exists($brace_code_commands{$cmdname})) {
          if (!$formatter->{'font_type_stack'}->[-1]->{'monospace'}) {
            push @{$formatter->{'font_type_stack'}}, {'monospace' => 1};
          } else {
            $formatter->{'font_type_stack'}->[-1]->{'monospace'}++;
          }
        } elsif ($brace_commands{$cmdname} eq 'style_no_code') {
          if ($formatter->{'font_type_stack'}->[-1]->{'monospace'}) {
            push @{$formatter->{'font_type_stack'}}, {'monospace' => 0,
                                                      'normal' => 1};
          } elsif ($formatter->{'font_type_stack'}->[-1]->{'normal'}) {
            $formatter->{'font_type_stack'}->[-1]->{'normal'}++;
          }
        }
        if (exists($no_punctuation_munging_commands{$cmdname})) {
          push @{$formatter->{'frenchspacing_stack'}}, 'on';
          set_frenchspacing($formatter->{'container'}, 1);
        }
        if ($cmdname eq 'w') {
          $formatter->{'w'}++;
          set_space_protection($formatter->{'container'}, 1)
            if ($formatter->{'w'} == 1);
        }
        my ($text_before, $text_after);
        if (exists($non_quoted_commands_when_nested{$cmdname})
                 and $formatter->{'font_type_stack'}->[-1]->{'code_command'}) {
        } elsif ($formatter->{'suppress_styles'}
                 and !exists($index_style_commands{$cmdname})) {
        } elsif (exists($style_map{$cmdname})) {
          $text_before = $style_map{$cmdname}->[0];
          $text_after = $style_map{$cmdname}->[1];
        } elsif ($is_quoted_command) {
          $text_before = $self->{'open_quote'};
          $text_after = $self->{'close_quote'};
        } elsif ($is_double_quoted_command) {
          $text_before = $self->{'open_double_quote'};
          $text_after = $self->{'close_double_quote'};
        } elsif ($is_asis_command) {
        } else {
          # bug
        }
        # do this after determining $text_before/$text_after such that it
        # doesn't impact the current command, but only commands nested within
        if (exists($non_quoted_commands_when_nested{$cmdname})) {
          $formatter->{'font_type_stack'}->[-1]->{'code_command'}++;
        }
        _stream_output_count_nl($self,
                       add_next($formatter->{'container'}, $text_before, 1))
           if (defined($text_before));
        if (exists($element->{'contents'})) {
          _convert($self, $element->{'contents'}->[0]);
          if ($cmdname eq 'strong'
              and exists($element->{'contents'}->[0]->{'contents'})
              and exists($element->{'contents'}->[0]->{'contents'}->[0]
                                                                   ->{'text'})
              and $element->{'contents'}->[0]->{'contents'}->[0]->{'text'}
                    =~ /^Note\s/i
              and $self->{'warn_strong_note'}) {
            $self->plaintext_line_warn($self, __(
      "\@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that"),
                             $element->{'source_info'});
          }
        }
        _stream_output_count_nl($self,
                       add_next($formatter->{'container'}, $text_after, 1))
           if (defined($text_after));
        if ($cmdname eq 'w') {
          $formatter->{'w'}--;
          set_space_protection($formatter->{'container'}, 0)
            if ($formatter->{'w'} == 0);
        }
        if (exists($brace_code_commands{$cmdname})) {
          $formatter->{'font_type_stack'}->[-1]->{'monospace'}--;
          allow_end_sentence($formatter->{'container'});
          pop @{$formatter->{'font_type_stack'}}
            if !$formatter->{'font_type_stack'}->[-1]->{'monospace'};
        } elsif ($brace_commands{$cmdname} eq 'style_no_code') {
          if ($formatter->{'font_type_stack'}->[-1]->{'normal'}) {
            $formatter->{'font_type_stack'}->[-1]->{'normal'}--;
            pop @{$formatter->{'font_type_stack'}}
              if !$formatter->{'font_type_stack'}->[-1]->{'normal'};
          }
        }
        if (exists($non_quoted_commands_when_nested{$cmdname})) {
          $formatter->{'font_type_stack'}->[-1]->{'code_command'}--;
        }
        if (exists($no_punctuation_munging_commands{$cmdname})) {
          pop @{$formatter->{'frenchspacing_stack'}};
          my $frenchspacing = 0;
          $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1]
                                 eq 'on');
          set_frenchspacing($formatter->{'container'}, $frenchspacing);
        }
        return;
      } elsif (exists($upper_case_commands{$cmdname})) {
        $formatter->{'upper_case_stack'}->[-1]->{'upper_case'}++;
        if ($cmdname eq 'var') {
          $formatter->{'upper_case_stack'}->[-1]->{'var'}++;
          push @{$formatter->{'frenchspacing_stack'}}, 'on';
          set_frenchspacing($formatter->{'container'}, 1);
        }

        if (exists($element->{'contents'})) {
          _convert($self, $element->{'contents'}->[0]);
        }

        $formatter->{'upper_case_stack'}->[-1]->{'upper_case'}--;
        if ($cmdname eq 'var') {
          pop @{$formatter->{'frenchspacing_stack'}};
          my $frenchspacing = 0;
          $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1]
                                 eq 'on');
          set_frenchspacing($formatter->{'container'}, $frenchspacing);

          $formatter->{'upper_case_stack'}->[-1]->{'var'}--;
          # Allow a following full stop to terminate a sentence.
          allow_end_sentence($formatter->{'container'});
        }
        return;
      } elsif ($cmdname eq 'link') {
        if (exists($element->{'contents'})) {
          # Use arg 2 if present, otherwise use arg 1.  Do not produce
          # functional link in Info/plaintext output.
          my $text_arg;

          if (scalar(@{$element->{'contents'}}) >= 2
              and not Texinfo::Common::empty_spaces_argument(
                                  $element->{'contents'}->[1])) {
            $text_arg = $element->{'contents'}->[1];
          } elsif (not Texinfo::Common::empty_spaces_argument(
                                   $element->{'contents'}->[0])) {
            $text_arg = $element->{'contents'}->[0];
          }
          if (defined($text_arg)) {
            _convert($self, $text_arg);
          }
        }
        return;
      } elsif (exists($ref_commands{$cmdname})) {
        $self->format_ref($cmdname, $element);
        return;
      } elsif ($cmdname eq 'image') {
        _stream_output_count_nl($self,
                       add_pending_word($formatter->{'container'}, 1));
        # add an empty word so that following spaces aren't lost
        add_next($formatter->{'container'}, '');
        my $lines_count = $self->format_image_element($element);
        # We do not how much horizontal space @image will take:
        #   * In plain text output or standalone Info, the replacement
        #     text will be used
        #   * In Emacs Info, the image file may be displayed.
        # So if an @image is used inside a paragraph, we cannot break
        # the line in a place that will always work.
        # Here we just add a small number to the line counter as a compromise.
        # (However, multi-line replacement texts are unlikely to look good if
        # used inside a paragraph.)
        Texinfo::Convert::Paragraph::add_to_counter($formatter->{'container'},
                                                    $IMAGE_WIDTH);
        _add_lines_count($self, $lines_count);
        return;
      } elsif ($cmdname eq 'today') {
        my $today = $self->expand_today();
        _convert($self, $today);
        return;
      } elsif (exists($brace_no_arg_commands{$cmdname})) {
        my $tree = $self->translated_command_tree($cmdname);

        if (defined($tree)) {
          _convert($self, $tree);
        } else {
          my $text;

          if ($cmdname eq 'dots' or $cmdname eq 'enddots') {
            # Don't use Unicode ellipsis character.
            $text = '...';
          } else {
            # Note that we set set_case to 0 irrespective of upper case
            # context, as we want the call to _protect_sentence_ends
            # to be on a text not already upper cased
            $text = Texinfo::Convert::Text::brace_no_arg_command($element,
                                          $self->{'enabled_encoding'},
                                          $self->{'ascii_glyph'}, 0, 0);
          }

          if ($punctuation_no_arg_commands{$cmdname}) {
            _stream_output_add_next($self, $text);
            add_end_sentence($formatter->{'container'});
          } elsif ($cmdname eq 'tie') {
            _stream_output_add_next($self, $text);
          } else {
            # @AA{} should suppress an end sentence, @aa{} shouldn't.  This
            # is the case whether we are in @sc or not.
            if ($formatter->{'upper_case_stack'}->[-1]->{'upper_case'}
                and $letter_no_arg_commands{$cmdname}) {
              $text = _protect_sentence_ends($text);
              $text = uc($text);
            }

            _stream_output_add_text($self, $text);

            # This is to have @TeX{}, for example, not to prevent end sentences.
            if (!exists($letter_no_arg_commands{$cmdname})) {
              allow_end_sentence($formatter->{'container'});
            }

            if ($cmdname eq 'dots') {
              remove_end_sentence($formatter->{'container'});
            }
          }
          if ($formatter->{'upper_case_stack'}->[-1]->{'var'}
              or $formatter->{'font_type_stack'}->[-1]->{'monospace'}) {
            allow_end_sentence($formatter->{'container'});
          }
        }
        return;
      } elsif ($cmdname eq 'email') {
        if (exists($element->{'contents'})) {
          my $name;
          my $email;
          if (scalar(@{$element->{'contents'}}) >= 2
              and not Texinfo::Common::empty_spaces_argument(
                                     $element->{'contents'}->[1])) {
            $name = $element->{'contents'}->[1];
          }
          if (not Texinfo::Common::empty_spaces_argument(
                                 $element->{'contents'}->[0])) {
            $email = $element->{'contents'}->[0];
          }
          my $email_tree;
          if (defined($name) and defined($email)) {
            $email_tree = $self->cdt('{name} @url{{email}}',
                             {'name' => $name, 'email' => $email});
          } elsif (defined($email)) {
            $email_tree = $self->cdt('@url{{email}}',
                             {'email' => $email});
          } elsif (defined($name)) {
            $email_tree = $name;
          } else {
            return;
          }
          _convert($self, $email_tree);
        }
        return;
      } elsif ($cmdname eq 'uref' or $cmdname eq 'url') {
        my $inserted;
        if (exists($element->{'contents'})) {
          if (scalar(@{$element->{'contents'}}) == 3
               and not Texinfo::Common::empty_spaces_argument(
                                            $element->{'contents'}->[2])) {
            $inserted = Texinfo::TreeElement::new(
                        {'type' => '_stop_upper_case',
                         'contents' => [$element->{'contents'}->[2]]});
          } elsif (not Texinfo::Common::empty_spaces_argument(
                                                $element->{'contents'}->[0])) {
            # no mangling of --- and similar in url.
            my $url = Texinfo::TreeElement::new(
             {'type' => '_stop_upper_case',
              'contents' => [
               Texinfo::TreeElement::new({'type' => '_code',
                'contents' => [$element->{'contents'}->[0]]})]});
            if (scalar(@{$element->{'contents'}}) == 2
                and not Texinfo::Common::empty_spaces_argument(
                                                $element->{'contents'}->[1])) {
              $inserted = $self->cdt('{text} ({url})',
                   {'text' => $element->{'contents'}->[1],
                    'url' => $url });
            } else {
              $inserted = $self->cdt('@t{<{url}>}', {'url' => $url});
            }
          } elsif (scalar(@{$element->{'contents'}}) == 2
                   and not Texinfo::Common::empty_spaces_argument(
                             $element->{'contents'}->[1])) {
            $inserted = $element->{'contents'}->[1];
          }
        }
        if ($inserted) {
          _convert($self, $inserted);
        }
        return;
      } elsif ($cmdname eq 'footnote') {
        $self->{'footnote_index'}++ unless ($self->{'multiple_pass'});
        my $formatted_footnote_number;
        if ($self->get_conf('NUMBER_FOOTNOTES')) {
          $formatted_footnote_number = $self->{'footnote_index'};
        } else {
          $formatted_footnote_number = $NO_NUMBER_FOOTNOTE_SYMBOL;
        }
        push @{$self->{'pending_footnotes'}}, {'footnote_element' => $element,
                                      'number' => $self->{'footnote_index'}}
            unless ($self->{'multiple_pass'});
        if (!$self->{'in_copying_header'}) {
          $self->format_error_outside_of_any_node($element);
        }
        _stream_output_count_nl($self,
             add_next($formatter->{'container'},
                      "($formatted_footnote_number)", 1));
        my $footnotestyle = $self->get_conf('footnotestyle');
        if (defined($footnotestyle) and $footnotestyle eq 'separate'
            and exists($self->{'current_node'})) {
          # arguments_line type element
          my $arguments_line = $self->{'current_node'}->{'contents'}->[0];
          my $line_arg = $arguments_line->{'contents'}->[0];
          _convert($self, Texinfo::TreeElement::new({'contents' =>
           [Texinfo::TreeElement::new({'text' => ' ('}),
            Texinfo::TreeElement::new({'cmdname' => 'pxref',
             'contents' => [
               Texinfo::TreeElement::new({'type' => 'brace_arg',
                'contents' => [
                   $line_arg,
                   Texinfo::TreeElement::new(
                        {'text' => "-Footnote-$self->{'footnote_index'}"})
                ]
               })
             ]
            }),
            Texinfo::TreeElement::new({'text' => ')'})],
            }));
        }
        return;
      } elsif ($cmdname eq 'anchor' or $cmdname eq 'namedanchor') {
        _stream_output_count_nl($self,
                                add_pending_word($formatter->{'container'}));
        $self->format_anchor($element);
        return;
      } elsif (exists($explained_commands{$cmdname})) {
        if (exists($element->{'contents'})
            and not Texinfo::Common::empty_spaces_argument(
                                 $element->{'contents'}->[0])) {
          # in abbr spaces never end a sentence.
          my $argument;
          if ($cmdname eq 'abbr') {
            $argument = Texinfo::TreeElement::new({'type' => '_frenchspacing',
                         'contents' => [$element->{'contents'}->[0]]});
          } else {
            $argument = $element->{'contents'}->[0];
          }
          if (scalar(@{$element->{'contents'}}) >= 2
              and not Texinfo::Common::empty_spaces_argument(
                                      $element->{'contents'}->[1])) {
            my $inserted = $self->cdt('{abbr_or_acronym} ({explanation})',
                   {'abbr_or_acronym' => $argument,
                    'explanation' => $element->{'contents'}->[1]});
            _convert($self, $inserted);
          } else {
            _convert($self, $argument);

            # We want to permit an end of sentence, but not force it
            # as @. does.
            allow_end_sentence($formatter->{'container'});
          }
        }
        return;
      } elsif ($brace_commands{$cmdname} eq 'inline') {
        my $arg_index = 1;
        if ($cmdname eq 'inlinefmtifelse'
            and (!exists($element->{'extra'}->{'format'})
                 or !$self->{'expanded_formats'}
                                  ->{$element->{'extra'}->{'format'}})) {
          $arg_index = 2;
        }
        if (scalar(@{$element->{'contents'}}) > $arg_index
            and exists($element->{'contents'}->[$arg_index]->{'contents'})) {
          my $arg = $element->{'contents'}->[$arg_index];
          my $argument;
          if ($cmdname eq 'inlineraw') {
            $argument = Texinfo::TreeElement::new(
                        {'type' => '_stop_upper_case',
                         'contents' => [
              Texinfo::TreeElement::new({'type' => '_code',
                                         'contents' => [$arg]})]});
          } else {
            $argument = $arg;
          }
          _convert($self, $argument);
        }
        return;
        # condition should actually be that the $cmdname is inline
      } elsif (exists($math_commands{$cmdname})) {
        if (exists($element->{'contents'})) {
          push @{$self->{'context'}}, $cmdname;
          if (exists($self->{'elements_images'})
              and exists($self->{'elements_images'}->{$element})) {
            # flush before @math, including spaces
            _stream_output_count_nl($self,
                       add_pending_word($formatter->{'container'}, 1));
            # TODO same as @image code.  Does not seems to have any effect,
            # leading spaces in @math are lost anyway (which is not important).
            # add an empty word so that following spaces aren't lost
            add_next($formatter->{'container'}, '');
            # math rendered as an image, push a count to capture content
            push @{$self->{'count_context'}}, {'lines' => 0,
                                               'index_entry_locations' => [],
                                               'pending_text' => [['']]};
          }
          _convert($self, Texinfo::TreeElement::new({'type' => '_frenchspacing',
           'contents' => [Texinfo::TreeElement::new({'type' => '_code',
                          'contents' => [$element->{'contents'}->[0]]})]}));
          if (exists($self->{'elements_images'})
              and exists($self->{'elements_images'}->{$element})) {
            # flush @math, including spaces
            _stream_output_count_nl($self,
                       add_pending_word($formatter->{'container'}, 1));
            my ($math_text, $anchors) = _stream_to_text_anchor($self);
            pop @{$self->{'count_context'}};
            foreach my $anchor (@$anchors) {
              $self->add_target_location($anchor);
            }
            my $lines_count = _insert_image($self,
                  $self->{'elements_images'}->{$element}->{'filename'},
                  $math_text,
                  $self->{'elements_images'}->{$element}->{'dpi'},
                  $self->{'elements_images'}->{$element}->{'depth'});
            _add_lines_count($self, $lines_count);
          }
          my $old_context = pop @{$self->{'context'}};
          die if ($old_context ne $cmdname);
        }
        return;
      } elsif ($cmdname eq 'titlefont') {
        if (!Texinfo::Common::empty_spaces_argument($element)) {
          _text_heading($self,
           Texinfo::TreeElement::new({'extra' => {'section_level' => 0},
                                      'cmdname' => 'titlefont'}),
                            $element->{'contents'}->[0],
                            $self->get_conf('NUMBER_SECTIONS'),
               $self->{'format_context'}->[-1]->{'context_indent_len'}, 1);
          _add_lines_count($self, 1);
        }
        return;
      } elsif ($cmdname eq 'U') {
        if (exists($element->{'contents'})) {
          my ($arg_text, $surplus_arg)
            = Texinfo::Common::simple_arg_text($element->{'contents'}->[0]);
          if (defined($arg_text) and $arg_text ne '') {
            # Syntactic checks on the value were already done in Parser.pm,
            # but we have one more thing to test: since this is the one
            # place where we might output actual UTF-8 binary bytes, we have
            # to check that it is possible.  If not, silently fall back to
            # plain text, on the theory that the user wants something.
            my $res;
            if ($self->{'to_utf8'}) {
              my $possible_conversion
                = Texinfo::Convert::Unicode::check_unicode_point_conversion(
                                                  $arg_text, $self->{'debug'});
              if ($possible_conversion) {
                $res = chr(hex($arg_text)); # ok to call chr
              } else {
                $res = "U+$arg_text";
              }
            } else {
              $res = "U+$arg_text";  # not outputting UTF-8
            }
            _stream_output_add_text ($self, $res);
          }
        }
        return;
      } elsif ($cmdname eq 'value') {
        my $expansion = $self->cdt('@{No value for `{value}\'@}',
                                   {'value' => $element->{'contents'}->[0]});
        my $piece;
        if ($formatter->{'_top_formatter'}) {
          $piece = {'type' => 'paragraph',
                        'contents' => [$expansion]};
        } else {
          $piece = $expansion;
        }
        _convert($self, $piece);
        return;
      }
    } elsif (defined($nobrace_symbol_text{$cmdname})) {
      if ($cmdname eq ':') {
        remove_end_sentence($formatter->{'container'});
      } elsif ($cmdname eq '*') {
        _stream_output_count_nl($self,
                       add_pending_word($formatter->{'container'}));
        # added eol in some line oriented constructs, such as @node, menu
        # entry and therefore index entry would lead to end of line on
        # node pointers line, in tag table, or on menu, all being invalid.
        if ($formatter->{'no_added_eol'}) {
          _stream_output_add_text($self, ' ');
        } else {
          _stream_output_count_nl($self,
                         end_line($formatter->{'container'}));
        }
      } elsif ($cmdname eq '.' or $cmdname eq '?' or $cmdname eq '!') {
        _stream_output_add_next($self, $cmdname);
        add_end_sentence($formatter->{'container'});
      } elsif ($cmdname eq ' ' or $cmdname eq "\n" or $cmdname eq "\t") {
        _stream_output_add_next($self, $nobrace_symbol_text{$cmdname});
      } else {
        _stream_output_add_text($self, $nobrace_symbol_text{$cmdname});
      }
      return;
    # block commands
    } elsif (exists($block_commands{$cmdname})) {
      # remark:
      # cartouche group and raggedright -> nothing on format stack

      my $format_menu = $self->get_conf('FORMAT_MENU');
      if (exists($menu_commands{$cmdname})
          and (!$format_menu or $format_menu eq 'nomenu')) {
        return;
      }
      # includes @verbatim raw block_commands and block_math_commands
      if (exists($preformatted_context_commands{$cmdname})
          or $cmdname eq 'float') {
        if (exists($format_raw_commands{$cmdname})) {
          _stream_output_count_nl($self,
                         add_pending_word($formatter->{'container'}, 1));
        }
        push @{$self->{'context'}}, $cmdname;
      } elsif (exists($flush_commands{$cmdname})) {
        push @{$self->{'context'}}, $cmdname;
      }

      if (exists($format_context_commands{$cmdname})) {
        push @{$self->{'format_context'}},
             { 'cmdname' => $cmdname,
               'paragraph_count' => 0,
               'context_indent_len'
                  => $self->{'format_context'}->[-1]->{'context_indent_len'},
             };
        if (exists($indented_commands{$cmdname})) {
          if (exists($example_indented_commands{$cmdname})) {
            my $indent_len = $self->get_conf('exampleindent');
            if ($indent_len eq 'asis') {
              $indent_len = 0;
            }
            $self->{'format_context'}->[-1]->{'context_indent_len'}
              += $indent_len;
          } else {
            $self->{'format_context'}->[-1]->{'context_indent_len'}
              += $default_indent_length;
          }
        }
        # open a preformatted container, if the command opening the
        # preformatted context is not a classical preformatted
        # command (ie if it is menu or verbatim, and not example or
        # similar)
        if (exists($preformatted_context_commands{$cmdname})
            and !exists($preformatted_commands{$cmdname})
            and !exists($format_raw_commands{$cmdname})) {
          $preformatted = new_formatter($self, 'unfilled');
          push @{$self->{'formatters'}}, $preformatted;
          # displaymath rendered as an image, push a count to capture
          # formatted content
          if (exists($self->{'elements_images'})
              and exists($self->{'elements_images'}->{$element})) {
            push @{$self->{'count_context'}}, {'lines' => 0,
                                               'index_entry_locations' => [],
                                               'pending_text' => [['']]};
          }
        }
      }
      if ($cmdname eq 'quotation' or $cmdname eq 'smallquotation') {
        push @{$self->{'document_context'}->[-1]->{'quotations_authors'}}, [];
        # arguments_line type element
        my $arguments_line = $element->{'contents'}->[0];
        my $block_line_arg = $arguments_line->{'contents'}->[0];
        if (!Texinfo::Common::empty_spaces_argument($block_line_arg)) {
          my $prepended = $self->cdt('@b{{quotation_arg}:} ',
                                {'quotation_arg' => $block_line_arg});
          $prepended->{'type'} = '_frenchspacing';
          my $width = $self->convert_line($prepended);

          $self->{'text_element_context'}->[-1]->{'counter'} += $width;
        }
      } elsif (exists($menu_commands{$cmdname})) {
        _menu($self, $element);
      } elsif ($cmdname eq 'multitable') {
        my $columnsize = [];
        my $columnfractions
          = Texinfo::Common::multitable_columnfractions($element);
        if (defined($columnfractions)) {
          if (exists($columnfractions->{'extra'})
              and exists($columnfractions->{'extra'}->{'misc_args'})) {
            foreach my $fraction (
                            @{$columnfractions->{'extra'}->{'misc_args'}}) {
              push @$columnsize,
                   int($fraction
                       * $self->{'text_element_context'}->[-1]->{'max'} +0.5);
            }
          }
        } else {
          # arguments_line type element
          my $arguments_line = $element->{'contents'}->[0];
          my $block_line_arg = $arguments_line->{'contents'}->[0];
          if (exists($block_line_arg->{'contents'})) {
            foreach my $content (@{$block_line_arg->{'contents'}}) {
              if (exists($content->{'type'})
                  and $content->{'type'} eq 'bracketed_arg') {
                my $column_size = 0;
                if (exists($content->{'contents'})) {
                  my (undef, $width)
                      = $self->convert_line_new_context($content, 0);
                  $column_size = $width;
                }
                push @$columnsize, 2+$column_size;
              }
            }
          }
        }
        $self->{'format_context'}->[-1]->{'columns_size'} = $columnsize;
        $self->{'document_context'}->[-1]->{'in_multitable'}++;
      } elsif ($cmdname eq 'float') {
        _add_newline_if_needed($self);
        my $argument_line = $element->{'contents'}->[0];
        if (exists($argument_line->{'contents'})
            and scalar(@{$argument_line->{'contents'}}) >= 2
            and exists($argument_line->{'contents'}->[1]->{'contents'})) {
          $self->format_anchor($element);
        }
      } elsif ($cmdname eq 'cartouche') {
        # arguments_line type element
        my $arguments_line = $element->{'contents'}->[0];
        my $block_line_arg = $arguments_line->{'contents'}->[0];
        if (!Texinfo::Common::empty_spaces_argument($block_line_arg)) {
          my $prepended = $self->cdt('@center @b{{cartouche_arg}}',
                                 {'cartouche_arg' => $block_line_arg});
          $prepended->{'type'} = '_frenchspacing';
          # Do not consider the title to be like a paragraph
          my $previous_paragraph_count
              = $self->{'format_context'}->[-1]->{'paragraph_count'};

          # TODO it would be logical to use convert_line here, and it would
          # allow to cover translations that do not use @center, but we
          # cannot use convert_line here in case there is indentation:
          # @center in $prepended already adds an end of line as part
          # of its formatting. When the formatter end() is called in
          # convert_line we are at the beginning of the line and trailing
          # spaces (although there are no space pending) are added because
          # 'add_final_space' is set in line formatter leads to spurious
          # spaces added for indentation at the beginning of the line.
          #$self->convert_line($prepended);
          _convert($self, $prepended);
          # This is not actually useful since @center already does it,
          # but it is logical.
          _ensure_end_of_line($self);
          $self->{'format_context'}->[-1]->{'paragraph_count'}
              = $previous_paragraph_count;
        }
      }
    } elsif ($cmdname eq 'node') {
      $self->{'current_node'} = $element;
      $self->format_node($element);
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
    } elsif (exists($sectioning_heading_commands{$cmdname})) {
      # use settitle for empty @top
      # ignore @part
      my $heading_element;
      my $line_arg;
      if (exists($root_commands{$cmdname})) {
        # arguments_line type element
        my $arguments_line = $element->{'contents'}->[0];
        $line_arg = $arguments_line->{'contents'}->[0];
      } else {
        # @heading* commands
        $line_arg = $element->{'contents'}->[0];
      }
      if ($cmdname ne 'part'
          and !Texinfo::Common::empty_spaces_argument($line_arg)) {
        $heading_element = $line_arg;
      } elsif ($cmdname eq 'top') {
        my $global_commands;
        if (exists($self->{'document'})) {
          $global_commands = $self->{'document'}->global_commands_information();
        }
        if (defined($global_commands)
            and exists($global_commands->{'settitle'})
            and exists($global_commands->{'settitle'}->{'contents'})
            and !Texinfo::Common::empty_spaces_argument(
               $global_commands->{'settitle'}->{'contents'}->[0])) {
          $heading_element =
                    $global_commands->{'settitle'}->{'contents'}->[0];
        }
      }

      if (defined($heading_element)) {
        _add_newline_if_needed($self);
        # @* leads to an end of line, underlying appears on the line below
        # over the last part of the line
        my $not_empty =
             _text_heading($self, $element, $heading_element,
                           $self->get_conf('NUMBER_SECTIONS'),
                     $self->{'format_context'}->[-1]->{'context_indent_len'});
        if ($not_empty) {
          _add_lines_count($self, 2);
          _add_newline_if_needed($self);
        }
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
      return unless(exists($root_commands{$cmdname}));
    } elsif (($cmdname eq 'item' or $cmdname eq 'itemx')
             and exists($element->{'contents'})
             and exists($element->{'contents'}->[0]->{'type'})
             and $element->{'contents'}->[0]->{'type'} eq 'line_arg') {
      if (!Texinfo::Common::empty_spaces_argument(
                                    $element->{'contents'}->[0])) {
        my $table_item_tree = $self->table_item_content_tree($element);
        if (!defined($table_item_tree)) {
          # Right now, this can only happen with @itemx in @itemize
          # or @enumerate in @*table, which is erroneous
          return;
        }
        my $frenchspacing_element = {'type' => '_frenchspacing',
                                     'contents' => [$table_item_tree]};
        $self->convert_line($frenchspacing_element,
               $self->{'format_context'}->[-2]->{'context_indent_len'});
        _ensure_end_of_line($self);
      }
      return;
    } elsif ($cmdname eq 'item' and exists($element->{'parent'}->{'cmdname'})
             and exists($block_commands{$element->{'parent'}->{'cmdname'}})
             and $block_commands{$element->{'parent'}->{'cmdname'}}
                                                      eq 'item_container') {
      $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
      my $line = new_formatter($self, 'line',
        $self->{'format_context'}->[-2]->{'context_indent_len'}
          + $item_indent_format_length{$element->{'parent'}->{'cmdname'}});
      push @{$self->{'formatters'}}, $line;
      if ($element->{'parent'}->{'cmdname'} eq 'enumerate') {
        _stream_output_add_next($self,
             Texinfo::Common::enumerate_item_representation($element). '. ');
      } else {
        my $prepended_element
          = Texinfo::Common::item_itemize_prepended($element);
        # this is the text prepended to items.
        _convert($self, $prepended_element);
        _convert($self, Texinfo::TreeElement::new({ 'text' => ' ' }));
      }
      _stream_output_count_nl($self,
                     Texinfo::Convert::Paragraph::end($line->{'container'}));
      $self->{'text_element_context'}->[-1]->{'counter'} +=
         Texinfo::Convert::Paragraph::counter($line->{'container'});
      destroy_formatter(pop @{$self->{'formatters'}});
    # open a multitable cell
    } elsif ($cmdname eq 'headitem' or $cmdname eq 'item'
             or $cmdname eq 'tab') {
      my $cell_width
        = $self->{'format_context'}->[-1]->{'columns_size'}
                                    ->[$element->{'extra'}->{'cell_number'}-1];
      $self->{'format_context'}->[-1]->{'item_command'} = $cmdname
        if ($cmdname ne 'tab');
      #die if (!defined($cell_width));
      # happens with bogus multitables
      $cell_width = 2 if (!defined ($cell_width));

      push @{$self->{'format_context'}},
           { 'cmdname' => $cmdname,
             'paragraph_count' => 0,
             'context_indent_len' => 0 };
      push @{$self->{'text_element_context'}}, {'max' => $cell_width - 2,
                                                'counter' => 0};
      push @{$self->{'count_context'}}, {'lines' => 0,
                                               'index_entry_locations' => [],
                                               'pending_text' => [['']]};
      $cell = 1;
    # not block commands and not brace commands
    } elsif (exists($def_commands{$cmdname})) {
      _convert_def_line($self, $element);
      return;
    } elsif ($cmdname eq 'center') {
      push @{$self->{'count_context'}}, {'lines' => 0,
                                         'index_entry_locations' => [],
                                         'pending_text' => [['']]};
      if (exists($element->{'contents'}->[0]->{'contents'})) {
        $self->convert_line(
             {'type' => '_frenchspacing',
              'contents' => [$element->{'contents'}->[0]]},
             0);
      }
      if (!_pending_is_empty(
                 $self->{'count_context'}->[-1]->{'pending_text'})) {
        _align_environment($self,
                   $self->{'text_element_context'}->[-1]->{'max'}, 'center');
        _ensure_end_of_line($self);
      } else {
        my $pending = $self->{'count_context'}->[-1]->{'pending_text'};
        # it has to be done here, as it is done in _align_environment above
        pop @{$self->{'count_context'}};
        # in case there is no text but anchor, merge
        push @{$self->{'count_context'}->[-1]->{'pending_text'}}, @$pending;
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      return;
    } elsif ($cmdname eq 'exdent') {
      if (!Texinfo::Common::empty_spaces_argument(
                         $element->{'contents'}->[0])) {
        if (exists(
            $preformatted_context_commands{$self->{'context'}->[-1]})) {
          my $formatter = new_formatter($self, 'unfilled',
              $self->{'format_context'}->[-2]->{'context_indent_len'});
          $formatter->{'font_type_stack'}->[-1]->{'monospace'} = 1;
          push @{$self->{'formatters'}}, $formatter;
          _convert($self, $element->{'contents'}->[0]);
          _stream_output_count_nl($self,
            Texinfo::Convert::Paragraph::end($formatter->{'container'}));
          destroy_formatter(pop @{$self->{'formatters'}});
        } else {
          $self->convert_line($element->{'contents'}->[0],
             $self->{'format_context'}->[-2]->{'context_indent_len'});
        }
      }
      _ensure_end_of_line($self);
      return;
    } elsif ($cmdname eq 'verbatiminclude') {
      my $expansion = $self->expand_verbatiminclude($element);
      _convert($self, $expansion) if (defined($expansion));
      return;
    } elsif ($cmdname eq 'insertcopying') {
      my $global_commands;
      if (exists($self->{'document'})) {
        $global_commands = $self->{'document'}->global_commands_information();
      }
      if (defined($global_commands)
          and exists($global_commands->{'copying'})) {
        my $inserted =
         {'contents' => $global_commands->{'copying'}->{'contents'}};
        _convert($self, $inserted);
      }
      return;
    } elsif ($cmdname eq 'printindex') {
      $self->format_printindex($element);
      return;
    } elsif ($cmdname eq 'listoffloats') {
      my $float_type = $element->{'extra'}->{'float_type'};
      my $lines_count = 0;
      my $floats;
      if (exists($self->{'document'})) {
        $floats = $self->{'document'}->floats_information();
      }
      if (defined($floats)
          and exists($floats->{$float_type})
          and scalar(@{$floats->{$float_type}})) {
        _add_newline_if_needed($self);
        _stream_output($self, "* Menu:\n\n");
        $lines_count += 2;
        foreach my $float_and_section (@{$floats->{$float_type}}) {
          my ($float, $float_section) = @$float_and_section;
          my $argument_line = $float->{'contents'}->[0];
          next if (!exists($argument_line->{'contents'})
                   or scalar(@{$argument_line->{'contents'}}) < 2
                   or Texinfo::Common::empty_spaces_argument(
                    $argument_line->{'contents'}->[1]));

          my $float_entry = $self->float_type_number($float);
          next if !defined($float_entry);

          my $formatter = new_formatter($self, 'paragraph',
                                        0, $listoffloat_entry_length);
          my $container = $formatter->{'container'};
          push @{$self->{'formatters'}}, $formatter;

          # Output in format "* $float_entry_text: $float_label_text.".

          _stream_output_add_next($self, '* ');

          $float_entry->{'type'} = '_frenchspacing';
          _convert($self, $float_entry);

          _stream_output_add_next($self, ': ');

          _convert($self, Texinfo::TreeElement::new({'type' => '_code',
                          'contents' =>
                      [$float->{'contents'}->[0]->{'contents'}->[1]]}));
          _stream_output_add_next($self, '.');
          _stream_output_count_nl($self,
                   Texinfo::Convert::Paragraph::add_pending_word($container));

          # NB we trust that only $container was used to format text
          # inside the call to convert_line so that all output text is
          # counted.
          my $line_width
             = Texinfo::Convert::Paragraph::counter($formatter->{'container'});

          if ($line_width > $listoffloat_entry_length) {
            _stream_output_count_nl($self,
                           Texinfo::Convert::Paragraph::end_line($container));
          } else {
            _stream_output_add_next($self,
                         ' ' x ($listoffloat_entry_length - $line_width));
          }

          my ($caption, $shortcaption)
           = Texinfo::Common::find_float_caption_shortcaption($float);

          my $caption_element;
          if (defined($shortcaption)) {
            $caption_element = $shortcaption;
          } elsif (defined($caption)) {
            $caption_element = $caption;
          }

          if (defined($caption_element)
              and exists($caption_element->{'contents'})
              and !Texinfo::Common::empty_spaces_argument(
                          $caption_element->{'contents'}->[0])) {
            push @{$self->{'context'}}, 'listoffloats';
            $self->{'multiple_pass'} = 1;
            my $caption_arg = $caption_element->{'contents'}->[0];

            # we do not want to start a new paragraph formatter so
            # we iterate over the contents of a paragraph rather than
            # converting the paragraph itself.
            foreach my $content (@{$caption_arg->{'contents'}}) {
              if (exists($content->{'type'})
                  and $content->{'type'} eq 'paragraph'
                  and exists($content->{'contents'})) {
                foreach my $subelement (@{$content->{'contents'}}) {
                  _convert($self, $subelement);
                }
                last;
              } elsif (!defined($content->{'type'})
                       or $content->{'type'} ne 'spaces_before_argument') {
                _convert($self, $content);
                last;
              }
            }
            delete $self->{'multiple_pass'};
            my $old_context = pop @{$self->{'context'}};
          }
          # flush and add newline
          _stream_output_count_nl($self,
            Texinfo::Convert::Paragraph::end($container));

          destroy_formatter(pop @{$self->{'formatters'}});
        }
        _stream_output($self, "\n");
        $lines_count++;
      }
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      _add_lines_count($self, $lines_count);
      return;
    } elsif ($cmdname eq 'sp') {
      _stream_output_count_nl($self,
                     add_pending_word($formatter->{'container'}));
      my $sp_nr = 1;
      if (exists($element->{'extra'})
          and exists($element->{'extra'}->{'misc_args'})) {
        $sp_nr = $element->{'extra'}->{'misc_args'}->[0];
      }
      for (my $i = 0; $i < $sp_nr; $i++) {
        _stream_output_count_nl($self,
                       end_line($formatter->{'container'}));
      }
      $self->{'text_element_context'}->[-1]->{'counter'} = 0;
      return;
    } elsif ($cmdname eq 'contents'
             or $cmdname eq 'shortcontents' or $cmdname eq 'summarycontents') {
      my $sections_list;
      my $sectioning_root;
      if (exists($self->{'document'})) {
        $sections_list = $self->{'document'}->sections_list();
        $sectioning_root = $self->{'document'}->sectioning_root();
      }

      if (defined($sections_list) and scalar(@$sections_list)) {
        $self->format_contents($sectioning_root, $cmdname);
      }
      return;
    } elsif ($cmdname eq 'author') {
      my $quotations_authors
        = $self->{'document_context'}->[-1]->{'quotations_authors'};
      if (scalar(@$quotations_authors)) {
        push @{$quotations_authors->[-1]}, $element;
      }
      return;
    # all the @-commands that have an information for the formatting, like
    # @paragraphindent, @frenchspacing...
    } elsif (exists($informative_commands{$cmdname})) {
      Texinfo::Common::set_informative_command_value($self, $element);
      if ($cmdname eq 'documentlanguage') {
        $self->converter_set_documentlanguage(
                                      $self->get_conf('documentlanguage'));
      } elsif ($cmdname eq 'documentscript') {
        $self->converter_set_documentscript(
                                      $self->get_conf('documentscript'))
      }
      return;
    } elsif ($cmdname eq 'documentlanguagevariant') {
      # special case, array argument
      my $variants
        = Texinfo::Common::documentlanguagevariant_variants($element);
      $self->converter_set_documentlanguagevariant($variants);
      return;
    } else { # unknown command
      _stream_output($self, "!!!!!!!!! Unhandled $cmdname !!!!!!!!!\n");
      _add_lines_count($self, 1)
    }
  }

  # open 'type' constructs.
  my $paragraph;
  if (defined($type)) {
    if ($type eq 'paragraph') {
      my ($para_indent_size, $para_indent_next);
      # indent. Not first paragraph.
      if ($self->{'format_context'}->[-1]->{'cmdname'} eq '_top_format'
          and $self->get_conf('paragraphindent') >= 0
          and $self->get_conf('paragraphindent')
          and ((exists($element->{'extra'})
                and $element->{'extra'}->{'indent'})
             or (!(exists($element->{'extra'})
                   and $element->{'extra'}->{'noindent'})
                and ($self->{'format_context'}->[-1]->{'paragraph_count'}
                  or $self->get_conf('firstparagraphindent') eq 'insert')
               and !$self->{'text_element_context'}->[-1]->{'counter'}))) {
        $para_indent_size = $self->get_conf('paragraphindent');
        $para_indent_next = 0;
      }
      $paragraph = new_formatter($self, 'paragraph',
                                 $para_indent_size, $para_indent_next);
      push @{$self->{'formatters'}}, $paragraph;
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
      if ($self->{'context'}->[-1] eq 'flushright') {
        push @{$self->{'count_context'}}, {'lines' => 0,
                                           'index_entry_locations' => [],
                                           'pending_text' => [['']]};
      }
    } elsif ($type eq 'preformatted'
             or $type eq 'rawpreformatted') {
      # if in a description reuse the main menu unfilled, to keep things
      # simpler and avoid having to do a separate count.
      if ($type eq 'rawpreformatted'
          or !exists($element->{'parent'}->{'type'})
          or $element->{'parent'}->{'type'} ne 'menu_entry_description') {
        $preformatted = new_formatter($self, 'unfilled');
        push @{$self->{'formatters'}}, $preformatted;
        if ($self->{'context'}->[-1] eq 'flushright') {
          push @{$self->{'count_context'}}, {'lines' => 0,
                                           'index_entry_locations' => [],
                                           'pending_text' => [['']]};
        }
      }
    } elsif ($type eq 'def_line') {
      _convert_def_line($self, $element);
      return;
    } elsif ($type eq 'menu_entry') {
      my $entry_name_seen = 0;
      my $menu_entry_node;
      foreach my $content (@{$element->{'contents'}}) {
        if ($content->{'type'} eq 'menu_entry_leading_text') {
          if (exists($content->{'text'})) {
            _stream_output_add_next($self, $content->{'text'});
          }
        } elsif ($content->{'type'} eq 'menu_entry_node') {
          # Flush output so not to include in node text.
          _stream_output_count_nl($self,
                         add_pending_word($formatter->{'container'}, 1));

          $menu_entry_node = $content;
          my ($pre_quote, $post_quote);
          $self->{'formatters'}->[-1]->{'suppress_styles'} = 1;
          $self->{'formatters'}->[-1]->{'no_added_eol'} = 1;

          push @{$self->{'count_context'}}, {'lines' => 0,
                                             'pending_text' => [['']]};
          _convert($self, Texinfo::TreeElement::new({'type' => '_code',
                                              'contents' => [$content]}));

          _stream_output_count_nl($self,
                        Texinfo::Convert::Paragraph::add_pending_word
                          ($formatter->{'container'}, 1));
          my $node_text = _stream_to_text($self);
          pop @{$self->{'count_context'}};

          delete $self->{'formatters'}->[-1]->{'suppress_styles'};
          delete $self->{'formatters'}->[-1]->{'no_added_eol'};
          $pre_quote = $post_quote = '';
          if ($entry_name_seen) {
            if ($node_text =~ /([,\t]|\.\s)/) {
              if ($self->{'info_special_chars_warning'}) {
                $self->plaintext_line_warn($self, sprintf(__(
                   "menu entry node name should not contain `%s'"), $1),
                               $element->{'source_info'});
              }
              if ($self->{'info_special_chars_quote'}) {
                $pre_quote = $post_quote = "\x{7f}";
              }
            }
          } else {
            if ($node_text =~ /:/) {
              if ($self->{'info_special_chars_warning'}) {
                $self->plaintext_line_warn($self, __(
                 "menu entry node name should not contain `:'"),
                               $element->{'source_info'});
              }
              if ($self->{'info_special_chars_quote'}) {
                $pre_quote = $post_quote = "\x{7f}";
              }
            }
          }
          _stream_output($self, $pre_quote.$node_text.$post_quote);
        } elsif ($content->{'type'} eq 'menu_entry_name') {
          # Flush output so not to include in name text
          _stream_output_count_nl($self,
                         add_pending_word($formatter->{'container'}, 1));

          my ($pre_quote, $post_quote);
          $self->{'formatters'}->[-1]->{'no_added_eol'} = 1;

          push @{$self->{'count_context'}}, {'lines' => 0,
                                             'pending_text' => [['']]};
          _convert($self, $content);
          _stream_output_count_nl($self,
                        Texinfo::Convert::Paragraph::add_pending_word
                          ($formatter->{'container'}, 1));
          my $entry_name = _stream_to_text($self);
          pop @{$self->{'count_context'}};

          delete $self->{'formatters'}->[-1]->{'no_added_eol'};
          my $formatter = $self->{'formatters'}->[-1];
          $entry_name_seen = 1;
          $pre_quote = $post_quote = '';
          if ($entry_name =~ /:/) {
            if ($self->{'info_special_chars_warning'}) {
              $self->plaintext_line_warn($self, __(
                 "menu entry name should not contain `:'"),
                               $element->{'source_info'});
            }
            if ($self->{'info_special_chars_quote'}) {
              $pre_quote = $post_quote = "\x{7f}";
            }
          }
          _stream_output($self, $pre_quote.$entry_name.$post_quote);
        # empty description
        } elsif ($content->{'type'} eq 'menu_entry_description'
                 and (not exists($content->{'contents'})
                      or (scalar(@{$content->{'contents'}}) == 1
                          # preformatted inside menu_entry_description
                          and (not exists($content->{'contents'}->[0]
                                                               ->{'contents'})
                               or (scalar(@{$content->{'contents'}->[0]
                                                         ->{'contents'}}) == 1)
                                   and exists($content->{'contents'}->[0]
                                                 ->{'contents'}->[0]->{'text'})
                                   and $content->{'contents'}->[0]
                                  ->{'contents'}->[0]->{'text'} !~ /\S/)))) {
          my $identifiers_target;
          if (exists($self->{'document'})) {
            $identifiers_target = $self->{'document'}->labels_information();
          }

          my $node_description;
          my $long_description = 0;
          if (defined($menu_entry_node) and exists($menu_entry_node->{'extra'})
              and defined($menu_entry_node->{'extra'}->{'normalized'})
              and $identifiers_target
                ->{$menu_entry_node->{'extra'}->{'normalized'}}) {
            my $node_element = $identifiers_target
                ->{$menu_entry_node->{'extra'}->{'normalized'}};
            if ($node_element->{'cmdname'} eq 'node'
                and exists($self->{'document'})) {
              my $nodes_list = $self->{'document'}->nodes_list();
              my $node_relations
                = $nodes_list->[$node_element->{'extra'}->{'node_number'} -1];
              if (exists($node_relations->{'node_description'})) {
                $node_description = $node_relations->{'node_description'};
              } elsif (exists($node_relations->{'node_long_description'})) {
                $node_description = $node_relations->{'node_long_description'};
                $long_description = 1;
              }
            }
          }

          if (defined($node_description)) {
            my $description_align_column;
            if (defined($self->get_conf('AUTO_MENU_DESCRIPTION_ALIGN_COLUMN'))) {
              $description_align_column
                 = $self->get_conf('AUTO_MENU_DESCRIPTION_ALIGN_COLUMN');
            } else {
              $description_align_column
               = int($self->{'text_element_context'}->[-1]->{'max'}
                    * $description_align_column_factor);
            }
            my $description_indent_length = $description_align_column - 1;

            if (! exists($self->{'seen_node_descriptions'}
                                            ->{$node_description})) {
              $self->{'seen_node_descriptions'}->{$node_description} = 0;
            }
            $self->{'seen_node_descriptions'}->{$node_description}++;

            # flush the current unfilled container
            _stream_output_count_nl($self,
                           add_pending_word($formatter->{'container'}, 1));
            my $formatted_elt;
            my $description_para;
            my $text_count
             = Texinfo::Convert::Paragraph::counter($formatter->{'container'});

            if ($text_count >= $description_indent_length) {
              my $inserted_space = '  ';
              _stream_output_count_nl($self,
                             add_text($formatter->{'container'},
                                      $inserted_space));
              _stream_output_count_nl($self,
                             add_pending_word($formatter->{'container'}, 1));
              $text_count += length($inserted_space);
            }

            my $text_element_context = { 'counter' => $text_count };

            if (defined($self->get_conf('AUTO_MENU_MAX_WIDTH'))) {
              $text_element_context->{'max'}
                 = $self->get_conf('AUTO_MENU_MAX_WIDTH');
            } else {
              # e.g. 72 -> 79
              $text_element_context->{'max'}
                 = int($self->{'text_element_context'}->[-1]->{'max'}
                       * 1.1);
            }

            push @{$self->{'text_element_context'}}, $text_element_context;

            # avoid messages if formatting the node description more than once
            if ($self->{'seen_node_descriptions'}->{$node_description} > 1) {
              $self->{'silent'} = 0 if (!exists($self->{'silent'}));
              $self->{'silent'}++;
            }

            if (!$long_description) {
              # push a paragraph container to format the description.
              $description_para = new_formatter($self, 'paragraph',
                  $description_indent_length);
              push @{$self->{'formatters'}}, $description_para;
              $formatted_elt = $node_description->{'contents'}->[0];
            } else {
              push @{$self->{'format_context'}},
               { 'cmdname' => $node_description->{'cmdname'},
                 'paragraph_count' => 0,
                 'context_indent_len' => $description_indent_length,
               };

              $formatted_elt = {'contents' => $node_description->{'contents'}};
            }
            _convert($self, $formatted_elt);
            if (!$long_description) {
              _stream_output_count_nl($self,
                 Texinfo::Convert::Paragraph::end($description_para->{'container'}));
              destroy_formatter(pop @{$self->{'formatters'}});
            } else {
              pop @{$self->{'format_context'}};
            }
            pop @{$self->{'text_element_context'}};
            if ($self->{'seen_node_descriptions'}->{$node_description} > 1) {
              $self->{'silent'}--;
            }
          } else {
            _convert($self, $content);
          }
        } else {
          _convert($self, $content);
        }
      }
      # If we are nested inside an @example, a 'menu_entry_description' may not
      # have been processed yet, and we need to output any pending spaces
      # before 'end_line' throws them away.  The argument to 'add_pending_word'
      # does this.
      if (exists($element->{'parent'}->{'type'})
          and $element->{'parent'}->{'type'} eq 'preformatted') {
        _stream_output_count_nl($self,
                       add_pending_word($formatter->{'container'}, 1));
      } else {
        _stream_output_count_nl($self,
                       add_pending_word($formatter->{'container'}));
        end_line($formatter->{'container'});
        _ensure_end_of_line($self);
      }

      return;
    } elsif ($type eq '_frenchspacing') {
      push @{$formatter->{'frenchspacing_stack'}}, 'on';
      set_frenchspacing($formatter->{'container'}, 1);
    } elsif ($type eq '_code') {
      _open_code($formatter);
    } elsif ($type eq '_stop_upper_case') {
      push @{$formatter->{'upper_case_stack'}}, {};
    } elsif ($type eq '_suppress_styles') {
      $self->{'formatters'}->[-1]->{'suppress_styles'} = 1;
    } elsif ($type eq 'untranslated_def_line_arg') {
      my $tree;
      if (exists($element->{'extra'})
          and exists($element->{'extra'}->{'translation_context'})) {
        $tree = $self->pcdt($element->{'extra'}->{'translation_context'},
                            $element->{'contents'}->[0]->{'text'});
      } else {
        $tree = $self->cdt($element->{'contents'}->[0]->{'text'});
      }
      _convert($self, $tree);
      return;
    }
  }

  # The processing of contents is done here.
  # $element->{'contents'} not existing may happen for some empty
  # commands/containers
  if (exists($element->{'contents'})) {
    #my $i = 0;
    foreach my $content (@{$element->{'contents'}}) {
      _convert($self, $content);

      #my $pending = $self->{'count_context'}->[-1]->{'pending_text'};
      #print STDERR "CONVERTED $i ".Texinfo::Common::debug_print_element($content, 1)
      #            ." '"._debug_print_pending($pending)."'\n";
      #$i++;
    }
  }

  # now closing. First, close types.
  if (defined($type)) {
    if ($type eq '_frenchspacing') {
      pop @{$formatter->{'frenchspacing_stack'}};
      my $frenchspacing = 0;
      $frenchspacing = 1 if ($formatter->{'frenchspacing_stack'}->[-1] eq 'on');
      set_frenchspacing($formatter->{'container'}, $frenchspacing);
    } elsif ($type eq '_code') {
      _close_code($formatter);
    } elsif ($type eq '_stop_upper_case') {
      pop @{$formatter->{'upper_case_stack'}};
    } elsif ($type eq '_suppress_styles') {
      delete $self->{'formatters'}->[-1]->{'suppress_styles'};
    } elsif ($type eq 'row') {
      # beginning of cell in character width based on column sizes given
      # in the specification of the table.
      my @cell_beginnings;
      # array of lines in each cell, already formatted using the max limit
      # on line length per column, for each cell.
      my $cell_lines = $self->{'format_context'}->[-1]->{'row_cell_lines'};
      my $cell_beginning = 0;
      my $max_cell_nr = scalar(@{$cell_lines});
      # number maximum of line for the cells in this row
      my $max_lines = 0;
      my $indent_len
        = $self->{'format_context'}->[-1]->{'context_indent_len'};
      for (my $cell_idx = 0; $cell_idx < $max_cell_nr; $cell_idx++) {
        $cell_beginnings[$cell_idx] = $cell_beginning;
        my $cell_width
           = $self->{'format_context'}->[-1]->{'columns_size'}->[$cell_idx];
        $cell_width = 2 if (!defined($cell_width));
        $cell_beginning += $cell_width +1;

        $max_lines = scalar(@{$cell_lines->[$cell_idx]})
          if (scalar(@{$cell_lines->[$cell_idx]}) > $max_lines);
      }

      # this is used to keep track of the last cell with content.
      my $result = $self->{'count_context'}->[-1]->{'pending_text'};
      for (my $line_idx = 0; $line_idx < $max_lines; $line_idx++) {
        my $line_width = $indent_len;
        # determine the last cell index in the line, to fill spaces in
        # cells preceding that cell on the line
        my $last_cell = 0;
        for (my $cell_idx = 0; $cell_idx < $max_cell_nr; $cell_idx++) {
          $last_cell = $cell_idx+1
            if (defined($cell_lines->[$cell_idx]->[$line_idx]));
        }
        my $indent_done;
        if ($indent_len <= 0) {
          $indent_done = 1;
        }

        for (my $cell_idx = 0; $cell_idx < $last_cell; $cell_idx++) {
          if (defined($cell_lines->[$cell_idx]->[$line_idx])) {
            my $cell_line = [@{$cell_lines->[$cell_idx]->[$line_idx]}];
            # remove end of line
            for (my $j = scalar(@$cell_line); $j > 0; $j--) {
              my $pending_text = $cell_line->[$j -1];
              if ($pending_text->[0] eq '') {
                next;
              }
              chomp($pending_text->[0]);
              last;
            }

            # add cell line to results while computing width
            foreach my $pending_text (@$cell_line) {
              if ($pending_text->[0] ne ''
                  or defined($pending_text->[1])) {
                if (not $indent_done) {
                  # Do not use _stream_output, as we never know if there
                  # is an anchor from the end of a cell in the previous
                  # text.
                  push @$result, [' ' x $indent_len];
                  $indent_done = 1;
                }
              }
              if (defined($pending_text->[1])
                  and $pending_text->[1]->{'conv_type'} eq 'quoted_image') {
                $line_width += $IMAGE_WIDTH;
              } else {
                $line_width
                += Texinfo::Convert::Unicode::string_width($pending_text->[0]);
              }
              push @$result, $pending_text;
            }
          }
          if ($cell_idx+1 < $last_cell) {
            if ($line_width < $indent_len + $cell_beginnings[$cell_idx+1]) {
              if (not $indent_done) {
                push @$result, [' ' x $indent_len];
                $indent_done = 1;
              }
              # add inter cell spaces
              my $spaces = ' '
                  x ($indent_len + $cell_beginnings[$cell_idx+1] - $line_width);
              $line_width += length($spaces);
              push @$result, [$spaces];
            }
          }
        }
        push @$result, ["\n"];
      }
      if ($self->{'format_context'}->[-1]->{'item_command'} eq 'headitem') {
        # at this point cell_beginning is at the beginning of
        # the cell following the end of the table -> full width
        my $line = (' ' x $indent_len) . ('-' x $cell_beginning) . "\n";
        _stream_output($self, $line);
        $max_lines++;
      }

      $self->{'count_context'}->[-1]->{'lines'} += $max_lines;
      $self->{'format_context'}->[-1]->{'row_cell_lines'} = [];
    } elsif ($type eq 'before_node_section') {
      _ensure_end_of_line($self);
      my $text = _pending_to_text($self,
                    $self->{'count_context'}->[-1]->{'pending_text'});
      $self->{'text_before_first_node'} = _encode_string($self, $text);
    }
  }
  # close paragraphs and preformatted
  if (defined($paragraph)) {
    _stream_output_count_nl($self,
               Texinfo::Convert::Paragraph::end($paragraph->{'container'}));
    if ($self->{'context'}->[-1] eq 'flushright') {
      _align_environment($self,
        $self->{'text_element_context'}->[-1]->{'max'}, 'right');
      _ensure_end_of_line($self);
    }
    destroy_formatter(pop @{$self->{'formatters'}});
    $self->{'text_element_context'}->[-1]->{'counter'} = 0;
  # may have been opened for a block commands, @menu, raw output
  # format, @verbatim..., or for (raw)preformatted type
  } elsif (defined($preformatted)) {
    _stream_output_count_nl($self,
               Texinfo::Convert::Paragraph::end($preformatted->{'container'}));
    _ensure_end_of_line($self);

    if ($self->{'context'}->[-1] eq 'flushright') {
      _align_environment($self,
                      $self->{'text_element_context'}->[-1]->{'max'}, 'right');
      _ensure_end_of_line($self);
    } elsif ($self->{'context'}->[-1] eq 'displaymath'
             and exists($self->{'elements_images'})
             and exists($self->{'elements_images'}->{$element})) {
      my ($math_text, $anchors) = _stream_to_text_anchor($self);
      pop @{$self->{'count_context'}};
      foreach my $anchor (@$anchors) {
        $self->add_target_location($anchor);
      }
      # NB we don't output the below-baseline depth for @displaymath as
      # it does not need to be aligned with surrounding text.
      my $lines_count
         = _insert_image($self,
                         $self->{'elements_images'}->{$element}->{'filename'},
                         $math_text,
                         $self->{'elements_images'}->{$element}->{'dpi'});
      _add_lines_count($self, $lines_count);
      _ensure_end_of_line($self);
    }
    destroy_formatter(pop @{$self->{'formatters'}});
    # We assume that, upon closing the preformatted we are at the
    # beginning of a line.
    $self->{'text_element_context'}->[-1]->{'counter'} = 0;
  }

  # Close commands
  if (defined($cmdname)) {
    if ($cmdname eq 'float') {
      my ($caption, $shortcaption)
        = Texinfo::Common::find_float_caption_shortcaption($element);

      if ((exists($element->{'extra'})
           and ($element->{'extra'}->{'float_type'} ne ''
                or defined($element->{'extra'}->{'float_number'})))
           or $caption or $shortcaption) {
        _add_newline_if_needed($self);
        my ($caption, $prepended)
          = Texinfo::Convert::Converter::float_name_caption($self, $element);
        if (defined($prepended)) {
          $prepended->{'type'} = '_frenchspacing';
          # there is no specific need for a line formatter, but there is
          # a need for a formatter
          my $width = $self->convert_line($prepended);
          $self->{'text_element_context'}->[-1]->{'counter'} += $width;
        }
        if (defined($caption)) {
          $self->{'format_context'}->[-1]->{'paragraph_count'} = 0;
          # no argument can only happen with bogus command without braces
          if (exists($caption->{'contents'})) {
            my $tree = $caption->{'contents'}->[0];
            _convert($self, $tree);
          }
        }
      }
    } elsif ($cmdname eq 'quotation' or $cmdname eq 'smallquotation') {
      my $authors
        = pop @{$self->{'document_context'}->[-1]->{'quotations_authors'}};
      foreach my $author (@$authors) {
        if (exists($author->{'contents'}->[0]->{'contents'})) {
          _convert($self,
            # TRANSLATORS: quotation author
            $self->cdt("\@center --- \@emph{{author}}",
               {'author' => $author->{'contents'}->[0]}));
        }
      }
    } elsif ($cmdname eq 'multitable') {
      $self->{'document_context'}->[-1]->{'in_multitable'}--;
    } elsif (exists($root_commands{$cmdname})
             and exists($sectioning_heading_commands{$cmdname})
             and $cmdname ne 'part'
             and exists($self->{'current_node'})
             and exists($self->{'document'})) {
      # add menu if missing
      my $node = $self->{'current_node'};
      my $arguments_line = $node->{'contents'}->[0];
      my $automatic_directions = (scalar(@{$arguments_line->{'contents'}}) <= 1);
      if (exists($node->{'extra'}) and $node->{'extra'}->{'node_number'}
          and $automatic_directions and !$self->{'seenmenus'}->{$node}) {
        my $identifiers_target = $self->{'document'}->labels_information();
        my $nodes_list = $self->{'document'}->nodes_list();
        my $sections_list = $self->{'document'}->sections_list();

        my $node_relations
          = $nodes_list->[$node->{'extra'}->{'node_number'} -1];

        $self->{'seenmenus'}->{$node} = 1;
        my $menu_node
         = Texinfo::Structuring::new_complete_menu_master_menu($self,
                                    $identifiers_target, $nodes_list,
                                    $node_relations);
        if ($menu_node) {
          _convert($self, $menu_node);
          _add_newline_if_needed($self);
        }
      }
    }

    # close the contexts and register the cells
    if (exists($preformatted_context_commands{$cmdname})
        or $cmdname eq 'float') {
      my $old_context = pop @{$self->{'context'}};
      die "Not a preformatted context: $old_context"
        if (!exists($preformatted_context_commands{$old_context})
            and $old_context ne 'float');
    } elsif (exists($flush_commands{$cmdname})) {
      my $old_context = pop @{$self->{'context'}};
      die if (! exists($flush_commands{$old_context}));
    }

    if (exists($format_context_commands{$cmdname})) {
      pop @{$self->{'format_context'}};
    } elsif ($cell) {
      pop @{$self->{'format_context'}};
      pop @{$self->{'text_element_context'}};
      my $cell_counts = pop @{$self->{'count_context'}};
      _update_locations_counts($self, $self->{'count_context'}->[-1],
                               $cell_counts);
      my $lines = collect_pending_texts_lines($cell_counts->{'pending_text'});
      push @{$self->{'format_context'}->[-1]->{'row_cell_lines'}},
           $lines;
    }
    if (exists $advance_paragraph_count_commands{$cmdname}) {
      $self->{'format_context'}->[-1]->{'paragraph_count'}++;
    }
  }

  return;
}

# Never called
sub convert_tree($$) {
  my ($self, $root) = @_;

  my $old_context = $self->{'count_context'}->[-1];

  my $new_context = {'lines' => 0,
                    'index_entry_locations' => [],
                    'pending_text' => [['']]};
  push @{$self->{'count_context'}}, $new_context;

  _convert($self, $root);
  my $pending_texts = $self->{'count_context'}->[-1]->{'pending_text'};

  pop @{$self->{'count_context'}};

  push @{$self->{'count_context'}->[-1]->{'pending_text'}},
           @$pending_texts;

  my $result = _stream_final_result($self);

  if (defined($old_context)) {
    _update_locations_counts($self, $old_context, $new_context);

    $old_context->{'lines'} += $new_context->{'lines'};
  }

  return $result;
}

1;
