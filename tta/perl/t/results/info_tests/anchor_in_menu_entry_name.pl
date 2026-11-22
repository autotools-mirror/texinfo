use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_menu_entry_name'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 l4
    {menu_entry_leading_text:* }
    *menu_entry_name C4
     {normal_text:name }
     *@anchor C1 l4
     |EXTRA
     |identifier:{point}
     |is_target:{1}
      *brace_arg C1
       {normal_text:point}
     {spaces_after_close_brace: }
     {normal_text:after anchor}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l7 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
';


$result_texis{'anchor_in_menu_entry_name'} = '@node Top

@menu
* name @anchor{point} after anchor: first.
@end menu

@node first
';


$result_texts{'anchor_in_menu_entry_name'} = '
* name after anchor: first.

';

$result_errors{'anchor_in_menu_entry_name'} = '';

$result_nodes_list{'anchor_in_menu_entry_name'} = '1|Top
 menus:
  first
 node_directions:
  next->first
2|first
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'anchor_in_menu_entry_name'} = '';

$result_sectioning_root{'anchor_in_menu_entry_name'} = '';

$result_headings_list{'anchor_in_menu_entry_name'} = '';


$result_converted{'info'}->{'anchor_in_menu_entry_name'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: first,  Up: (dir)

* Menu:

* name after anchor: first.


File: ,  Node: first,  Prev: Top,  Up: Top


Tag Table:
Node: Top27
Node: first113

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
