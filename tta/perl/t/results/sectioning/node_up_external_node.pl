use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_up_external_node'} = 'U0 unit{C2}{N:Top}
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
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
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
   *@end C1 l5
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C1}{N:chap first}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
NodeNext: (manual1)
NodePrev: (manual2)
NodeUp: (manual3)
NodeForward: (manual1)
NodeBack: [U0]
 *@node C1 l7 {chap first}
 |EXTRA
 |identifier:{chap-first}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap first}
   *line_arg C4
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:manual1}
    {normal_text:)}
   *line_arg C5
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:manual2}
    {normal_text:)}
    {spaces_after_argument: }
   *line_arg C5
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:manual3}
    {normal_text:)}
    {spaces_after_argument:\\n}
';


$result_texis{'node_up_external_node'} = '@node Top

@menu
* chap first::
@end menu

@node chap first, (manual1), (manual2) , (manual3)
';


$result_texts{'node_up_external_node'} = '
* chap first::

';

$result_errors{'node_up_external_node'} = '';

$result_nodes_list{'node_up_external_node'} = '1|Top
 menus:
  chap first
 node_directions:
  next->chap first
2|chap first
 node_directions:
  next-> (manual1)
  prev-> (manual2) 
  up-> (manual3)

';

$result_sections_list{'node_up_external_node'} = '';

$result_sectioning_root{'node_up_external_node'} = '';

$result_headings_list{'node_up_external_node'} = '';


$result_converted{'plaintext'}->{'node_up_external_node'} = '';


$result_converted{'html'}->{'node_up_external_node'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap-first" accesskey="n" rel="next">chap first</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap-first"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="manual1.html#Top" accesskey="n" rel="next">(manual1)</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="manual2.html#Top" accesskey="p" rel="prev">(manual2)</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="manual3.html#Top" accesskey="u" rel="up">(manual3)</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap first<a class="copiable-link" href="#chap-first"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'node_up_external_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'node_up_external_node'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap first</nodenext></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap first</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-first"><nodename> chap first</nodename><nodenext> (manual1)</nodenext><nodeprev> (manual2)</nodeprev><nodeup> (manual3)</nodeup></node>
';

1;
