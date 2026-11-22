use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_first_on_itemize_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@itemize C3 l1
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment on itemize line}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:first\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'comment_first_on_itemize_line'} = '@itemize @c comment on itemize line
@item first
@end itemize
';


$result_texts{'comment_first_on_itemize_line'} = 'first
';

$result_errors{'comment_first_on_itemize_line'} = '';

$result_nodes_list{'comment_first_on_itemize_line'} = '';

$result_sections_list{'comment_first_on_itemize_line'} = '';

$result_sectioning_root{'comment_first_on_itemize_line'} = '';

$result_headings_list{'comment_first_on_itemize_line'} = '';


$result_converted{'plaintext'}->{'comment_first_on_itemize_line'} = '   • first
';


$result_converted{'html_text'}->{'comment_first_on_itemize_line'} = '<ul class="itemize mark-bullet">
<li>first
</li></ul>
';


$result_converted{'xml'}->{'comment_first_on_itemize_line'} = '<itemize endspaces=" "> <!-- c comment on itemize line -->
<listitem><prepend>&bullet;</prepend> <para>first
</para></listitem></itemize>
';

1;
