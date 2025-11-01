use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'table_in_itemize'} = '*document_root C1
 *before_node_section C1
  *@itemize C5 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@bullet l1
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item one\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command:\\n}
    *@table C4 l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *arguments_line C1
      *block_line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@asis l4
     *table_entry C2
      *table_term C1
       *@item C1 l5
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {table one}
      *table_definition C3
       *paragraph C1
        {aaaaa\\n}
       {empty_line:\\n}
       *paragraph C1
        {New para.\\n}
     *table_entry C2
      *table_term C1
       *@item C1 l9
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {table two}
      *table_definition C3
       *paragraph C1
        {Five\\n}
       {empty_line:\\n}
       *paragraph C1
        {New para.\\n}
     *@end C1 l13
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{table}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {table}
   *@item C2 l14
   |EXTRA
   |item_number:{3}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {item three\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
     {itemize}
';


$result_texis{'table_in_itemize'} = '@itemize @bullet
@item item one
@item
@table @asis
@item table one
aaaaa

New para.
@item table two
Five

New para.
@end table
@item item three
@end itemize';


$result_texts{'table_in_itemize'} = 'item one
table one
aaaaa

New para.
table two
Five

New para.
item three
';

$result_errors{'table_in_itemize'} = '';

$result_nodes_list{'table_in_itemize'} = '';

$result_sections_list{'table_in_itemize'} = '';

$result_sectioning_root{'table_in_itemize'} = '';

$result_headings_list{'table_in_itemize'} = '';


$result_converted{'plaintext'}->{'table_in_itemize'} = '   • item one
   • table one
          aaaaa

          New para.
     table two
          Five

          New para.
   • item three
';


$result_converted{'html_text'}->{'table_in_itemize'} = '<ul class="itemize mark-bullet">
<li>item one
</li><li><dl class="table">
<dt>table one</dt>
<dd><p>aaaaa
</p>
<p>New para.
</p></dd>
<dt>table two</dt>
<dd><p>Five
</p>
<p>New para.
</p></dd>
</dl>
</li><li>item three
</li></ul>
';


$result_converted{'xml'}->{'table_in_itemize'} = '<itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend><formattingcommand command="bullet"/></itemprepend>
<listitem><prepend>&bullet;</prepend> <para>item one
</para></listitem><listitem><prepend>&bullet;</prepend>
<table commandarg="asis" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="asis">table one</itemformat></item>
</tableterm><tableitem><para>aaaaa
</para>
<para>New para.
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="asis">table two</itemformat></item>
</tableterm><tableitem><para>Five
</para>
<para>New para.
</para></tableitem></tableentry></table>
</listitem><listitem><prepend>&bullet;</prepend> <para>item three
</para></listitem></itemize>';

1;
