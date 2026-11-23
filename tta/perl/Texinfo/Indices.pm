# Indices.pm: merge and sort indices.  Functions without XS override.
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
# Most methods in that module are called from documents or
# converters methods that cache the results.  Therefore, the relevant
# interface is, in the general case, with the document or converter
# when possible.
#
# ALTIMP C/main/manipulate_indices.c

package Texinfo::Indices;

use 5.006;

# See comment at start of HTML.pm
use if $] >= 5.012, feature => 'unicode_strings';

# Cannot do that because of sort_indices_by_letter, probably for uc().
# stop \s from matching non-ASCII spaces, etc.  \p{...} can still be
# used to match Unicode character classes.
#use if $] >= 5.014, re => '/a';

use strict;
use warnings;

# Can be used to check that there is no incorrect autovivfication
#no autovivification qw(fetch delete exists store strict);

use Carp qw(cluck confess);

use Unicode::Normalize;
use Unicode::Collate;

use Texinfo::XSLoader;

use Texinfo::TreeElement;

use Texinfo::Common;

use Texinfo::Translations;

use Texinfo::Convert::Text;

our $VERSION = '7.3dev';

# The methods that are usefully called directly (outside of tests) are:
# index_entry_element_sort_string
# setup_index_entry_keys_formatting
# index_entry_first_letter_text_or_command

BEGIN {
  Texinfo::XSLoader::init (
    "Texinfo::Indices",
    "Texinfo::IndicesNonXS",
    'IndicesXS',
    undef,
    ['texinfo', 'texinfoxs', 'texinfo-convert', 'texinfo-convertxs'],
  );
}

# This is a stub for the Unicode::Collate module.  It is used if
# USE_UNICODE_COLLATION=0.  Using this fall-back will change index sorting,
# especially of punctuation characters and in non-English manuals.
#
# This fall-back also allows checking the performance impact of
# Unicode::Collate (last checked as about a 5% increase in runtime for
# typical Info output).

package Texinfo::CollateStub;

sub new($%) {
  my $class = shift;
  my %options = @_;

  my $self = {};
  bless $self, $class;
  return $self;
}

# Simply return a copy of the string, in UTF-8.
# Note: this should return an encoded string, because Unicode::Collate
# getSortKey returns a byte string (and if the getSortKey function
# is called from C code again someday it may not handle any "wide characters"
# in the sort key).
# The ordering will be the Unicode code point order because the UTF-8
# sequences sort in code point order.
sub getSortKey($$) {
  my ($self, $string) = @_;

  utf8::encode($string);
  return $string;
}

package Texinfo::Indices;

# Normally called through Texinfo::Document::merged_indices only
sub merge_indices($) {
  my $indices_information = shift;

  my $merged_index_entries;
  # sort for reproducible error or debug messages within merged
  # indices.
  foreach my $index_name (sort(keys(%$indices_information))) {
    my $index_info = $indices_information->{$index_name};
    if ($index_info->{'index_entries'}) {
      $merged_index_entries = {} if (! $merged_index_entries);
      my $in_idx_name = $index_name;
      if ($index_info->{'merged_in'}) {
        my $ultimate_idx = Texinfo::Common::ultimate_index($indices_information,
                                                           $index_info);
        $in_idx_name = $ultimate_idx->{'name'};
      }
      push @{$merged_index_entries->{$in_idx_name}},
        @{$index_info->{'index_entries'}};
    }
  }
  return $merged_index_entries;
}



# getting index content element

sub _remove_def_types($) {
  my $element = shift;

  $element->{'type'} = 'generic_container';
  if (exists($element->{'contents'})
      and exists($element->{'contents'}->[0]->{'type'})
      and $element->{'contents'}->[0]->{'type'} eq 'bracketed_arg') {
        # use brace_arg instead of bracketed_arg to avoid specific def
        # type for the conversion of the index entry, but still have
        # a type that have the same memory layout as bracketed_arg for C
    $element->{'contents'}->[0]->{'type'} = 'brace_arg';
  }
}

