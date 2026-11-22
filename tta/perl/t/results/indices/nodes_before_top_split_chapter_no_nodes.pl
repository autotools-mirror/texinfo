use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_before_top_split_chapter_no_nodes'} = '*document_root C9
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:test nodes before Top node}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
 *normal_command@node C6 nodes_before_top.texi:l6 {first before top}
 |EXTRA
 |identifier:{first-before-top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first before top}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C4
   |EXTRA
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l7
  |EXTRA
  |element_node:{first-before-top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first before top}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l8
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:in first node\\n}
  *normal_command@menu C3 nodes_before_top.texi:l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-in-menu-before-top}
     {normal_text:node in menu before top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top.texi:l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C9 nodes_before_top.texi:l14 {node in menu before top}
 |EXTRA
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
   |EXTRA
   |node_content:A{0|0}
   |normalized:{first-before-top}
    {normal_text:first before top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l16
  |EXTRA
  |element_node:{node-in-menu-before-top}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node in menu before top}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l17
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:node in menu before top text\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l20
  |EXTRA
  |element_node:{node-in-menu-before-top}
  |index_entry:I{cp,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:printindex node in menu before top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C13 nodes_before_top.texi:l23 {Top}
 |EXTRA
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
   |EXTRA
   |node_content:A{0|0}
   |normalized:{first-before-top}
    {normal_text:first before top}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l24
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l26
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l28
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:And one one more index\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l32
  |EXTRA
  |global_command_number:{5}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 nodes_before_top.texi:l34
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap-first}
     {normal_text:chap first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top.texi:l36
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C7 nodes_before_top.texi:l38 {chap first}
 |EXTRA
 |identifier:{chap-first}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap first}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C4
   {normal_text:Text and then index entries\\n}
   *index_entry_command@cindex C1 nodes_before_top.texi:l40
   |EXTRA
   |element_node:{chap-first}
   |index_entry:I{cp,5}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:! entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@findex C1 nodes_before_top.texi:l41
   |EXTRA
   |element_node:{chap-first}
   |index_entry:I{fn,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fun in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 nodes_before_top.texi:l42
   |EXTRA
   |element_node:{chap-first}
   |index_entry:I{cp,6}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:entry in node}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l44
  |EXTRA
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 nodes_before_top.texi:l46
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top.texi:l47
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{second}
     {normal_text:second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top.texi:l48
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 nodes_before_top.texi:l50 {second}
 |EXTRA
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
   |EXTRA
   |node_content:A{0|0}
   |normalized:{chap-first}
    {normal_text:chap first}
    {spaces_after_argument:\\n}
  *normal_command@menu C4 nodes_before_top.texi:l51
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 nodes_before_top.texi:l52
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-node}
     {normal_text:a node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 nodes_before_top.texi:l53
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{another}
     {normal_text:another}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 nodes_before_top.texi:l54
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l56
  |EXTRA
  |global_command_number:{7}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 nodes_before_top.texi:l58 {another}
 |EXTRA
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
   |EXTRA
   |node_content:A{1|1}
   |normalized:{a-node}
    {spaces_before_argument: }
    {normal_text:a node}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{second}
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l60
  |EXTRA
  |element_node:{another}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:something}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 nodes_before_top.texi:l61
  |EXTRA
  |element_node:{another}
  |index_entry:I{fn,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:somewhere}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l62
  |EXTRA
  |element_node:{another}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:another}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C10 nodes_before_top.texi:l64 {a node}
 |EXTRA
 |identifier:{a-node}
 |is_target:{1}
 |isindex:{1}
 |node_number:{7}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:a node}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{another}
    {spaces_before_argument: }
    {normal_text:another}
   *line_arg C1
    {spaces_before_argument: }
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{second}
    {normal_text:second}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l65
  |EXTRA
  |element_node:{a-node}
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry after printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l67
  |EXTRA
  |global_command_number:{8}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 nodes_before_top.texi:l69
  |EXTRA
  |element_node:{a-node}
  |index_entry:I{fn,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a function}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 nodes_before_top.texi:l70
  |EXTRA
  |element_node:{a-node}
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a concept a node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 nodes_before_top.texi:l72
  |EXTRA
  |global_command_number:{9}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'nodes_before_top_split_chapter_no_nodes'} = '\\input texinfo @c -*-texinfo-*-

@c test nodes before Top node


@node first before top, Top, ,(dir)
@cindex first before top
@printindex cp
in first node
@menu
* node in menu before top::
@end menu

@node node in menu before top,,,first before top

@cindex node in menu before top
@printindex cp
node in menu before top text

@cindex printindex node in menu before top


@node Top, ,first before top
@cindex entry a

@printindex cp

@printindex fn

And one one more index

@printindex cp

@menu
* chap first::
@end menu

@node chap first,,Top, Top
Text and then index entries
@cindex ! entry in node
@findex fun in node
@cindex entry in node

@printindex cp

@menu
* second::
@end menu

@node second,,,chap first
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

@bye
';


$result_texts{'nodes_before_top_split_chapter_no_nodes'} = '

in first node
* node in menu before top::


node in menu before top text






And one one more index


* chap first::

Text and then index entries


* second::

* a node::
* another::








';

$result_errors{'nodes_before_top_split_chapter_no_nodes'} = '* W nodes_before_top.texi:l6|node `first before top\' not in menu
 warning: node `first before top\' not in menu

';

$result_nodes_list{'nodes_before_top_split_chapter_no_nodes'} = '1|first before top
 menus:
  node in menu before top
 node_directions:
  next->Top
  up->(dir)

2|node in menu before top
 node_directions:
  up->first before top
3|Top
 menus:
  chap first
 node_directions:
  prev->first before top
4|chap first
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
  up->chap first
6|another
 node_directions:
  prev->a node
  up->second
7|a node
 node_directions:
  next->another
  up->second
';

$result_sections_list{'nodes_before_top_split_chapter_no_nodes'} = '';

$result_sectioning_root{'nodes_before_top_split_chapter_no_nodes'} = '';

$result_headings_list{'nodes_before_top_split_chapter_no_nodes'} = '';

$result_indices_sort_strings{'nodes_before_top_split_chapter_no_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 first before top
 node in menu before top
 printindex node in menu before top
 something
fn:
 a function
 fun in node
 somewhere
';

$result_converted_sort_strings{'file_html'}->{'nodes_before_top_split_chapter_no_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 first before top
 node in menu before top
 printindex node in menu before top
 something
fn:
 a function
 fun in node
 somewhere
';

$result_converted_errors{'file_html'}->{'nodes_before_top_split_chapter_no_nodes'} = '* W nodes_before_top.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

* W nodes_before_top.texi:l40|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l70|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l62|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l24|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l65|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l42|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l7|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l16|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l20|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l60|entry for index `cp\' for @printindex cp outside of any section
 warning: entry for index `cp\' for @printindex cp outside of any section

* W nodes_before_top.texi:l69|entry for index `fn\' for @printindex fn outside of any section
 warning: entry for index `fn\' for @printindex fn outside of any section

* W nodes_before_top.texi:l41|entry for index `fn\' for @printindex fn outside of any section
 warning: entry for index `fn\' for @printindex fn outside of any section

* W nodes_before_top.texi:l61|entry for index `fn\' for @printindex fn outside of any section
 warning: entry for index `fn\' for @printindex fn outside of any section

';

1;
