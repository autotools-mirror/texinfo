use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_node_normalization'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C5 l1 {ToP}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ToP}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@xref C1 l3
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:TOP}
   {normal_text:. }
   *normal_command@xref C1 l3
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:tOP}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:tOP}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'top_node_normalization'} = '@node ToP

@xref{TOP}. @xref{tOP}.

@menu
* tOP::
@end menu
';


$result_texts{'top_node_normalization'} = '
TOP. tOP.

* tOP::
';

$result_errors{'top_node_normalization'} = '* W l3|@xref to `TOP\', different from node name `ToP\'
 warning: @xref to `TOP\', different from node name `ToP\'

* W l3|@xref to `tOP\', different from node name `ToP\'
 warning: @xref to `tOP\', different from node name `ToP\'

* W l6|@menu entry node name `tOP\' different from node name `ToP\'
 warning: @menu entry node name `tOP\' different from node name `ToP\'

';

$result_nodes_list{'top_node_normalization'} = '1|ToP
 menus:
  tOP
 node_directions:
  next->ToP
';

$result_sections_list{'top_node_normalization'} = '';

$result_sectioning_root{'top_node_normalization'} = '';

$result_headings_list{'top_node_normalization'} = '';


$result_converted{'info'}->{'top_node_normalization'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: Top,  Up: (dir)

*Note ToP::.  *Note ToP::.

* Menu:

* tOP::


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
