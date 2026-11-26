use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'itemx_in_itemize_enumerate_in_table'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@strong l1
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item}
       {spaces_after_argument:\\n}
    *table_definition C6
     {empty_line:\\n}
     *paragraph C1
      {normal_text:In item, nested itemize\\n}
     *normal_command@itemize C3 l5
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *before_item C1
       *normal_command@itemx C1 l6
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:in nested itemize itemx}
         {spaces_after_argument:\\n}
      *normal_command@end C1 l7
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:itemize}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *normal_command@enumerate C3 l9
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *before_item C1
       *normal_command@itemx C1 l10
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:in nested enumerate itemx}
         {spaces_after_argument:\\n}
      *normal_command@end C1 l11
      |text_arg:{enumerate}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:enumerate}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
   *normal_command@end C1 l13
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'itemx_in_itemize_enumerate_in_table'} = '@table @strong
@item item

In item, nested itemize
@itemize
@itemx in nested itemize itemx
@end itemize

@enumerate
@itemx in nested enumerate itemx
@end enumerate

@end table
';


$result_texts{'itemx_in_itemize_enumerate_in_table'} = 'item

In item, nested itemize
in nested itemize itemx

in nested enumerate itemx

';

$result_errors{'itemx_in_itemize_enumerate_in_table'} = '* E l6|@itemx outside of table or list
 @itemx outside of table or list

* W l5|@itemize has text but no @item
 warning: @itemize has text but no @item

* E l10|@itemx outside of table or list
 @itemx outside of table or list

* W l9|@enumerate has text but no @item
 warning: @enumerate has text but no @item

';

$result_nodes_list{'itemx_in_itemize_enumerate_in_table'} = '';

$result_sections_list{'itemx_in_itemize_enumerate_in_table'} = '';

$result_sectioning_root{'itemx_in_itemize_enumerate_in_table'} = '';

$result_headings_list{'itemx_in_itemize_enumerate_in_table'} = '';


$result_converted{'plaintext'}->{'itemx_in_itemize_enumerate_in_table'} = '*item*

     In item, nested itemize

';


$result_converted{'xml'}->{'itemx_in_itemize_enumerate_in_table'} = '<table commandarg="strong" endspaces=" ">
<tableentry><tableterm><item><itemformat command="strong"> item</itemformat></item>
</tableterm><tableitem>
<para>In item, nested itemize
</para><itemize endspaces=" ">
<beforefirstitem><itemx> in nested itemize itemx</itemx>
</beforefirstitem></itemize>

<enumerate first="1" endspaces=" ">
<beforefirstitem><itemx> in nested enumerate itemx</itemx>
</beforefirstitem></enumerate>

</tableitem></tableentry></table>
';

1;