sub get_index_content_info_element($;$) {
  my ($element, $prefer_reference_element) = @_;

  if (!exists($element->{'extra'})
      or !exists($element->{'extra'}->{'def_command'})) {
    # the copy is not strictly needed, but we want to obtain the same
    # result as with C and the result is different with anchors
    # in index entries.
    my $copy = Texinfo::ManipulateTree::copy_element_tree(
                                           $element->{'contents'}->[0]);
    return $copy, undef, undef;
  }

  my ($name, $class);
  if (exists($element->{'contents'}->[0]->{'contents'})) {
    foreach my $arg (@{$element->{'contents'}->[0]->{'contents'}}) {
      my $type = $arg->{'type'};
      if ($type eq 'def_name') {
        $name = $arg;
      } elsif ($type eq 'def_class') {
        $class = $arg;
      } elsif ($type eq 'def_arg' or $type eq 'def_typearg'
               or $type eq 'delimiter') {
        last;
      }
    }
  }

  if (defined($name)) {
    my $def_command = $element->{'extra'}->{'def_command'};
    my $name_copy = Texinfo::ManipulateTree::copy_element_tree($name);

    if (!exists($Texinfo::Commands::def_class_variable_commands{
                                                         $def_command})
        and !exists($Texinfo::Commands::def_class_method_commands{
                                           $def_command})) {
      _remove_def_types($name_copy);
      return $name_copy, undef, undef;
    }

    if (defined($class)) {
      my $class_copy = Texinfo::ManipulateTree::copy_element_tree($class);

      foreach my $element_copy ($class_copy, $name_copy) {
        _remove_def_types($element_copy);
      }

      if ($prefer_reference_element) {
        my $text_element;
        my $index_entry_normalized
          = Texinfo::TreeElement::new({'type' => 'generic_container'});

        if (exists($Texinfo::Commands::def_class_method_commands{
                                                   $def_command})) {
          $text_element = Texinfo::TreeElement::new({'text' => ' on ',
                                                  'type' => 'normal_text'});
        } elsif (exists($Texinfo::Commands::def_class_variable_commands{
                                                       $def_command})) {
          $text_element = Texinfo::TreeElement::new({'text' => ' of ',
                                                   'type' => 'normal_text'});
        }

        $index_entry_normalized->{'contents'}
          = [$name_copy, $text_element, $class_copy];

        return $index_entry_normalized, undef, undef;
      } else {
        return undef, $name_copy, $class_copy;
      }
    }
  }
  return undef, undef, undef;
}

# if $PREFER_REFERENCE_ELEMENT is set, prefer an untranslated element.
sub element_index_content_element($;$$) {
  my ($element, $prefer_reference_element, $debug_level) = @_;

  # get index element for cases that use tree element elements
  # and do not need translation, as well as and copied elements relevant
  # for the case needing translation handled just below.
  my ($index_element, $name_copy, $class_copy)
   = get_index_content_info_element($element, $prefer_reference_element);

  if (defined($index_element) or !defined($class_copy)) {
    return $index_element;
  }

  # The remaining case is object-oriented definition command index entry
  # based on a translation, handled next.

  # Use the language information that was current when the command was
  # used for getting the translation.
  my $element_lang_translations
    = Texinfo::Translations::new_element_language_translation(
            $Texinfo::Translations::converters_translation_cache,
                    $element);

  my $def_command = $element->{'extra'}->{'def_command'};
  my $substrings = {'name' => $name_copy, 'class' => $class_copy};
  if (exists($Texinfo::Commands::def_class_method_commands{
                                                   $def_command})) {
  # TRANSLATORS: association of a method or operation name with a class
  # in descriptions of object-oriented programming methods or operations.
    $index_element
      = Texinfo::Translations::gdt('{name} on {class}',
                   $element_lang_translations, $substrings,
                   undef, $debug_level);
  } elsif (exists($Texinfo::Commands::def_class_variable_commands{
                                                            $def_command})) {
  # TRANSLATORS: association of a variable or instance variable with
  # a class in descriptions of object-oriented programming variables or
  # instance variable.
    $index_element = Texinfo::Translations::gdt('{name} of {class}',
                   $element_lang_translations, $substrings,
                   undef, $debug_level);
  }

  # prefer a generic container rather than 'root_line' returned by gdt
  $index_element->{'type'} = 'generic_container';

  return $index_element;
}



