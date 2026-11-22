use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line_in_braces_in_math_at_begin_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *@math C1 l1
    *brace_arg C5
     {normal_text:a\\n}
     {empty_line:\\n}
     *balanced_braces C3 l3
      {normal_text:{b\\n}
      {empty_line:\\n}
      {normal_text:}}
     {normal_text: c}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_line_in_braces_in_math_at_begin_line'} = '@math{a

{b

} c
}';


$result_texts{'empty_line_in_braces_in_math_at_begin_line'} = 'a

{b

} c';

$result_errors{'empty_line_in_braces_in_math_at_begin_line'} = '';

$result_nodes_list{'empty_line_in_braces_in_math_at_begin_line'} = '';

$result_sections_list{'empty_line_in_braces_in_math_at_begin_line'} = '';

$result_sectioning_root{'empty_line_in_braces_in_math_at_begin_line'} = '';

$result_headings_list{'empty_line_in_braces_in_math_at_begin_line'} = '';

1;
