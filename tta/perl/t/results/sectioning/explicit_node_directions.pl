use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'explicit_node_directions'} = 'U0 unit{C2}{N:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap-node}
     {normal_text:chap node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{third-node}
     {normal_text:third node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C1}{N:chap node}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C4 l8 {chap node}
 |EXTRA
 |identifier:{chap-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap node}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{third-node}
    {spaces_before_argument: }
    {normal_text:third node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second node\\n}
  {empty_line:\\n}
U2 unit{C1}{N:third node}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *@node C1 l12 {third node}
 |EXTRA
 |identifier:{third-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:third node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{chap-node}
    {normal_text:chap node}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
';


$result_texis{'explicit_node_directions'} = '@node Top
Top node
@menu
* chap node::
* third node::
@end menu

@node chap node, third node,Top,Top

second node

@node third node,,chap node,Top
';


$result_texts{'explicit_node_directions'} = 'Top node
* chap node::
* third node::


second node

';

$result_errors{'explicit_node_directions'} = '';

$result_nodes_list{'explicit_node_directions'} = '1|Top
 menus:
  chap node
  third node
 node_directions:
  next->chap node
2|chap node
 node_directions:
  next->third node
  prev->Top
  up->Top
3|third node
 node_directions:
  prev->chap node
  up->Top
';

$result_sections_list{'explicit_node_directions'} = '';

$result_sectioning_root{'explicit_node_directions'} = '';

$result_headings_list{'explicit_node_directions'} = '';


$result_converted{'info'}->{'explicit_node_directions'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap node,  Up: (dir)

Top node
* Menu:

* chap node::
* third node::


File: ,  Node: chap node,  Next: third node,  Prev: Top,  Up: Top

second node


File: ,  Node: third node,  Prev: chap node,  Up: Top


Tag Table:
Node: Top27
Node: chap node127
Node: third node209

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'explicit_node_directions'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap-node" accesskey="n" rel="next">chap node</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<p>Top node
</p>
<hr>
<a class="node-id" id="chap-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#third-node" accesskey="n" rel="next">third node</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap node<a class="copiable-link" href="#chap-node"> &para;</a></span></h4>

<p>second node
</p>
<hr>
<a class="node-id" id="third-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chap-node" accesskey="p" rel="prev">chap node</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>third node<a class="copiable-link" href="#third-node"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'explicit_node_directions'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'explicit_node_directions'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap node</nodenext></node>
<para>Top node
</para><menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>third node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-node"><nodename> chap node</nodename><nodenext> third node</nodenext><nodeprev>Top</nodeprev><nodeup>Top</nodeup></node>

<para>second node
</para>
<node identifier="third-node"><nodename> third node</nodename><nodenext></nodenext><nodeprev>chap node</nodeprev><nodeup>Top</nodeup></node>
';

1;
