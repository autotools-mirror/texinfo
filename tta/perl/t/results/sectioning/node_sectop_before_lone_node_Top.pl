use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_sectop_before_lone_node_Top'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {node before}
 |EXTRA
 |identifier:{node-before}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node before}
    {spaces_after_argument:\\n}
 *@top C4 l2 {top sectionning}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in node before\\n}
  {empty_line:\\n}
 *@node C4 l6 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in node Top\\n}
  {empty_line:\\n}
 *@node C1 l10 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C3 l11 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in chap\\n}
';


$result_texis{'node_sectop_before_lone_node_Top'} = '@node node before
@top top sectionning

in node before

@node Top

in node Top

@node chap
@chapter chap

in chap
';


$result_texts{'node_sectop_before_lone_node_Top'} = 'top sectionning
***************

in node before


in node Top

1 chap
******

in chap
';

$result_errors{'node_sectop_before_lone_node_Top'} = '';

$result_nodes_list{'node_sectop_before_lone_node_Top'} = '1|node before
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->chap
2|Top
 node_directions:
  next->node before
3|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  up->node before
';

$result_sections_list{'node_sectop_before_lone_node_Top'} = '1|top sectionning
 associated_anchor_command: node before
 associated_node: node before
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top sectionning
 toplevel_directions:
  prev->top sectionning
  up->top sectionning
';

$result_sectioning_root{'node_sectop_before_lone_node_Top'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'node_sectop_before_lone_node_Top'} = '';


$result_converted{'plaintext'}->{'node_sectop_before_lone_node_Top'} = 'top sectionning
***************

in node before

in node Top

1 chap
******

in chap
';


$result_converted{'html'}->{'node_sectop_before_lone_node_Top'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top sectionning</title>

<meta name="description" content="top sectionning">
<meta name="keywords" content="top sectionning">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#node-before" rel="start" title="node before">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="node-before">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top-sectionning"><span>top sectionning<a class="copiable-link" href="#top-sectionning"> &para;</a></span></h1>

<p>in node before
</p>
<ul class="mini-toc">
<li><a href="#chap" accesskey="1">chap</a></li>
</ul>
<hr>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node-before" accesskey="n" rel="next">top sectionning</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<p>in node Top
</p>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#node-before" accesskey="u" rel="up">top sectionning</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<p>in chap
</p></div>
</div>



</body>
</html>
';


$result_converted{'docbook'}->{'node_sectop_before_lone_node_Top'} = '<chapter label="" id="node-before">
<title>top sectionning</title>

<para>in node before
</para>
</chapter>
<chapter label="1" id="chap">
<title>chap</title>

<para>in chap
</para></chapter>
';


$result_converted{'latex_text'}->{'node_sectop_before_lone_node_Top'} = '\\begin{document}
\\part*{{top sectionning}}
\\label{anchor:node-before}%

in node before

\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

in chap
';

1;
