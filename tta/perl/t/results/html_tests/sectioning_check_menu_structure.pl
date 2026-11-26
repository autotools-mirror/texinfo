use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sectioning_check_menu_structure'} = '*document_root C29
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble_before_content
 *normal_command@node C1 sectioning.texi:l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{First-node}
    {normal_text:First node}
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@top C3 sectioning.texi:l4
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  *normal_command@menu C11 sectioning.texi:l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 sectioning.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{First-node}
     {normal_text:First node}
    {menu_entry_separator:::    }
    *menu_entry_description C1
     *preformatted C9
      {normal_text:node 1\\n}
      {normal_text:  explaination no heading ?\\n}
      {normal_text:* and here ?\\n}
      {normal_text:With command }
      *normal_command@^ C1 sectioning.texi:l9
       *brace_container C1
        *normal_command@dotless C1 sectioning.texi:l9
         *brace_container C1
          {normal_text:i}
      {normal_text: and\\n}
      {normal_text:a }
      *normal_command@cite C1 sectioning.texi:l10
       *brace_container C1
        {normal_text:me}
      {normal_text:.\\n}
   *menu_comment C1
    *preformatted C2
     {after_menu_description_line:\\n}
     {normal_text:heading\\n}
   *menu_entry C4 sectioning.texi:l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{between-node}
     {normal_text:between node}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      {normal_text:\\n}
      {normal_text:node in between\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {normal_text:heading \\n}
     {normal_text:or not ?\\n}
   *menu_entry C4 sectioning.texi:l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Second-node}
     {normal_text:Second node}
    {menu_entry_separator:::   }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:node 2\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {normal_text:heading with spaces around\\n}
     {empty_line:\\n}
   *menu_entry C4 sectioning.texi:l22
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Third-node-unnumbered}
     {normal_text:Third node unnumbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:unnumbered in Top menu\\n}
   *menu_entry C4 sectioning.texi:l23
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Last-node-no-description}
     {normal_text:Last node no description}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {normal_text:description here\\n}
     {empty_line:\\n}
   *normal_command@end C1 sectioning.texi:l27
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l29 {First node}
 |identifier:{First-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:First node}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 sectioning.texi:l30 {first node chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first node chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:first node chapter text\\n}
  *normal_command@menu C6 sectioning.texi:l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 sectioning.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{unnumbered}
     {normal_text:unnumbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un\\n}
   *menu_entry C4 sectioning.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{unnumbered2}
     {normal_text:unnumbered2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un2\\n}
   *menu_entry C4 sectioning.texi:l36
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{numbered}
     {normal_text:numbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:nu\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *normal_command@end C1 sectioning.texi:l38
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l40 {unnumbered}
 |identifier:{unnumbered}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
 *normal_command@unnumberedsec C4 sectioning.texi:l41 {unnumbered section}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C6 sectioning.texi:l43
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 sectioning.texi:l44
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{unnumbered-sub}
     {normal_text:unnumbered sub}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un\\n}
   *menu_entry C4 sectioning.texi:l45
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{numbered-sub}
     {normal_text:numbered sub}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:nu\\n}
   *menu_entry C4 sectioning.texi:l46
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{unnumbered-sub2}
     {normal_text:unnumbered sub2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:un2\\n}
   *menu_entry C4 sectioning.texi:l47
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{numbered-sub2}
     {normal_text:numbered sub2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:nu2\\n}
   *normal_command@end C1 sectioning.texi:l48
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l50 {unnumbered sub}
 |identifier:{unnumbered-sub}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered sub}
    {spaces_after_argument:\\n}
 *normal_command@unnumberedsubsec C2 sectioning.texi:l51 {unnumbered subsection}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l53 {numbered sub}
 |identifier:{numbered-sub}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered sub}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 sectioning.texi:l54 {numbered subsection}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l56 {unnumbered sub2}
 |identifier:{unnumbered-sub2}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered sub2}
    {spaces_after_argument:\\n}
 *normal_command@unnumberedsubsec C2 sectioning.texi:l57 {unnumbered subsection2}
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered subsection2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l59 {numbered sub2}
 |identifier:{numbered-sub2}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered sub2}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 sectioning.texi:l60 {numbered subsection2}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered subsection2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l62 {unnumbered2}
 |identifier:{unnumbered2}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered2}
    {spaces_after_argument:\\n}
 *normal_command@unnumberedsec C4 sectioning.texi:l63 {unnumbered section2}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered section2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 sectioning.texi:l65
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 sectioning.texi:l66
    {menu_entry_leading_text:*  }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{numbered-sub3}
     {normal_text:numbered sub3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 sectioning.texi:l67
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l69 {numbered sub3}
 |identifier:{numbered-sub3}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered sub3}
    {spaces_after_argument:\\n}
 *normal_command@subsection C3 sectioning.texi:l70 {numbered subsection3}
 |section_level:{3}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered subsection3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l73 {numbered}
 |identifier:{numbered}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:numbered}
    {spaces_after_argument:\\n}
 *normal_command@section C2 sectioning.texi:l74 {numbered section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:numbered section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C4 sectioning.texi:l76 {between node}
 |identifier:{between-node}
 |is_target:{1}
 |node_number:{11}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:between node}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:between node, node without sectioning node\\n}
  {empty_line:\\n}
 *normal_command@node C4 sectioning.texi:l80 {Second node}
 |identifier:{Second-node}
 |is_target:{1}
 |node_number:{12}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Second node}
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Third-node-unnumbered}
    {normal_text:Third node unnumbered}
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second node text\\n}
  {empty_line:\\n}
 *normal_command@chapter C4 sectioning.texi:l84 {second node chapter}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second node chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second node chapter text.\\n}
  {empty_line:\\n}
 *normal_command@node C1 sectioning.texi:l88 {Third node unnumbered}
 |identifier:{Third-node-unnumbered}
 |is_target:{1}
 |node_number:{13}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Third node unnumbered}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C5 sectioning.texi:l89 {unnumbered chapter}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:unnumbered chapter text.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C3 sectioning.texi:l94 {Last node no description}
 |identifier:{Last-node-no-description}
 |is_target:{1}
 |node_number:{14}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Last node no description}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Third-node-unnumbered}
    {normal_text:Third node unnumbered}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 sectioning.texi:l96
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'sectioning_check_menu_structure'} = '\\input texinfo @c -*-texinfo-*-

