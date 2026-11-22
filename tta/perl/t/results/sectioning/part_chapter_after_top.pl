use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_chapter_after_top'} = 'U0 unit{C3}{S:@top top}{n:Top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
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
U1 unit{C3}{S:@chapter 1 chapter}{n:chapter}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
NodePrev: [U0]
NodeUp: [U0]
NodeBack: [U0]
 *@part C2 l8 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l10 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C1 l11 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument: \\n}
';


$result_texis{'part_chapter_after_top'} = '@node Top
@top top

@menu
* chapter::
@end menu

@part part

@node chapter
@chapter chapter 
';


$result_texts{'part_chapter_after_top'} = 'top
***

* chapter::

part
****

1 chapter
*********
';

$result_errors{'part_chapter_after_top'} = '';

$result_nodes_list{'part_chapter_after_top'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 node_preceding_part: part
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'part_chapter_after_top'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part
 toplevel_directions:
  next->chapter
2|part
 part_following_node: chapter
 part_associated_section: 1 chapter
 section_directions:
  prev->top
 section_children:
  1|chapter
3|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 associated_part: part
 section_directions:
  up->part
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'part_chapter_after_top'} = 'level: -1
list:
 1|top
 2|part
';

$result_headings_list{'part_chapter_after_top'} = '';


$result_converted{'info'}->{'part_chapter_after_top'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top
***

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chapter
*********


Tag Table:
Node: Top27
Node: chapter108

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'part_chapter_after_top'} = '<!DOCTYPE html>
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
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
</div>
<div class="part-level-extent" id="part">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chapter</a></li>
</ul>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_chapter_after_top'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part><sectiontitle> part</sectiontitle>

<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chapter </sectiontitle>
</chapter>
</part>
';

1;
