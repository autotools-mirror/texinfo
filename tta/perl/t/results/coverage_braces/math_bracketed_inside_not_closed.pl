use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'math_bracketed_inside_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@math C1 l1
    *brace_arg C3
     *balanced_braces C1 l1
      {normal_text:{x^i}}
     {normal_text:\\over}
     *balanced_braces C1 l1
      {normal_text:{\\tan}}
';


$result_texis{'math_bracketed_inside_not_closed'} = '@math{{x^i}\\over{\\tan}}';


$result_texts{'math_bracketed_inside_not_closed'} = '{x^i}\\over{\\tan}';

$result_errors{'math_bracketed_inside_not_closed'} = '* E l1|@math missing closing brace
 @math missing closing brace

';

$result_nodes_list{'math_bracketed_inside_not_closed'} = '';

$result_sections_list{'math_bracketed_inside_not_closed'} = '';

$result_sectioning_root{'math_bracketed_inside_not_closed'} = '';

$result_headings_list{'math_bracketed_inside_not_closed'} = '';

1;
