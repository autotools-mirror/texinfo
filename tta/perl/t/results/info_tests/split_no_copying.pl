use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'split_no_copying'} = '*document_root C7
 *before_node_section C3
  *paragraph C1
   {\\input texinfo\\n}
  *@setfilename C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |text_arg:{split_no_copying.info}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {split_no_copying.info}
  {empty_line:\\n}
 *@node C1 l4 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C6 l5 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *paragraph C1
   {This is the top node.\\n}
  {empty_line:\\n}
  *@menu C3 l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Ch1}
    |normalized:{Ch1}
     {Ch1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l13 {Ch1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Ch1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Ch1}
 *@chapter C4 l14 {Ch1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Ch1}
  {empty_line:\\n}
  *paragraph C1
   {First chapter.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'split_no_copying'} = '\\input texinfo
@setfilename split_no_copying.info

@node Top
@top Top

This is the top node.

@menu
* Ch1::
@end menu

@node Ch1
@chapter Ch1

First chapter.

@bye

';


$result_texts{'split_no_copying'} = '\\input texinfo

Top
***

This is the top node.

* Ch1::

1 Ch1
*****

First chapter.

';

$result_errors{'split_no_copying'} = '';

$result_nodes_list{'split_no_copying'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Ch1
 node_directions:
  next->Ch1
2|Ch1
 associated_section: 1 Ch1
 associated_title_command: 1 Ch1
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'split_no_copying'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Ch1
 section_children:
  1|Ch1
2|Ch1
 associated_anchor_command: Ch1
 associated_node: Ch1
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
';

$result_sectioning_root{'split_no_copying'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'split_no_copying'} = '';


$result_converted{'info'}->{'split_no_copying'} = 'This is split_no_copying.info, produced from .

\\input texinfo


File: split_no_copying.info,  Node: Top,  Next: Ch1,  Up: (dir)

Top
***

This is the top node.

* Menu:

* Ch1::


File: split_no_copying.info,  Node: Ch1,  Prev: Top,  Up: Top

1 Ch1
*****

First chapter.


Tag Table:
Node: Top64
Node: Ch1181

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
