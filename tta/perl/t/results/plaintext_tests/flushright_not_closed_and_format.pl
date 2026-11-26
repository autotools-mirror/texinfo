use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'flushright_not_closed_and_format'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@flushright C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:flushright\\n}
   {empty_line:\\n}
   *normal_command@quotation C3 l4
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    *paragraph C1
     {normal_text:A quot---ation\\n}
    *normal_command@end C1 l6
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
';


$result_texis{'flushright_not_closed_and_format'} = '@flushright
flushright

@quotation 
A quot---ation
@end quotation
';


$result_texts{'flushright_not_closed_and_format'} = 'flushright

A quot--ation
';

$result_errors{'flushright_not_closed_and_format'} = '* E l1|no matching `@end flushright\'
 no matching `@end flushright\'

';

$result_nodes_list{'flushright_not_closed_and_format'} = '';

$result_sections_list{'flushright_not_closed_and_format'} = '';

$result_sectioning_root{'flushright_not_closed_and_format'} = '';

$result_headings_list{'flushright_not_closed_and_format'} = '';


$result_converted{'plaintext'}->{'flushright_not_closed_and_format'} = '                                                             flushright

                                                          A quot--ation
';

1;
