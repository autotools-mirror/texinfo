use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_and_parts'} = '*document_root C11
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-1-node}
     {chapter 1 node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-2-node}
     {chapter 2 node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-3-node}
     {chapter 3 node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C2 l10 {part 1: part 1}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {part 1: part 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l12 {chapter 1 node}
 |EXTRA
 |identifier:{chapter-1-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter 1 node}
    {spaces_after_argument:\\n}
 *@chapter C2 l13 {chapter 1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter 1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l15 {chapter 2 node}
 |EXTRA
 |identifier:{chapter-2-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter 2 node}
    {spaces_after_argument:\\n}
 *@chapter C2 l16 {chapter 2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C2 l18 {part2: part2}
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {part2: part2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l20 {chapter 3 node}
 |EXTRA
 |identifier:{chapter-3-node}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter 3 node}
    {spaces_after_argument:\\n}
 *@chapter C4 l21 {chapter 3}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter 3}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 l23
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  *@shortcontents C1 l24
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'contents_and_parts'} = '@node Top
@top top

@menu
* chapter 1 node::
* chapter 2 node::
* chapter 3 node::
@end menu

@part part 1: part 1

@node chapter 1 node
@chapter chapter 1

@node chapter 2 node
@chapter chapter 2

@part part2: part2

@node chapter 3 node
@chapter chapter 3

@contents
@shortcontents
';


$result_texts{'contents_and_parts'} = 'top
***

* chapter 1 node::
* chapter 2 node::
* chapter 3 node::

part 1: part 1
**************

1 chapter 1
***********

2 chapter 2
***********

part2: part2
************

3 chapter 3
***********

';

$result_errors{'contents_and_parts'} = '';

$result_nodes_list{'contents_and_parts'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter 1 node
  chapter 2 node
  chapter 3 node
 node_directions:
  next->chapter 1 node
2|chapter 1 node
 associated_section: 1 chapter 1
 node_preceding_part: part 1: part 1
 associated_title_command: 1 chapter 1
 node_directions:
  next->chapter 2 node
  prev->Top
  up->Top
3|chapter 2 node
 associated_section: 2 chapter 2
 associated_title_command: 2 chapter 2
 node_directions:
  next->chapter 3 node
  prev->chapter 1 node
  up->Top
4|chapter 3 node
 associated_section: 3 chapter 3
 node_preceding_part: part2: part2
 associated_title_command: 3 chapter 3
 node_directions:
  prev->chapter 2 node
  up->Top
';

$result_sections_list{'contents_and_parts'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  next->part 1: part 1
 toplevel_directions:
  next->chapter 1
2|part 1: part 1
 part_following_node: chapter 1 node
 part_associated_section: 1 chapter 1
 section_directions:
  next->part2: part2
  prev->top
 section_children:
  1|chapter 1
  2|chapter 2
3|chapter 1
 associated_anchor_command: chapter 1 node
 associated_node: chapter 1 node
 associated_part: part 1: part 1
 section_directions:
  next->chapter 2
  up->part 1: part 1
 toplevel_directions:
  next->chapter 2
  prev->top
  up->top
4|chapter 2
 associated_anchor_command: chapter 2 node
 associated_node: chapter 2 node
 section_directions:
  prev->chapter 1
  up->part 1: part 1
 toplevel_directions:
  next->chapter 3
  prev->chapter 1
  up->top
5|part2: part2
 part_following_node: chapter 3 node
 part_associated_section: 3 chapter 3
 section_directions:
  prev->part 1: part 1
 section_children:
  1|chapter 3
6|chapter 3
 associated_anchor_command: chapter 3 node
 associated_node: chapter 3 node
 associated_part: part2: part2
 section_directions:
  up->part2: part2
 toplevel_directions:
  prev->chapter 2
  up->top
';

$result_sectioning_root{'contents_and_parts'} = 'level: -1
list:
 1|top
 2|part 1: part 1
 3|part2: part2
';

$result_headings_list{'contents_and_parts'} = '';


$result_converted{'plaintext'}->{'contents_and_parts'} = 'top
***

1 chapter 1
***********

2 chapter 2
***********

3 chapter 3
***********

top
part 1: part 1
1 chapter 1
2 chapter 2
part2: part2
3 chapter 3
top
part 1: part 1
1 chapter 1
2 chapter 2
part2: part2
3 chapter 3
';


$result_converted{'html'}->{'contents_and_parts'} = '<!DOCTYPE html>
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
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-1-node" accesskey="n" rel="next">chapter 1</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<div class="region-shortcontents" id="SEC_Shortcontents">
<h2 class="shortcontents-heading">Short Table of Contents</h2>

<div class="shortcontents">
<ul class="toc-numbered-mark">
<li><a id="stoc-part-1_003a-part-1" href="#toc-part-1_003a-part-1">part 1: part 1</a><ul class="toc-numbered-mark">
<li><a id="stoc-chapter-1" href="#toc-chapter-1">1 chapter 1</a></li>
<li><a id="stoc-chapter-2" href="#toc-chapter-2">2 chapter 2</a></li>
</ul></li>
<li><a id="stoc-part2_003a-part2" href="#toc-part2_003a-part2">part2: part2</a><ul class="toc-numbered-mark">
<li><a id="stoc-chapter-3" href="#toc-chapter-3">3 chapter 3</a></li>
</ul></li>

</ul>
</div>
</div>
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">
<ul class="toc-numbered-mark">
<li><a id="toc-part-1_003a-part-1" href="#part-1_003a-part-1">part 1: part 1</a>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-1" href="#chapter-1-node">1 chapter 1</a></li>
  <li><a id="toc-chapter-2" href="#chapter-2-node">2 chapter 2</a></li>
</ul></li>
<li><a id="toc-part2_003a-part2" href="#part2_003a-part2">part2: part2</a>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-3" href="#chapter-3-node">3 chapter 3</a></li>
</ul></li>

</ul>
</div>
</div>
<hr>
</div>
<div class="part-level-extent" id="part-1_003a-part-1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-2-node" accesskey="n" rel="next">chapter 2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h1 class="part"><span>part 1: part 1<a class="copiable-link" href="#part-1_003a-part-1"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter-1-node" accesskey="1">chapter 1</a></li>
<li><a href="#chapter-2-node" accesskey="2">chapter 2</a></li>
</ul>
<div class="chapter-level-extent" id="chapter-1-node">
<h2 class="chapter" id="chapter-1"><span>1 chapter 1<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="chapter-2-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-3-node" accesskey="n" rel="next">chapter 3</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter-1-node" accesskey="p" rel="prev">chapter 1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h2 class="chapter" id="chapter-2"><span>2 chapter 2<a class="copiable-link" href="#chapter-2"> &para;</a></span></h2>

<hr>
</div>
</div>
<div class="part-level-extent" id="part2_003a-part2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter-2-node" accesskey="p" rel="prev">chapter 2</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span></p>
<h1 class="part"><span>part2: part2<a class="copiable-link" href="#part2_003a-part2"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter-3-node" accesskey="1">chapter 3</a></li>
</ul>
<div class="chapter-level-extent" id="chapter-3-node">
<h2 class="chapter" id="chapter-3"><span>3 chapter 3<a class="copiable-link" href="#chapter-3"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';

1;
