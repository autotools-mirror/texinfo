use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_in_copying'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C2
     *@ref C1 l2
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
      |normalized:{GFDL}
       {normal_text:GFDL}
     {normal_text:\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C6 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@insertcopying C1 l8
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{GFDL}
     {normal_text:GFDL}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l14 {GFDL}
 |EXTRA
 |identifier:{GFDL}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:GFDL}
    {spaces_after_argument:\\n}
 *@chapter C2 l15 {GFDL}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:GFDL}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'ref_in_copying'} = '@copying
@ref{GFDL}
@end copying

@node Top
@top top

@insertcopying

@menu
* GFDL::
@end menu

@node GFDL
@chapter GFDL

';


$result_texts{'ref_in_copying'} = '
top
***


* GFDL::

1 GFDL
******

';

$result_errors{'ref_in_copying'} = '';

$result_nodes_list{'ref_in_copying'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  GFDL
 node_directions:
  next->GFDL
2|GFDL
 associated_section: 1 GFDL
 associated_title_command: 1 GFDL
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'ref_in_copying'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->GFDL
 section_children:
  1|GFDL
2|GFDL
 associated_anchor_command: GFDL
 associated_node: GFDL
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'ref_in_copying'} = 'level: -1
list:
 1|top
';

$result_headings_list{'ref_in_copying'} = '';


$result_converted{'info'}->{'ref_in_copying'} = Encode::encode('utf-8', 'This is , produced from .

*note GFDL::


File: ,  Node: Top,  Next: GFDL,  Up: (dir)

top
***

*note GFDL::

* Menu:

* GFDL::


File: ,  Node: GFDL,  Prev: Top,  Up: Top

1 GFDL
******


Tag Table:
Node: Top41
Node: GFDL130

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'ref_in_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- GFDL -->
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#GFDL" accesskey="n" rel="next">GFDL</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p><a class="ref" href="#GFDL">GFDL</a>
</p>

<ul class="mini-toc">
<li><a href="#GFDL" accesskey="1">GFDL</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="GFDL">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="GFDL-1"><span>1 GFDL<a class="copiable-link" href="#GFDL-1"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';


$result_converted{'latex_text'}->{'ref_in_copying'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{GFDL}}
\\label{anchor:GFDL}%

';

1;
