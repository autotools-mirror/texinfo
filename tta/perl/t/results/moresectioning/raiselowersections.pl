use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raiselowersections'} = '*document_root C14
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C3 l4
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  *normal_command@menu C4 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Chapter}
     {normal_text:Chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Second-chapter}
     {normal_text:Second chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 l11 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l13
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifclear C1 l14
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:include}
       >{spaces_after_argument:\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Chapter-in-included-file}
     {normal_text:Chapter in included file}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
      >SOURCEMARKS
      >expanded_conditional_command<end;1><p:1>
       >*normal_command@end C1 l16
       >|text_arg:{ifclear}
        >*line_arg C3
         >{spaces_before_argument: }
         >{normal_text:ifclear}
         >{spaces_after_argument:\\n}
   *normal_command@end C1 l17
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{do-top|}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:do-top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@lowersections C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*normal_command@ifclear C1 l23
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:include}
      >{spaces_after_argument:\\n}
  >include<start;1><p:1>
   >*normal_command@include C1 l24
   >|text_arg:{section_file.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:section_file.texi}
     >{spaces_after_argument:\\n}
  *paragraph C2
   {normal_text:\\input texinfo }
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:-*-texinfo-*-}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@ifclear C8 section_file.texi:l3
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:do-top}
      >{spaces_after_argument:\\n}
    >{raw:@node Top\\n}
    >{raw:@top\\n}
    >{raw:\\n}
    >{raw:@menu\\n}
    >{raw:* Chapter in included file::\\n}
    >{raw:@end menu\\n}
    >*normal_command@end C1 section_file.texi:l10
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 section_file.texi:l12 {Chapter in included file}
 |identifier:{Chapter-in-included-file}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 section_file.texi:l13 {Chapter in included file}
 |level_modifier:{-1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter in included file}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 section_file.texi:l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 section_file.texi:l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Section}
     {normal_text:Section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 section_file.texi:l17
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 section_file.texi:l19 {Section}
 |identifier:{Section}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
 *normal_command@section C4 section_file.texi:l20 {Section}
 |level_modifier:{-1}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 section_file.texi:l22
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 section_file.texi:l23
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Subsection}
     {normal_text:Subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 section_file.texi:l24
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 section_file.texi:l26 {Subsection}
 |identifier:{Subsection}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
 *normal_command@subsection C7 section_file.texi:l27 {Subsection}
 |level_modifier:{-1}
 |section_heading_number:{1.1.1.1}
 |section_level:{4}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*normal_command@ifset C8 section_file.texi:l29
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:subsub}
      >{spaces_after_argument:\\n}
    >{raw:@menu\\n}
    >{raw:* Subsubsection::\\n}
    >{raw:@end menu\\n}
    >{raw:\\n}
    >{raw:@node Subsubsection\\n}
    >{raw:@subsubsection Subsubsection\\n}
    >*normal_command@end C1 section_file.texi:l36
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*normal_command@ifclear C4 section_file.texi:l38
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:do-top}
      >{spaces_after_argument:\\n}
    >{raw:@contents\\n}
    >{raw:@bye\\n}
    >*normal_command@end C1 section_file.texi:l41
    >|text_arg:{ifclear}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifclear}
      >{spaces_after_argument:\\n}
  >include<end;1><p:1>
  >expanded_conditional_command<end;2><p:1>
   >*normal_command@end C1 l25
   >|text_arg:{ifclear}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifclear}
     >{spaces_after_argument:\\n}
  *normal_command@raisesections C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@clear C1
  |misc_args:A{do-top}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:do-top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l30 {Second chapter}
 |identifier:{Second-chapter}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Second chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l31 {Second chapter}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Second chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second chapter\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l35
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'raiselowersections'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top
@menu
* Chapter::
* Second chapter::
@end menu

@node Chapter
@chapter Chapter

@menu
* Chapter in included file::
@end menu

@set do-top

@lowersections

\\input texinfo @c -*-texinfo-*-


@node Chapter in included file
@chapter Chapter in included file

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


@raisesections

@clear do-top

@node Second chapter
@chapter Second chapter

Second chapter

@contents
@bye
';


$result_texts{'raiselowersections'} = '* Chapter::
* Second chapter::

1 Chapter
*********

* Chapter in included file::



\\input texinfo 

1.1 Chapter in included file
============================

* Section::

1.1.1 Section
-------------

* Subsection::

1.1.1.1 Subsection
..................




2 Second chapter
****************

Second chapter

';

$result_errors{'raiselowersections'} = '';

$result_nodes_list{'raiselowersections'} = '1|Top
 associated_section
 associated_title_command
 menus:
  Chapter
  Second chapter
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 menus:
  Chapter in included file
 node_directions:
  next->Second chapter
  prev->Top
  up->Top
3|Chapter in included file
 associated_section: 1.1 Chapter in included file
 associated_title_command: 1.1 Chapter in included file
 menus:
  Section
 node_directions:
  up->Chapter
4|Section
 associated_section: 1.1.1 Section
 associated_title_command: 1.1.1 Section
 menus:
  Subsection
 node_directions:
  up->Chapter in included file
5|Subsection
 associated_section: 1.1.1.1 Subsection
 associated_title_command: 1.1.1.1 Subsection
 node_directions:
  up->Section
6|Second chapter
 associated_section: 2 Second chapter
 associated_title_command: 2 Second chapter
 node_directions:
  prev->Chapter
  up->Top
';

$result_sections_list{'raiselowersections'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|Second chapter
2|Chapter
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  next->Second chapter
  up->
 toplevel_directions:
  next->Second chapter
  prev->
  up->
 section_children:
  1|Chapter in included file
3|Chapter in included file
 associated_anchor_command: Chapter in included file
 associated_node: Chapter in included file
 section_directions:
  up->Chapter
 section_children:
  1|Section
4|Section
 associated_anchor_command: Section
 associated_node: Section
 section_directions:
  up->Chapter in included file
 section_children:
  1|Subsection
5|Subsection
 associated_anchor_command: Subsection
 associated_node: Subsection
 section_directions:
  up->Section
6|Second chapter
 associated_anchor_command: Second chapter
 associated_node: Second chapter
 section_directions:
  prev->Chapter
  up->
 toplevel_directions:
  prev->Chapter
  up->
';

$result_sectioning_root{'raiselowersections'} = 'level: -1
list:
 1|
';

$result_headings_list{'raiselowersections'} = '';

1;
