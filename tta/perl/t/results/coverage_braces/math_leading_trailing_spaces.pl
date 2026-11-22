use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'math_leading_trailing_spaces'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *@math C1 l1
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:a = b}
     {spaces_after_argument: }
';


$result_texis{'math_leading_trailing_spaces'} = '@math{ a = b }';


$result_texts{'math_leading_trailing_spaces'} = 'a = b';

$result_errors{'math_leading_trailing_spaces'} = '';

$result_nodes_list{'math_leading_trailing_spaces'} = '';

$result_sections_list{'math_leading_trailing_spaces'} = '';

$result_sectioning_root{'math_leading_trailing_spaces'} = '';

$result_headings_list{'math_leading_trailing_spaces'} = '';

1;
