use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_before_top_and_sections_chapter'} = '*document_root C13
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble_before_content
 *normal_command@node C10 nodes_before_top_and_sections.texi:l3 {first before top}
 |identifier:{first-before-top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first before top}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l4
  |element_node:{first-before-top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first before top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in first node before printindex\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l7
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:in first node\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l9
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:after second printindex in first node\\n}
  *normal_command@menu C3 nodes_before_top_and_sections.texi:l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-in-menu-before-top}
     {normal_text:node in menu before top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top_and_sections.texi:l13
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C10 nodes_before_top_and_sections.texi:l15 {node in menu before top}
 |identifier:{node-in-menu-before-top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node in menu before top}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{first-before-top}
    {normal_text:first before top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l17
  |element_node:{node-in-menu-before-top}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node in menu before top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:between node in menu before top and printindex\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l19
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:node in menu before top text after printindex\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l22
  |element_node:{node-in-menu-before-top}
  |index_entry:I{cp,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:printindex node in menu before top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C11 nodes_before_top_and_sections.texi:l25 {Top}
 |identifier:{Top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{first-before-top}
    {normal_text:first before top}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l26
  |element_node:{Top}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry a}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:in top node.\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l28
  |global_command_number:{4}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l30
  |global_command_number:{5}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:And one more index in top node\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l34
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@top C7 nodes_before_top_and_sections.texi:l36 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l37
  |element_node:{Top}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in top section\\n}
  {empty_line:\\n}
  *normal_command@menu C5 nodes_before_top_and_sections.texi:l41
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l42
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l43
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l44
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-in-chapter}
     {normal_text:node in chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top_and_sections.texi:l45
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C7 nodes_before_top_and_sections.texi:l47 {first}
 |identifier:{first}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C4
   {normal_text:Text and then index entries\\n}
   *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l49
   |element_node:{first}
   |index_entry:I{cp,6}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:! entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@findex C1 nodes_before_top_and_sections.texi:l50
   |element_node:{first}
   |index_entry:I{fn,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fun in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l51
   |element_node:{first}
   |index_entry:I{cp,7}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:entry in node}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l53
  |global_command_number:{7}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 nodes_before_top_and_sections.texi:l55
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l56
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{second}
     {normal_text:second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top_and_sections.texi:l57
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 nodes_before_top_and_sections.texi:l59 {second}
 |identifier:{second}
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:second}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{first}
    {normal_text:first}
    {spaces_after_argument:\\n}
  *normal_command@menu C4 nodes_before_top_and_sections.texi:l60
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l61
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{a-node}
     {normal_text:a node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 nodes_before_top_and_sections.texi:l62
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{another}
     {normal_text:another}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top_and_sections.texi:l63
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l65
  |global_command_number:{8}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 nodes_before_top_and_sections.texi:l67 {another}
 |identifier:{another}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:another}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{a-node}
    {spaces_before_argument: }
    {normal_text:a node}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{second}
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l69
  |element_node:{another}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:something}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 nodes_before_top_and_sections.texi:l70
  |element_node:{another}
  |index_entry:I{fn,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:somewhere}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l71
  |element_node:{another}
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:another}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C10 nodes_before_top_and_sections.texi:l73 {a node}
 |identifier:{a-node}
 |is_target:{1}
 |isindex:{1}
 |node_number:{7}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:a node}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{another}
    {spaces_before_argument: }
    {normal_text:another}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{second}
    {normal_text:second}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l74
  |element_node:{a-node}
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry after printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l76
  |global_command_number:{9}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 nodes_before_top_and_sections.texi:l78
  |element_node:{a-node}
  |index_entry:I{fn,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a function}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l79
  |element_node:{a-node}
  |index_entry:I{cp,11}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a concept a node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l81
  |global_command_number:{10}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 nodes_before_top_and_sections.texi:l83 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |isindex:{1}
 |node_number:{8}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chapter}
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{node-in-chapter}
    {normal_text:node in chapter}
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 nodes_before_top_and_sections.texi:l84 {A chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top_and_sections.texi:l86
  |global_command_number:{11}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C4 nodes_before_top_and_sections.texi:l88 {node in chapter}
 |identifier:{node-in-chapter}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node in chapter}
   *line_arg
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{chapter}
    {spaces_before_argument: }
    {normal_text:chapter}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top_and_sections.texi:l90
  |element_node:{node-in-chapter}
  |index_entry:I{cp,12}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node in chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'nodes_before_top_and_sections_chapter'} = '\\input texinfo @c -*-texinfo-*-

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


$result_texts{'nodes_before_top_and_sections_chapter'} = '
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

$result_errors{'nodes_before_top_and_sections_chapter'} = '* W nodes_before_top_and_sections.texi:l42|node `first\' in menu where `chapter\' expected
 warning: node `first\' in menu where `chapter\' expected

* W nodes_before_top_and_sections.texi:l3|node `first before top\' not in menu
 warning: node `first before top\' not in menu

';

$result_nodes_list{'nodes_before_top_and_sections_chapter'} = '1|first before top
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

$result_sections_list{'nodes_before_top_and_sections_chapter'} = '1|top section
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

$result_sectioning_root{'nodes_before_top_and_sections_chapter'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'nodes_before_top_and_sections_chapter'} = '';

$result_indices_sort_strings{'nodes_before_top_and_sections_chapter'} = 'cp:
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

$result_converted_sort_strings{'file_html'}->{'nodes_before_top_and_sections_chapter'} = 'cp:
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