# indices entries sorting

# For each index in the document, convert index entry and associated
# subentries to text to be used as sort string.
#
# Considered as kind of internal for index sorting functions, therefore
# not documented, no XS since it should not be called directly, but
# through Texinfo::Document::document_indices_sort_strings or
# Texinfo::Convert::Converter::_converter_indices_sort_strings that cache the
# result, themselves called possibly through sorting functions.
sub setup_index_entries_sort_strings($$$$;$$) {
  my ($document, $converter, $index_entries, $indices_information,
      $prefer_reference_element, $debug_level) = @_;

  return undef unless (defined($index_entries));

  my $document_info;

  if (defined($converter)) {
    $document_info = $converter;
  } else {
    $document_info = $document;
  }

  # convert index entries to sort string using unicode when possible
  # independently of input and output encodings
  my $convert_text_options = {};
  $convert_text_options->{'enabled_encoding'} = 'utf-8';

  my $indices_sort_strings = {};
  # sort for reproducible error or debug messages if there are
  # messages with translations
  foreach my $index_name (sort(keys(%$index_entries))) {
    my @index_entries_sort_strings;
    foreach my $index_entry (@{$index_entries->{$index_name}}) {
      my $entry_index_name = $index_entry->{'index_name'};
      my $main_entry_element = $index_entry->{'entry_element'};
      my $in_code = $indices_information->{$entry_index_name}->{'in_code'};
      if ($in_code) {
        Texinfo::Convert::Text::set_options_code($convert_text_options);
      }
      # gather entry and subentries sort strings
      my @entry_subentries_sort_strings;
      my $non_empty_entry_subentries = 0;
      my $entry_sort_string
        = index_entry_element_sort_string($document_info,
                               $index_entry, $main_entry_element,
                           $convert_text_options, $prefer_reference_element,
                           $converter, $debug_level);
      if ($entry_sort_string !~ /\S/) {
        my $entry_cmdname = $main_entry_element->{'cmdname'};
        $entry_cmdname
          = $main_entry_element->{'extra'}->{'original_def_cmdname'}
           if (!defined($entry_cmdname));
        Texinfo::Common::converter_or_document_line_warn($document,
                                   $converter,
                       sprintf(__("empty index key in \@%s"),
                                  $entry_cmdname),
                               $main_entry_element->{'source_info'});
        push @entry_subentries_sort_strings, '';
      } else {
        push @entry_subentries_sort_strings, $entry_sort_string;
        $non_empty_entry_subentries++;
      }
      my $subentry_nr = 0;
      my @subentries;
      Texinfo::Common::collect_subentries($main_entry_element,
                                          \@subentries);
      foreach my $subentry (@subentries) {
        $subentry_nr++;
        my $subentry_sort_string
              = index_entry_element_sort_string($document_info,
                             $index_entry, $subentry, $convert_text_options,
                             undef, $converter, $debug_level);
        if ($subentry_sort_string !~ /\S/) {
          my $entry_cmdname = $main_entry_element->{'cmdname'};
          $entry_cmdname
            = $main_entry_element->{'extra'}->{'original_def_cmdname'}
              if (!defined($entry_cmdname));
          Texinfo::Common::converter_or_document_line_warn($document,
                                $converter,
                         sprintf(__("empty index sub entry %d key in \@%s"),
                                    $subentry_nr, $entry_cmdname),
                                  $main_entry_element->{'source_info'});
          push @entry_subentries_sort_strings, '';
        } else {
          push @entry_subentries_sort_strings, $subentry_sort_string;
          $non_empty_entry_subentries++;
        }
      }

      if ($non_empty_entry_subentries > 0) {
        # register index entry sort strings information based on gathered
        # entry and subentries sort strings and main entry information
        my @entry_subentries_alpha_strings;
        foreach my $sort_string (@entry_subentries_sort_strings) {
          my $alpha = 0;
          if ($sort_string =~ /^[[:alpha:]]/) {
            $alpha = 1;
          }
          push @entry_subentries_alpha_strings,
             {'sort_string' => $sort_string, 'alpha' => $alpha};
        }
        push @index_entries_sort_strings, {'entry' => $index_entry,
                       'sort_strings' => \@entry_subentries_alpha_strings,
                                 'number' => $index_entry->{'entry_number'},
                              'index_name' => $entry_index_name};
      }
      if ($in_code) {
        Texinfo::Convert::Text::reset_options_code($convert_text_options);
      }
    }
    $indices_sort_strings->{$index_name} = \@index_entries_sort_strings;
  }

  return $indices_sort_strings;
}

