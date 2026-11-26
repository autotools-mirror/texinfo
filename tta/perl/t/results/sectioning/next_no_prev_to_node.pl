use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'next_no_prev_to_node'} = '*document_root C4
 *before_node_section C1
  *preamble
 *normal_command@node C4 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chap-first-node}
     {normal_text:chap first node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{no-return}
     {normal_text:no return}
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
 *normal_command@node C2 l8 {chap first node}
 |identifier:{chap-first-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap first node}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{no-return}
    {spaces_before_argument: }
    {normal_text:no return}
   *line_arg
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {no return}
 |identifier:{no-return}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:no return}
   *line_arg
   *line_arg
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument: \\n}
';


$result_texis{'next_no_prev_to_node'} = '@node Top

@menu
* chap first node::
* no return::
@end menu

@node chap first node, no return,, Top

@node no return,,, Top 
';


$result_texts{'next_no_prev_to_node'} = '
* chap first node::
* no return::


';

$result_errors{'next_no_prev_to_node'} = '';

$result_nodes_list{'next_no_prev_to_node'} = '1|Top
 menus:
  chap first node
  no return
 node_directions:
  next->chap first node
2|chap first node
 node_directions:
  next->no return
  up->Top
3|no return
 node_directions:
  up->Top
';

$result_sections_list{'next_no_prev_to_node'} = '';

$result_sectioning_root{'next_no_prev_to_node'} = '';

$result_headings_list{'next_no_prev_to_node'} = '';


$result_converted{'xml'}->{'next_no_prev_to_node'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap first node</nodenext></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap first node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>no return</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-first-node"><nodename> chap first node</nodename><nodenext> no return</nodenext><nodeprev></nodeprev><nodeup> Top</nodeup></node>

<node identifier="no-return"><nodename> no return</nodename><nodenext></nodenext><nodeprev></nodeprev><nodeup> Top</nodeup></node>
';

1;
