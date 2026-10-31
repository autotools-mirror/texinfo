# Copyright 2026 Free Software Foundation, Inc.

# This is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#   
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <http://www.gnu.org/licenses/>.

# This is the same as code provided to Lilypond

sub test_lower_case_label_target_name {
  my ($converter, $normalized, $node_contents, $default_target) = @_;

  return lc($default_target);
}

texinfo_register_file_id_setting_function('label_target_name',
                                     \&test_lower_case_label_target_name);

sub test_lower_case_node_file_name {
  my ($converter, $element, $file_name) = @_;

  return lc($file_name);
}

texinfo_register_file_id_setting_function('node_file_name',
                                        \&test_lower_case_node_file_name);

sub test_lower_case_redirection_file_names {
  my ($converter, $target_element, $filename, $node_redirection_filename,
     $reference_redirection_files) = @_;

  my $added_redirection_file = lc($node_redirection_filename);
  return @$reference_redirection_files
    if ($added_redirection_file eq $filename);
  foreach my $redirection_file (@$reference_redirection_files) {
    if ($added_redirection_file eq $redirection_file
        or ($converter->get_conf('CASE_INSENSITIVE_FILENAMES')
            and $added_redirection_file eq lc($redirection_file))) {
      return @$reference_redirection_files;
    }
  }
  return @$reference_redirection_files, $added_redirection_file;
}

texinfo_register_file_id_setting_function('redirection_file_names',
                                  \&test_lower_case_redirection_file_names);

1;
