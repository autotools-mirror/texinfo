use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'flushright_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@flushright C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:text flushed right\\n}
';


$result_texis{'flushright_not_closed'} = '@flushright

text flushed right
';


$result_texts{'flushright_not_closed'} = '
text flushed right
';

$result_errors{'flushright_not_closed'} = '* E l1|no matching `@end flushright\'
 no matching `@end flushright\'

';

$result_nodes_list{'flushright_not_closed'} = '';

$result_sections_list{'flushright_not_closed'} = '';

$result_sectioning_root{'flushright_not_closed'} = '';

$result_headings_list{'flushright_not_closed'} = '';

1;
