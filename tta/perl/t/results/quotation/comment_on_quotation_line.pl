use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_on_quotation_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@quotation C3 l1
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:truc}
     *normal_command@ 
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:quotation }
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


$result_texis{'comment_on_quotation_line'} = '@quotation truc@ @c quotation 
In quotation
@end quotation
';


$result_texts{'comment_on_quotation_line'} = 'truc 
In quotation
';

$result_errors{'comment_on_quotation_line'} = '';

$result_nodes_list{'comment_on_quotation_line'} = '';

$result_sections_list{'comment_on_quotation_line'} = '';

$result_sectioning_root{'comment_on_quotation_line'} = '';

$result_headings_list{'comment_on_quotation_line'} = '';


$result_converted{'plaintext'}->{'comment_on_quotation_line'} = '     truc : In quotation
';


$result_converted{'html_text'}->{'comment_on_quotation_line'} = '<blockquote class="quotation">
<p><b class="b">truc&nbsp;:</b> In quotation
</p></blockquote>
';


$result_converted{'xml'}->{'comment_on_quotation_line'} = '<quotation endspaces=" "><quotationtype> truc<spacecmd type="spc"/></quotationtype><!-- c quotation  -->
<para>In quotation
</para></quotation>
';


$result_converted{'docbook'}->{'comment_on_quotation_line'} = '<blockquote><para><emphasis role="bold">truc&#160;<!-- quotation  -->
:</emphasis> In quotation
</para></blockquote>';

1;
