use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'math_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@math C1 l1
    *brace_arg C1
     {normal_text:\\delta + 2}
';


$result_texis{'math_not_closed'} = '@math{\\delta + 2}';


$result_texts{'math_not_closed'} = '\\delta + 2';

$result_errors{'math_not_closed'} = '* E l1|@math missing closing brace
 @math missing closing brace

';

$result_nodes_list{'math_not_closed'} = '';

$result_sections_list{'math_not_closed'} = '';

$result_sectioning_root{'math_not_closed'} = '';

$result_headings_list{'math_not_closed'} = '';

1;
