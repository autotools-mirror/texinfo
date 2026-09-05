#! /usr/bin/env perl

# regenerate_documentlanguages-iana.pl: download the iana language file
# and regenerate Texinfo/Documentlanguages.pm language related hashes
# and gperf generated C code files.
#
# Copyright 2010-2026 Free Software Foundation, Inc.
# 
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.
#
# Original author: Patrice Dumas <pertusus@free.fr>
#
# Call that script from the tta directory for each release to keep
# the lists updated.

use strict;

use warnings;

use File::Basename;

# from gnulib/lib/bcp47.c
my %alias_ISO_script = (
   "latin",      "Latn",
   "cyrillic",   "Cyrl",
   "hebrew",     "Hebr",
   "arabic",     "Arab",
   "devanagari", "Deva",
   "gurmukhi",   "Guru",
   "mongolian",  "Mong"
);

my $dir = 'maintain/documentlanguage';
system("cd $dir && wget -N http://www.iana.org/assignments/language-subtag-registry");

open(TXT,"$dir/language-subtag-registry")
    or die "Open $dir/language-subtag-registry: $!\n";

my $entry;
my @entries;
while (<TXT>) {
 if (/^%%/) {
   push @entries, $entry if (defined($entry));
   $entry = undef;
 } else {
   if (/^(\w+): (.*)/) {
     $entry->{$1} = $2;
   }
 }
}
push @entries, $entry if (defined($entry));
if (!defined($entry->{'Type'})) {
  die "Type not defined for $entry ".join('|', keys(%$entry))."\n";
}

my $program_name = basename($0);

my $perl_document_language_out = 'perl/Texinfo/Documentlanguages.pm';
open(OUT, ">$perl_document_language_out")
       or die "Open $perl_document_language_out: $!\n";

my @languages;
my @regions;
my @scripts;
my @variants;
foreach my $entry (@entries) {
  # Scope macrolanguage are used, as well as special, partially
  if ($entry->{'Type'} eq 'language') {
    if (!defined($entry->{'Preferred-Value'})
        and (!defined($entry->{'Scope'})
             or ($entry->{'Scope'} ne 'private-use'
                 and $entry->{'Scope'} ne 'collection'
                 and ($entry->{'Scope'} ne 'special'
      # there are 4 special codes
      # mis Uncoded languages
      # mul Multiple languages
      # und Undetermined
      # zxx No linguistic content; Not applicable
      # This is not very useful, but we accept mis and und, but not mul,
      # as multiple @documentlanguage are valid, nor zxx
                      or ($entry->{'Subtag'} ne 'zxx'
                          and $entry->{'Subtag'} ne 'mul'))))) {
     push @languages, $entry->{'Subtag'};
     #print STDERR "$entry->{'Subtag'} Scope $entry->{'Scope'}\n"
     #   if defined($entry->{'Scope'});
    }
  } elsif ($entry->{'Type'} eq 'region') {
     if (!defined($entry->{'Preferred-Value'})
         and !defined($entry->{'Deprecated'})
         and $entry->{'Description'} ne 'Private use'
         and $entry->{'Subtag'} !~ /^\d{3}$/) {
      push @regions, $entry->{'Subtag'};
    }
  } elsif ($entry->{'Type'} eq 'script') {
    if ($entry->{'Description'} ne 'Private use') {
      push @scripts, $entry->{'Subtag'};
    }
  } elsif ($entry->{'Type'} eq 'variant') {
    push @variants, $entry->{'Subtag'};
  #} else {
  #  print STDERR "$entry->{'Type'}\n";
  }
}

my $declarations = "%{\n#include <config.h>\n%}\n"
                   ."%includes\n%%\n";
my $gperf_languages_file = "$dir/languages.gperf";
open(LANGUAGES, ">$gperf_languages_file") or die "Open $gperf_languages_file: $!\n";
print LANGUAGES $declarations;

my $gperf_regions_file = "$dir/regions.gperf";
open(REGIONS, ">$gperf_regions_file") or die "Open $gperf_regions_file: $!\n";
print REGIONS $declarations;

