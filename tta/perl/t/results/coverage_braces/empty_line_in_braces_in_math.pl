use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line_in_braces_in_math'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@math C1 l1
    *brace_arg C3
     {normal_text:a}
     *balanced_braces C3 l1
      {normal_text:{bb\\n}
      {empty_line:\\n}
      {normal_text:c}}
     {normal_text:d}
';


$result_texis{'empty_line_in_braces_in_math'} = '@math{a{bb

c}d}';


$result_texts{'empty_line_in_braces_in_math'} = 'a{bb

c}d';

$result_errors{'empty_line_in_braces_in_math'} = '';

$result_nodes_list{'empty_line_in_braces_in_math'} = '';

$result_sections_list{'empty_line_in_braces_in_math'} = '';

$result_sectioning_root{'empty_line_in_braces_in_math'} = '';

$result_headings_list{'empty_line_in_braces_in_math'} = '';

1;
