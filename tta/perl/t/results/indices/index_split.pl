use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_split'} = '*document_root C21
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 index_split.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C13 index_split.texi:l4 {split indices}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {split indices}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_split.texi:l5
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {entry a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l7
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l9
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {And one one more index\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l13
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 index_split.texi:l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_split.texi:l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {back to the current top node\\n}
   *menu_entry C4 index_split.texi:l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{first}
    |normalized:{first}
     {first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{second chapter}
    |normalized:{second-chapter}
     {second chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 index_split.texi:l19
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C10 index_split.texi:l21 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   {Text and then index entries\\n}
   *index_entry_command@cindex C1 index_split.texi:l24
   |EXTRA
   |element_node:{first}
   |index_entry:I{cp,2}
    *line_arg C3
     {spaces_before_argument: }
     {entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 index_split.texi:l25
   |EXTRA
   |element_node:{first}
   |index_entry:I{cp,3}
    *line_arg C3
     {spaces_before_argument: }
     {! entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@findex C1 index_split.texi:l26
   |EXTRA
   |element_node:{first}
   |index_entry:I{fn,1}
    *line_arg C3
     {spaces_before_argument: }
     {fun in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 index_split.texi:l27
   |EXTRA
   |element_node:{first}
   |index_entry:I{cp,4}
    *line_arg C3
     {spaces_before_argument: }
     {entry in node}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l29
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l31
  |EXTRA
  |global_command_number:{5}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l33
  |EXTRA
  |element_node:{first}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {entry after printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C7 index_split.texi:l35 {First chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {First chapter}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 index_split.texi:l36
  |EXTRA
  |element_node:{first}
  |index_entry:I{fn,2}
   *line_arg C3
    {spaces_before_argument: }
    {a function}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_split.texi:l37
  |EXTRA
  |element_node:{first}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {a concept in first}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 index_split.texi:l38
  |EXTRA
  |element_node:{first}
  |index_entry:I{fn,3}
   *line_arg C3
    {spaces_before_argument: }
    {somewhere}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C8 index_split.texi:l40
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_split.texi:l41
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{section 1}
    |normalized:{section-1}
     {section 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l42
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{section 2}
    |normalized:{section-2}
     {section 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l43
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{section 3}
    |normalized:{section-3}
     {section 3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l44
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node in section 3}
    |normalized:{node-in-section-3}
     {node in section 3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l45
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node 2 in section 3}
    |normalized:{node-2-in-section-3}
     {node 2 in section 3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l46
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node 3 in section 3}
    |normalized:{node-3-in-section-3}
     {node 3 in section 3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 index_split.texi:l47
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 index_split.texi:l49 {section 1}
 |EXTRA
 |identifier:{section-1}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {section 1}
    {spaces_after_argument:\\n}
 *@section C11 index_split.texi:l50 {Section 1}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Section 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l52
  |EXTRA
  |element_node:{section-1}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {something}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 index_split.texi:l54
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 index_split.texi:l55
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{subsection 1}
    |normalized:{subsection-1}
     {subsection 1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 index_split.texi:l56
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{subsection 2}
    |normalized:{subsection-2}
     {subsection 2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 index_split.texi:l57
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  *paragraph C1
   {The index once more\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l60
  |EXTRA
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l62
  |EXTRA
  |element_node:{section-1}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {another}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 index_split.texi:l64 {subsection 1}
 |EXTRA
 |identifier:{subsection-1}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {subsection 1}
    {spaces_after_argument:\\n}
 *@subsection C4 index_split.texi:l65 {Subsection 1}
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Subsection 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {In subsection 1\\n}
  {empty_line:\\n}
 *@node C1 index_split.texi:l69 {subsection 2}
 |EXTRA
 |identifier:{subsection-2}
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {subsection 2}
    {spaces_after_argument:\\n}
 *@subsection C10 index_split.texi:l70 {Subsection 2}
 |EXTRA
 |section_heading_number:{1.1.2}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Subsection 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {index in subsction 2\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l74
  |EXTRA
  |element_node:{subsection-2}
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {subsection 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l76
  |EXTRA
  |global_command_number:{7}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l78
  |EXTRA
  |element_node:{subsection-2}
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {printindex subsection 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 index_split.texi:l80 {section 2}
 |EXTRA
 |identifier:{section-2}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {section 2}
    {spaces_after_argument:\\n}
 *@section C4 index_split.texi:l81 {Section 2}
 |EXTRA
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Section 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Section 2\\n}
  {empty_line:\\n}
 *@node C1 index_split.texi:l85 {section 3}
 |EXTRA
 |identifier:{section-3}
 |is_target:{1}
 |isindex:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {section 3}
    {spaces_after_argument:\\n}
 *@section C6 index_split.texi:l86 {Section 3}
 |EXTRA
 |section_heading_number:{1.3}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Section 3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l88
  |EXTRA
  |element_node:{section-3}
  |index_entry:I{cp,11}
   *line_arg C3
    {spaces_before_argument: }
    {section 3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l90
  |EXTRA
  |global_command_number:{8}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C5 index_split.texi:l92 {node in section 3}
 |EXTRA
 |identifier:{node-in-section-3}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {node in section 3}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:{section 3}
   |normalized:{section-3}
    {section 3}
   *line_arg C2
   |EXTRA
   |node_content:{first}
   |normalized:{first}
    {first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l94
  |EXTRA
  |element_node:{node-in-section-3}
  |index_entry:I{cp,12}
   *line_arg C3
    {spaces_before_argument: }
    {node in section 3}
    {spaces_after_argument:\\n}
  *paragraph C1
   {Text for the node in section 3\\n}
  {empty_line:\\n}
 *@node C13 index_split.texi:l97 {node 2 in section 3}
 |EXTRA
 |identifier:{node-2-in-section-3}
 |is_target:{1}
 |isindex:{1}
 |node_number:{9}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {node 2 in section 3}
   *line_arg
   *line_arg
   *line_arg C2
   |EXTRA
   |node_content:{first}
   |normalized:{first}
    {first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l99
  |EXTRA
  |element_node:{node-2-in-section-3}
  |index_entry:I{cp,13}
   *line_arg C3
    {spaces_before_argument: }
    {node 2 in section 3}
    {spaces_after_argument:\\n}
  *paragraph C1
   {Text for the node 2 in section 3\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l102
  |EXTRA
  |global_command_number:{9}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l104
  |EXTRA
  |element_node:{node-2-in-section-3}
  |index_entry:I{cp,14}
   *line_arg C3
    {spaces_before_argument: }
    {between printindex node in section 3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 index_split.texi:l106
  |EXTRA
  |global_command_number:{10}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l108
  |EXTRA
  |element_node:{node-2-in-section-3}
  |index_entry:I{cp,15}
   *line_arg C3
    {spaces_before_argument: }
    {after second printindex node in section 3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C4 index_split.texi:l110 {node 3 in section 3}
 |EXTRA
 |identifier:{node-3-in-section-3}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {node 3 in section 3}
   *line_arg
   *line_arg
   *line_arg C2
   |EXTRA
   |node_content:{first}
   |normalized:{first}
    {first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_split.texi:l112
  |EXTRA
  |element_node:{node-3-in-section-3}
  |index_entry:I{cp,16}
   *line_arg C3
    {spaces_before_argument: }
    {node 3 in section 3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 index_split.texi:l114 {second chapter}
 |EXTRA
 |identifier:{second-chapter}
 |is_target:{1}
 |node_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {second chapter}
    {spaces_after_argument:\\n}
 *@chapter C4 index_split.texi:l115 {Second chapter}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Second chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Second chapter\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'index_split'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top split indices
@cindex entry a

@printindex cp

@printindex fn

And one one more index

@printindex cp

@menu
* Top:: back to the current top node
* first::
* second chapter::
@end menu

@node first

Text and then index entries
@cindex entry in node
@cindex ! entry in node
@findex fun in node
@cindex entry in node

@printindex cp

@printindex fn

@cindex entry after printindex

@chapter First chapter
@findex a function
@cindex a concept in first
@findex somewhere

@menu
* section 1::
* section 2::
* section 3::
* node in section 3::
* node 2 in section 3::
* node 3 in section 3::
@end menu

@node section 1
@section Section 1

@cindex something

@menu 
* subsection 1::
* subsection 2::
@end menu
The index once more

@printindex cp

@cindex another

@node subsection 1
@subsection Subsection 1

In subsection 1

@node subsection 2
@subsection Subsection 2

index in subsction 2

@cindex subsection 2

@printindex cp

@cindex printindex subsection 2

@node section 2
@section Section 2

Section 2

@node section 3
@section Section 3

@cindex section 3

@printindex cp

@node node in section 3,,section 3,first

@cindex node in section 3
Text for the node in section 3

@node node 2 in section 3,,,first

@cindex node 2 in section 3
Text for the node 2 in section 3

@printindex cp

@cindex between printindex node in section 3

@printindex cp

@cindex after second printindex node in section 3

@node node 3 in section 3,,,first

@cindex node 3 in section 3

@node second chapter
@chapter Second chapter

Second chapter

@bye
';


$result_texts{'index_split'} = 'split indices
*************



And one one more index


* Top:: back to the current top node
* first::
* second chapter::


Text and then index entries




1 First chapter
***************

* section 1::
* section 2::
* section 3::
* node in section 3::
* node 2 in section 3::
* node 3 in section 3::

1.1 Section 1
=============


* subsection 1::
* subsection 2::
The index once more



1.1.1 Subsection 1
------------------

In subsection 1

1.1.2 Subsection 2
------------------

index in subsction 2




1.2 Section 2
=============

Section 2

1.3 Section 3
=============




Text for the node in section 3


Text for the node 2 in section 3







2 Second chapter
****************

Second chapter

';

$result_errors{'index_split'} = '* W index_split.texi:l16|node `Top\' in menu in `Top\' but not under it in sectioning
 warning: node `Top\' in menu in `Top\' but not under it in sectioning

* W index_split.texi:l44|unexpected node `node in section 3\' in menu
 warning: unexpected node `node in section 3\' in menu

';

$result_nodes_list{'index_split'} = '1|Top
 associated_section: split indices
 associated_title_command: split indices
 menus:
  Top
  first
  second chapter
 node_directions:
  next->first
2|first
 associated_section: 1 First chapter
 associated_title_command: 1 First chapter
 menus:
  section 1
  section 2
  section 3
  node in section 3
  node 2 in section 3
  node 3 in section 3
 node_directions:
  next->second chapter
  prev->Top
  up->Top
3|section 1
 associated_section: 1.1 Section 1
 associated_title_command: 1.1 Section 1
 menus:
  subsection 1
  subsection 2
 node_directions:
  next->section 2
  up->first
4|subsection 1
 associated_section: 1.1.1 Subsection 1
 associated_title_command: 1.1.1 Subsection 1
 node_directions:
  next->subsection 2
  up->section 1
5|subsection 2
 associated_section: 1.1.2 Subsection 2
 associated_title_command: 1.1.2 Subsection 2
 node_directions:
  prev->subsection 1
  up->section 1
6|section 2
 associated_section: 1.2 Section 2
 associated_title_command: 1.2 Section 2
 node_directions:
  next->section 3
  prev->section 1
  up->first
7|section 3
 associated_section: 1.3 Section 3
 associated_title_command: 1.3 Section 3
 node_directions:
  next->node in section 3
  prev->section 2
  up->first
8|node in section 3
 node_directions:
  prev->section 3
  up->first
9|node 2 in section 3
 node_directions:
  up->first
10|node 3 in section 3
 node_directions:
  up->first
11|second chapter
 associated_section: 2 Second chapter
 associated_title_command: 2 Second chapter
 node_directions:
  prev->first
  up->Top
';

$result_sections_list{'index_split'} = '1|split indices
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->First chapter
 section_children:
  1|First chapter
  2|Second chapter
2|First chapter
 associated_anchor_command: first
 associated_node: first
 section_directions:
  next->Second chapter
  up->split indices
 toplevel_directions:
  next->Second chapter
  prev->split indices
  up->split indices
 section_children:
  1|Section 1
  2|Section 2
  3|Section 3
3|Section 1
 associated_anchor_command: section 1
 associated_node: section 1
 section_directions:
  next->Section 2
  up->First chapter
 section_children:
  1|Subsection 1
  2|Subsection 2
4|Subsection 1
 associated_anchor_command: subsection 1
 associated_node: subsection 1
 section_directions:
  next->Subsection 2
  up->Section 1
5|Subsection 2
 associated_anchor_command: subsection 2
 associated_node: subsection 2
 section_directions:
  prev->Subsection 1
  up->Section 1
6|Section 2
 associated_anchor_command: section 2
 associated_node: section 2
 section_directions:
  next->Section 3
  prev->Section 1
  up->First chapter
7|Section 3
 associated_anchor_command: section 3
 associated_node: section 3
 section_directions:
  prev->Section 2
  up->First chapter
8|Second chapter
 associated_anchor_command: second chapter
 associated_node: second chapter
 section_directions:
  prev->First chapter
  up->split indices
 toplevel_directions:
  prev->First chapter
  up->split indices
';

$result_sectioning_root{'index_split'} = 'level: -1
list:
 1|split indices
';

$result_headings_list{'index_split'} = '';

$result_indices_sort_strings{'index_split'} = 'cp:
 ! entry in node
 a concept in first
 after second printindex node in section 3
 another
 between printindex node in section 3
 entry a
 entry after printindex
 entry in node
 entry in node
 node 2 in section 3
 node 3 in section 3
 node in section 3
 printindex subsection 2
 section 3
 something
 subsection 2
fn:
 a function
 fun in node
 somewhere
';

$result_converted_sort_strings{'file_html'}->{'index_split'} = 'cp:
 ! entry in node
 a concept in first
 after second printindex node in section 3
 another
 between printindex node in section 3
 entry a
 entry after printindex
 entry in node
 entry in node
 node 2 in section 3
 node 3 in section 3
 node in section 3
 printindex subsection 2
 section 3
 something
 subsection 2
fn:
 a function
 fun in node
 somewhere
';

1;