# Returns a hash reference associating the index entries with the text strings
# that are used for sorting (also going through a collator).
# Used in tests, but not documented, as it is unlikely for this function
# to be of any other use.
sub format_index_entries_sort_strings($) {
  my $indices_sort_strings = shift;

  my $index_entries_sort_strings = {};

  return $index_entries_sort_strings unless (defined($indices_sort_strings));

  foreach my $index_name (keys(%$indices_sort_strings)) {
    foreach my $index_entry (@{$indices_sort_strings->{$index_name}}) {
      $index_entries_sort_strings->{$index_entry->{'entry'}}
         = join(', ', map {$_->{'sort_string'}}
                          @{$index_entry->{'sort_strings'}});
    }
  }
  return $index_entries_sort_strings;
}

# 'Non-Ignorable' for 'variable' collation characters means that they are
# treated as normal characters.   This allows to have spaces and punctuation
# marks sort before letters.
# http://www.unicode.org/reports/tr10/#Variable_Weighting
my %collate_options = ( 'variable' => 'Non-Ignorable' );

sub _setup_lang_collator($;$) {
  my ($lang_sorting_locale, $collate_options_ref) = @_;

  $collate_options_ref = \%collate_options if (!defined($collate_options_ref));

  my $collator;
  # Unicode::Collate::Locale is present in perl core since perl major
  # version 5.14 released in 2011.
  eval { require Unicode::Collate::Locale;
         Unicode::Collate::Locale->import; };
  my $unicode_collate_locale_loading_error = $@;
  if ($unicode_collate_locale_loading_error eq '') {
    $collator = Unicode::Collate::Locale->new(
                                 'locale' => $lang_sorting_locale,
                                              %collate_options);
  }
  return $collator;
}

sub _setup_collator($$) {
  my ($use_unicode_collation, $lang_sorting_locale) = @_;

  my $collator;

  # The Unicode::Collate sorting changes based on the UCA version.
  # To test the result with a specific version, the UCA_Version should be set,
  # and, more importantly the table should correspond to that version.
  # To test a specific table, in the tta directory, do
  # wget -N http://www.unicode.org/Public/UCA/6.2.0/allkeys.txt
  # mkdir -p Unicode/Collate/
  # mv allkeys.txt Unicode/Collate/allkeys-6.2.0.txt
  # The table argument leads to a very important slowdown, so the argument
  # should only be used for checks.
  # The test results seem to be consistent with 6.2.0, corresponding
  # to the perl 5.18.0 Unicode::Collate

  # to test for 6.2.0
  #%collate_options = (%collate_options,
  #                    'UCA_Version' => 24,
  #                    'table' => 'allkeys-6.2.0.txt');
  # To test files affected for UCA corresponding to perl 5.8.1
  # wget -N http://www.unicode.org/Public/UCA/3.1.1/allkeys-3.1.1.txt
  #%collate_options = (%collate_options,
  #                   'UCA_Version' => 9,
  #                   'table' => 'allkeys-3.1.1.txt');

  if (!(defined($use_unicode_collation) and !$use_unicode_collation)) {
    if (defined($lang_sorting_locale)) {
      $collator = _setup_lang_collator($lang_sorting_locale,
                                       \%collate_options);
    }

    if (!defined($collator)) {
      $collator = Unicode::Collate->new(%collate_options);
    }
  } else {
    # stub if Unicode::Collate is not wanted.
    $collator = Texinfo::CollateStub->new();
  }

  return $collator;
}

