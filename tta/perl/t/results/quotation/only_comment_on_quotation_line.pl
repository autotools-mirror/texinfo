use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'only_comment_on_quotation_line'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@quotation C3 l1
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In quotation\\n}
   *normal_command@end C1 l3
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'only_comment_on_quotation_line'} = '@quotation @c comment
In quotation
@end quotation
';


$result_texts{'only_comment_on_quotation_line'} = 'In quotation
';

$result_errors{'only_comment_on_quotation_line'} = '';

$result_nodes_list{'only_comment_on_quotation_line'} = '';

$result_sections_list{'only_comment_on_quotation_line'} = '';

$result_sectioning_root{'only_comment_on_quotation_line'} = '';

$result_headings_list{'only_comment_on_quotation_line'} = '';


$result_converted{'plaintext'}->{'only_comment_on_quotation_line'} = '     In quotation
';


$result_converted{'html_text'}->{'only_comment_on_quotation_line'} = '<blockquote class="quotation">
<p>In quotation
</p></blockquote>
';


$result_converted{'xml'}->{'only_comment_on_quotation_line'} = '<quotation endspaces=" "> <!-- c comment -->
<para>In quotation
</para></quotation>
';


$result_converted{'docbook'}->{'only_comment_on_quotation_line'} = '<blockquote><para>In quotation
</para></blockquote>';

1;
