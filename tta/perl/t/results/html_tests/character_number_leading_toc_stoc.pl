use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'character_number_leading_toc_stoc'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C1 l1 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l2 {0}
 |EXTRA
 |identifier:{0}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:0}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C1 l3 {_}
 |EXTRA
 |identifier:{_005f}
 |is_target:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:_}
    {spaces_after_argument:\\n}
 *normal_command@section C6 l4 {?}
 |EXTRA
 |identifier:{_003f}
 |is_target:{1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:?}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l6
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@shortcontents C1 l8
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'character_number_leading_toc_stoc'} = '@top top
@chapter 0
@unnumbered _
@section ?

@contents

@shortcontents

';


$result_texts{'character_number_leading_toc_stoc'} = 'top
***
1 0
***
_
*
?
=



';

$result_errors{'character_number_leading_toc_stoc'} = '';

$result_nodes_list{'character_number_leading_toc_stoc'} = '';

$result_sections_list{'character_number_leading_toc_stoc'} = '1|top
 toplevel_directions:
  next->0
 section_children:
  1|0
  2|_
2|0
 section_directions:
  next->_
  up->top
 toplevel_directions:
  next->_
  prev->top
  up->top
3|_
 section_directions:
  prev->0
  up->top
 toplevel_directions:
  prev->0
  up->top
 section_children:
  1|?
4|?
 section_directions:
  up->_
';

$result_sectioning_root{'character_number_leading_toc_stoc'} = 'level: -1
list:
 1|top
';

$result_headings_list{'character_number_leading_toc_stoc'} = '';


$result_converted{'html'}->{'character_number_leading_toc_stoc'} = '<!DOCTYPE html>
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

<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<h1 class="top"><span>top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<div class="region-shortcontents" id="SEC_Shortcontents">
<h2 class="shortcontents-heading">Short Table of Contents</h2>

<div class="shortcontents">
<ul class="toc-numbered-mark">
<li><a id="stoc-0" href="#toc-0">1 0</a></li>
<li><a id="stoc-_005f" href="#toc-_005f">_</a></li>
</ul>
</div>
</div>
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-0" href="#g_t0">1 0</a></li>
  <li><a id="toc-_005f" href="#g_t_005f">_</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-_003f" href="#g_t_003f">?</a></li>
  </ul></li>
</ul>
</div>
</div>
<div class="chapter-level-extent" id="g_t0">
<h2 class="chapter"><span>1 0<a class="copiable-link" href="#g_t0"> &para;</a></span></h2>
</div>
<div class="unnumbered-level-extent" id="g_t_005f">
<h2 class="unnumbered"><span>_<a class="copiable-link" href="#g_t_005f"> &para;</a></span></h2>
<ul class="mini-toc">
<li><a href="#g_t_003f" accesskey="1">?</a></li>
</ul>
<div class="section-level-extent" id="g_t_003f">
<h3 class="section"><span>?<a class="copiable-link" href="#g_t_003f"> &para;</a></span></h3>



</div>
</div>
</div>



</body>
</html>
';

1;
