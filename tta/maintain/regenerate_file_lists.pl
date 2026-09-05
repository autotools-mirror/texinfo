#! /usr/bin/env perl
# Copyright 2011-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# Originally written by Patrice Dumas.

use strict;

use warnings;

use File::Find;
use File::Basename;
use File::Spec;

my ($program_name, $mydir, $suffix) = fileparse($0);
my $updir = File::Spec->updir();
my $parent = join('/', ($mydir, $updir, 'perl'));
chdir($parent) || die "chdir $parent: $!";
-d "t" || (die "goodbye, no t directory in " . `pwd`);

my @files;
my @dirs;
find(\&wanted, ('t'));
sub wanted  {
  if (/\.pl$/ and $File::Find::dir =~ m;^t/results/[^/]+;) {
    push @files, $File::Find::name;
  } elsif (($File::Find::name =~ m;^t/results/[^/]+$;
            or $File::Find::name =~ m;^t/results/[^/]+/[^/]+$;
            or $File::Find::name =~ m;^t/results/[^/]+/[^/]+/res_[^/]+$;)
              and -d $_) {
    push @dirs, $File::Find::name;
  } elsif ($File::Find::dir =~ m;^t/results/[^/]+/[^/]+/res_[^/]+;) {
    if (-d $_) {
      push @dirs, $File::Find::name;
    } else {
      push @files, $File::Find::name;
    }
  }# else {
  #  print STDERR "I: $File::Find::name\n";
  #}
}

open(DIRS, '>t/test_dirs_generated_list.txt')
  or die "Open t/test_dirs_generated_list.txt failed: $!";
foreach my $dir (sort(@dirs)) {
  print DIRS "$dir\n";
}

close(DIRS) or die "t/test_dirs_generated_list.txt: error closing: $!";

open(FILES, '>t/test_files_generated_list.txt')
   or die "Open t/test_files_generated_list.txt failed: $!";
foreach my $file (sort(@files)) {
  print FILES "$file\n";
}
close(FILES) or die "t/test_files_generated_list.txt: error closing: $!";

