use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'alias_non_existing_command'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@alias C1 l1
   |EXTRA
   |misc_args:A{myalias|userdefined}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:myalias = userdefined}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:hh.\\n}
';


$result_texis{'alias_non_existing_command'} = '@alias myalias = userdefined

hh.
';


$result_texts{'alias_non_existing_command'} = '
hh.
';

$result_errors{'alias_non_existing_command'} = '* E l3|unknown command `userdefined\'
 unknown command `userdefined\'

* E l3|misplaced {
 misplaced {

* E l3|misplaced }
 misplaced }

';

$result_nodes_list{'alias_non_existing_command'} = '';

$result_sections_list{'alias_non_existing_command'} = '';

$result_sectioning_root{'alias_non_existing_command'} = '';

$result_headings_list{'alias_non_existing_command'} = '';

1;
