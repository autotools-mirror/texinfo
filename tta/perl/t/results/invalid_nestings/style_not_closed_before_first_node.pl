use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'style_not_closed_before_first_node'} = '*document_root C2
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@code C1 l1
    *brace_container C2
     {normal_text:in code\\n}
     {empty_line:\\n}
 *normal_command@node C2 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:In node\\n}
';


$result_texis{'style_not_closed_before_first_node'} = '@code{in code

}@node Top
In node
';


$result_texts{'style_not_closed_before_first_node'} = 'in code

In node
';

$result_errors{'style_not_closed_before_first_node'} = '* E l1|@code missing closing brace
 @code missing closing brace

';

$result_nodes_list{'style_not_closed_before_first_node'} = '1|Top
';

$result_sections_list{'style_not_closed_before_first_node'} = '';

$result_sectioning_root{'style_not_closed_before_first_node'} = '';

$result_headings_list{'style_not_closed_before_first_node'} = '';

1;
