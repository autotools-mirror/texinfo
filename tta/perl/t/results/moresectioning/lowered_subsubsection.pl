use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'lowered_subsubsection'} = '*document_root C16
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Chapter}
     {normal_text:Chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l6
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l9 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Section}
     {normal_text:Section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l13
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l15 {Section}
 |identifier:{Section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
 *normal_command@section C4 l16 {Section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Subsection}
     {normal_text:Subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l20
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l22 {Subsection}
 |identifier:{Subsection}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
 *normal_command@subsection C4 l23 {Subsection}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Subsubsection}
     {normal_text:Subsubsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Lowered-subsec}
     {normal_text:Lowered subsec}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l28
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l30 {Subsubsection}
 |identifier:{Subsubsection}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsubsection}
    {spaces_after_argument:\\n}
 *normal_command@subsubsection C3 l31 {Subsubsection}
 |section_heading_number:{1.1.1.1}
 |section_level:{4}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsubsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@lowersections C1
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@node C1 l34 {Lowered subsec}
 |identifier:{Lowered-subsec}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Lowered subsec}
    {spaces_after_argument:\\n}
 *normal_command@subsection C4 l35 {Lowered subsec}
 |level_modifier:{-1}
 |section_heading_number:{1.1.1.2}
 |section_level:{4}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Lowered subsec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l37
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l38
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Lowered-subsubsection}
     {normal_text:Lowered subsubsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l39
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l41 {Lowered subsubsection}
 |identifier:{Lowered-subsubsection}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Lowered subsubsection}
    {spaces_after_argument:\\n}
 *normal_command@subsubsection C4 l42 {Lowered subsubsection}
 |level_modifier:{-1}
 |section_heading_number:{1.1.1.3}
 |section_level:{4}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Lowered subsubsection}
    {spaces_after_argument:\\n}
  *normal_command@raisesections C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l45
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'lowered_subsubsection'} = '@node Top
@top

@menu
* Chapter::
@end menu

@node Chapter
@chapter Chapter

@menu
* Section::
@end menu

@node Section
@section Section

@menu
* Subsection::
@end menu

@node Subsection
@subsection Subsection

@menu
* Subsubsection::
* Lowered subsec::
@end menu

@node Subsubsection
@subsubsection Subsubsection

@lowersections
@node Lowered subsec
@subsection Lowered subsec

@menu
* Lowered subsubsection::
@end menu

@node Lowered subsubsection
@subsubsection Lowered subsubsection
@raisesections

@contents
@bye
';


$result_texts{'lowered_subsubsection'} = '
* Chapter::

1 Chapter
*********

* Section::

1.1 Section
===========

* Subsection::

1.1.1 Subsection
----------------

* Subsubsection::
* Lowered subsec::

1.1.1.1 Subsubsection
.....................

1.1.1.2 Lowered subsec
......................

* Lowered subsubsection::

1.1.1.3 Lowered subsubsection
.............................

';

$result_errors{'lowered_subsubsection'} = '* W l38|node `Lowered subsubsection\' in menu in `Lowered subsec\' but under `Subsection\' in sectioning
 warning: node `Lowered subsubsection\' in menu in `Lowered subsec\' but under `Subsection\' in sectioning

';

$result_nodes_list{'lowered_subsubsection'} = '1|Top
 associated_section
 associated_title_command
 menus:
  Chapter
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 menus:
  Section
 node_directions:
  prev->Top
  up->Top
3|Section
 associated_section: 1.1 Section
 associated_title_command: 1.1 Section
 menus:
  Subsection
 node_directions:
  up->Chapter
4|Subsection
 associated_section: 1.1.1 Subsection
 associated_title_command: 1.1.1 Subsection
 menus:
  Subsubsection
  Lowered subsec
 node_directions:
  up->Section
5|Subsubsection
 associated_section: 1.1.1.1 Subsubsection
 associated_title_command: 1.1.1.1 Subsubsection
 node_directions:
  next->Lowered subsec
  up->Subsection
6|Lowered subsec
 associated_section: 1.1.1.2 Lowered subsec
 associated_title_command: 1.1.1.2 Lowered subsec
 menus:
  Lowered subsubsection
 node_directions:
  next->Lowered subsubsection
  prev->Subsubsection
  up->Subsection
7|Lowered subsubsection
 associated_section: 1.1.1.3 Lowered subsubsection
 associated_title_command: 1.1.1.3 Lowered subsubsection
 node_directions:
  prev->Lowered subsec
  up->Subsection
';

$result_sections_list{'lowered_subsubsection'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  up->
 toplevel_directions:
  prev->
  up->
 section_children:
  1|Section
3|Section
 associated_anchor_command: Section
 associated_node: Section
 section_directions:
  up->Chapter
 section_children:
  1|Subsection
4|Subsection
 associated_anchor_command: Subsection
 associated_node: Subsection
 section_directions:
  up->Section
 section_children:
  1|Subsubsection
  2|Lowered subsec
  3|Lowered subsubsection
5|Subsubsection
 associated_anchor_command: Subsubsection
 associated_node: Subsubsection
 section_directions:
  next->Lowered subsec
  up->Subsection
6|Lowered subsec
 associated_anchor_command: Lowered subsec
 associated_node: Lowered subsec
 section_directions:
  next->Lowered subsubsection
  prev->Subsubsection
  up->Subsection
7|Lowered subsubsection
 associated_anchor_command: Lowered subsubsection
 associated_node: Lowered subsubsection
 section_directions:
  prev->Lowered subsec
  up->Subsection
';

$result_sectioning_root{'lowered_subsubsection'} = 'level: -1
list:
 1|
';

$result_headings_list{'lowered_subsubsection'} = '';

1;
