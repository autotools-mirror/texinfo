#! /usr/bin/env perl
# t/* test support for the Perl modules.
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

use strict;

#no autovivification qw(fetch delete exists store strict);

use 5.006;

BEGIN {

require Texinfo::ModulePath;
Texinfo::ModulePath::init(undef, undef, undef, 'updirs' => 2);

# NOTE in general file names and directory names are not encoded,
# there will be problems if there are non ascii characters in those
# strings.
# For consistent test results, use the C locale.
# Note that this could prevent displaying non ascii characters
# in error messages.
$ENV{LC_ALL} = 'C';
$ENV{LANGUAGE} = 'en';

} # end BEGIN

use Test::More;

#use Carp q(cluck);
# to determine the locale encoding to output the Texinfo to Texinfo
# result when regenerating
use I18N::Langinfo qw(langinfo CODESET);
use Encode ();
#use Data::Dumper ();
use Storable qw(dclone); # standard in 5.007003
use Getopt::Long qw(GetOptions);
use Locale::Messages ();
#use Test::Differences;
#unified_diff;

#eval {
# require Test::Differences; Test::Differences->import(('eq_or_diff_text', 'unified_diff')); unified_diff();
#};

#my $test_differences_loading_error = $@;

use Texinfo::Configure;

use Texinfo::XSLoader;

use Texinfo::Tests qw(compare_dirs_files is_diff unlink_dir_files);

use Texinfo::Commands;
use Texinfo::Options;
use Texinfo::Common;
use Texinfo::Convert::Texinfo;
use Texinfo::Config;
use Texinfo::Parser;
use Texinfo::Convert::Text;
use Texinfo::Document;
use Texinfo::Convert::PlainTexinfo;
use Texinfo::ManipulateTree;
use Texinfo::Structuring;
use Texinfo::OutputUnits;
use Texinfo::Indices;
use Texinfo::Translations;
use Texinfo::Convert::Plaintext;
use Texinfo::Convert::Info;
use Texinfo::Convert::LaTeX;
use Texinfo::Convert::HTML;
use Texinfo::Example::TexinfoXML;
use Texinfo::Convert::DocBook;
#use Texinfo::Example::ReadDocBook;

# the tests reference perl results file is loaded through a require
# of a file containing code setting those variables.
use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

Locale::Messages->select_package('gettext_pp');

# Force Perl STDERR to be in UTF-8, to have the same encoding as C
# direct output on stderr.
binmode(STDERR, ":encoding(UTF-8)");

use File::Spec;
my $updir = File::Spec->updir();

# Find input files in srcdir
my $t2a_srcdir = $Texinfo::ModulePath::t2a_srcdir;
my $srcdir = $ENV{'srcdir'};

if (!defined($srcdir) and defined($t2a_srcdir)) {
  $srcdir = join('/', ($t2a_srcdir, 'perl'));
}
$srcdir = '.' if (!defined($srcdir) or $srcdir eq '');

# Find locales in builddir
my $t2a_builddir = $Texinfo::ModulePath::t2a_builddir;

if (!defined($t2a_builddir)) {
  $t2a_builddir = $updir;
}

# NOTE if the LocaleData directory is not found, the test could still succeed
# if the translations for the strings textdomain are found elsewhere in the
# system.  If the translations found elsewhere are too old, some tests could
# still fail.
my $locales_dir;
foreach my $dir ("LocaleData", join('/', ($t2a_builddir, 'LocaleData'))) {
  if (-d $dir) {
    $locales_dir = $dir;
  }
}

if (! defined($locales_dir)) {
  warn "No locales directory found, some tests could fail\n";
}

Texinfo::Translations::setup_output_strings($locales_dir);

Locale::Messages::bindtextdomain('texinfo', $locales_dir);

my $default_test_level = 1;
if (defined($Texinfo::Configure::default_test_level)
    and ($Texinfo::Configure::default_test_level == 1
         or $Texinfo::Configure::default_test_level == 2)) {
  $default_test_level = $Texinfo::Configure::default_test_level;
}

my $generated_texis_dir = 't_texis';

my $input_files_dir = $srcdir."/t/input_files/";

my $output_files_dir = 't/output_files/';
foreach my $dir ('t', 't/results', $output_files_dir) {
  my $error;
  # to avoid a race conditon, first create the dir then test that it
  # exists
  mkdir $dir or $error = $!;
  if (! -d $dir) {
    die "mkdir $dir: $error\n";
  }
}

# NOTE the texi2any corresponding code is more elaborate for Windows
# and may determine a console encoding for messages distinct from the
# file output encoding.
# According to the https://perldoc.perl.org/I18N::Langinfo documentation,
# starting with Perl 5.28 released in 2018, the module works on all
# platforms, therefore the specific code would only be needed for older Perl.
# Unless there are reports, leave it as is.
#
# There has been no reports by testers so far, although some probably
# tested with older Perl years ago, probably because the locale encoding
# is not so useful, only for diagnostic messages with non-ASCII characters
# and with $arg_output set for errors only.
my $locale_encoding = langinfo(CODESET);
$locale_encoding = undef if ($locale_encoding eq '');

# to encode is() diagnostic messages.  From Test::More documentation
if (defined($locale_encoding)) {
  my $builder = Test::More->builder;
  binmode $builder->output,         ":encoding($locale_encoding)";
  binmode $builder->failure_output, ":encoding($locale_encoding)";
  binmode $builder->todo_output,    ":encoding($locale_encoding)";
}

ok(1);

my %formats = (
  'plaintext' => \&convert_to_plaintext,
  'file_plaintext' => \&convert_to_plaintext,
  'info' => \&convert_to_info,
  'file_info' => \&convert_to_info,
  'html' => \&convert_to_html,
  # Can also be used for epub, the only difference is the name of the
  # output directory.
  'file_html' => \&convert_to_html,
  'html_text' => \&convert_to_html,
  # NOTE setting file_epub format does not automatically loads epub3.pm,
  # since init files are handled before parsing.  The init file should
  # also be added to init_files.
  'file_epub' => \&convert_to_html,
  'xml' => \&convert_to_xml,
  'file_xml' => \&convert_to_xml,
  'docbook' => \&convert_to_docbook,
  'file_docbook' => \&convert_to_docbook,
  # call output, not convert
  'docbook_doc' => \&convert_to_docbook,
  'latex' => \&convert_to_latex,
  'latex_text' => \&convert_to_latex,
  'file_latex' => \&convert_to_latex,
);

my %extensions = (
  'plaintext' => 'txt',
  'html_text' => 'html',
  'xml' => 'xml',
  'docbook' => 'dbk',
  'docbook_doc' => 'dbk',
  'latex' => 'tex',
  'latex_text' => 'tex',
);

