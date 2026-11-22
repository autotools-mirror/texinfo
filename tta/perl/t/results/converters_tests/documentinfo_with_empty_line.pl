use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentinfo_with_empty_line'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentinfo C5 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *@title C1 l3
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:yup}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *@author C1 l5
    |EXTRA
    |global_command_number:{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:Toto}
      {spaces_after_argument:\\n}
    *@end C1 l6
    |EXTRA
    |text_arg:{documentinfo}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentinfo}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l8 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l9 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l11 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C1 l12 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
';


$result_texis{'documentinfo_with_empty_line'} = '
@documentinfo
@title yup

@author Toto
@end documentinfo

@node Top
@top top

@node chapter
@chapter Chap
';


$result_texts{'documentinfo_with_empty_line'} = '
top
***

1 Chap
******
';

$result_errors{'documentinfo_with_empty_line'} = '';

$result_nodes_list{'documentinfo_with_empty_line'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'documentinfo_with_empty_line'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'documentinfo_with_empty_line'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentinfo_with_empty_line'} = '';


$result_converted{'plaintext'}->{'documentinfo_with_empty_line'} = 'top
***

1 Chap
******

';


$result_converted{'html'}->{'documentinfo_with_empty_line'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>yup</title>

<meta name="description" content="yup">
<meta name="keywords" content="yup">
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'documentinfo_with_empty_line'} = '<preamblebeforebeginning>
</preamblebeforebeginning><documentinfo endspaces=" ">
<title> yup</title>

<author> Toto</author>
</documentinfo>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>
</chapter>
';


$result_converted{'docbook_doc'}->{'documentinfo_with_empty_line'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>yup</title>
<bookinfo><title>yup</title>
<authorgroup>
<collab><collabname>Toto</collabname></collab>
</authorgroup>
</bookinfo>
<chapter label="1" id="chapter">
<title>Chap</title>
</chapter>
</book>
';


$result_converted{'latex_text'}->{'documentinfo_with_empty_line'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chapter}%
';

1;
