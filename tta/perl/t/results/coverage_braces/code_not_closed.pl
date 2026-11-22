use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'code_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *normal_command@code C1 l1
    *brace_container C1
     {normal_text:in code}
';


$result_texis{'code_not_closed'} = '@code{in code}';


$result_texts{'code_not_closed'} = 'in code';

$result_errors{'code_not_closed'} = '* E l1|@code missing closing brace
 @code missing closing brace

';

$result_nodes_list{'code_not_closed'} = '';

$result_sections_list{'code_not_closed'} = '';

$result_sectioning_root{'code_not_closed'} = '';

$result_headings_list{'code_not_closed'} = '';

1;
