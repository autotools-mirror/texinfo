use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'math_not_closed'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@math C1 l1
    *brace_command_context C1
     {\\delta + 2}
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