# Take textual index sort strings $INDICES_SORT_STRINGS (by index)
# in input, setup and use a collator to produce sortable byte string
# sort keys that can be compared directly based on their value.
sub _setup_sort_sortable_strings_collator($$$) {
  my ($indices_sort_strings, $use_unicode_collation,
      $lang_sorting_locale) = @_;

  return undef unless (defined($indices_sort_strings));

  my $collator = _setup_collator($use_unicode_collation, $lang_sorting_locale);

  my $index_sortable_index_entries = {};
  foreach my $index_name (keys(%$indices_sort_strings)) {
    my $sortable_index_entries = [];
    foreach my $index_entry (@{$indices_sort_strings->{$index_name}}) {
      my @keys_and_alpha;
      foreach my $entry_subentries_sort_string_alpha
                                   (@{$index_entry->{'sort_strings'}}) {
        my $sort_string = $entry_subentries_sort_string_alpha->{'sort_string'};
        # TODO we do not mix decoded and non-decoded strings anymore, we decode
        # all the strings, and Encode::decode for old Perl should already set
        # the UTF-8 flag for anything else than ASCII (for recent
        # Perl the UTF-8 flag is set for ASCII too), so utf8::upgrade is
        # probably not needed anymore.  To be safe, we can keep it until we
        # only support perl > 5.12. (5.14.0 released in 2011).
        #
        # This avoided varying results depending on whether the string is
        # represented internally in UTF-8.  See 'the "Unicode bug"' in the
        # "perlunicode" man page.
        utf8::upgrade($sort_string);
        # $sort_key is a byte string
        my $sort_key = $collator->getSortKey($sort_string);
        push @keys_and_alpha, [$sort_key,
                               $entry_subentries_sort_string_alpha->{'alpha'}];
      }
      my $sortable_entry = {'entry' => $index_entry->{'entry'},
                            'keys' => \@keys_and_alpha,
                            'entry_strings_alpha' => $index_entry->{'sort_strings'},
                            'number' => $index_entry->{'number'},
                            'index_name' => $index_entry->{'index_name'}};
      push @{$sortable_index_entries}, $sortable_entry;
    }
    $index_sortable_index_entries->{$index_name} = $sortable_index_entries;
  }

  return ($index_sortable_index_entries, $collator);
}

sub _sort_key($$) {
  my ($a, $b) = @_;

  my ($a_value, $a_alpha) = @$a;
  my ($b_value, $b_alpha) = @$b;
  if ($a_alpha == $b_alpha) {
    return ($a_value cmp $b_value);
  }
  return $a_alpha <=> $b_alpha;
}

sub _sort_index_entries($$) {
  my ($key1, $key2) = @_;

  my $key_index = 0;
  # the keys array corresponds to the main entry and subentries
  foreach my $key1_str (@{$key1->{'keys'}}) {
    my $res = _sort_key($key1_str,
                           $key2->{'keys'}->[$key_index]);
    if ($res != 0) {
      return $res;
    }
    $key_index++;
    if (scalar(@{$key2->{'keys'}}) <= $key_index) {
      last;
    }
  }
  my $res = (scalar(@{$key1->{'keys'}}) <=> scalar(@{$key2->{'keys'}}));
  if ($res == 0) {
    $res = ($key1->{'number'} <=> $key2->{'number'});
  }
  # This may happen if 2 indices are merged as the number is per
  # index name.
  if ($res == 0) {
    $res = ($key1->{'index_name'} cmp $key2->{'index_name'});
  }
  return $res;
}

