use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'part_node_after_top'} = 'U0 unit{S:top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
NodeNext: [U0]
NodeForward: [U0]
NodeBack: [U0]
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C4 l2 {top}
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
    {top}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap part node after top}
    |normalized:{chap-part-node-after-top}
     {chap part node after top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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
 *@node C1 l8 {chap part node after top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-part-node-after-top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap part node after top}
U1 unit{S:part}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
Prev: [U0]
 *@part C1 l9 {part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {part}
';


$result_texis{'part_node_after_top'} = '@node Top
@top top

@menu
* chap part node after top::
@end menu

@node chap part node after top
@part part
';


$result_texts{'part_node_after_top'} = 'top
***

* chap part node after top::

part
****
';

$result_errors{'part_node_after_top'} = '* W l9|@node precedes @part, but parts may not be associated with nodes
 warning: @node precedes @part, but parts may not be associated with nodes

* W l9|no sectioning command associated with @part
 warning: no sectioning command associated with @part

';

$result_nodes_list{'part_node_after_top'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chap part node after top
 node_directions:
  next->chap part node after top
2|chap part node after top
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'part_node_after_top'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part
2|part
 section_directions:
  prev->top
';

$result_sectioning_root{'part_node_after_top'} = 'level: -1
list:
 1|top
 2|part
';

$result_headings_list{'part_node_after_top'} = '';


$result_converted{'info'}->{'part_node_after_top'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap part node after top,  Up: (dir)

top
***

* Menu:

* chap part node after top::


File: ,  Node: chap part node after top,  Prev: Top,  Up: Top


Tag Table:
Node: Top27
Node: chap part node after top142

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'part_node_after_top'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap-part-node-after-top" accesskey="n" rel="next">chap part node after top</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap-part-node-after-top"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h4 class="node"><span>chap part node after top<a class="copiable-link" href="#chap-part-node-after-top"> &para;</a></span></h4>
</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_node_after_top'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap part node after top</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap part node after top</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chap-part-node-after-top" spaces=" "><nodename>chap part node after top</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<part spaces=" "><sectiontitle>part</sectiontitle>
</part>
';

1;
