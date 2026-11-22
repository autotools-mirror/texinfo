use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_and_itemx_before_item'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l1
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C2
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l3
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in itemx}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l4
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'comment_and_itemx_before_item'} = '@table @code
@c comment
@itemx in itemx
@end table
';


$result_texts{'comment_and_itemx_before_item'} = 'in itemx
';

$result_errors{'comment_and_itemx_before_item'} = '* E l3|@itemx should not begin @table
 @itemx should not begin @table

';

$result_nodes_list{'comment_and_itemx_before_item'} = '';

$result_sections_list{'comment_and_itemx_before_item'} = '';

$result_sectioning_root{'comment_and_itemx_before_item'} = '';

$result_headings_list{'comment_and_itemx_before_item'} = '';


$result_converted{'plaintext'}->{'comment_and_itemx_before_item'} = '‘in itemx’
';


$result_converted{'html_text'}->{'comment_and_itemx_before_item'} = '<dl class="table">
<dt><dt><code class="code">in itemx</code></dt>
</dl>
';


$result_converted{'xml'}->{'comment_and_itemx_before_item'} = '<table commandarg="code" endspaces=" ">
<tableentry><tableterm><!-- c comment -->
<itemx><itemformat command="code"> in itemx</itemformat></itemx>
</tableterm></tableentry></table>
';


$result_converted{'docbook'}->{'comment_and_itemx_before_item'} = '<variablelist><varlistentry><term><!-- comment -->
<term><literal>in itemx</literal>
</term></varlistentry></variablelist>';

1;