# Normally only called through get_converter_indices_sorted_by_*
# (and Texinfo::Document::sorted_indices_by_index in tests).
sub sort_indices_by_index($;$$) {
  my ($indices_sort_strings, $use_unicode_collation, $lang_sorting_locale) = @_;

  my ($index_sortable_index_entries, $collator)
     = _setup_sort_sortable_strings_collator($indices_sort_strings,
                                             $use_unicode_collation,
                                             $lang_sorting_locale);

  if (!defined($index_sortable_index_entries)) {
    return undef;
  }

  my $sorted_index_entries = {};
  foreach my $index_name (keys(%$index_sortable_index_entries)) {
    my $sortable_index_entries = $index_sortable_index_entries->{$index_name};
    $sorted_index_entries->{$index_name} = [
         map {$_->{'entry'}} sort {_sort_index_entries($a, $b)}
                                                @{$sortable_index_entries}
       ];
  }
  return $sorted_index_entries;
}

# Normally only called through get_converter_indices_sorted_by_*
sub sort_indices_by_letter($;$$) {
  my ($indices_sort_strings, $use_unicode_collation, $lang_sorting_locale) = @_;

  my ($index_sortable_index_entries, $collator)
     = _setup_sort_sortable_strings_collator($indices_sort_strings,
                                             $use_unicode_collation,
                                             $lang_sorting_locale);

  if (!defined($index_sortable_index_entries)) {
    return undef;
  }

  my $sorted_index_entries = {};
  foreach my $index_name (keys(%$index_sortable_index_entries)) {
    my $sortable_index_entries = $index_sortable_index_entries->{$index_name};
    my $index_letter_hash = {};
    foreach my $sortable_entry (@{$sortable_index_entries}) {
      my $main_entry_sort_string
        = $sortable_entry->{'entry_strings_alpha'}->[0]->{'sort_string'};
      # the following line leads to each accented letter being separate
      # $letter = uc(substr($main_entry_sort_string, 0, 1));
      my $letter_string = uc(substr($main_entry_sort_string, 0, 1));
      # determine main letter by decomposing and removing diacritics
      my $letter = Unicode::Normalize::NFKD($letter_string);
      $letter =~ s/\p{NonspacingMark}//g;
      # following code is less good, as the upper-casing may lead to
      # two letters in case of the german Eszett that becomes SS.  So
      # it is better to upper-case first and remove diacritics after.
      #my $normalized_string
      #  = Unicode::Normalize::NFKD(uc($main_entry_sort_string));
      #$normalized_string =~ s/\p{NonspacingMark}//g;
      #$letter = substr($normalized_string, 0, 1);

      push @{$index_letter_hash->{$letter}}, $sortable_entry;
    }

    my @letter_keys;
    foreach my $letter (keys %$index_letter_hash) {
      my $sort_key = $collator->getSortKey($letter);
      push @letter_keys, [$sort_key, $letter, $index_letter_hash->{$letter}];
    }

    my @sorted_letters = sort{$a->[0] cmp $b->[0]} @letter_keys;

    foreach my $letter_and_entries (@sorted_letters) {
      my $letter = $letter_and_entries->[1];
      my @sorted_letter_entries
         = map {$_->{'entry'}} sort {_sort_index_entries($a, $b)}
                                            @{$letter_and_entries->[2]};
      push @{$sorted_index_entries->{$index_name}},
        { 'letter' => $letter, 'entries' => \@sorted_letter_entries };
    }
  }
  return $sorted_index_entries;
}

