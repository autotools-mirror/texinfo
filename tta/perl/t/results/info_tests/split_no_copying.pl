use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'split_no_copying'} = '*document_root C7
 *before_node_section C2
  *preamble_before_setfilename C1
   *preamble_before_beginning C1
    {text_before_beginning:\\input texinfo\\n}
  *preamble_before_content C2
   *normal_command@setfilename C1 l2
   |text_arg:{split_no_copying.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:split_no_copying.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 l5 {Top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:This is the top node.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Ch1}
     {normal_text:Ch1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l11
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {Ch1}
 |identifier:{Ch1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ch1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l14 {Ch1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ch1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:First chapter.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
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


$result_texts{'split_no_copying'} = '
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


$result_converted{'info'}->{'split_no_copying'} = Encode::encode('utf-8', 'This is split_no_copying.info, produced from .


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
Node: Top48
Node: Ch1165

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