my %outfile_preamble = (
  'docbook' => ['<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
'. "<book>\n", "</book>\n"],
  'xml' => ['<?xml version="1.0"?>
'."<!DOCTYPE texinfo PUBLIC \"-//GNU//DTD TexinfoML V7.3//EN\" \"http://www.gnu.org/software/texinfo/dtd/7.3/texinfo.dtd\">
".'<texinfo>
', "</texinfo>\n"],
 # done dynamically for CSS
 'html_text' => \&output_preamble_postamble_html,
 'latex_text' => \&output_preamble_postamble_latex,
);

my $arg_generate;
my $arg_debug;
my $arg_complete;
my $arg_output;
my $nr_comparisons;
$nr_comparisons = 11;

Getopt::Long::Configure("gnu_getopt");
# complete: output a complete texinfo file based on the test.  Does not
#           run the tests at all.
# generate: run the tests and reset reference results instead of comparing
#           with reference results.
# output: run the test, compare with references, and output the test results
#         (even if not the same as references) in output files per output
#         format.
GetOptions('g|generate' => \$arg_generate, 'd|debug=i' => \$arg_debug,
           'c|complete' => \$arg_complete, 'o|output' => \$arg_output);

sub protect_perl_string($) {
  my $string = shift;

  #if (!defined($string)) {
  #  cluck();
  #}
  $string =~ s/\\/\\\\/g;
  $string =~ s/'/\\'/g;
  # \r can be mangled upon reading if at end of line
  $string =~ s/\r/'."\\r".'/g;
  return $string;
}

sub protect_encode_string($) {
  my $string = shift;

  my $protected = protect_perl_string($string);
  return Encode::encode('utf-8', $protected);
}

# protect non ascii characters and special Perl characters in double quotes,
# such that the resulting string is ASCII but contains the same encoded
# information.
# FIXME Unused.  Remove when it is clear that there is no issue with the
# current way to deal with Info strings.
sub protect_non_ascii($) {
  my $text = shift;

  my $result = '';
  while ($text ne '') {
    # the character put in that regex are for efficiency (assuming that one
    # regex that catch more is more efficient than going through each
    # character) as they are caught below as ASCII characters
    if ($text =~ s/^([A-Za-z0-9 ,.:*_;?!\/(){}|=+&%<>`]+)//) {
      $result .= $1;
    } elsif ($text =~ s/^(.)//s) {
      # protecting ' is probably unneeded
      if ($1 eq '\\' or $1 eq "'" or $1 eq '"' or $1 eq '@' or $1 eq '$') {
        $result .= '\\' .$1;
      } elsif ($1 eq "\r") {
        # probably not strictly needed, but possibly safer, and more readable
        $result .= "\\r";
      } elsif (ord($1) <= 127) {
        # other ASCII characters
        $result .= $1;
      } else {
        $result .= '\\x' . lc(sprintf("%02x",ord($1)));
      }
    }
  }
  return $result;
}

sub new_test($;$$$) {
  my ($name, $generate, $debug, $test_formats) = @_;

  my $test = {'name' => $name, 'generate' => $generate,
              'DEBUG' => $debug, 'test_formats' => $test_formats};

  if ($generate) {
    mkdir $srcdir."/t/results/$name"
       if (! -d $srcdir."/t/results/$name");
  }
  bless $test;
  return $test;
}

sub set_converter_option_defaults($$;$) {
  my ($converter_options, $format, $debug) = @_;

  $converter_options = {} if (!defined($converter_options));

  if (!defined($converter_options->{'EXPANDED_FORMATS'})) {
    $converter_options->{'EXPANDED_FORMATS'} = [$format];
  }

  # NOTE not the same as in texi2any if the format and the output
  # format name do not match, the case of xml, which output format
  # name is texinfoxml.  No consequence as it is only used for output
  # directory name, which is overriden in tests anyway.
  $converter_options->{'TEXINFO_OUTPUT_FORMAT'} = $format;

  if (!defined($converter_options->{'DEBUG'})) {
    $converter_options->{'DEBUG'} = $debug;
  }
  if (!defined($converter_options->{'CHECK_HTMLXREF'})) {
    # avoid bloating test results with warnings
    $converter_options->{'CHECK_HTMLXREF'} = 0;
  }

  return $converter_options;
}

# NOTE this function is unlikely to be called, as files are closed in
# converters except for STDOUT, but in the tests the output is not to STDOUT.
sub close_files($) {
  my $converter = shift;

  my $converter_unclosed_files
       = Texinfo::Convert::Utils::output_files_unclosed_files(
                               $converter->output_files_information());
  if ($converter_unclosed_files) {
    my $close_error_nr = 0;
    foreach my $unclosed_file (keys(%$converter_unclosed_files)) {
      my $fh = $converter_unclosed_files->{$unclosed_file};
      # undefined file handle means that the path comes from XS (normally
      # through build_output_files_unclosed_files) but is not associated
      # with a file handle yet, as a file handle can't be directly associated
      # with a stream in C code, but the stream can be returned through
      # an XS interface, here
      # Texinfo::Convert::ConvertConverterXS::get_unclosed_stream.
      if (!defined($fh)) {
        $fh = $converter->XS_get_unclosed_stream($unclosed_file);
        if (!defined($fh)) {
          next;
        }
      }
      if (!close($fh)) {
        warn(sprintf("test_utils.pl: error on closing %s: %s\n",
                     $unclosed_file, $!));
        $close_error_nr++;
      }
    }
    die if ($close_error_nr > 0);
  }

  Texinfo::Convert::Utils::output_files_reset(
                        $converter->output_files_information());
}

sub _convert($$$) {
  my ($converter, $document, $do_convert) = @_;

  my $result;

  # Get the errors in converter before doing any conversion
  my $converter_init_errors = $converter->get_converter_errors();

  if ($do_convert) {
    $result = $converter->convert($document);
    $converter->converter_remove_output_units();
  } else {
    $result = $converter->output($document);
    close_files($converter);
    $converter->converter_remove_output_units();
    $result = undef if (defined($result) and ($result eq ''));
  }

  return $result, $converter_init_errors;
}

sub convert_to_plaintext($$$$$) {
  my ($self, $test_name, $format, $document, $converter_options) = @_;

  $converter_options
    = set_converter_option_defaults($converter_options, 'plaintext',
                                    $self->{'DEBUG'});

  if (!defined($converter_options->{'OUTFILE'})
      and defined($converter_options->{'SUBDIR'})) {
    # need to set OUTFILE in any case otherwise the default of -
    # will be used
    if ($converter_options->{'SPLIT'}) {
      $converter_options->{'OUTFILE'} = undef;
    } else {
      $converter_options->{'OUTFILE'}
        = $converter_options->{'SUBDIR'}.$test_name.".txt";
    }
  }

  my $converter = Texinfo::Convert::Plaintext->converter($converter_options);

  my ($result, $converter_init_errors) = _convert($converter, $document,
                                   (defined($converter_options->{'OUTFILE'})
                                    and $converter_options->{'OUTFILE'} eq ''));
  return ($result, $converter, $converter_init_errors);
}

sub convert_to_info($$$$$) {
  my ($self, $test_name, $format, $document, $converter_options) = @_;

  $converter_options
    = set_converter_option_defaults($converter_options, 'info',
                                    $self->{'DEBUG'});

  my $converter = Texinfo::Convert::Info->converter($converter_options);

  my ($result, $converter_init_errors) = _convert($converter, $document, 0);

  die if (!defined($converter_options->{'SUBDIR'}) and !defined($result));

  return ($result, $converter, $converter_init_errors);
}

sub convert_to_html($$$$$) {
  my ($self, $test_name, $format, $document, $converter_options) = @_;

  my $add_epub_expanded_format;
  if ($format eq 'epub'
      and (!defined($converter_options)
           or !exists($converter_options->{'EXPANDED_FORMATS'}))) {
    $add_epub_expanded_format = 1;
  }

  $converter_options
    = set_converter_option_defaults($converter_options, 'html',
                                    $self->{'DEBUG'});

  push @{$converter_options->{'EXPANDED_FORMATS'}}, 'epub'
    if ($add_epub_expanded_format);

  $converter_options->{'SPLIT'} = ''
    if ($format eq 'html_text'
        and !defined($converter_options->{'SPLIT'}));

  my $converter = Texinfo::Convert::HTML->converter($converter_options);

  my ($result, $converter_init_errors)
     = _convert($converter, $document, $format eq 'html_text');

  die if (!defined($converter_options->{'SUBDIR'}) and !defined($result));

  return ($result, $converter, $converter_init_errors);
}

sub convert_to_xml($$$$$) {
  my ($self, $test_name, $format, $document, $converter_options) = @_;

  $converter_options
    = set_converter_option_defaults($converter_options, 'xml',
                                    $self->{'DEBUG'});

  my $converter = Texinfo::Example::TexinfoXML->converter($converter_options);

  my ($result, $converter_init_errors) = _convert($converter, $document,
                                   (defined($converter_options->{'OUTFILE'})
                                    and $converter_options->{'OUTFILE'} eq ''));
  return ($result, $converter, $converter_init_errors);
}

sub convert_to_docbook($$$$$) {
  my ($self, $test_name, $format, $document, $converter_options) = @_;

  $converter_options
    = set_converter_option_defaults($converter_options, 'docbook',
                                    $self->{'DEBUG'});

  my $tree = $document->tree();

  # 'before_node_section' is normally ignored in conversion to DocBook and
  # it is the type, in 'document_root' that holds content that appear before
  # @node and sectioning command.  To be able to have tests of simple
  # Texinfo code without sectioning or @node command with DocBook,
  # set the customization variable that mean that the document is not a
  # full book.
  if ($tree->{'contents'} and scalar(@{$tree->{'contents'}}) == 1) {
    $converter_options->{'_DOCBOOK_PIECE'} = 1;
  }

  #my $converter = Texinfo::Example::ReadDocBook->converter($converter_options);
  my $converter = Texinfo::Convert::DocBook->converter($converter_options);

  my ($result, $converter_init_errors) = _convert($converter, $document,
                                    (defined($converter_options->{'OUTFILE'})
                                     and $converter_options->{'OUTFILE'} eq ''
                                     and $format ne 'docbook_doc'));
  return ($result, $converter, $converter_init_errors);
}

sub convert_to_latex($$$$$) {
  my ($self, $test_name, $format, $document, $converter_options) = @_;

  $converter_options
    = set_converter_option_defaults($converter_options, 'latex',
                                    $self->{'DEBUG'});

  my $converter = Texinfo::Convert::LaTeX->converter($converter_options);

  my ($result, $converter_init_errors)
     = _convert($converter, $document, $format eq 'latex_text');

  return ($result, $converter, $converter_init_errors);
}

sub output_preamble_postamble_html($$$) {
  my ($converter, $postamble, $parser_options) = @_;

  if ($postamble) {
    return '</body>
</html>
'
  } else {
    my $encoding = '';
    $encoding = "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=".
            $converter->get_conf('OUTPUT_ENCODING_NAME')."\">\n"
       if (defined($converter->get_conf('OUTPUT_ENCODING_NAME'))
          and ($converter->get_conf('OUTPUT_ENCODING_NAME') ne ''));

    return '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="Generator" content="tta">
'.$encoding
.&{$converter->formatting_function('format_css_lines')}($converter,
                    $converter->{'current_filename'})
.'</head>
<body>
';
  }
}

sub output_preamble_postamble_latex($$$) {
  my ($converter, $postamble, $parser_options) = @_;

  if ($postamble) {
    return '\end{document}
';
  } else {
    return $converter->_latex_header();
  }
}

# used to check that there are no file overwritten with -o
my %output_files;

sub _set_outfile_name($$$$) {
  my ($test_file_name, $test_name, $extension, $format) = @_;

  my $original_test_outfile = "$test_file_name/$test_name.$extension";
  my $test_outfile = $original_test_outfile;
  if ($output_files{$original_test_outfile}) {
    # check that the file output (as reference) has not already been output
    # and is overwritten.
    warn "WARNING: $test_file_name: $test_name: $format: same name: $original_test_outfile "
             ."(".join("|", @{$output_files{$original_test_outfile}}).")\n";
    push @{$output_files{$original_test_outfile}}, $format;
    $test_outfile = "$test_file_name/${test_name}_${format}.$extension";
    # we also check that the file name with the format in name
    # has not already been output
    if ($output_files{$test_outfile}) {
      warn "ERROR: $test_file_name: $test_name: $format: same name with format: $test_outfile\n";
    } else {
      $output_files{$test_outfile} = [$format];
    }
  } else {
    $output_files{$original_test_outfile} = [$format];
  }

  return $test_outfile;
}

my %tested_transformations;

# Run a single test case.  Each test case is an array
# [TEST_NAME, TEST_TEXT, PARSER_OPTIONS, CONVERTER_OPTIONS]
sub test($$) {
  my ($self, $test_case) = @_;

  my $parser_options = {};
  my ($test_name, $test_text);

  my $tests_count = 0;

  $test_name = shift @$test_case;
  die if (!defined($test_name));
  $test_text = shift @$test_case;
  $parser_options = shift @$test_case if (scalar(@$test_case));
  my $converter_options;
  if (scalar(@$test_case)) {
    $converter_options = shift @$test_case;
  } else {
    $converter_options = {};
  }

  my $debug = $self->{'DEBUG'};

  if (!defined($converter_options->{'XS_EXTERNAL_CONVERSION'})
      and defined($ENV{TEXINFO_XS_EXTERNAL_CONVERSION})
      and $ENV{TEXINFO_XS_EXTERNAL_CONVERSION}) {
    $converter_options->{'XS_EXTERNAL_CONVERSION'} = 1;
  }
  if (!defined($converter_options->{'XS_EXTERNAL_FORMATTING'})
      and defined($ENV{TEXINFO_XS_EXTERNAL_FORMATTING})
      and $ENV{TEXINFO_XS_EXTERNAL_FORMATTING}) {
    $converter_options->{'XS_EXTERNAL_FORMATTING'} = 1;
  }

  if (!$self->{'generate'}) {
    mkdir "t/results/$self->{'name'}" if (! -d "t/results/$self->{'name'}");
  } else {
    mkdir $srcdir."/t/results/$self->{'name'}"
      if (! -d $srcdir."/t/results/$self->{'name'}");
  }

  # keep track of expanded formats not being set to add epub only if
  # loading the epub init file
  my $default_expanded_formats;
  if (!defined $parser_options->{'EXPANDED_FORMATS'}) {
    $default_expanded_formats = 1;
    $parser_options->{'EXPANDED_FORMATS'} = [
      'docbook', 'html', 'info', 'plaintext', 'latex'];
    #  'tex' is missed out here so that @ifnottex is expanded
    # in the tests.  Put
    #   {'EXPANDED_FORMATS' => ['tex']}
    # where you need @tex expanded in the t/*.t files.
    #  'xml', being deprecated, is not expanded in the default case either
  }
  my $initial_parser_options;
  # keep initial parser options to be able to pass to preamble formatting
  if ($arg_output) {
    $initial_parser_options = dclone($parser_options);
  }

  # get all the infos put in parser_options that are not actual
  # parser options but specifications for the test.
  my $test_file;
  if ($parser_options->{'test_file'}) {
    $test_file = $input_files_dir . $parser_options->{'test_file'};
    delete $parser_options->{'test_file'};
  }
  my $test_input_file_name;
  if ($parser_options->{'test_input_file_name'}) {
    $test_input_file_name = $parser_options->{'test_input_file_name'};
    delete $parser_options->{'test_input_file_name'};
  }
  # test_split_by_node should not interfere with output formats conversion
  # as it is applied after the output formats.  Splitting should not interfere
  # with conversion anyway.  Output formats using information added by
  # splitting split themselves and reassociate all the root commands.
  # Splitting means setting up output units and associating every root
  # command to an output unit through 'associated_unit'.  Converters that
  # do not split ignore output units and the association of root commands
  # with output units and therefore should not be affected either.
  # Also the output units may be released when releasing conversion data.

  my $test_split_by_node = undef;
  if ($parser_options->{'test_split'}) {
    my $test_split = $parser_options->{'test_split'};
    if ($test_split eq 'node') {
      $test_split_by_node = 1;
    } elsif ($test_split eq 'section') {
      $test_split_by_node = 0;
    } else {
      warn "test_utils.pl: test_split should be node or section: $test_split\n";
    }
    delete $parser_options->{'test_split'};
  }

  my $additional_tree_transformations;
  my %tree_transformations;
  if ($parser_options->{'TREE_TRANSFORMATIONS'}) {
    require Texinfo::Transformations;
    Texinfo::Transformations->import();
    # Not valid tree transformation, but we want to test them anyway.
    # There are other specific tests for comparison to texinfo, but here
    # we also get the tree.
    %tested_transformations = (
     'protect_comma' => \&Texinfo::ManipulateTree::protect_comma_in_document,
     'protect_colon' => \&Texinfo::ManipulateTree::protect_colon_in_document,
     'protect_node_after_label'
        => \&Texinfo::ManipulateTree::protect_node_after_label_in_document,
     'protect_first_parenthesis'
  => \&Texinfo::Transformations::protect_first_parenthesis_in_targets_in_document,
     'protect_hashchar_at_line_beginning'
  => \&Texinfo::Transformations::protect_hashchar_at_line_beginning_in_document,
    );

    my @option_transformations
        = split /,/, $parser_options->{'TREE_TRANSFORMATIONS'};
    foreach my $transformation (@option_transformations) {
      if (Texinfo::Common::valid_tree_transformation($transformation)) {
        $tree_transformations{$transformation} = 1;
      } elsif ($tested_transformations{$transformation}) {
        $additional_tree_transformations = []
          if (!defined($additional_tree_transformations));
        push @$additional_tree_transformations, $transformation;
      } else {
        warn "$test_name: unknown tree transformation $transformation\n";
      }
    }
    delete $parser_options->{'TREE_TRANSFORMATIONS'};
  }

  if ($parser_options->{'skip'}) {
    if (!$self->{'generate'}) {
      SKIP: {
        skip "$test_name: $parser_options->{'skip'}", 1;
        ok(1, $test_name);
      }
    }
    return 1;
  } elsif (exists($parser_options->{'skip'})) {
    delete $parser_options->{'skip'};
  }

  my %todos;
  if ($parser_options->{'todo'}) {
    %todos = %{$parser_options->{'todo'}};
    delete $parser_options->{'todo'};
  }
  my $split_pages;
  if ($parser_options->{'test_split_pages'}) {
    $split_pages = $parser_options->{'test_split_pages'};
    delete $parser_options->{'test_split_pages'};
  }

  my @tested_formats;
  if ($parser_options and $parser_options->{'test_formats'}) {
    push @tested_formats, @{$parser_options->{'test_formats'}};
    delete $parser_options->{'test_formats'};
  }

  my $test_base_dir = "t/results/$self->{'name'}/$test_name/";

  # set/reset converted formats output directories
  foreach my $format (@tested_formats) {
    if (exists($formats{$format})) {
      my $format_type = $format;
      if ($format_type =~ s/^file_//) {
        my $base = $test_base_dir;
        my $test_out_dir;
        if ($self->{'generate'}) {
          $base = $srcdir.'/'.$base;
          $test_out_dir = $base.'res_'.$format_type;
          if (-d $test_out_dir) {
            unlink_dir_files($test_out_dir);
          }
        } else {
          $test_out_dir = $base.'out_'.$format_type;
        }
        mkdir ($base)
          if (! -d $base);
        if (! -d $test_out_dir) {
          mkdir ($test_out_dir);
        } else {
          # remove any files from previous runs
          unlink glob ("$test_out_dir/*");
        }
      }
    }
  }

  # Setup default customization options to be ready for init files options
  # setting.

  my $test_customization_defaults = {
     %Texinfo::Common::default_main_program_customization_options
    };

  my $doing_epub = 0;
  my $loaded_init_files = 0;

  # get symbols in Texinfo::Config namespace before calling the init files
  # such that the added symbols can be removed after running the tests to have
  # isolated tests and be able to load the same init file multiple times.
  my $symbols_before_init_file;
  # reset Texinfo::Config informations to have isolated tests
  Texinfo::Config::GNUT_reinitialize_init_files();
  my $init_files_options
      = Texinfo::Config::GNUT_initialize_customization('',
                                   $test_customization_defaults, {});
  my $init_file_directories = [$srcdir.'/init/',
                               $srcdir.'/t/init/',
                               $srcdir.'/ext/'];
  # the init file names should be binary strings.  Since they
  # are not encoded here, ascii file names should be used or they
  # should be encoded in test specification files.
  if ($parser_options and $parser_options->{'init_files'}) {
    $symbols_before_init_file = {};
    foreach my $symbol (keys(%Texinfo::Config::)) {
      $symbols_before_init_file->{$symbol} = 1;
    }
    foreach my $filename (@{$parser_options->{'init_files'}}) {
      my ($files, $deprecated_dirs_used)
          = Texinfo::Common::locate_file_in_dirs($filename,
                                                 $init_file_directories, 0);
      if (defined($files)) {
        my $file = $files->[0];
        Texinfo::Config::GNUT_load_init_file($file);
        if ($filename eq 'epub3.pm') {
          $doing_epub = 1;
          if ($default_expanded_formats) {
            push @{$parser_options->{'EXPANDED_FORMATS'}}, 'epub';
          }
          my $create_epub_file = $arg_output;
          if ($arg_output) {
            eval { require Archive::Zip; };
            my $archive_zip_loading_error = $@;

            $create_epub_file = 0 if ($archive_zip_loading_error);
          }
          if ($create_epub_file) {
            # output EPUB as an epub publication file by setting OUTFILE.
            # EPUB_CREATE_CONTAINER_FILE should be set in the default case.
            my $extension = 'epub';
            mkdir ("$output_files_dir/$self->{'name'}")
              if (! -d "$output_files_dir/$self->{'name'}");
            my $test_outfile = _set_outfile_name($self->{'name'}, $test_name,
                                                  $extension, 'epub');
            my $outfile = "$output_files_dir/$test_outfile";
            $converter_options->{'OUTFILE'} = $outfile;
          } elsif (!defined($converter_options->{'EPUB_CREATE_CONTAINER_FILE'})) {
          # we override init_files_options, as the priority between
          # converter_options and init_files_options is not well defined.
            $init_files_options->{'EPUB_CREATE_CONTAINER_FILE'} = 0;
          }
        } else {
          $loaded_init_files++;
        }
      } else {
        warn (sprintf("could not read init file %s", $filename));
      }
    }
    delete $parser_options->{'init_files'};
  }

  # Setup test configuration options at this point to remove
  # structuring options from parser options.
  my $test_customization_options = {};
  # gather options for structuring.
  foreach my $structuring_option ('CHECK_NORMAL_MENU_STRUCTURE',
                                  'CHECK_MISSING_MENU_ENTRY',
       # Not structuring options, but used for index sorting strings tests
                                  'USE_UNICODE_COLLATION',
                                  'COLLATION_LANGUAGE') {
    if (defined($parser_options->{$structuring_option})) {
      $test_customization_options->{$structuring_option}
        = $parser_options->{$structuring_option};
      delete $parser_options->{$structuring_option};
    }
  }

  my $completed_parser_options =
          {'INCLUDE_DIRECTORIES' => [$srcdir.'/t/include/'],
           'DEBUG' => $debug,
            %$parser_options};

  my $parser = Texinfo::Parser::parser($completed_parser_options);

  # take the initial values to record only if there is something new
  my $initial_index_names
    = Texinfo::Indices::print_indices_information(
                              \%Texinfo::Commands::index_names);
  my $document;
  if (!$test_file) {
    print STDERR "  TEST $test_name\n" if ($debug);
    $document = $parser->parse_text($test_text);

    if (defined($test_input_file_name)) {
      # argument should be byte strings.  In most if not all cases,
      # 'test_input_file_name' is based on $test_name.  $test_name should
      # only consist of ascii characters as it is used both as a
      # character string and a byte string (see the comment below on that),
      # so we do not encode, but we could if needed.  If we encode, an
      # output encoding should be determined.
      $document->set_document_global_info('input_file_name',
                                          $test_input_file_name);
    }
  } else {
    print STDERR "  TEST $test_name ($test_file)\n" if ($debug);
    $document = $parser->parse_file($test_file);
  }

  # Get the tree object.  Note that if XS is used, the argument
  # prevents the tree being built as a Perl structure at this stage; only
  # a "handle" is returned.
  my $tree = $document->tree(1);

  my $errors = $document->parser_errors();

  my $indices;

  my $successful_parsing = 1;

  if (not defined($tree)) {
    warn "ERROR: $test_name: parsing result undef\n";
    foreach my $error_message (@$errors) {
      warn $error_message->{'error_line'}
        if ($error_message->{'type'} eq 'error');
    }
    $successful_parsing = 0;
    goto COMPARE;
  }

  # Setup main configuration options, used for structuring.
  my $document_information = $document->global_information();

  # setup a configuration Perl object which defines get_conf and set_conf,
  # use the test customization information with per-document
  # customization.  This allows to use functions calling get_conf and
  # set_conf to manipulate customization information.
  # After this is done, the customization information should not
  # change anymore, and it is registered in the document and used by
  # Structuring/Transformations methods needing access to configuration
  # information.
  foreach my $parser_and_structuring_option ('FORMAT_MENU', 'DEBUG',
                                             'documentlanguage',
                                             'documentscript') {
    if (exists($completed_parser_options->{$parser_and_structuring_option})) {
      $test_customization_options->{$parser_and_structuring_option}
        = $completed_parser_options->{$parser_and_structuring_option};
    }
  }
  if (!exists($completed_parser_options->{'TEST'})) {
    $test_customization_options->{'TEST'} = $default_test_level;
  } else {
    $test_customization_options->{'TEST'} = $completed_parser_options->{'TEST'};
  }

  my $remove_references = 0;
  my $test_level = $test_customization_options->{'TEST'};
  # used both for output units and tree elements
  $remove_references = 1 if (defined($test_level) and $test_level > 1);

  # setup options from test specification (+DEBUG) as if they were
  # command-line options, with high precedence.
  foreach my $option (keys(%$test_customization_options)) {
    Texinfo::Config::GNUT_set_from_cmdline($option,
                                 $test_customization_options->{$option});
  }

  my $test_customization = Texinfo::MainConfig::new();

  Texinfo::Common::set_output_encoding($test_customization,
                                       $document);

  if ($document_information->{'novalidate'}) {
    $test_customization->set_conf('novalidate', 1);
  }

  $parser->release();
  $parser = undef;

  # Now that all the configuration has been set, register with the
  # document
  my $document_options = $test_customization->get_customization_options_hash();
  $document->register_document_options($document_options);

  print STDERR "DOING structuring and indices sorting\n" if ($debug);

  if ($tree_transformations{'fill_gaps_in_sectioning'}) {
    Texinfo::Transformations::fill_gaps_in_sectioning_in_document($document);
  }

  if ($tree_transformations{'relate_index_entries_to_table_items'}) {
    Texinfo::ManipulateTree::relate_index_entries_to_table_items_in_document(
                                                                   $document);
  }

  if ($tree_transformations{'move_index_entries_after_items'}) {
    Texinfo::ManipulateTree::move_index_entries_after_items_in_document(
                                                                   $document);
  }

  if ($tree_transformations{'insert_nodes_for_sectioning_commands'}) {
    Texinfo::Transformations::insert_nodes_for_sectioning_commands(
                                                             $document);
  }

  Texinfo::Structuring::sectioning_structure($document);
  Texinfo::Structuring::sectioning_targets($document);

  Texinfo::Structuring::associate_internal_references($document);

  Texinfo::Structuring::warn_non_empty_parts($document);

  if ($tree_transformations{'complete_tree_nodes_menus'}) {
    Texinfo::Transformations::complete_tree_nodes_menus_in_document($document);
  } elsif ($tree_transformations{'complete_tree_nodes_missing_menu'}) {
    Texinfo::Transformations::complete_tree_nodes_missing_menu($document);
  }

  if ($tree_transformations{'regenerate_master_menu'}) {
    Texinfo::Transformations::regenerate_master_menu($document);
  }

  Texinfo::Structuring::construct_nodes_tree($document);

  if (not defined($document->get_conf('FORMAT_MENU'))
      or $document->get_conf('FORMAT_MENU') eq 'menu') {
    Texinfo::Structuring::check_node_tree_menu_structure($document);
    Texinfo::Structuring::complete_node_tree_with_menus($document);

    Texinfo::Structuring::check_nodes_are_referenced($document);
  }

  Texinfo::Structuring::number_floats($document);

  if ($additional_tree_transformations) {
    foreach my $transformation (@$additional_tree_transformations) {
      my $tree_transformation_sub = $tested_transformations{$transformation};
      &$tree_transformation_sub($document);
    }
  }

  my $indices_info_text
    = Texinfo::Document::Indices::print_document_indices_information($document);
  # only print indices information if it differs from the default
  # indices.  Indices information is not about the entries.
  $indices = $indices_info_text
    unless($indices_info_text eq $initial_index_names);

  my $indices_sorted_sort_strings
   = Texinfo::Document::Indices::print_document_indices_sort_strings($document);

  my $input_file_names_encoding
      = Texinfo::Common::input_file_name_encoding(
                 $document->get_conf('INPUT_FILE_NAME_ENCODING'),
                 $document->get_conf('DOC_ENCODING_FOR_INPUT_FILE_NAME'),
                 $document->get_conf('LOCALE_ENCODING'), $document);

  # use the parser expanded formats to be similar to the main program,
  # and also to avoid having @inline* and raw output format @-commands
  # with elided contents particular output because they are ignored
  # and appear as raw content in the tree in the output and it is not
  # expected in converters.
  my %expanded_formats;
  if ($parser_options->{'EXPANDED_FORMATS'}) {
    foreach my $expanded_format (@{$parser_options->{'EXPANDED_FORMATS'}}) {
      $expanded_formats{$expanded_format} = 1;
    }
  }
  my $text_options = {'TEST' => $default_test_level,
                      'expanded_formats' => \%expanded_formats};
  foreach my $text_option ('COMMAND_LINE_ENCODING', 'DEBUG') {
    if (exists($completed_parser_options->{$text_option})) {
      $text_options->{$text_option}
        = $completed_parser_options->{$text_option};
    }
  }

  print STDERR "DOING TEXT\n" if ($debug);
  my $converted_text
      = Texinfo::Convert::Text::convert_to_text($tree, $text_options);

  # holds conversion function output returned as text for each format.
  # Should not be set for formats outputting to files.
  my %converted;

  my %converted_errors;
  my %converted_sort_strings;

  foreach my $format (@tested_formats) {
    if (exists($formats{$format})) {
      # If a key is in both, last one is kept, which means priority for
      # init_files_options.
      my $format_converter_options = {%$converter_options,
                                      %$init_files_options};
      my $format_type = $format;
      if ($format_type =~ s/^file_//) {
        if ($format_type eq 'epub' and !$doing_epub) {
          warn "ERROR: $self->{'name'}: $test_name: $format: init file not loaded\n";
        }
        # the information that the results is a file is passed
        # through $format_converter_options->{'SUBDIR'} being defined,
        # except for EPUB, which set (and reuse) SUBDIR internally.
        my $test_out_dir;
        if ($self->{'generate'}) {
          my $base = $srcdir.'/'.$test_base_dir;
          $test_out_dir = $base.'res_'.$format_type;
        } else {
          my $base = $test_base_dir;
          $test_out_dir = $base.'out_'.$format_type;
        }
        $format_converter_options->{'SUBDIR'} = "$test_out_dir/";
      } elsif (!defined($format_converter_options->{'OUTFILE'})) {
        $format_converter_options->{'OUTFILE'} = '';
      }
      $format_converter_options->{'TEST'} = $default_test_level
        if (!exists($format_converter_options->{'TEST'}));
      $format_converter_options->{'INCLUDE_DIRECTORIES'} = [
                                          $srcdir.'/t/include/'];
      print STDERR "\nDOING $test_name: $format\n" if ($debug);
      my ($converter, $converter_init_errors);
      ($converted{$format}, $converter, $converter_init_errors)
           = &{$formats{$format}}($self, $test_name, $format_type,
                                  $document, $format_converter_options);

      if ($format =~ /^file_/ and defined($converted{$format})) {
        # This is certainly wrong, because the differences are made on
        # the output files which should be empty.  Differences in output
        # will be missed.  It is tempting to use such format to have
        # output() called by the converter and get the file headers and
        # footers output in the main test perl file, but it is incorrect.
        # It is better to do as for the html or latex cases, have a _text
        # format, like html_text for which convert() is called and have
        # output() be called for the main format name, for example html.
        warn "ERROR: $self->{'name'}: $test_name: $format: file test with result as text\n";
      }

      # For the formats that need indices sorting, compare sorting strings
      if ($format_type eq 'html' or $format_type eq 'info'
          or $format_type eq 'plaintext') {
        my $format_indices_sort_strings
          = $converter->print_converter_indices_sort_strings();
        if (defined($format_indices_sort_strings)) {
          $converted_sort_strings{$format} = $format_indices_sort_strings;
        }
      }

      # output converted returned text in files if $arg_output is set
      if ($arg_output) {
        mkdir ("$output_files_dir/$self->{'name'}")
          if (! -d "$output_files_dir/$self->{'name'}");
        my $extension;
        if ($extensions{$format_type}) {
          $extension = $extensions{$format_type};
        } else {
          $extension = $format_type;
        }
        if (defined ($converted{$format})) {
          my $test_outfile
            = _set_outfile_name($self->{'name'}, $test_name,
                                $extension, $format);
          my $outfile = "$output_files_dir/$test_outfile";
          if (!open(OUTFILE, ">$outfile")) {
            warn "ERROR: open $outfile: $!\n";
          } else {
            # binary formats (Info) are already encoded
            if ($format ne 'info') {
              my $output_encoding
                = $converter->get_conf('OUTPUT_ENCODING_NAME');
              my $output_file_encoding
             = Texinfo::Common::processing_output_encoding($output_encoding);

              if (defined($output_file_encoding)
                  and $output_file_encoding ne '') {
                binmode(OUTFILE, ":encoding($output_file_encoding)");
              } else {
                warn "WARNING: $self->{'name'}: $test_name: $format: no encoding\n";
              }
            }
            if (exists($outfile_preamble{$format})) {
              if (ref($outfile_preamble{$format}) eq 'CODE') {
                print OUTFILE &{$outfile_preamble{$format}}($converter, 0,
                                                     $initial_parser_options);
              } else {
                print OUTFILE $outfile_preamble{$format}->[0];
              }
            }
            print OUTFILE $converted{$format};
            if (exists($outfile_preamble{$format})) {
              if (ref($outfile_preamble{$format}) eq 'CODE') {
                print OUTFILE &{$outfile_preamble{$format}}($converter, 1,
                                                     $initial_parser_options);
              } else {
                print OUTFILE $outfile_preamble{$format}->[1];
              }
            }
            close (OUTFILE) or warn "Close $outfile: $!\n";
          }
        }
      }
      $converter->converter_remove_output_units();
      $converter->destroy_converter();

      my $converter_errors = [@{$converter_init_errors}];
      my $conversion_errors = $converter->get_converter_errors();
      push @{$converter_errors}, @{$conversion_errors};
      if (!scalar(@$converter_errors)) {
        $converted_errors{$format} = undef;
      } else {
        $converted_errors{$format}
          = Texinfo::Report::errors_print_details($converter_errors,
                                          $input_file_names_encoding, 1);
      }

      # output errors in files if $arg_output is set
      if ($arg_output) {
        if (scalar(@$converter_errors)) {
          my $errors_file
            = "$output_files_dir/$self->{'name'}/${test_name}_$format.err";
          if (!open(ERRFILE, ">$errors_file")) {
            warn "Open $errors_file: $!\n";
          } else {
            foreach my $error_message (@{$converter_errors}) {
              my $error_line = $error_message->{'error_line'};
              if (defined($locale_encoding)) {
                $error_line = Encode::encode($locale_encoding, $error_line);
              }
              if (defined($error_message->{'line_nr'})) {
                $error_line = $error_message->{'line_nr'} . ':' . ' '
                   . $error_line;
              }
              print ERRFILE $error_line;
            }
            close (ERRFILE) or warn "Close $errors_file: $!\n";
          }
        }
      }
      $converter = undef;
    } else {
      die "Unknown $format\n";
    }
  }
  my $directions_text;
  # remove the association of top-level commands with element units, in case
  # a converter split the document.
  # It may be noticed that this is only done after all conversions.  This
  # means that depending on the order of converters call, documents feed to
  # converters may have element units if output units are not released.
  # It could be possible to unsplit before each converter call, but it is
  # better to check that this does not have an effect on conversion.
  # Any conversion to Info, Plaintext or HTML (both with output and convert)
  # leads to splitting by the converter, and generally the tests order is
  # first plaintext or info then html, so splitting not having an effect
  # on conversion should be fairly well tested.  See above the comment
  # near test_split_by_node with more explanation on why previous splitting
  # should not interfere with conversion.
  my $unsplit_needed = Texinfo::OutputUnits::unsplit($document);
  print STDERR "  UNSPLIT: $test_name\n"
    if ($debug and $unsplit_needed);

  # NOTE either a PlainTexinfo converter or a direct call to
  # convert_to_texinfo can be used to test conversion back to Texinfo.
  # We use convert_to_texinfo that should require less resources, because
  # there is no need to create a converter.
  my $texi_result = Texinfo::Convert::Texinfo::convert_to_texinfo($tree);

  my $output_units
    = Texinfo::OutputUnits::do_units_directions_pages($document,
                         $test_split_by_node, $split_pages, $debug);

  my $errors_text;
  my $float_text;
  my $tree_text;
  my $nodes_list_text;
  my $sections_list_text;
  my $sectioning_root_text;
  my $headings_list_text;
  if ($output_units) {
    $tree_text
      = Texinfo::OutputUnits::print_output_units_tree_details($output_units,
                                     $tree, $input_file_names_encoding, 1);
    if ($remove_references) {
      Texinfo::OutputUnits::release_output_units_list($output_units);
    }
  } else {
    $tree_text = Texinfo::ManipulateTree::tree_print_details($tree,
                                         $input_file_names_encoding, 1);
  }

  $float_text = Texinfo::Structuring::print_document_listoffloats($document);

  $nodes_list_text = Texinfo::Structuring::print_nodes_list($document);

  $sections_list_text = Texinfo::Structuring::print_sections_list($document);

  $sectioning_root_text
    = Texinfo::Structuring::print_sectioning_root($document);

  $headings_list_text = Texinfo::Structuring::print_headings_list($document);

  # this is needed to avoid a last reference on the tree root when checking
  # with C code that there are no references left.
  $tree = undef;

  Texinfo::Document::destroy_document($document, $remove_references);

  my $document_errors = $document->errors();
  push @$errors, @$document_errors;

  $errors_text = Texinfo::Report::errors_print_details($errors,
                                             $input_file_names_encoding, 1);

 COMPARE:

  my $file = "t/results/$self->{'name'}/$test_name.pl";
  my $new_file = $file.'.new';

  if ($symbols_before_init_file) {
    foreach my $symbol (keys(%Texinfo::Config::)) {
      if (!$symbols_before_init_file->{$symbol}) {
        delete $Texinfo::Config::{$symbol};
      }
    }
  }

  {
    my $out_file;
    if (!$self->{'generate'}) {
      $out_file = $new_file;
    } else {
      $out_file = $srcdir.'/'.$file;
    }
    open(OUT, ">$out_file") or die "Open $out_file: $!\n";
    # We encode each character string that is not ASCII separately such that
    # we can easily output the Info strings that are already encoded.
    #binmode (OUT, ":encoding(utf8)");
    print OUT
     'use vars qw(%result_texis %result_texts %result_tree_text %result_errors'."\n".
     '   %result_indices %result_floats %result_nodes_list %result_sections_list'."\n".
     '   %result_sectioning_root %result_headings_list'."\n".
     '   %result_converted %result_converted_errors %result_converted_sort_strings'."\n"
     .'   %result_indices_sort_strings);'."\n\n";
    print OUT 'use utf8;'."\n\n";
    print OUT 'use Encode;'."\n\n";

    # NOTE $test_name is in general used for directories, file names,
    # and messages.  Here it is used as a text string.  If non ascii, it
    # should be a character string in internal perl codepoints as OUT
    # is encoded as utf8.  In that case, it should be encoded to be
    # used as a file name for the above cases.  Since this is not the case,
    # $test_name should consist of ascii characters only.
    my $out_result;

    if (defined($tree_text)) {
      $out_result .= '$result_tree_text{\''.$test_name.'\'} = \''
          . protect_encode_string($tree_text)."';\n\n";
    }

    if (!$successful_parsing) {
      goto END_OUT_FILE;
    }

    $out_result .= "\n".'$result_texis{\''.$test_name.'\'} = \''
          .protect_encode_string($texi_result)."';\n\n";
    $out_result .= "\n".'$result_texts{\''.$test_name.'\'} = \''
          .protect_encode_string($converted_text)."';\n\n";

    $out_result .= '$result_errors{\''.$test_name.'\'} = \''
                   . protect_encode_string($errors_text)."';\n\n";

    if (defined($indices)) {
      $out_result .= '$result_indices{\''.$test_name.'\'} = \''
                     . protect_encode_string($indices)."';\n\n";
    }

    if (defined($float_text)) {
      $out_result .= '$result_floats{\''.$test_name.'\'} = \''
                    . protect_encode_string($float_text)."';\n\n";
    }

    if (defined($nodes_list_text)) {
      $out_result .= '$result_nodes_list{\''.$test_name.'\'} = \''
                    . protect_encode_string($nodes_list_text)."';\n\n";
    }

    if (defined($sections_list_text)) {
      $out_result .= '$result_sections_list{\''.$test_name.'\'} = \''
                    . protect_encode_string($sections_list_text)."';\n\n";
    }

    if (defined($sectioning_root_text)) {
      $out_result .= '$result_sectioning_root{\''.$test_name.'\'} = \''
                    . protect_encode_string($sectioning_root_text)."';\n\n";
    }

    if (defined($headings_list_text)) {
      $out_result .= '$result_headings_list{\''.$test_name.'\'} = \''
                    . protect_encode_string($headings_list_text)."';\n\n";
    }

    if (defined($indices_sorted_sort_strings)) {
      $out_result .= '$result_indices_sort_strings{\''.$test_name.'\'} = \''
             . protect_encode_string($indices_sorted_sort_strings)."';\n\n";
    }

    foreach my $format (@tested_formats) {
      if (defined($converted{$format})) {
        $out_result .= "\n".'$result_converted{\''.$format.'\'}->{\''
                       .$test_name.'\'} = ';
        if ($format ne 'info') {
          $out_result .= "'".protect_encode_string($converted{$format})."'";
        } else {
          # only protect the generated, do not encode as it is already encoded.
          # Use en Encode::encode call to encode to UTF-8 upon reading in Perl.
          $out_result .= "Encode::encode('utf-8', '"
                        .protect_perl_string($converted{$format})."')";
        }
        $out_result .= ";\n\n";
      }
      if (defined($converted_sort_strings{$format})) {
        $out_result
         .= '$result_converted_sort_strings{\''.$format.'\'}->{\''.
           $test_name.'\'} = \''
           . protect_encode_string($converted_sort_strings{$format})."';\n\n";
      }
      if (defined($converted_errors{$format})) {
        $out_result
     .= '$result_converted_errors{\''.$format.'\'}->{\''.$test_name.'\'} = \''
         . protect_encode_string($converted_errors{$format})."';\n\n";
      }
    }

   END_OUT_FILE:

    $out_result .= "1;\n";
    print OUT $out_result;
    close (OUT);

    if ($self->{'generate'}) {
      print STDERR "--> $test_name\n";
    }
  }
  if (!$self->{'generate'}) {
    %result_converted = ();
    require "$srcdir/$file";

    is_diff($tree_text, $result_tree_text{$test_name}, $test_name.' tree');

    is_diff($float_text, $result_floats{$test_name}, $test_name.' floats');

    is_diff($nodes_list_text, $result_nodes_list{$test_name}, $test_name
             .' nodes list');

    is_diff($sections_list_text, $result_sections_list{$test_name}, $test_name
             .' sections list');

    is_diff($sectioning_root_text, $result_sectioning_root{$test_name},
            $test_name .' sectioning root');

    is_diff($headings_list_text, $result_headings_list{$test_name}, $test_name
             .' headings list');

    is_diff($errors_text, $result_errors{$test_name}, $test_name.' errors');

    is_diff($indices, $result_indices{$test_name}, $test_name.' indices');
    is_diff($indices_sorted_sort_strings,
            $result_indices_sort_strings{$test_name},
            $test_name.' indices sort');

    is_diff($texi_result, $result_texis{$test_name}, $test_name.' texi');
    if ($todos{'text'}) {
      SKIP: {
        skip $todos{'text'}, 1;
        is($converted_text, $result_texts{$test_name}, $test_name.' text');
      }
    } else {
      is_diff($converted_text, $result_texts{$test_name}, $test_name.' text');
    }
    $tests_count = $nr_comparisons;
    if (@tested_formats) {
      foreach my $format (@tested_formats) {
        my $reference_exists;
        my $format_type = $format;
        if ($format_type =~ s/^file_//) {
          my $base = $test_base_dir;
          my $reference_dir = "$srcdir/$base".'res_'.$format_type;
          my $results_dir = $base.'out_'.$format_type;
          if (-d $reference_dir) {
            $reference_exists = 1;
            $tests_count += 1;
            my $dir_errors = compare_dirs_files($reference_dir, $results_dir);

            # compare *_epub_package/EPUB and *_epub_package/EPUB/xhtml
            # contents too for epub
            if (($format_type eq 'html' or $format_type eq 'epub')
                and $doing_epub) {
              my @epub_package_dirs;
              if (opendir(RDIR, $reference_dir)) {
                my @files = readdir (RDIR);
                foreach my $file (@files) {
                  if ($file =~ /_epub_package$/) {
                    push @epub_package_dirs, $file;
                  }
                }
              }
              my $used_dir;
              foreach my $dir_name (@epub_package_dirs) {
                my $reference_EPUB_dir;
                my $reference_xhtml_dir;
                my $ref_epub_package = join('/', ($reference_dir, $dir_name));
                if (-r $ref_epub_package and -d $ref_epub_package) {
                  $reference_EPUB_dir = join('/', ($ref_epub_package, 'EPUB'));
                  if (-r $reference_EPUB_dir and -d $reference_EPUB_dir) {
                    $used_dir = 1;

                    my $results_EPUB_dir
                      = join('/', ($results_dir, $dir_name, 'EPUB'));
                    my $EPUB_dir_errors
                      = compare_dirs_files($reference_EPUB_dir,
                                           $results_EPUB_dir);
                    if (defined($EPUB_dir_errors)) {
                      if (!defined($dir_errors)) {
                        $dir_errors = [];
                      }
                      push @$dir_errors, @$EPUB_dir_errors;
                    }

                    $reference_xhtml_dir
                      = join('/', ($reference_EPUB_dir, 'xhtml'));
                    if (-r $reference_xhtml_dir and -d $reference_xhtml_dir) {
                      my $results_xhtml_dir
                        = join('/', ($results_EPUB_dir, 'xhtml'));
                      my $xhtml_dir_errors
                        = compare_dirs_files($reference_xhtml_dir,
                                             $results_xhtml_dir);
                      if (defined($xhtml_dir_errors)) {
                        if (!defined($dir_errors)) {
                          $dir_errors = [];
                        }
                        push @$dir_errors, @$xhtml_dir_errors;
                      }
                    }
                  }
                }
              }
              if (!$used_dir) {
                warn "WARNING: $format $test_name: ".
                                "no suitable epub_package dir\n";
              }
            }
            if ($todos{$format}) {
              SKIP: {
                skip $todos{$format}, 1;
                ok(!defined($dir_errors), $test_name.' converted '.$format)
                  or diag(join("\n", @$dir_errors));
              }
            } else {
              ok(!defined($dir_errors), $test_name.' converted '.$format)
                or diag(join("\n", @$dir_errors));
            }
          } else {
            print STDERR "\n$format $test_name: \n$results_dir\n";
          }
        } elsif (!defined($result_converted{$format})) {
          my $result;
          if (defined($converted{$format})) {
            $result = $converted{$format};
          } else {
            $result = 'UNDEF'."\n";
          }
          print STDERR "\n$format $test_name:\n$result";
        } else {
          $reference_exists = 1;
          $tests_count += 1;
          if ($todos{$format}) {
            SKIP: {
              skip $todos{$format}, 1;
              is($converted{$format},
                 $result_converted{$format}->{$test_name},
                 $test_name.' converted '.$format);
            }
          } else {
            is_diff($converted{$format},
                    $result_converted{$format}->{$test_name},
                    $test_name.' converted '.$format);
          }
        }

        if ($reference_exists) {
          $tests_count += 1;
          ok(((not defined($converted_sort_strings{$format})
               and (not exists($result_converted_sort_strings{$format})
                    or not exists(
                      $result_converted_sort_strings{$format}->{$test_name})))
              or (defined($converted_sort_strings{$format})
                  and exists($result_converted_sort_strings{$format})
                  and exists(
                        $result_converted_sort_strings{$format}->{$test_name})
                  and $converted_sort_strings{$format} eq
                       $result_converted_sort_strings{$format}->{$test_name})),
             $test_name.' indices sort '.$format);
        }


        if ($reference_exists) {
          $tests_count += 1;
          ok(((not defined($converted_errors{$format})
               and (not exists($result_converted_errors{$format})
                    or not exists(
                             $result_converted_errors{$format}->{$test_name})))
              or (defined($converted_errors{$format})
                  and exists($result_converted_errors{$format})
                  and exists($result_converted_errors{$format}->{$test_name})
                  and $converted_errors{$format} eq
                              $result_converted_errors{$format}->{$test_name})),
             $test_name.' errors '.$format);
        }
      }
    }
  }

  return $tests_count;
}

# Main entry point for the tests.  Called from *.t files.
#  $NAME - a string, name of test
#  $TEST_CASES - array of sub-tests
#
# variables set from command line:
#  If $ARG_TEST_CASE is set, only run that test.
#  $ARG_GENERATE set means to generate reference test results (-g from command line).
#  $ARG_DEBUG is used for debugging (-d from command line).
#  The $ARG_COMPLETE variable is the -c option, to create Texinfo files for the
#  test cases.
sub run_all($$) {
  my ($name, $test_cases) = @_;

  my $test = new_test($name, $arg_generate, $arg_debug);
  my $ran_tests;
  if (scalar(@ARGV)) {
    $ran_tests = [];
    foreach my $arg_test_case (@ARGV) {
      foreach my $test_case (@$test_cases) {
        if ($test_case->[0] eq $arg_test_case) {
          push @$ran_tests, $test_case;
          last;
        }
      }
    }
  } else {
    $ran_tests = $test_cases;
  }

  if (!defined($ran_tests)) {
    die "No test\n";
  }
  my $test_nrs = 0;

  foreach my $test_case (@$ran_tests) {
    if ($arg_complete) {
      $test->output_texi_file($test_case);
    } else {
      $test_nrs += $test->test($test_case);
    }
  }
  if ($arg_generate or $arg_complete) {
    plan tests => 1;
  } else {
    plan tests => (1 + $test_nrs);
  }
}

# Create a Texinfo file for a test case; used when -c option is given.
sub output_texi_file($$) {
  my ($self, $test_case) = @_;

  my $test_name = shift @$test_case;
  my $test_text = shift @$test_case;
  my $test_options = shift @$test_case;

  my $dir = "$generated_texis_dir/$self->{'name'}/";
  mkdir "$generated_texis_dir/" or die
     unless (-d "$generated_texis_dir/");
  mkdir $dir or die
     unless (-d $dir);
  my $file = "${dir}$test_name.texi";
  print STDERR "texi: $test_name\n" if ($arg_debug);
  open(OUTFILE, ">$file") or die ("Open $file: $!\n");

  my $encode = 1;
  my $first_line = "\\input texinfo \@c -*-texinfo-*-";
  my $from_file;
  if (!defined($test_text)) {
    $from_file = 1;
    # We do not decode to character strings in internal perl encoding,
    # we get bytes and output bytes already encoded, mixing with
    # character strings containing ascii characters only.
    my $test_file;
    if ($test_options and $test_options->{'test_file'}) {
      $encode = 0;
      $test_file = $input_files_dir . $test_options->{'test_file'};
      if (open(INFILE, $test_file)) {
        my $holdTerminator = $/;
        undef $/;
        $test_text = <INFILE>;
        $/ = $holdTerminator;
      } else {
        die "Open $test_file: $!\n";
      }
    }
  }
  my $node_top;
  if ($test_text =~ /^\@node +top[\s,]/mi
      or $test_text =~ /^\@node +top *$/mi) {
    $node_top = '';
  } else {
    $node_top = "\@node Top\n";
    unless ($test_text =~ /^\@top\s/m or $test_text =~ /^\@top *$/m) {
      $node_top .= "\@top $test_name\n";
    }
  }
  my $added_chapter = '';
  unless ($test_text =~ /^\@(chapter|unnumbered|appendix)\s/m
          or $test_text =~ /^\@(chapter|unnumbered|appendix) *$/m
          or $test_text =~ /^\@node +chap/mi) {
    # need a chapter or node after Top for LaTeX as Top node is ignored.
    if ($node_top ne '') {
      $added_chapter = "\@node chapter\n\@chapter chapter\n";
    } else {
      print STDERR "WARNING: $test_name: top in test, no chapter added\n";
    }
  }
  if ($from_file) {
    if ($node_top ne '' or $added_chapter ne '') {
         # \A matches beginning of string, even with /m
      if ($test_text =~ s/\A(\s*\\input texinfo(\.tex)? *\@.*)(\n|$)//m
          or $test_text =~ s/\A(\s*\\input texinfo(\.tex)? *)(\n|$)//m) {
        $first_line = $1;
      }
    } elsif ($test_text =~ /^\s*\\input texinfo(\.tex)? *\@/
             or $test_text =~ /\A\s*\\input texinfo(\.tex)? *$/m) {
      $first_line = "";
    }
  }
  my $bye = '';
  if ($test_text !~ /\@bye *$/m
      and $test_text !~ /\@bye[\@ ]/) {
    $bye = '@bye';
  }
  foreach my $output ($first_line, $node_top, $added_chapter) {
    print OUTFILE "$output\n"
      if ($output ne '');
  }
  # $test_text is already encoded if read from a file, but if it is
  # a test string from a *.t file code, it is a perl character string
  # and is encoded here, to UTF-8 as it is the default Texinfo encoding.
  $test_text = Encode::encode('UTF-8', $test_text) if ($encode);
  # Always add a newline in the end.  There may not be a newline for tests
  # defined as strings ending right after a character.
  chomp($test_text);
  print OUTFILE $test_text."\n";
  print OUTFILE "$bye\n" if ($bye ne '');
  close (OUTFILE) or die "Close $file: $!\n";
}

1;