# textual representation on indices themselves (not on the index entries)
# used in tests
sub print_indices_information($) {
  my $indices_information = shift;

  return undef if (!defined($indices_information));

  my @sorted_indices = sort(keys(%$indices_information));

  return undef if (!scalar(@sorted_indices));

  my $result = '';
  foreach my $index_name (@sorted_indices) {
    my $index_info = $indices_information->{$index_name};
    $result .= $index_name;
    if ($index_info->{'in_code'}) {
      $result .= " C";
    }
    if (defined($index_info->{'merged_in'})) {
      $result .= " ->$index_info->{'merged_in'}"
    }
    $result .= "\n";
  }

  return $result;
}

sub print_indices_sort_strings($$) {
  my ($sorted_index_entries, $indices_sort_strings) = @_;

  return if (not defined($sorted_index_entries));

  my $index_entries_sort_strings
   = format_index_entries_sort_strings($indices_sort_strings);

  my $idx_sort_strings_str = '';
  foreach my $index_name (sort(keys(%$sorted_index_entries))) {
    # index entries sort strings sorted in the order of the index entries
    my $index_entries = $sorted_index_entries->{$index_name};
    if (scalar(@{$index_entries})) {
      $idx_sort_strings_str .= "${index_name}:\n";
      foreach my $index_entry (@{$index_entries}) {
        my $sort_string = $index_entries_sort_strings->{$index_entry};
        $idx_sort_strings_str .= " ${sort_string}\n";
      }
    }
  }
  return if ($idx_sort_strings_str eq '');
  return $idx_sort_strings_str;
}


1;

__END__

=head1 NAME

Texinfo::Indices - merging and sorting indices from Texinfo

=head1 SYNOPSIS

  use Texinfo::Indices;

  # $document is a parsed Texinfo::Document document.
  my $indices_information = $document->indices_information();
  my $merged_index_entries
     = Texinfo::Indices::merge_indices($indices_information);

  my $indices_sort_strings
    $converter->_converter_indices_sort_strings();

  my $index_entries_sorted;
  if ($sort_by_letter) {
    $index_entries_sorted
      = Texinfo::Indices::sort_indices_by_letter($indices_sort_strings);
  } else {
    $index_entries_sorted
      = Texinfo::Indices::sort_indices_by_index($indices_sort_strings);
  }


=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

Main functions merge and sort indices.  These functions should generally be
called indirectly.

Other functions help presenting sorting strings especially generated to be
output or are helper functions related to indices or index entries.

=head1 METHODS

No method is exported.

C<merge_indices> may be used to merge indices.  Document indices may be sorted
with C<sort_indices_by_index> or C<sort_indices_by_letter>.  The sorting may
be influenced by the current language.

Note that, in general, the functions used to merge or sort indices should not
be called directly, corresponding functions in converters already call the
functions in this module or in the Document module, and, in addition, cache the
result.

=over

=item $merged_indices = merge_indices($indices_information)
X<C<merge_indices>>

Returns a structure holding all the index entries by index name
with all the entries of merged indices merged with those of the indice
merged into.  The I<$indices_information> argument should be an hash reference
with indices information, it is described in details in
L<< C<Texinfo::Document::indices_information>|Texinfo::Document/$indices_information = $document->indices_information() >>.

The I<$merged_indices> returned is a hash reference whose
keys are the index names and values arrays of index entry structures
described in details in L<Texinfo::Document/index_entries>.

In general, this method should not be called directly, instead
L<< C<Texinfo::Document::Indices::merged_indices>|Texinfo::Document::Indices/$merged_indices = $document->merged_indices() >>
should be called on a document, which calls C<merge_indices> if needed and
associate the merged indices to the document.

=item $index_entries_sorted = sort_indices_by_index($indices_sort_strings, $use_unicode_collation, $lang_sorting_locale)

=item $index_entries_sorted = sort_indices_by_letter($indices_sort_strings, $use_unicode_collation, $lang_sorting_locale)
X<C<sort_indices_by_index>> X<C<sort_indices_by_letter>>

