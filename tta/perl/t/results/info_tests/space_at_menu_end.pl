use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_at_menu_end'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C5 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {out}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {A para.\\n}
';


$result_texis{'space_at_menu_end'} = '@node Top

@menu
* (out)::

@end menu

A para.
';


$result_texts{'space_at_menu_end'} = '
* (out)::


A para.
';

$result_errors{'space_at_menu_end'} = '';

$result_nodes_list{'space_at_menu_end'} = '1|Top
 menus:
  (out)
 node_directions:
  next->(out)
';

$result_sections_list{'space_at_menu_end'} = '';

$result_sectioning_root{'space_at_menu_end'} = '';

$result_headings_list{'space_at_menu_end'} = '';


$result_converted{'info'}->{'space_at_menu_end'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: (out),  Up: (dir)

* Menu:

* (out)::

A para.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
