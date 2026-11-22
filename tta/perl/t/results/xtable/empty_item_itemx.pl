use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_item_itemx'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@vtable C6 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l1
     {spaces_after_argument:\\n}
   *before_item C3
    {empty_line:\\n}
    *paragraph C1
     {normal_text:VTable\\n}
    {empty_line:\\n}
   *table_entry C1
    *table_term C3
     *normal_command@item C1 l5
     |index_entry:I{vr,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:first item}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l6
      *line_arg C1
       {spaces_before_argument:\\n}
     *normal_command@itemx C1 l7
     |index_entry:I{vr,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:after an empty itemx, before an empty item}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l8
      *line_arg C1
       {spaces_before_argument: \\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l9
     |index_entry:I{vr,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in item before end table}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_item_itemx'} = '@vtable @asis

VTable

@item first item
@itemx
@itemx after an empty itemx, before an empty item
@item 
@item in item before end table
@end vtable
';


$result_texts{'empty_item_itemx'} = '
VTable

first item

after an empty itemx, before an empty item

in item before end table
';

$result_errors{'empty_item_itemx'} = '* W l5|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l6|@itemx missing argument
 warning: @itemx missing argument

* W l7|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l8|@item missing argument
 warning: @item missing argument

* W l9|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

';

$result_nodes_list{'empty_item_itemx'} = '';

$result_sections_list{'empty_item_itemx'} = '';

$result_sectioning_root{'empty_item_itemx'} = '';

$result_headings_list{'empty_item_itemx'} = '';

$result_indices_sort_strings{'empty_item_itemx'} = 'vr:
 after an empty itemx, before an empty item
 first item
 in item before end table
';


$result_converted{'plaintext'}->{'empty_item_itemx'} = '     VTable

first item
after an empty itemx, before an empty item
in item before end table
';

$result_converted_sort_strings{'plaintext'}->{'empty_item_itemx'} = 'vr:
 after an empty itemx, before an empty item
 first item
 in item before end table
';


$result_converted{'html_text'}->{'empty_item_itemx'} = '<dl class="vtable">
<dd>
<p>VTable
</p>
</dd>
<dt><a id="index-first-item"></a><span>first item<a class="copiable-link" href="#index-first-item"> &para;</a></span></dt>
<dt><a id="index-after-an-empty-itemx_002c-before-an-empty-item"></a><span>after an empty itemx, before an empty item<a class="copiable-link" href="#index-after-an-empty-itemx_002c-before-an-empty-item"> &para;</a></span></dt>
<dt><dt><a id="index-in-item-before-end-table"></a><span>in item before end table<a class="copiable-link" href="#index-in-item-before-end-table"> &para;</a></span></dt>
</dl>
';


$result_converted{'xml'}->{'empty_item_itemx'} = '<vtable commandarg="asis" endspaces=" ">
<beforefirstitem>
<para>VTable
</para>
</beforefirstitem><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="1">first item</indexterm> first item</itemformat></item>
<itemx><itemformat command="asis"></itemformat></itemx>
<itemx><itemformat command="asis"><indexterm index="vr" number="2">after an empty itemx, before an empty item</indexterm> after an empty itemx, before an empty item</itemformat></itemx>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis"> </itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="3">in item before end table</indexterm> in item before end table</itemformat></item>
</tableterm></tableentry></vtable>
';


$result_converted{'docbook'}->{'empty_item_itemx'} = '<variablelist>
<para>VTable
</para>
<varlistentry><term><indexterm role="vr"><primary>first item</primary></indexterm>first item
</term><term>
</term><term><indexterm role="vr"><primary>after an empty itemx, before an empty item</primary></indexterm>after an empty itemx, before an empty item
</term></varlistentry><varlistentry><term>
</term></varlistentry><varlistentry><term><indexterm role="vr"><primary>in item before end table</primary></indexterm>in item before end table
</term></varlistentry></variablelist>';

1;
