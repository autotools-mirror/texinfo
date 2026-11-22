use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'braces_for_line_command'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@settitle C1 l1
    *line_arg C4
     {normal_text:In title }
     *normal_command@sc C1 l1
      *brace_container C1
       {normal_text:my string}
     {normal_text: NEXT}
     {spaces_after_argument:\\n}
';


$result_texis{'braces_for_line_command'} = '@settitleIn title @sc{my string} NEXT
';


$result_texts{'braces_for_line_command'} = '';

$result_errors{'braces_for_line_command'} = '* E l1|misplaced {
 misplaced {

* E l1|misplaced }
 misplaced }

';

$result_nodes_list{'braces_for_line_command'} = '';

$result_sections_list{'braces_for_line_command'} = '';

$result_sectioning_root{'braces_for_line_command'} = '';

$result_headings_list{'braces_for_line_command'} = '';

1;
