use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_item_tab'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l1
     |EXTRA
     |misc_args:A{1.0}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:1.0}
       {spaces_after_argument:\\n}
   *multitable_body C4
    *row C1
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
      {empty_line:\\n}
    *row C1
    |EXTRA
    |row_number:{2}
     *@item C1 l4
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
    *row C1
    |EXTRA
    |row_number:{3}
     *@item C2 l5
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:text\\n}
    *row C1
    |EXTRA
    |row_number:{4}
     *@item C1 l6
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l9
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l9
     |EXTRA
     |misc_args:A{0.5|0.5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.5 0.5}
       {spaces_after_argument:\\n}
   *multitable_body C8
    *row C1
    |EXTRA
    |row_number:{1}
     *@item C2 l10
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
      {empty_line:\\n}
    *row C1
    |EXTRA
    |row_number:{2}
     *@item C1 l12
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
    *row C1
    |EXTRA
    |row_number:{3}
     *@item C3 l13
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:only item\\n}
      {empty_line:\\n}
    *row C2
    |EXTRA
    |row_number:{4}
     *@item C2 l15
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:item text }
     *@tab C1 l15
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
    *row C2
    |EXTRA
    |row_number:{5}
     *@item C2 l16
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:item new line\\n}
     *@tab C2 l17
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
      {empty_line:\\n}
    *row C2
    |EXTRA
    |row_number:{6}
     *@item C1 l19
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
     *@tab C1 l19
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
    *row C2
    |EXTRA
    |row_number:{7}
     *@item C1 l20
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
     *@tab C2 l21
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command:\\n}
      {empty_line:\\n}
    *row C2
    |EXTRA
    |row_number:{8}
     *@item C2 l23
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:not empty }
     *@tab C2 l23
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:tab not empty\\n}
   *@end C1 l24
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_item_tab'} = '@multitable @columnfractions 1.0
@item

@item
@item text
@item
@end multitable

@multitable @columnfractions 0.5 0.5
@item

@item
@item only item

@item item text @tab
@item item new line
@tab

@item @tab
@item
@tab

@item not empty @tab tab not empty
@end multitable
';


$result_texts{'empty_item_tab'} = '
text


only item

item text item new line


not empty tab not empty
';

$result_errors{'empty_item_tab'} = '';

$result_nodes_list{'empty_item_tab'} = '';

$result_sections_list{'empty_item_tab'} = '';

$result_sectioning_root{'empty_item_tab'} = '';

$result_headings_list{'empty_item_tab'} = '';


$result_converted{'plaintext'}->{'empty_item_tab'} = 'text

only item

item text
item new line
not empty                            tab not empty
';


$result_converted{'html_text'}->{'empty_item_tab'} = '<table class="multitable">
<tbody><tr><td width="100%"></td></tr>
<tr><td width="100%"></td></tr>
<tr><td width="100%">text</td></tr>
<tr><td width="100%"></td></tr>
</tbody>
</table>

<table class="multitable">
<tbody><tr><td width="50%"></td></tr>
<tr><td width="50%"></td></tr>
<tr><td width="50%">only item</td></tr>
<tr><td width="50%">item text</td><td width="50%"></td></tr>
<tr><td width="50%">item new line</td><td width="50%"></td></tr>
<tr><td width="50%"></td><td width="50%"></td></tr>
<tr><td width="50%"></td><td width="50%"></td></tr>
<tr><td width="50%">not empty</td><td width="50%">tab not empty</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'empty_item_tab'} = '<multitable endspaces=" "><columnfractions line=" 1.0"><columnfraction value="1.0"></columnfraction></columnfractions>
<tbody><row><entry command="item">

</entry></row><row><entry command="item">
</entry></row><row><entry command="item"> <para>text
</para></entry></row><row><entry command="item">
</entry></row></tbody></multitable>

<multitable endspaces=" "><columnfractions line=" 0.5 0.5"><columnfraction value="0.5"></columnfraction><columnfraction value="0.5"></columnfraction></columnfractions>
<tbody><row><entry command="item">

</entry></row><row><entry command="item">
</entry></row><row><entry command="item"> <para>only item
</para>
</entry></row><row><entry command="item"> <para>item text </para></entry><entry command="tab">
</entry></row><row><entry command="item"> <para>item new line
</para></entry><entry command="tab">

</entry></row><row><entry command="item"> </entry><entry command="tab">
</entry></row><row><entry command="item">
</entry><entry command="tab">

</entry></row><row><entry command="item"> <para>not empty </para></entry><entry command="tab"> <para>tab not empty
</para></entry></row></tbody></multitable>
';

1;
