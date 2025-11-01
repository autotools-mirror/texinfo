use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'lone_chapter_between_nodes'} = '*document_root C8
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
 *@top C4 l2 {Top}
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
    {Top}
  {empty_line:\\n}
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{1}
    |normalized:{1}
     {1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{3}
    |normalized:{3}
     {3}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l7
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
 *@node C1 l9 {1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
 *@chapter C2 l10 {1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  {empty_line:\\n}
 *@chapter C2 l12 {2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2}
  {empty_line:\\n}
 *@node C1 l14 {3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {3}
 *@chapter C1 l15 {3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {3}
';


$result_texis{'lone_chapter_between_nodes'} = '@node Top
@top Top

@menu
* 1::
* 3::
@end menu

@node 1
@chapter 1

@chapter 2

@node 3
@chapter 3
';


$result_texts{'lone_chapter_between_nodes'} = 'Top
***

* 1::
* 3::

1 1
***

2 2
***

3 3
***
';

$result_errors{'lone_chapter_between_nodes'} = '';

$result_nodes_list{'lone_chapter_between_nodes'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  1
  3
 node_directions:
  next->1
2|1
 associated_section: 1 1
 associated_title_command: 1 1
 node_directions:
  next->3
  prev->Top
  up->Top
3|3
 associated_section: 3 3
 associated_title_command: 3 3
 node_directions:
  prev->1
  up->Top
';

$result_sections_list{'lone_chapter_between_nodes'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->1
 section_children:
  1|1
  2|2
  3|3
2|1
 associated_anchor_command: 1
 associated_node: 1
 section_directions:
  next->2
  up->Top
 toplevel_directions:
  next->2
  prev->Top
  up->Top
3|2
 section_directions:
  next->3
  prev->1
  up->Top
 toplevel_directions:
  next->3
  prev->1
  up->Top
4|3
 associated_anchor_command: 3
 associated_node: 3
 section_directions:
  prev->2
  up->Top
 toplevel_directions:
  prev->2
  up->Top
';

$result_sectioning_root{'lone_chapter_between_nodes'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'lone_chapter_between_nodes'} = '';


$result_converted{'info'}->{'lone_chapter_between_nodes'} = 'This is , produced from .


File: ,  Node: Top,  Next: 1,  Up: (dir)

Top
***

* Menu:

* 1::
* 3::


File: ,  Node: 1,  Next: 3,  Prev: Top,  Up: Top

1 1
***

2 2
***


File: ,  Node: 3,  Prev: 1,  Up: Top

3 3
***


Tag Table:
Node: Top27
Node: 1102
Node: 3172

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'lone_chapter_between_nodes'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Top</title>

<meta name="description" content="Top">
<meta name="keywords" content="Top">
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
Next: <a href="#g_t1" accesskey="n" rel="next">1</a> &nbsp; </p>
</div>
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#g_t1" accesskey="1">1</a></li>
<li><a href="#g_t2" accesskey="2">2</a></li>
<li><a href="#g_t3" accesskey="3">3</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="g_t1">
<div class="nav-panel">
<p>
Next: <a href="#g_t3" accesskey="n" rel="next">3</a>, Previous: <a href="#Top" accesskey="p" rel="prev">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="g_t1-1"><span>1 1<a class="copiable-link" href="#g_t1-1"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="g_t2">
<h2 class="chapter"><span>2 2<a class="copiable-link" href="#g_t2"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t3">
<div class="nav-panel">
<p>
Previous: <a href="#g_t1" accesskey="p" rel="prev">1</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="g_t3-1"><span>3 3<a class="copiable-link" href="#g_t3-1"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

1;
