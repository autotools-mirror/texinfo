use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'flushright_not_closed_and_format'} = '*document_root C1
 *before_node_section C1
  *@flushright C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {flushright\\n}
   {empty_line:\\n}
   *@quotation C3 l4
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument: \\n}
    *paragraph C1
     {A quot---ation\\n}
    *@end C1 l6
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{quotation}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {quotation}
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
