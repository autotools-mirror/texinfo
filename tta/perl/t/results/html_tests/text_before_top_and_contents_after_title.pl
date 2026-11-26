use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_before_top_and_contents_after_title'} = '*document_root C4
 *before_node_section C4
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *paragraph C1
   {normal_text:Some text before top\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l5 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In top.\\n}
  {empty_line:\\n}
 *normal_command@chapter C4 l9 {the chap}
 |identifier:{the-chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:the chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l11
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'text_before_top_and_contents_after_title'} = '
Some text before top

@node Top
@top top

In top.

@chapter the chap

@contents

';


$result_texts{'text_before_top_and_contents_after_title'} = 'Some text before top

top
***

In top.

1 the chap
**********


';

$result_errors{'text_before_top_and_contents_after_title'} = '';

$result_nodes_list{'text_before_top_and_contents_after_title'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'text_before_top_and_contents_after_title'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->the chap
 section_children:
  1|the chap
2|the chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'text_before_top_and_contents_after_title'} = 'level: -1
list:
 1|top
';

$result_headings_list{'text_before_top_and_contents_after_title'} = '';


$result_converted{'html'}->{'text_before_top_and_contents_after_title'} = '<!DOCTYPE html>
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
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-the-chap" href="#the-chap">1 the chap</a></li>
</ul>
</div>
</div>
<hr>
<p>Some text before top
</p>
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>In top.
</p>
<ul class="mini-toc">
<li><a href="#the-chap" accesskey="1">the chap</a></li>
</ul>
<div class="chapter-level-extent" id="the-chap">
<h2 class="chapter"><span>1 the chap<a class="copiable-link" href="#the-chap"> &para;</a></span></h2>


</div>
</div>



</body>
</html>
';

1;
