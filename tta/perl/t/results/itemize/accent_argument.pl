use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accent_argument'} = '*document_root C1
 *before_node_section C6
  *preamble
  *normal_command@itemize C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@~ C1 l1
      *following_arg C1
       {normal_text:e}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item\\n}
   *normal_command@end C1 l3
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l5
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@~ C1 l5
      *brace_container C1
       {normal_text:e}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l6
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item\\n}
   *normal_command@end C1 l7
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@ringaccent C2 l9
      {spaces_after_cmd_before_arg: }
      *following_arg C1
       {normal_text:a}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l10
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item\\n}
   *normal_command@end C1 l11
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'accent_argument'} = '@itemize @~e
@item item
@end itemize

@itemize @~{e}
@item item
@end itemize

@itemize @ringaccent a
@item item
@end itemize
';


$result_texts{'accent_argument'} = 'item

item

item
';

$result_errors{'accent_argument'} = '';

$result_nodes_list{'accent_argument'} = '';

$result_sections_list{'accent_argument'} = '';

$result_sectioning_root{'accent_argument'} = '';

$result_headings_list{'accent_argument'} = '';


$result_converted{'plaintext'}->{'accent_argument'} = '   ẽ item

   ẽ item

   å item
';


$result_converted{'html_text'}->{'accent_argument'} = '<ul class="itemize" style="list-style-type: \'\\1EBD \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\1EBD \'">
<li>item
</li></ul>

<ul class="itemize" style="list-style-type: \'\\00E5 \'">
<li>item
</li></ul>
';


$result_converted{'xml'}->{'accent_argument'} = '<itemize endspaces=" "><itemprepend> <accent type="tilde" bracketed="off">e</accent></itemprepend>
<listitem><prepend><accent type="tilde" bracketed="off">e</accent></prepend> <para>item
</para></listitem></itemize>

<itemize endspaces=" "><itemprepend> <accent type="tilde">e</accent></itemprepend>
<listitem><prepend><accent type="tilde">e</accent></prepend> <para>item
</para></listitem></itemize>

<itemize endspaces=" "><itemprepend> <accent type="ring" bracketed="off"> </accent></itemprepend>
<listitem><prepend><accent type="ring" bracketed="off"> </accent></prepend> <para>item
</para></listitem></itemize>
';

1;
