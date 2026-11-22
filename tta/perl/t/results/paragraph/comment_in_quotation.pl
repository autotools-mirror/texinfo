use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_in_quotation'} = '*document_root C1
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@quotation C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:Quotation }
    *normal_command@c C1
     *line_arg C2
      {rawline_text:}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l4
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:Quotation no space}
    *normal_command@c C1
     *line_arg C2
      {rawline_text:}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument: \\n}
';


$result_texis{'comment_in_quotation'} = '
@quotation
Quotation @c
@end quotation 

@quotation
Quotation no space@c
@end quotation 
';


$result_texts{'comment_in_quotation'} = 'Quotation 
Quotation no space';

$result_errors{'comment_in_quotation'} = '';

$result_nodes_list{'comment_in_quotation'} = '';

$result_sections_list{'comment_in_quotation'} = '';

$result_sectioning_root{'comment_in_quotation'} = '';

$result_headings_list{'comment_in_quotation'} = '';


$result_converted{'plaintext'}->{'comment_in_quotation'} = '     Quotation

     Quotation no space
';


$result_converted{'html_text'}->{'comment_in_quotation'} = '<blockquote class="quotation">
<p>Quotation </p></blockquote>

<blockquote class="quotation">
<p>Quotation no space</p></blockquote>
';

1;