@node Top,First node,(dir)
@top
@menu
* First node::    node 1
  explaination no heading ?
* and here ?
With command @^{@dotless{i}} and
a @cite{me}.

heading
* between node:: 
node in between

heading 
or not ?
* Second node::   node 2

heading with spaces around

* Third node unnumbered:: unnumbered in Top menu
* Last node no description::

description here

@end menu

@node First node,,Top,Top
@chapter first node chapter

first node chapter text
@menu
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu

@end menu

@node unnumbered
@unnumberedsec unnumbered section

@menu
* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2
@end menu

@node unnumbered sub
@unnumberedsubsec unnumbered subsection

@node numbered sub
@subsection numbered subsection

@node unnumbered sub2
@unnumberedsubsec unnumbered subsection2

@node numbered sub2
@subsection numbered subsection2

@node unnumbered2
@unnumberedsec unnumbered section2

@menu
*  numbered sub3::
@end menu

@node numbered sub3
@subsection numbered subsection3


@node numbered
@section  numbered section

@node between node,,,Top

between node, node without sectioning node

@node Second node,Third node unnumbered,,Top

Second node text

@chapter second node chapter

second node chapter text.

@node Third node unnumbered
@unnumbered unnumbered chapter

unnumbered chapter text.


@node Last node no description,,Third node unnumbered,Top

@contents
@bye

';


$result_texts{'sectioning_check_menu_structure'} = '* First node::    node 1
  explaination no heading ?
* and here ?
With command i^ and
a me.

heading
* between node:: 
node in between

heading 
or not ?
* Second node::   node 2

heading with spaces around

* Third node unnumbered:: unnumbered in Top menu
* Last node no description::

description here


1 first node chapter
********************

first node chapter text
* unnumbered:: un
* unnumbered2:: un2
* numbered:: nu


unnumbered section
==================

* unnumbered sub:: un
* numbered sub:: nu
* unnumbered sub2:: un2
* numbered sub2:: nu2

unnumbered subsection
---------------------

numbered subsection
-------------------

unnumbered subsection2
----------------------

numbered subsection2
--------------------

unnumbered section2
===================

*  numbered sub3::

numbered subsection3
--------------------


1.1 numbered section
====================


between node, node without sectioning node


Second node text

2 second node chapter
*********************

second node chapter text.

unnumbered chapter
******************

unnumbered chapter text.



';

$result_errors{'sectioning_check_menu_structure'} = '* W sectioning.texi:l13|node `between node\' in menu where `Second node\' expected
 warning: node `between node\' in menu where `Second node\' expected

* W sectioning.texi:l23|unexpected node `Last node no description\' in menu
 warning: unexpected node `Last node no description\' in menu

';

$result_nodes_list{'sectioning_check_menu_structure'} = '1|Top
 associated_section
 associated_title_command
 menus:
  First node
  between node
  Second node
  Third node unnumbered
  Last node no description
 node_directions:
  next->First node
  prev->(dir)

2|First node
 associated_section: 1 first node chapter
 associated_title_command: 1 first node chapter
 menus:
  unnumbered
  unnumbered2
  numbered
 node_directions:
  prev->Top
  up->Top
