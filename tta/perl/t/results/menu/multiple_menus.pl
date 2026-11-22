use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_menus'} = '*document_root C2
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
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{a}
     {normal_text:(}
     {normal_text:a}
     {normal_text:)}
     {normal_text:a}
    {menu_entry_separator:::}
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
  *@menu C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b}
     {normal_text:(}
     {normal_text:b}
     {normal_text:)}
     {normal_text:b}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'multiple_menus'} = '@node Top

@menu
* (a)a::
@end menu

@menu
* (b)b::
@end menu
';


$result_texts{'multiple_menus'} = '
* (a)a::

* (b)b::
';

$result_errors{'multiple_menus'} = '* W l7|multiple @menu
 warning: multiple @menu

';

$result_nodes_list{'multiple_menus'} = '1|Top
 menus:
  (a)a
  (b)b
 node_directions:
  next->(a)a
';

$result_sections_list{'multiple_menus'} = '';

$result_sectioning_root{'multiple_menus'} = '';

$result_headings_list{'multiple_menus'} = '';

1;
