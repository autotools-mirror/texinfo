use strict;

use lib '.';
use Texinfo::ModulePath (undef, undef, undef, 'updirs' => 3);

use Test::More;
BEGIN { plan tests => 8; };

#use Data::Dumper;

use Texinfo::Tests qw(is_diff);

use Texinfo::Convert::Text;
use Texinfo::Parser;
use Texinfo::Document;
use Texinfo::Indices;
use Texinfo::Document::Indices;
# for cmp_deeply
#use Test::Deep;
# package Texinfo::MainConfig is in Texinfo::Config
use Texinfo::Config;

ok(1, 'modules loading');

my $parser = Texinfo::Parser::parser();
my $tree = $parser->parse_string('@copyright{} @quotedblbase{}');
my $result = Texinfo::Convert::Text::convert_to_text($tree, {'sort_string' => 1});
is($result, 'C ,,', 'sort no encoding');

$result = Texinfo::Convert::Text::convert_to_text($tree, {'sort_string' => 1,
                                      'enabled_encoding' => 'utf-8'});

is($result, "\x{00A9} \x{201E}", 'sort utf-8');

$result = Texinfo::Convert::Text::convert_to_text($tree, {'sort_string' => 1,
                                      'enabled_encoding' => 'iso-8859-1'});

is($result, "\x{00A9} ,,", 'sort iso-8859-1');


# NOTE the following tests test low-level Perl code that it not supposed
# to be directly called in general.  XS/C functions are not called except for
# parsing and getting index information.
#
# Similar input and conversion result are tested as part
# of other tests.  Therefore this file could be removed without much
# loss in test coverage.  Some functions could be made internal in that case.

$parser = Texinfo::Parser::parser();
my $document = $parser->parse_text('@node Top

@cindex !
@cindex e
@cindex E
@cindex ``
@cindex @~e
@cindex
@cindex aaaaaaaaaaaa
@cindex @l{}
');

my $main_configuration = Texinfo::MainConfig::new();
Texinfo::Config::GNUT_initialize_customization(undef, {}, {});

# With XS, the indices information is built to Perl in this call.
my $indices_information = $document->indices_information();
my $index_entries = Texinfo::Document::Indices::merged_indices($document);
my $document_options = $main_configuration->get_customization_options_hash();
$document->register_document_options($document_options);

my $indices_sort_strings
  = Texinfo::Indices::setup_index_entries_sort_strings($document, undef,
                                      $index_entries, $indices_information);

my $sorted_index_entries
  = Texinfo::Indices::sort_indices_by_index($indices_sort_strings);

my $index_entries_sort_strings
  = Texinfo::Indices::format_index_entries_sort_strings($indices_sort_strings);

my @entries = ();
foreach my $entry (@{$sorted_index_entries->{'cp'}}) {
  push @entries, $index_entries_sort_strings->{$entry};
}

use utf8;

# When e and E are equal, e is before E as it appears before in the document
my @entries_ref = ('!', '"', 'aaaaaaaaaaaa', 'e', 'E', 'ẽ', 'ł');

is_diff(join("\n", @entries), join("\n", @entries_ref), 'sorted index entries');

my $sorted_index_entries_by_letter
 = Texinfo::Indices::sort_indices_by_letter($indices_sort_strings);

my @letter_entries_ref = (
   ['!', [ '!' ]],
   ['"' , [ '"' ]],
   ['A', [ 'aaaaaaaaaaaa' ]],
# result with accented letters separate
#   ['E', [ 'e', 'E']],
#   ['Ẽ', [ 'ẽ' ]],
   ['E', [ 'e', 'E', 'ẽ' ]],
   ['Ł', [ 'ł' ]],
);

my @letter_entries;
foreach my $letter (@{$sorted_index_entries_by_letter->{'cp'}}) {
  my $letter_entry = [$letter->{'letter'}, []];
  foreach my $entry (@{$letter->{'entries'}}) {
    push @{$letter_entry->[1]}, $index_entries_sort_strings->{$entry};
  }
  push @letter_entries, $letter_entry;
}

#{
#local $Data::Dumper::Purity = 1;
#local $Data::Dumper::Maxdepth = 2;
#local $Data::Dumper::Indent = 1;
#print STDERR "".Data::Dumper->Dump([$sorted_index_entries_by_letter])."\n";
#foreach my $letter (@{$sorted_index_entries_by_letter->{'cp'}}) {
#  print STDERR "AAA $letter->{'letter'} ".join('|',keys(%$letter))."\n";
#}
# print STDERR "".Data::Dumper->Dump([\@letter_entries])."\n";
#}

sub _letter_entries_text($) {
  my $letters_entries = shift;

  my $result = '';
  foreach my $letter_entry (@$letters_entries) {
    $result .= "$letter_entry->[0]:\n";
    $result .= join("\n", map {' '.$_} @{$letter_entry->[1]});
    $result .= "\n";
  }
  return $result;
}

#cmp_deeply (\@letter_entries, \@letter_entries_ref, 'by letter index entries');
is_diff(_letter_entries_text(\@letter_entries),
        _letter_entries_text(\@letter_entries_ref), 'by letter index entries');

$parser = Texinfo::Parser::parser();
$document = $parser->parse_text('@node Top

@cindex hhh @subentry jjj @subentry lll
@cindex hhh @subentry jjj
@cindex hhh jjj
@cindex hhh @subentry k
@cindex hhh @subentry 
@cindex hhh 
@cindex hhh @subentry jjj @subentry lll
@cindex hhh 
@cindex @samp{hhh} @subentry jjj
@cindex @kbd{hhh} @subentry @sc{jjj} @subentry @email{jjj,mymail}
@cindex @subentry aa
@cindex hhh @subentry jjj @subentry lll @sortas{A}
');

$document->register_document_options($document_options);

# the entry @cindex @subentry aa does not appear, has a missing argument
@entries_ref = (', aa', 'hhh', 'hhh', 'hhh, ', 'hhh, jjj', 'hhh, jjj',
 'hhh, jjj, A',
 'hhh, jjj, lll', 'hhh, jjj, lll', 'hhh, JJJ, mymail', 'hhh, k', 'hhh jjj');

# use Document function to sort.
# With XS, the indices information is built to Perl in this call.
my $document_sorted_index_entries
  = Texinfo::Document::Indices::sorted_indices_by_index($document);

# Texinfo::Indices to sort (and set $index_entries_sort_strings).
$indices_information = $document->indices_information();
$index_entries = Texinfo::Document::Indices::merged_indices($document);
$indices_sort_strings
  = Texinfo::Indices::setup_index_entries_sort_strings($document, undef,
                                      $index_entries, $indices_information);
$sorted_index_entries
  = Texinfo::Indices::sort_indices_by_index($indices_sort_strings);

$index_entries_sort_strings
  = Texinfo::Indices::format_index_entries_sort_strings($indices_sort_strings);

@entries = ();
foreach my $entry (@{$document_sorted_index_entries->{'cp'}}) {
  push @entries, $index_entries_sort_strings->{$entry};
}

#cmp_deeply(\@entries, \@entries_ref, 'subentry document sorted');
is_diff(join("\n", @entries), join("\n", @entries_ref), 'subentry document sorted');

@entries = ();
foreach my $entry (@{$sorted_index_entries->{'cp'}}) {
  push @entries, $index_entries_sort_strings->{$entry};
}

#print STDERR join(', ', map {"'$_'"} @entries)."\n";

#cmp_deeply(\@entries, \@entries_ref, 'subentry sorted');
is_diff(join("\n", @entries), join("\n", @entries_ref), 'subentry sorted');