3|unnumbered
 associated_section: unnumbered section
 associated_title_command: unnumbered section
 menus:
  unnumbered sub
  numbered sub
  unnumbered sub2
  numbered sub2
 node_directions:
  next->unnumbered2
  up->First node
4|unnumbered sub
 associated_section: unnumbered subsection
 associated_title_command: unnumbered subsection
 node_directions:
  next->numbered sub
  up->unnumbered
5|numbered sub
 associated_section: numbered subsection
 associated_title_command: numbered subsection
 node_directions:
  next->unnumbered sub2
  prev->unnumbered sub
  up->unnumbered
6|unnumbered sub2
 associated_section: unnumbered subsection2
 associated_title_command: unnumbered subsection2
 node_directions:
  next->numbered sub2
  prev->numbered sub
  up->unnumbered
7|numbered sub2
 associated_section: numbered subsection2
 associated_title_command: numbered subsection2
 node_directions:
  prev->unnumbered sub2
  up->unnumbered
8|unnumbered2
 associated_section: unnumbered section2
 associated_title_command: unnumbered section2
 menus:
  numbered sub3
 node_directions:
  next->numbered
  prev->unnumbered
  up->First node
9|numbered sub3
 associated_section: numbered subsection3
 associated_title_command: numbered subsection3
 node_directions:
  up->unnumbered2
10|numbered
 associated_section: 1.1 numbered section
 associated_title_command: 1.1 numbered section
 node_directions:
  prev->unnumbered2
  up->First node
11|between node
 node_directions:
  up->Top
12|Second node
 associated_section: 2 second node chapter
 associated_title_command: 2 second node chapter
 node_directions:
  next->Third node unnumbered
  up->Top
13|Third node unnumbered
 associated_section: unnumbered chapter
 associated_title_command: unnumbered chapter
 node_directions:
  next->Last node no description
  prev->Second node
  up->Top
14|Last node no description
 node_directions:
  prev->Third node unnumbered
  up->Top
';

$result_sections_list{'sectioning_check_menu_structure'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->first node chapter
 section_children:
  1|first node chapter
  2|second node chapter
  3|unnumbered chapter
2|first node chapter
 associated_anchor_command: First node
 associated_node: First node
 section_directions:
  next->second node chapter
  up->
 toplevel_directions:
  next->second node chapter
  prev->
  up->
 section_children:
  1|unnumbered section
  2|unnumbered section2
  3|numbered section
3|unnumbered section
 associated_anchor_command: unnumbered
 associated_node: unnumbered
 section_directions:
  next->unnumbered section2
  up->first node chapter
 section_children:
  1|unnumbered subsection
  2|numbered subsection
  3|unnumbered subsection2
  4|numbered subsection2
4|unnumbered subsection
 associated_anchor_command: unnumbered sub
 associated_node: unnumbered sub
 section_directions:
  next->numbered subsection
  up->unnumbered section
5|numbered subsection
 associated_anchor_command: numbered sub
 associated_node: numbered sub
 section_directions:
  next->unnumbered subsection2
  prev->unnumbered subsection
  up->unnumbered section
6|unnumbered subsection2
 associated_anchor_command: unnumbered sub2
 associated_node: unnumbered sub2
 section_directions:
  next->numbered subsection2
  prev->numbered subsection
  up->unnumbered section
7|numbered subsection2
 associated_anchor_command: numbered sub2
 associated_node: numbered sub2
 section_directions:
  prev->unnumbered subsection2
  up->unnumbered section
8|unnumbered section2
 associated_anchor_command: unnumbered2
 associated_node: unnumbered2
 section_directions:
  next->numbered section
  prev->unnumbered section
  up->first node chapter
 section_children:
  1|numbered subsection3
9|numbered subsection3
 associated_anchor_command: numbered sub3
 associated_node: numbered sub3
 section_directions:
  up->unnumbered section2
10|numbered section
 associated_anchor_command: numbered
 associated_node: numbered
 section_directions:
  prev->unnumbered section2
  up->first node chapter
11|second node chapter
 associated_anchor_command: Second node
 associated_node: Second node
 section_directions:
  next->unnumbered chapter
  prev->first node chapter
  up->
 toplevel_directions:
  next->unnumbered chapter
  prev->first node chapter
  up->
12|unnumbered chapter
 associated_anchor_command: Third node unnumbered
 associated_node: Third node unnumbered
 section_directions:
  prev->second node chapter
  up->
 toplevel_directions:
  prev->second node chapter
  up->
';

$result_sectioning_root{'sectioning_check_menu_structure'} = 'level: -1
list:
 1|
';

$result_headings_list{'sectioning_check_menu_structure'} = '';

$result_converted_errors{'file_html'}->{'sectioning_check_menu_structure'} = '* W sectioning.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
