use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_nodes'} = '*document_root C7
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble
 *normal_command@node C13 index_nodes.texi:l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_nodes.texi:l4
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l6
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l8
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:And one one more index\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l12
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 index_nodes.texi:l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_nodes.texi:l15
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chap-first}
     {normal_text:chap first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 index_nodes.texi:l16
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C7 index_nodes.texi:l18 {chap first}
 |identifier:{chap-first}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap first}
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
  *paragraph C5
   {normal_text:Text and then index entries\\n}
   *index_entry_command@cindex C1 index_nodes.texi:l20
   |element_node:{chap-first}
   |index_entry:I{cp,2}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 index_nodes.texi:l21
   |element_node:{chap-first}
   |index_entry:I{cp,3}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:! entry in node}
     {spaces_after_argument:\\n}
   *index_entry_command@findex C1 index_nodes.texi:l22
   |element_node:{chap-first}
   |index_entry:I{fn,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fun in node}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 index_nodes.texi:l23
   |element_node:{chap-first}
   |index_entry:I{cp,4}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:entry in node}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l25
  |global_command_number:{4}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 index_nodes.texi:l27
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_nodes.texi:l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{second}
     {normal_text:second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 index_nodes.texi:l29
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 index_nodes.texi:l31 {second}
 |identifier:{second}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:second}
   *line_arg
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{chap-first}
    {normal_text:chap first}
    {spaces_after_argument:\\n}
  *normal_command@menu C4 index_nodes.texi:l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_nodes.texi:l33
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{a-node}
     {normal_text:a node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 index_nodes.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{another}
     {normal_text:another}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 index_nodes.texi:l35
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l37
  |global_command_number:{5}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C6 index_nodes.texi:l39 {another}
 |identifier:{another}
 |is_target:{1}
 |node_number:{4}
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
  *index_entry_command@cindex C1 index_nodes.texi:l41
  |element_node:{another}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:something}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 index_nodes.texi:l42
  |element_node:{another}
  |index_entry:I{fn,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:somewhere}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_nodes.texi:l43
  |element_node:{another}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:another}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C10 index_nodes.texi:l45 {a node}
 |identifier:{a-node}
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
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
  *index_entry_command@cindex C1 index_nodes.texi:l46
  |element_node:{a-node}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry after printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l48
  |global_command_number:{6}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 index_nodes.texi:l50
  |element_node:{a-node}
  |index_entry:I{fn,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a function}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_nodes.texi:l51
  |element_node:{a-node}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a concept a node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_nodes.texi:l53
  |global_command_number:{7}
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


$result_texis{'index_nodes'} = '\\input texinfo @c -*-texinfo-*-

@node Top
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
@cindex entry in node
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


$result_texts{'index_nodes'} = '


And one one more index


* chap first::

Text and then index entries


* second::

* a node::
* another::








';

$result_errors{'index_nodes'} = '';

$result_nodes_list{'index_nodes'} = '1|Top
 menus:
  chap first
 node_directions:
  next->chap first
2|chap first
 menus:
  second
 node_directions:
  prev->Top
  up->Top
3|second
 menus:
  a node
  another
 node_directions:
  up->chap first
4|another
 node_directions:
  prev->a node
  up->second
5|a node
 node_directions:
  next->another
  up->second
';

$result_sections_list{'index_nodes'} = '';

$result_sectioning_root{'index_nodes'} = '';

$result_headings_list{'index_nodes'} = '';

$result_indices_sort_strings{'index_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 entry in node
 something
fn:
 a function
 fun in node
 somewhere
';

$result_converted_sort_strings{'file_info'}->{'index_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 entry in node
 something
fn:
 a function
 fun in node
 somewhere
';

$result_converted_sort_strings{'file_html'}->{'index_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 entry in node
 something
fn:
 a function
 fun in node
 somewhere
';

$result_converted_errors{'file_html'}->{'index_nodes'} = '* W index_nodes.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

$result_converted_sort_strings{'file_plaintext'}->{'index_nodes'} = 'cp:
 ! entry in node
 a concept a node
 another
 entry a
 entry after printindex
 entry in node
 entry in node
 something
fn:
 a function
 fun in node
 somewhere
';

1;