# we setup aliases, so we need to declare a structure
my $scripts_declarations = "%{\n#include <config.h>\n%}\n"
     ."struct TXI_DOCUMENT_SCRIPT { char const *name; const char *code; };\n"
                   ."%includes\n%%\n";
my $gperf_scripts_file = "$dir/scripts.gperf";
open(SCRIPTS, ">$gperf_scripts_file") or die "Open $gperf_scripts_file: $!\n";
print SCRIPTS $scripts_declarations;

my $script_names_declarations = "%{\n#include <config.h>\n%}\n"
 ."struct TXI_DOCUMENT_SCRIPT_NAME { char const *name; const char *alias; };\n"
                   ."%includes\n%%\n";
my $gperf_script_names_file = "$dir/script_names.gperf";
open(SCRIPT_NAMES, ">$gperf_script_names_file")
   or die "Open $gperf_script_names_file: $!\n";
print SCRIPT_NAMES $script_names_declarations;

my $gperf_variants_file = "$dir/variants.gperf";
open(VARIANTS, ">$gperf_variants_file") or die "Open $gperf_variants_file: $!\n";
print VARIANTS $declarations;

print OUT "# This file was automatically generated from $program_name\n\n";

print OUT "package Texinfo::Documentlanguages;\n\n";

print OUT 'our %language_codes = ('."\n";

foreach my $language (sort @languages) {
  print OUT "'$language' => 1,\n";
  print LANGUAGES "$language\n";
}
print OUT ");\n\n";

print OUT 'our %region_codes = ('."\n";

foreach my $region (@regions) {
  print OUT "'$region' => 1,\n";
  print REGIONS "$region\n";
}
print OUT ");\n\n";

print OUT 'our %scripts = ('."\n";
foreach my $script (@scripts) {
  print OUT "'$script' => 1,\n";
  print SCRIPTS "$script, 0\n";
}
print OUT ");\n\n";

print OUT 'our %documentscript_alias_ISO_script = ('."\n";
# aliases
foreach my $alias (sort(keys(%alias_ISO_script))) {
  print OUT "'$alias' => '$alias_ISO_script{$alias}',\n";
  print SCRIPTS "$alias, \"$alias_ISO_script{$alias}\"\n";
}
print OUT ");\n\n";

print OUT 'our %documentscript_XPG_script = ('."\n";
foreach my $alias (sort(keys(%alias_ISO_script))) {
  print OUT "'$alias_ISO_script{$alias}' => '$alias',\n";
  print SCRIPT_NAMES "$alias_ISO_script{$alias}, \"$alias\"\n";
}
print OUT ");\n\n";

print OUT 'our %variants = ('."\n";
foreach my $variant (@variants) {
  print OUT "'$variant' => 1,\n";
  print VARIANTS "$variant\n";
}
print OUT ");\n\n";

print OUT "1;\n";

close(LANGUAGES) or die "$gperf_languages_file: error closing: $!\n";
close(REGIONS) or die "$gperf_regions_file: error closing: $!\n";
close(SCRIPTS) or die "$gperf_scripts_file: error closing: $!\n";
close(SCRIPT_NAMES) or die "$gperf_script_names_file: error closing: $!\n";
close(VARIANTS) or die "$gperf_variants_file: error closing: $!\n";

my $command = "gperf --output-file=C/main/txi_documentlanguage_languages.c -N txi_in_language_codes $gperf_languages_file";
system($command) == 0 or die ("$command: failed: $?\n");

$command = "gperf --output-file=C/main/txi_documentlanguage_regions.c -N txi_in_language_regions $gperf_regions_file";
system($command) == 0 or die ("$command: failed: $?\n");

$command = "gperf -t --output-file=C/main/txi_documentlanguage_scripts.c -N txi_in_language_scripts $gperf_scripts_file";
system($command) == 0 or die ("$command: failed: $?\n");

$command = "gperf -t --output-file=C/main/txi_documentlanguage_script_names.c -N txi_in_language_script_names $gperf_script_names_file";
system($command) == 0 or die ("$command: failed: $?\n");

$command = "gperf --output-file=C/main/txi_documentlanguage_variants.c -N txi_in_language_variants $gperf_variants_file";
system($command) == 0 or die ("$command: failed: $?\n");

close(OUT) or die "$perl_document_language_out: error closing: $!\n";
