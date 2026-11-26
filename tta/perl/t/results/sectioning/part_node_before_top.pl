use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_node_before_top'} = 'U0 unit{C5}{S:@top top}{n:Top}
UNIT_DIRECTIONS
This: [U0]
NodeNext: [U0]
NodeForward: [U0]
NodeBack: [U0]
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {part node before top}
 |identifier:{part-node-before-top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:part node before top}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@part C2 l2 {part}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C3 l5 {top}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{part-node-before-top}
     {normal_text:part node before top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l9
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'part_node_before_top'} = '@node part node before top, Top,,Top
@part part

@node Top
@top top

@menu
* part node before top::
@end menu
';


$result_texts{'part_node_before_top'} = 'part
****

top
***

* part node before top::
';

$result_errors{'part_node_before_top'} = '* W l2|@node precedes @part, but parts may not be associated with nodes
 warning: @node precedes @part, but parts may not be associated with nodes

* W l2|@part should not be associated with @top
 warning: @part should not be associated with @top

';

$result_nodes_list{'part_node_before_top'} = '1|part node before top
 node_directions:
  next->Top
  up->Top
2|Top
 associated_section: top
 node_preceding_part: part
 associated_title_command: top
 menus:
  part node before top
 node_directions:
  next->part node before top
';

$result_sections_list{'part_node_before_top'} = '1|part
 part_following_node: Top
 part_associated_section: top
 section_directions:
  next->top
2|top
 associated_anchor_command: Top
 associated_node: Top
 associated_part: part
 section_directions:
  prev->part
';

$result_sectioning_root{'part_node_before_top'} = 'level: -1
list:
 1|part
 2|top
';

$result_headings_list{'part_node_before_top'} = '';


$result_converted{'info'}->{'part_node_before_top'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: part node before top,  Next: Top,  Up: Top


File: ,  Node: Top,  Next: part node before top,  Up: (dir)

top
***

* Menu:

* part node before top::


Tag Table:
Node: part node before top27
Node: Top88

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'part_node_before_top'} = '<!DOCTYPE html>
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

<body>
<a class="node-id" id="part-node-before-top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Top" accesskey="n" rel="next">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>part node before top<a class="copiable-link" href="#part-node-before-top"> &para;</a></span></h4>
<hr>
<div class="part-level-extent" id="part">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#part-node-before-top" accesskey="n" rel="next">part node before top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

</div>
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_node_before_top'} = '<node identifier="part-node-before-top"><nodename> part node before top</nodename><nodenext> Top</nodenext><nodeprev></nodeprev><nodeup>Top</nodeup></node>
<part><sectiontitle> part</sectiontitle>

</part>
<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> part node before top</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>part node before top</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
</top>
';

1;
