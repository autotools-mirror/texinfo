use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_quotation_with_arg_followed_by_quotation'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@quotation C2 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:something}
     {spaces_after_argument:\\n}
   *@end C1 l2
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In quotation\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_quotation_with_arg_followed_by_quotation'} = '@quotation something
@end quotation

@quotation
In quotation
@end quotation
';


$result_texts{'empty_quotation_with_arg_followed_by_quotation'} = 'something

In quotation
';

$result_errors{'empty_quotation_with_arg_followed_by_quotation'} = '';

$result_nodes_list{'empty_quotation_with_arg_followed_by_quotation'} = '';

$result_sections_list{'empty_quotation_with_arg_followed_by_quotation'} = '';

$result_sectioning_root{'empty_quotation_with_arg_followed_by_quotation'} = '';

$result_headings_list{'empty_quotation_with_arg_followed_by_quotation'} = '';


$result_converted{'docbook'}->{'empty_quotation_with_arg_followed_by_quotation'} = '<blockquote></blockquote>
<blockquote><para>In quotation
</para></blockquote>';

1;