C<sort_indices_by_letter> sorts by index and letter, while
C<sort_indices_by_index> sort all entries of an index together.
In both cases, a hash reference with index names as keys I<$index_entries_sorted>
is returned.

I<$indices_sort_strings> are strings used to sort the index entries,
by index, obtained by converting the index entries to text.
Indices are obtained from a Texinfo Document, and should have been merged
previously, in general by using
L<< C<Texinfo::Document::Indices::merged_indices>|Texinfo::Document::Indices/$merged_indices = $document->merged_indices() >>.

By default, indices are sorted according to the I<Unicode Collation Algorithm>
defined in the L<Unicode Technical Standard
#10|http://www.unicode.org/reports/tr10/>, without language-specific collation
tailoring.  If I<$use_unicode_collation> is set to 0, the sorting will not use
the I<Unicode Collation Algorithm> and simply sort according to the codepoints.
The optional I<$lang_sorting_locale> language is used for linguistic
tailoring of the sorting, if possible.

When sorting by letter, an array reference of letter hash references is
associated with each index name.  Each letter hash reference has two
keys, a I<letter> key with the letter, and an I<entries> key with an array
reference of sorted index entries beginning with the letter.  The letter
is a character string suitable for sorting letters, but is not necessarily
the best to use for output.

When simply sorting, the array of the sorted index entries is associated
with the index name.

In general, those methods should not be called directly, instead
L<< C<Texinfo::Convert::Converter::get_converter_indices_sorted_by_letter>|Texinfo::Convert::Converter/$sorted_indices = $converter->get_converter_indices_sorted_by_letter() >>
or L<< C<Texinfo::Convert::Converter::get_converter_indices_sorted_by_index>|Texinfo::Convert::Converter/$sorted_indices = $converter->get_converter_indices_sorted_by_index() >>
should be called.

=back

Functions help setting up textual sorting strings, for instance for output.
Although they may be generated by calling the same functions, these sorting
strings are independent from the sorting keys used internally to sort indices.

=over

=item $options = setup_index_entry_keys_formatting($customization_information)
X<C<setup_index_entry_keys_formatting>>

Return options relevant for index entries sorting strings used for
conversion of Texinfo to output.

Should be called early, since it sets up language information corresponding to
the language current at the end of the preamble.  (Note that commands appearing
in index entry whose output may depend on a language are rare.)

=item $sort_string = index_entry_element_sort_string($document_info, $main_entry, $index_entry_element, $options, $prefer_reference_element, $converter, $debug_level)
X<C<index_entry_element_sort_string>>

Return a string suitable as a sorting string for index entries, possibly
to be used in output.
I<$document_info> is solely used by C code to retrieve the document data.
I<$document_info> can be a converter based on L<Texinfo::Convert::Converter> or
a L<Texinfo::Document> document.

The tree element index entry processed is I<$index_entry_element>,
and can be a C<@subentry>.  I<$main_entry> is the main index entry
that can be used to gather information.

The I<$options> are options used for Texinfo conversion to text for the
generation of the sorting string and, when called directly (and not through
index sorting functions), are generally obtained from
L<setup_index_entry_keys_formatting|/$options = setup_index_entry_keys_formatting($customization_information)>
early on, and reused in every call.

If I<$prefer_reference_element> is set, prefer an untranslated
element for the formatting as sorting string.

If I<$converter> is set, use the converter for index entries with
index string based on a translation.

=back

Other functions.

=over

=item $entry_content_element = element_index_content_element($element, $prefer_reference_element, $debug_level)
X<C<element_index_content_element>>

Return a Texinfo tree element corresponding to the content of the index
entry associated to I<$element>.  If I<$prefer_reference_element> is set,
prefer an untranslated element.  If the element is an index command like
C<@cindex> or an C<@ftable> C<@item>, the content element is the argument
of the command.  If the element is an object-oriented definition, the index
entry element is based on the name and class, with a translation.

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
