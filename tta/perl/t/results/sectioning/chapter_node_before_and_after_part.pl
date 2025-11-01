use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'chapter_node_before_and_after_part'} = '*document_root C6
 *before_node_section C1
  {empty_line:\\n}
 *@node C1 l2 {Top}
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
 *@chapter C4 l3 {chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter}
  {empty_line:\\n}
  *@menu C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{after}
    |normalized:{after}
     {after}
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
 *@part C2 l9 {part}
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
  {empty_line:\\n}
 *@node C1 l11 {after}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{after}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {after}
 *@chapter C3 l12 {chapter 2}
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
    {chapter 2}
  {empty_line:\\n}
  *@contents C1 l14
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'chapter_node_before_and_after_part'} = '
@node Top
@chapter chapter

@menu
* after::
@end menu

@part part

@node after
@chapter chapter 2

@contents
';


$result_texts{'chapter_node_before_and_after_part'} = '
1 chapter
*********

* after::

part
****

2 chapter 2
***********

';

$result_errors{'chapter_node_before_and_after_part'} = '* W l6|node `after\' in menu in `Top\' but not under it in sectioning
 warning: node `after\' in menu in `Top\' but not under it in sectioning

';

$result_nodes_list{'chapter_node_before_and_after_part'} = '1|Top
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 menus:
  after
 node_directions:
  next->after
2|after
 associated_section: 2 chapter 2
 node_preceding_part: part
 associated_title_command: 2 chapter 2
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'chapter_node_before_and_after_part'} = '1|chapter
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter 2
2|part
 part_following_node: after
 part_associated_section: 2 chapter 2
 section_children:
  1|chapter 2
3|chapter 2
 associated_anchor_command: after
 associated_node: after
 associated_part: part
 section_directions:
  up->part
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'chapter_node_before_and_after_part'} = 'level: -1
list:
 1|chapter
 2|part
';

$result_headings_list{'chapter_node_before_and_after_part'} = '';


$result_converted{'plaintext'}->{'chapter_node_before_and_after_part'} = '1 chapter
*********

2 chapter 2
***********

1 chapter
part
2 chapter 2
';


$result_converted{'info'}->{'chapter_node_before_and_after_part'} = 'This is , produced from .


File: ,  Node: Top,  Next: after,  Up: (dir)

1 chapter
*********

* Menu:

* after::


File: ,  Node: after,  Prev: Top,  Up: Top

2 chapter 2
***********


Tag Table:
Node: Top27
Node: after116

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'chapter_node_before_and_after_part'} = '<!DOCTYPE html>
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
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body lang="">

<div class="chapter-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#after" accesskey="n" rel="next">chapter 2</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>


<hr>
</div>
<div class="part-level-extent" id="part">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">chapter</a>, Up: <a href="#Top" accesskey="u" rel="up">chapter</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</p>
</div>
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#after" accesskey="1">chapter 2</a></li>
</ul>
<div class="chapter-level-extent" id="after">
<h2 class="chapter" id="chapter-2"><span>2 chapter 2<a class="copiable-link" href="#chapter-2"> &para;</a></span></h2>

<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter" href="#Top">1 chapter</a></li>
<li><a id="toc-part" href="#part">part</a>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-2" href="#after">2 chapter 2</a></li>
</ul></li>

</ul>
</div>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'chapter_node_before_and_after_part'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'chapter_node_before_and_after_part'} = '
<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">after</nodenext></node>
<chapter spaces=" "><sectiontitle>chapter</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>after</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</chapter>
<part spaces=" "><sectiontitle>part</sectiontitle>

<node identifier="after" spaces=" "><nodename>after</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chapter 2</sectiontitle>

<contents></contents>
</chapter>
</part>
';

1;
