use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sectioning_check_menu_structure'} = '*document_root C29
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 sectioning.texi:l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C3
   *line_arg C1
    {Top}
   *line_arg C1
   |EXTRA
   |node_content:{First node}
   |normalized:{First-node}
    {First node}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
 *@top C3 sectioning.texi:l4
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *@menu C11 sectioning.texi:l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 sectioning.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{First node}
    |normalized:{First-node}
     {First node}
    {menu_entry_separator:::    }
    *menu_entry_description C1
     *preformatted C9
      {node 1\\n}
      {  explaination no heading ?\\n}
      {* and here ?\\n}
      {With command }
      *@^ C1 sectioning.texi:l9
       *brace_container C1
        *@dotless C1 sectioning.texi:l9
         *brace_container C1
          {i}
      { and\\n}
      {a }
      *@cite C1 sectioning.texi:l10
       *brace_container C1
        {me}
      {.\\n}
   *menu_comment C1
    *preformatted C2
     {after_menu_description_line:\\n}
     {heading\\n}
   *menu_entry C4 sectioning.texi:l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{between node}
    |normalized:{between-node}
     {between node}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      {\\n}
      {node in between\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {heading \\n}
     {or not ?\\n}
   *menu_entry C4 sectioning.texi:l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Second node}
    |normalized:{Second-node}
     {Second node}
    {menu_entry_separator:::   }
    *menu_entry_description C1
     *preformatted C1
      {node 2\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {heading with spaces around\\n}
     {empty_line:\\n}
   *menu_entry C4 sectioning.texi:l22
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Third node unnumbered}
    |normalized:{Third-node-unnumbered}
     {Third node unnumbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {unnumbered in Top menu\\n}
   *menu_entry C4 sectioning.texi:l23
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Last node no description}
    |normalized:{Last-node-no-description}
     {Last node no description}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {description here\\n}
     {empty_line:\\n}
   *@end C1 sectioning.texi:l27
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
 *@node C1 sectioning.texi:l29 {First node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{First-node}
  *arguments_line C4
   *line_arg C1
    {First node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
 *@chapter C5 sectioning.texi:l30 {first node chapter}
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
    {first node chapter}
  {empty_line:\\n}
  *paragraph C1
   {first node chapter text\\n}
  *@menu C6 sectioning.texi:l33
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 sectioning.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{unnumbered}
    |normalized:{unnumbered}
     {unnumbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {un\\n}
   *menu_entry C4 sectioning.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{unnumbered2}
    |normalized:{unnumbered2}
     {unnumbered2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {un2\\n}
   *menu_entry C4 sectioning.texi:l36
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{numbered}
    |normalized:{numbered}
     {numbered}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {nu\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 sectioning.texi:l38
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
 *@node C1 sectioning.texi:l40 {unnumbered}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{unnumbered}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered}
 *@unnumberedsec C4 sectioning.texi:l41 {unnumbered section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered section}
  {empty_line:\\n}
  *@menu C6 sectioning.texi:l43
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 sectioning.texi:l44
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{unnumbered sub}
    |normalized:{unnumbered-sub}
     {unnumbered sub}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {un\\n}
   *menu_entry C4 sectioning.texi:l45
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{numbered sub}
    |normalized:{numbered-sub}
     {numbered sub}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {nu\\n}
   *menu_entry C4 sectioning.texi:l46
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{unnumbered sub2}
    |normalized:{unnumbered-sub2}
     {unnumbered sub2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {un2\\n}
   *menu_entry C4 sectioning.texi:l47
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{numbered sub2}
    |normalized:{numbered-sub2}
     {numbered sub2}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {nu2\\n}
   *@end C1 sectioning.texi:l48
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
 *@node C1 sectioning.texi:l50 {unnumbered sub}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{unnumbered-sub}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered sub}
 *@unnumberedsubsec C2 sectioning.texi:l51 {unnumbered subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered subsection}
  {empty_line:\\n}
 *@node C1 sectioning.texi:l53 {numbered sub}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{numbered-sub}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered sub}
 *@subsection C2 sectioning.texi:l54 {numbered subsection}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered subsection}
  {empty_line:\\n}
 *@node C1 sectioning.texi:l56 {unnumbered sub2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{unnumbered-sub2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered sub2}
 *@unnumberedsubsec C2 sectioning.texi:l57 {unnumbered subsection2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered subsection2}
  {empty_line:\\n}
 *@node C1 sectioning.texi:l59 {numbered sub2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{numbered-sub2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered sub2}
 *@subsection C2 sectioning.texi:l60 {numbered subsection2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered subsection2}
  {empty_line:\\n}
 *@node C1 sectioning.texi:l62 {unnumbered2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{unnumbered2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered2}
 *@unnumberedsec C4 sectioning.texi:l63 {unnumbered section2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered section2}
  {empty_line:\\n}
  *@menu C3 sectioning.texi:l65
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 sectioning.texi:l66
    {menu_entry_leading_text:*  }
    *menu_entry_node C1
    |EXTRA
    |node_content:{numbered sub3}
    |normalized:{numbered-sub3}
     {numbered sub3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 sectioning.texi:l67
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
 *@node C1 sectioning.texi:l69 {numbered sub3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{9}
 |normalized:{numbered-sub3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered sub3}
 *@subsection C3 sectioning.texi:l70 {numbered subsection3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{3}
 |section_number:{9}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered subsection3}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 sectioning.texi:l73 {numbered}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{10}
 |normalized:{numbered}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered}
 *@section C2 sectioning.texi:l74 {numbered section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument:  }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{10}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {numbered section}
  {empty_line:\\n}
 *@node C4 sectioning.texi:l76 {between node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{11}
 |normalized:{between-node}
  *arguments_line C4
   *line_arg C1
    {between node}
   *line_arg
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  {empty_line:\\n}
  *paragraph C1
   {between node, node without sectioning node\\n}
  {empty_line:\\n}
 *@node C4 sectioning.texi:l80 {Second node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{12}
 |normalized:{Second-node}
  *arguments_line C4
   *line_arg C1
    {Second node}
   *line_arg C1
   |EXTRA
   |node_content:{Third node unnumbered}
   |normalized:{Third-node-unnumbered}
    {Third node unnumbered}
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  {empty_line:\\n}
  *paragraph C1
   {Second node text\\n}
  {empty_line:\\n}
 *@chapter C4 sectioning.texi:l84 {second node chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{11}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {second node chapter}
  {empty_line:\\n}
  *paragraph C1
   {second node chapter text.\\n}
  {empty_line:\\n}
 *@node C1 sectioning.texi:l88 {Third node unnumbered}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{13}
 |normalized:{Third-node-unnumbered}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Third node unnumbered}
 *@unnumbered C5 sectioning.texi:l89 {unnumbered chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {unnumbered chapter}
  {empty_line:\\n}
  *paragraph C1
   {unnumbered chapter text.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C3 sectioning.texi:l94 {Last node no description}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{14}
 |normalized:{Last-node-no-description}
  *arguments_line C4
   *line_arg C1
    {Last node no description}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:{Third node unnumbered}
   |normalized:{Third-node-unnumbered}
    {Third node unnumbered}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  {empty_line:\\n}
  *@contents C1 sectioning.texi:l96
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
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

$result_converted_errors{'file_html'}->{'sectioning_check_menu_structure'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'file_name' => 'sectioning.texi',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
