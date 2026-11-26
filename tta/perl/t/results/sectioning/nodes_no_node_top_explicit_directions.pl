use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_no_node_top_explicit_directions'} = 'U0 unit{C2}{N:first}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeUp: (dir)
NodeForward: [U1]
 *before_node_section C1
  *preamble
 *normal_command@node C5 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first}
   *line_arg
   *line_arg
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:first node\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{second-node}
     {normal_text:second node}
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
U1 unit{C1}{N:second node}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
NodePrev: [U0]
NodeUp: [U0]
NodeBack: [U0]
 *normal_command@node C2 l8 {second node}
 |identifier:{second-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:second node}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{first}
    {normal_text:first}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{first}
    {normal_text:first}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:second node\\n}
';


$result_texis{'nodes_no_node_top_explicit_directions'} = '@node first,,,(dir)
first node

@menu
* second node::
@end menu

@node second node,,first,first
second node
';


$result_texts{'nodes_no_node_top_explicit_directions'} = 'first node

* second node::

second node
';

$result_errors{'nodes_no_node_top_explicit_directions'} = '* W l1|node `first\' not in menu
 warning: node `first\' not in menu

';

$result_nodes_list{'nodes_no_node_top_explicit_directions'} = '1|first
 menus:
  second node
 node_directions:
  up->(dir)

2|second node
 node_directions:
  prev->first
  up->first
';

$result_sections_list{'nodes_no_node_top_explicit_directions'} = '';

$result_sectioning_root{'nodes_no_node_top_explicit_directions'} = '';

$result_headings_list{'nodes_no_node_top_explicit_directions'} = '';


$result_converted{'info'}->{'nodes_no_node_top_explicit_directions'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: first,  Up: (dir)

first node

* Menu:

* second node::


File: ,  Node: second node,  Prev: first,  Up: first

second node


Tag Table:
Node: first27
Node: second node101

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'nodes_no_node_top_explicit_directions'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'nodes_no_node_top_explicit_directions'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#first" rel="start" title="first">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="first"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="dir.html#Top" accesskey="u" rel="up">(dir)</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>
<p>first node
</p>

<hr>
<a class="node-id" id="second-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#first" accesskey="p" rel="prev">first</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#first" accesskey="u" rel="up">first</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>second node<a class="copiable-link" href="#second-node"> &para;</a></span></h4>
<p>second node
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'nodes_no_node_top_explicit_directions'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'nodes_no_node_top_explicit_directions'} = '<node identifier="first"><nodename> first</nodename><nodenext></nodenext><nodeprev></nodeprev><nodeup>(dir)</nodeup></node>
<para>first node
</para>
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>second node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="second-node"><nodename> second node</nodename><nodenext></nodenext><nodeprev>first</nodeprev><nodeup>first</nodeup></node>
<para>second node
</para>';

1;
