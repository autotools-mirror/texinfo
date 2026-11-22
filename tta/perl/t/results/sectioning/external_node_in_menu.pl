use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'external_node_in_menu'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{nchapter1}
     {normal_text:nchapter1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{other}
     {normal_text:(}
     {normal_text:aaa}
     {normal_text:)}
     {normal_text:other}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{nchapter2}
     {normal_text:nchapter2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {nchapter1}
 |EXTRA
 |identifier:{nchapter1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:nchapter1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l11 {chap1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {nchapter2}
 |EXTRA
 |identifier:{nchapter2}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:nchapter2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l14 {chap2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap2}
    {spaces_after_argument:\\n}
';


$result_texis{'external_node_in_menu'} = '@node Top
@top top

@menu
* nchapter1::
* (aaa)other::
* nchapter2::
@end menu

@node nchapter1
@chapter chap1

@node nchapter2
@chapter chap2
';


$result_texts{'external_node_in_menu'} = 'top
***

* nchapter1::
* (aaa)other::
* nchapter2::

1 chap1
*******

2 chap2
*******
';

$result_errors{'external_node_in_menu'} = '';

$result_nodes_list{'external_node_in_menu'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  nchapter1
  (aaa)other
  nchapter2
 node_directions:
  next->nchapter1
2|nchapter1
 associated_section: 1 chap1
 associated_title_command: 1 chap1
 node_directions:
  next->nchapter2
  prev->Top
  up->Top
3|nchapter2
 associated_section: 2 chap2
 associated_title_command: 2 chap2
 node_directions:
  prev->nchapter1
  up->Top
';

$result_sections_list{'external_node_in_menu'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap1
 section_children:
  1|chap1
  2|chap2
2|chap1
 associated_anchor_command: nchapter1
 associated_node: nchapter1
 section_directions:
  next->chap2
  up->top
 toplevel_directions:
  next->chap2
  prev->top
  up->top
3|chap2
 associated_anchor_command: nchapter2
 associated_node: nchapter2
 section_directions:
  prev->chap1
  up->top
 toplevel_directions:
  prev->chap1
  up->top
';

$result_sectioning_root{'external_node_in_menu'} = 'level: -1
list:
 1|top
';

$result_headings_list{'external_node_in_menu'} = '';


$result_converted{'info'}->{'external_node_in_menu'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: nchapter1,  Up: (dir)

top
***

* Menu:

* nchapter1::
* (aaa)other::
* nchapter2::


File: ,  Node: nchapter1,  Next: nchapter2,  Prev: Top,  Up: Top

1 chap1
*******


File: ,  Node: nchapter2,  Prev: nchapter1,  Up: Top

2 chap2
*******


Tag Table:
Node: Top27
Node: nchapter1141
Node: nchapter2226

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'external_node_in_menu'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#nchapter1" accesskey="n" rel="next">chap1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#nchapter1" accesskey="1">chap1</a></li>
<li><a href="#nchapter2" accesskey="2">chap2</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="nchapter1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#nchapter2" accesskey="n" rel="next">chap2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap1"><span>1 chap1<a class="copiable-link" href="#chap1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="nchapter2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#nchapter1" accesskey="p" rel="prev">chap1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap2"><span>2 chap2<a class="copiable-link" href="#chap2"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

1;
