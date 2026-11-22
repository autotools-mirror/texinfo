use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'asis_as_itemize_argument'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@itemize C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis l1
     {spaces_after_argument:\\n}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:as is\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'asis_as_itemize_argument'} = '@itemize @asis
@item as is
@end itemize
';


$result_texts{'asis_as_itemize_argument'} = 'as is
';

$result_errors{'asis_as_itemize_argument'} = '* W l1|@asis expected braces
 warning: @asis expected braces

';

$result_nodes_list{'asis_as_itemize_argument'} = '';

$result_sections_list{'asis_as_itemize_argument'} = '';

$result_sectioning_root{'asis_as_itemize_argument'} = '';

$result_headings_list{'asis_as_itemize_argument'} = '';


$result_converted{'plaintext'}->{'asis_as_itemize_argument'} = '     as is
';


$result_converted{'html_text'}->{'asis_as_itemize_argument'} = '<ul class="itemize">
<li>as is
</li></ul>
';


$result_converted{'xml'}->{'asis_as_itemize_argument'} = '<itemize commandarg="asis" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>as is
</para></listitem></itemize>
';

1;
