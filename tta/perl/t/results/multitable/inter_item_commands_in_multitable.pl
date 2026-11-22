use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inter_item_commands_in_multitable'} = '*document_root C1
 *before_node_section C7
  *preamble_before_content
  *normal_command@multitable C4 l1
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:truc}
     {spaces_after_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment before first item}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *multitable_body C2
    *row C1
    |row_number:{1}
     *normal_command@item C5 l4
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:truc\\n}
      {empty_line:\\n}
      *index_entry_command@cindex C1 l6
      |index_entry:I{cp,1}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:index entry between empty lines}
        {spaces_after_argument:\\n}
      {empty_line:\\n}
    *row C1
    |row_number:{2}
     *normal_command@item C2 l8
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:trouc\\n}
       *normal_command@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:last comment}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C4 l12
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l12
     |misc_args:A{0.6|0.4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.6 0.4}
       {spaces_after_argument:\\n}
   *multitable_head C1
    *row C2
    |row_number:{1}
     *normal_command@headitem C2 l13
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable headitem }
     *normal_command@tab C2 l13
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:another tab\\n}
   *multitable_body C3
    *row C2
    |row_number:{2}
     *normal_command@item C2 l14
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable item }
     *normal_command@tab C2 l14
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:multitable tab\\n}
       *normal_command@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:comment in multitable}
         {spaces_after_argument:\\n}
    *row C2
    |row_number:{3}
     *normal_command@item C2 l16
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable item 2 }
     *normal_command@tab C2 l16
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:multitable tab 2\\n}
       *index_entry_command@cindex C1 l17
       |index_entry:I{cp,2}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:index entry within multitable}
         {spaces_after_argument:\\n}
    *row C1
    |row_number:{4}
     *normal_command@item C2 l18
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:lone mu--ltitable item\\n}
   *normal_command@end C1 l19
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C4 l21
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *bracketed_arg C1 l21
      {normal_text:thing}
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C2
     {normal_text:Title\\n}
     *index_entry_command@cindex C1 l23
     |index_entry:I{cp,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex}
       {spaces_after_argument:\\n}
   *multitable_body C1
    *row C1
    |row_number:{1}
     *normal_command@item C2 l24
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:thing\\n}
   *normal_command@end C1 l25
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'inter_item_commands_in_multitable'} = '@multitable {truc}
@c comment before first item

@item truc

@cindex index entry between empty lines

@item trouc
@c last comment
@end multitable

@multitable @columnfractions 0.6 0.4
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@item lone mu--ltitable item
@end multitable

@multitable {thing}
Title
@cindex cindex
@item thing
@end multitable

';


$result_texts{'inter_item_commands_in_multitable'} = '
truc


trouc

mu-ltitable headitem another tab
mu-ltitable item multitable tab
mu-ltitable item 2 multitable tab 2
lone mu-ltitable item

Title
thing

';

$result_errors{'inter_item_commands_in_multitable'} = '* W l6|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l17|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l23|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'inter_item_commands_in_multitable'} = '';

$result_sections_list{'inter_item_commands_in_multitable'} = '';

$result_sectioning_root{'inter_item_commands_in_multitable'} = '';

$result_headings_list{'inter_item_commands_in_multitable'} = '';

$result_indices_sort_strings{'inter_item_commands_in_multitable'} = 'cp:
 cindex
 index entry between empty lines
 index entry within multitable
';


$result_converted{'plaintext'}->{'inter_item_commands_in_multitable'} = 'truc

trouc

mu-ltitable headitem                        another tab
--------------------------------------------------------------------------
mu-ltitable item                            multitable tab
mu-ltitable item 2                          multitable tab 2
lone mu-ltitable item

Title
thing

';

$result_converted_sort_strings{'plaintext'}->{'inter_item_commands_in_multitable'} = 'cp:
 cindex
 index entry between empty lines
 index entry within multitable
';


$result_converted{'html_text'}->{'inter_item_commands_in_multitable'} = '<table class="multitable">
<tbody><tr><td>truc

<a class="index-entry-id" id="index-index-entry-between-empty-lines"></a></td></tr>
<tr><td>trouc</td></tr>
</tbody>
</table>

<table class="multitable">
<thead><tr><th width="60%">mu&ndash;ltitable headitem</th><th width="40%">another tab</th></tr></thead>
<tbody><tr><td width="60%">mu&ndash;ltitable item</td><td width="40%">multitable tab</td></tr>
<tr><td width="60%">mu&ndash;ltitable item 2</td><td width="40%">multitable tab 2
<a class="index-entry-id" id="index-index-entry-within-multitable"></a></td></tr>
<tr><td width="60%">lone mu&ndash;ltitable item</td></tr>
</tbody>
</table>

<table class="multitable">
<tr><td>Title
<a class="index-entry-id" id="index-cindex"></a></td></tr>
<tbody><tr><td>thing</td></tr>
</tbody>
</table>

';


$result_converted{'xml'}->{'inter_item_commands_in_multitable'} = '<multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">truc</columnprototype>
</columnprototypes>
<beforefirstitem><!-- c comment before first item -->

</beforefirstitem><tbody><row><entry command="item"> <para>truc
</para>
<cindex index="cp"> <indexterm index="cp" number="1">index entry between empty lines</indexterm></cindex>

</entry></row><row><entry command="item"> <para>trouc
<!-- c last comment -->
</para></entry></row></tbody></multitable>

<multitable endspaces=" "><columnfractions line=" 0.6 0.4"><columnfraction value="0.6"></columnfraction><columnfraction value="0.4"></columnfraction></columnfractions>
<thead><row><entry command="headitem"> <para>mu&textndash;ltitable headitem </para></entry><entry command="tab"> <para>another tab
</para></entry></row></thead><tbody><row><entry command="item"> <para>mu&textndash;ltitable item </para></entry><entry command="tab"> <para>multitable tab
<!-- c comment in multitable -->
</para></entry></row><row><entry command="item"> <para>mu&textndash;ltitable item 2 </para></entry><entry command="tab"> <para>multitable tab 2
<cindex index="cp"> <indexterm index="cp" number="2">index entry within multitable</indexterm></cindex>
</para></entry></row><row><entry command="item"> <para>lone mu&textndash;ltitable item
</para></entry></row></tbody></multitable>

<multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">thing</columnprototype>
</columnprototypes>
<beforefirstitem><para>Title
<cindex index="cp"> <indexterm index="cp" number="3">cindex</indexterm></cindex>
</para></beforefirstitem><tbody><row><entry command="item"> <para>thing
</para></entry></row></tbody></multitable>

';

1;
