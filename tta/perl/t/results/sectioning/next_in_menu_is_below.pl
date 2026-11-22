use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'next_in_menu_is_below'} = '*document_root C9
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
 *@node C1 l8 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C4 l9 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{subsection}
     {normal_text:subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l14
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l16 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *@section C4 l17 {section}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l19
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l20
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{subsection}
     {normal_text:subsection}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l21
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l23 {subsection}
 |EXTRA
 |identifier:{subsection}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection}
    {spaces_after_argument:\\n}
 *@subsection C1 l24 {subsection}
 |EXTRA
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection}
    {spaces_after_argument:\\n}
';


$result_texis{'next_in_menu_is_below'} = '@node Top
@top top

@menu
* chapter::
@end menu

@node chapter
@chapter chapter

@menu
* section::
* subsection::
@end menu

@node section
@section section

@menu
* subsection::
@end menu

@node subsection
@subsection subsection
';


$result_texts{'next_in_menu_is_below'} = 'top
***

* chapter::

1 chapter
*********

* section::
* subsection::

1.1 section
===========

* subsection::

1.1.1 subsection
----------------
';

$result_errors{'next_in_menu_is_below'} = '* W l13|node `subsection\' in menu in `chapter\' but under `section\' in sectioning
 warning: node `subsection\' in menu in `chapter\' but under `section\' in sectioning

';

$result_nodes_list{'next_in_menu_is_below'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 menus:
  section
  subsection
 node_directions:
  prev->Top
  up->Top
3|section
 associated_section: 1.1 section
 associated_title_command: 1.1 section
 menus:
  subsection
 node_directions:
  next->subsection
  up->chapter
4|subsection
 associated_section: 1.1.1 subsection
 associated_title_command: 1.1.1 subsection
 node_directions:
  prev->section
  up->section
';

$result_sections_list{'next_in_menu_is_below'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|section
3|section
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chapter
 section_children:
  1|subsection
4|subsection
 associated_anchor_command: subsection
 associated_node: subsection
 section_directions:
  up->section
';

$result_sectioning_root{'next_in_menu_is_below'} = 'level: -1
list:
 1|top
';

$result_headings_list{'next_in_menu_is_below'} = '';


$result_converted{'info'}->{'next_in_menu_is_below'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top
***

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chapter
*********

* Menu:

* section::
* subsection::


File: ,  Node: section,  Next: subsection,  Up: chapter

1.1 section
===========

* Menu:

* subsection::


File: ,  Node: subsection,  Prev: section,  Up: section

1.1.1 subsection
----------------


Tag Table:
Node: Top27
Node: chapter108
Node: section214
Node: subsection323

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'next_in_menu_is_below'} = '<!DOCTYPE html>
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


<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>


<ul class="mini-toc">
<li><a href="#section" accesskey="1">section</a></li>
</ul>
<hr>
<div class="section-level-extent" id="section">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#subsection" accesskey="n" rel="next">subsection</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chapter" accesskey="u" rel="up">chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="section-1"><span>1.1 section<a class="copiable-link" href="#section-1"> &para;</a></span></h3>


<ul class="mini-toc">
<li><a href="#subsection" accesskey="1">subsection</a></li>
</ul>
<hr>
<div class="subsection-level-extent" id="subsection">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#section" accesskey="p" rel="prev">section</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#section" accesskey="u" rel="up">section</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="subsection" id="subsection-1"><span>1.1.1 subsection<a class="copiable-link" href="#subsection-1"> &para;</a></span></h4>
</div>
</div>
</div>
</div>



</body>
</html>
';

1;
