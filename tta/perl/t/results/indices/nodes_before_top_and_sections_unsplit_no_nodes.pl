use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nodes_before_top_and_sections_unsplit_no_nodes'} = '*document_root C13
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C10 nodes_before_top_and_sections.texi:l3 {first before top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
 |normalized:{first-before-top}
  *arguments_line C4
   *line_arg C1
    {first before top}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{first-before-top}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first before top}
  {empty_line:\\n}
  *paragraph C1
   {in first node before printindex\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  *paragraph C1
   {in first node\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  *paragraph C1
   {after second printindex in first node\\n}
  *@menu C3 nodes_before_top_and_sections.texi:l11
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node in menu before top}
    |normalized:{node-in-menu-before-top}
     {node in menu before top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 nodes_before_top_and_sections.texi:l13
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
 *@node C10 nodes_before_top_and_sections.texi:l15 {node in menu before top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{node-in-menu-before-top}
  *arguments_line C4
   *line_arg C1
    {node in menu before top}
   *line_arg
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{first before top}
   |normalized:{first-before-top}
    {first before top}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{node-in-menu-before-top}
  |index_entry:I{cp,2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node in menu before top}
  *paragraph C1
   {between node in menu before top and printindex\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l19
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  *paragraph C1
   {node in menu before top text after printindex\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l22
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{node-in-menu-before-top}
  |index_entry:I{cp,3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {printindex node in menu before top}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C11 nodes_before_top_and_sections.texi:l25 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{Top}
  *arguments_line C3
   *line_arg C1
    {Top}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{first before top}
   |normalized:{first-before-top}
    {first before top}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l26
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {entry a}
  *paragraph C1
   {in top node.\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l28
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l30
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{5}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
  {empty_line:\\n}
  *paragraph C1
   {And one more index in top node\\n}
  {empty_line:\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l34
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
 *@top C7 nodes_before_top_and_sections.texi:l36 {top section}
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
    {top section}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,5}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top section}
  {empty_line:\\n}
  *paragraph C1
   {in top section\\n}
  {empty_line:\\n}
  *@menu C5 nodes_before_top_and_sections.texi:l41
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l42
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
   *menu_entry C4 nodes_before_top_and_sections.texi:l43
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l44
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node in chapter}
    |normalized:{node-in-chapter}
     {node in chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 nodes_before_top_and_sections.texi:l45
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
 *@node C7 nodes_before_top_and_sections.texi:l47 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
 |normalized:{first}
  *arguments_line C4
   *line_arg C1
    {first}
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
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  *paragraph C4
   {Text and then index entries\\n}
   *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l49
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{first}
   |index_entry:I{cp,6}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {! entry in node}
   *index_entry_command@findex C1 nodes_before_top_and_sections.texi:l50
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{first}
   |index_entry:I{fn,1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {fun in node}
   *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l51
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |element_node:{first}
   |index_entry:I{cp,7}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {entry in node}
  {empty_line:\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l53
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{7}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *@menu C3 nodes_before_top_and_sections.texi:l55
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l56
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{second}
    |normalized:{second}
     {second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 nodes_before_top_and_sections.texi:l57
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
 *@node C5 nodes_before_top_and_sections.texi:l59 {second}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
 |normalized:{second}
  *arguments_line C4
   *line_arg C1
    {second}
   *line_arg
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{first}
   |normalized:{first}
    {first}
  *@menu C4 nodes_before_top_and_sections.texi:l60
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l61
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{a node}
    |normalized:{a-node}
     {a node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l62
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{another}
    |normalized:{another}
     {another}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 nodes_before_top_and_sections.texi:l63
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
  *@printindex C1 nodes_before_top_and_sections.texi:l65
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{8}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
  {empty_line:\\n}
 *@node C6 nodes_before_top_and_sections.texi:l67 {another}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{another}
  *arguments_line C4
   *line_arg C1
    {another}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{a node}
   |normalized:{a-node}
    {a node}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{second}
   |normalized:{second}
    {second}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l69
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{another}
  |index_entry:I{cp,8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {something}
  *index_entry_command@findex C1 nodes_before_top_and_sections.texi:l70
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{another}
  |index_entry:I{fn,2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {somewhere}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l71
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{another}
  |index_entry:I{cp,9}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {another}
  {empty_line:\\n}
 *@node C10 nodes_before_top_and_sections.texi:l73 {a node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{7}
 |normalized:{a-node}
  *arguments_line C4
   *line_arg C1
    {a node}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{another}
   |normalized:{another}
    {another}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{second}
   |normalized:{second}
    {second}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l74
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{a-node}
  |index_entry:I{cp,10}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {entry after printindex}
  {empty_line:\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l76
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{9}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *index_entry_command@findex C1 nodes_before_top_and_sections.texi:l78
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{a-node}
  |index_entry:I{fn,3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a function}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l79
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{a-node}
  |index_entry:I{cp,11}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a concept a node}
  {empty_line:\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l81
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{10}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
 *@node C1 nodes_before_top_and_sections.texi:l83 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{8}
 |normalized:{chapter}
  *arguments_line C4
   *line_arg C1
    {chapter}
   *line_arg C1
   |EXTRA
   |node_content:{node in chapter}
   |normalized:{node-in-chapter}
    {node in chapter}
   *line_arg
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
 *@chapter C4 nodes_before_top_and_sections.texi:l84 {A chapter}
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
    {A chapter}
  {empty_line:\\n}
  *@printindex C1 nodes_before_top_and_sections.texi:l86
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{11}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
 *@node C4 nodes_before_top_and_sections.texi:l88 {node in chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{9}
 |normalized:{node-in-chapter}
  *arguments_line C4
   *line_arg C1
    {node in chapter}
   *line_arg
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{chapter}
   |normalized:{chapter}
    {chapter}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |node_content:{Top}
   |normalized:{Top}
    {Top}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l90
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{node-in-chapter}
  |index_entry:I{cp,12}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node in chapter}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'nodes_before_top_and_sections_unsplit_no_nodes'} = '\\input texinfo @c -*-texinfo-*-

@node first before top, Top, ,(dir)
@cindex first before top

in first node before printindex
@printindex cp
in first node
@printindex cp
after second printindex in first node
@menu
* node in menu before top::
@end menu

@node node in menu before top,,,first before top

@cindex node in menu before top
between node in menu before top and printindex
@printindex cp
node in menu before top text after printindex

@cindex printindex node in menu before top


@node Top, ,first before top
@cindex entry a
in top node.
@printindex cp

@printindex fn

And one more index in top node

@printindex cp

@top top section
@cindex top section

in top section

@menu
* first::
* chapter::
* node in chapter::
@end menu

@node first,,Top, Top
Text and then index entries
@cindex ! entry in node
@findex fun in node
@cindex entry in node

@printindex cp

@menu
* second::
@end menu

@node second,,,first
@menu
* a node::
* another::
@end menu

@printindex fn

@node another, , a node, second

@cindex something
@findex somewhere
@cindex another

@node a node, another, ,second
@cindex entry after printindex

@printindex cp

@findex a function
@cindex a concept a node

@printindex cp

@node chapter,node in chapter,,Top
@chapter A chapter

@printindex cp

@node node in chapter,, chapter,Top

@cindex node in chapter

@bye
';


$result_texts{'nodes_before_top_and_sections_unsplit_no_nodes'} = '
in first node before printindex
in first node
after second printindex in first node
* node in menu before top::


between node in menu before top and printindex
node in menu before top text after printindex



in top node.


And one more index in top node


top section
***********

in top section

* first::
* chapter::
* node in chapter::

Text and then index entries


* second::

* a node::
* another::








1 A chapter
***********




';

$result_errors{'nodes_before_top_and_sections_unsplit_no_nodes'} = '* W nodes_before_top_and_sections.texi:l42|node `first\' in menu where `chapter\' expected
 warning: node `first\' in menu where `chapter\' expected

* W nodes_before_top_and_sections.texi:l3|node `first before top\' not in menu
 warning: node `first before top\' not in menu

';

$result_nodes_list{'nodes_before_top_and_sections_unsplit_no_nodes'} = '1|first before top
 menus:
  node in menu before top
 node_directions:
  next->Top
  up->(dir)

2|node in menu before top
 node_directions:
  up->first before top
3|Top
 associated_section: top section
 associated_title_command: top section
 menus:
  first
  chapter
  node in chapter
 node_directions:
  prev->first before top
4|first
 menus:
  second
 node_directions:
  prev->Top
  up->Top
5|second
 menus:
  a node
  another
 node_directions:
  up->first
6|another
 node_directions:
  prev->a node
  up->second
7|a node
 node_directions:
  next->another
  up->second
8|chapter
 associated_section: 1 A chapter
 associated_title_command: 1 A chapter
 node_directions:
  next->node in chapter
  up->Top
9|node in chapter
 node_directions:
  prev->chapter
  up->Top
';

$result_sections_list{'nodes_before_top_and_sections_unsplit_no_nodes'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A chapter
 section_children:
  1|A chapter
2|A chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'nodes_before_top_and_sections_unsplit_no_nodes'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'nodes_before_top_and_sections_unsplit_no_nodes'} = '';

$result_indices_sort_strings{'nodes_before_top_and_sections_unsplit_no_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 first before top
 node in chapter
 node in menu before top
 printindex node in menu before top
 something
 top section
fn:
 a function
 fun in node
 somewhere
';

1;
