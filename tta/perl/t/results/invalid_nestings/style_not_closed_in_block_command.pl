use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'style_not_closed_in_block_command'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@cartouche C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:cartouche }
    *normal_command@code C1 l2
     *brace_container C1
      {normal_text:in code \\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
';


$result_texis{'style_not_closed_in_block_command'} = '@cartouche
cartouche @code{in code 
}@end cartouche
';


$result_texts{'style_not_closed_in_block_command'} = 'cartouche in code 
';

$result_errors{'style_not_closed_in_block_command'} = '* E l2|@end cartouche seen before @code closing brace
 @end cartouche seen before @code closing brace

';

$result_nodes_list{'style_not_closed_in_block_command'} = '';

$result_sections_list{'style_not_closed_in_block_command'} = '';

$result_sectioning_root{'style_not_closed_in_block_command'} = '';

$result_headings_list{'style_not_closed_in_block_command'} = '';

1;
