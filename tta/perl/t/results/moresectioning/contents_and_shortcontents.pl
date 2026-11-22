use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_and_shortcontents'} = '*document_root C12
 *before_node_section C1
  *preamble_before_content
 *normal_command@top C2 l1 {top}
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
  {empty_line:\\n}
 *normal_command@chapter C2 l3 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l5 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C2 l7 {subsection}
 |EXTRA
 |identifier:{subsection}
 |is_target:{1}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsubsection C2 l9 {subsubsection}
 |EXTRA
 |identifier:{subsubsection}
 |is_target:{1}
 |section_heading_number:{1.1.1.1}
 |section_level:{4}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:subsubsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@part C2 l11 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l13 {chapter in part}
 |EXTRA
 |identifier:{chapter-in-part}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter in part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l15 {second chapter in part}
 |EXTRA
 |identifier:{second-chapter-in-part}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second chapter in part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@unnumbered C2 l17 {unnumbered}
 |EXTRA
 |identifier:{unnumbered}
 |is_target:{1}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@appendix C2 l19 {appendix}
 |EXTRA
 |identifier:{appendix}
 |is_target:{1}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@appendixsec C5 l21 {appendixsec}
 |EXTRA
 |identifier:{appendixsec}
 |is_target:{1}
 |section_heading_number:{A.1}
 |section_level:{2}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendixsec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@shortcontents C1 l23
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l25
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'contents_and_shortcontents'} = '@top top

@chapter chapter

@section section

@subsection subsection

@subsubsection subsubsection

@part part

@chapter chapter in part

@chapter second chapter in part

@unnumbered unnumbered

@appendix appendix

@appendixsec appendixsec

@shortcontents

@contents
';


$result_texts{'contents_and_shortcontents'} = 'top
***

1 chapter
*********

1.1 section
===========

1.1.1 subsection
----------------

1.1.1.1 subsubsection
.....................

part
****

2 chapter in part
*****************

3 second chapter in part
************************

unnumbered
**********

Appendix A appendix
*******************

A.1 appendixsec
===============


';

$result_errors{'contents_and_shortcontents'} = '';

$result_nodes_list{'contents_and_shortcontents'} = '';

$result_sections_list{'contents_and_shortcontents'} = '1|top
 section_directions:
  next->part
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 section_directions:
  up->top
 toplevel_directions:
  next->chapter in part
  prev->top
  up->top
 section_children:
  1|section
3|section
 section_directions:
  up->chapter
 section_children:
  1|subsection
4|subsection
 section_directions:
  up->section
 section_children:
  1|subsubsection
5|subsubsection
 section_directions:
  up->subsection
6|part
 part_associated_section: 2 chapter in part
 section_directions:
  next->appendix
  prev->top
 section_children:
  1|chapter in part
  2|second chapter in part
  3|unnumbered
7|chapter in part
 associated_part: part
 section_directions:
  next->second chapter in part
  up->part
 toplevel_directions:
  next->second chapter in part
  prev->chapter
  up->top
8|second chapter in part
 section_directions:
  next->unnumbered
  prev->chapter in part
  up->part
 toplevel_directions:
  next->unnumbered
  prev->chapter in part
  up->top
9|unnumbered
 section_directions:
  prev->second chapter in part
  up->part
 toplevel_directions:
  next->appendix
  prev->second chapter in part
  up->top
10|appendix
 section_directions:
  prev->part
 toplevel_directions:
  prev->unnumbered
  up->top
 section_children:
  1|appendixsec
11|appendixsec
 section_directions:
  up->appendix
';

$result_sectioning_root{'contents_and_shortcontents'} = 'level: -1
list:
 1|top
 2|part
 3|appendix
';

$result_headings_list{'contents_and_shortcontents'} = '';


$result_converted{'plaintext'}->{'contents_and_shortcontents'} = 'top
***

1 chapter
*********

1.1 section
===========

1.1.1 subsection
----------------

1.1.1.1 subsubsection
.....................

2 chapter in part
*****************

3 second chapter in part
************************

unnumbered
**********

Appendix A appendix
*******************

A.1 appendixsec
===============

top
1 chapter
part
2 chapter in part
3 second chapter in part
unnumbered
Appendix A appendix

top
1 chapter
  1.1 section
    1.1.1 subsection
      1.1.1.1 subsubsection
part
2 chapter in part
3 second chapter in part
unnumbered
Appendix A appendix
  A.1 appendixsec
';


$result_converted{'html'}->{'contents_and_shortcontents'} = '<!DOCTYPE html>
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
<li><ul class="toc-numbered-mark">
<li><a id="stoc-chapter" href="#toc-chapter">1 chapter</a></li>
</ul></li>
<li><a id="stoc-part" href="#toc-part">part</a><ul class="toc-numbered-mark">
<li><a id="stoc-chapter-in-part" href="#toc-chapter-in-part">2 chapter in part</a></li>
<li><a id="stoc-second-chapter-in-part" href="#toc-second-chapter-in-part">3 second chapter in part</a></li>
<li><a id="stoc-unnumbered" href="#toc-unnumbered">unnumbered</a></li>
</ul></li>
<li><a id="stoc-appendix" href="#toc-appendix">Appendix A appendix</a></li>

</ul>
</div>
</div>
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">
<ul class="toc-numbered-mark">
<li>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter" href="#chapter">1 chapter</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-section" href="#section">1.1 section</a>
    <ul class="toc-numbered-mark">
      <li><a id="toc-subsection" href="#subsection">1.1.1 subsection</a>
      <ul class="toc-numbered-mark">
        <li><a id="toc-subsubsection" href="#subsubsection">1.1.1.1 subsubsection</a></li>
      </ul></li>
    </ul></li>
  </ul></li>
</ul></li>
<li><a id="toc-part" href="#part">part</a>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-in-part" href="#chapter-in-part">2 chapter in part</a></li>
  <li><a id="toc-second-chapter-in-part" href="#second-chapter-in-part">3 second chapter in part</a></li>
  <li><a id="toc-unnumbered" href="#unnumbered">unnumbered</a></li>
</ul></li>
  <li><a id="toc-appendix" href="#appendix">Appendix A appendix</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-appendixsec" href="#appendixsec">A.1 appendixsec</a></li>
  </ul></li>

</ul>
</div>
</div>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#section" accesskey="1">section</a></li>
</ul>
<div class="section-level-extent" id="section">
<h3 class="section"><span>1.1 section<a class="copiable-link" href="#section"> &para;</a></span></h3>

<ul class="mini-toc">
<li><a href="#subsection" accesskey="1">subsection</a></li>
</ul>
<div class="subsection-level-extent" id="subsection">
<h4 class="subsection"><span>1.1.1 subsection<a class="copiable-link" href="#subsection"> &para;</a></span></h4>

<ul class="mini-toc">
<li><a href="#subsubsection" accesskey="1">subsubsection</a></li>
</ul>
<div class="subsubsection-level-extent" id="subsubsection">
<h4 class="subsubsection"><span>1.1.1.1 subsubsection<a class="copiable-link" href="#subsubsection"> &para;</a></span></h4>

</div>
</div>
</div>
</div>
</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter-in-part" accesskey="1">chapter in part</a></li>
<li><a href="#second-chapter-in-part" accesskey="2">second chapter in part</a></li>
<li><a href="#unnumbered" accesskey="3">unnumbered</a></li>
</ul>
<div class="chapter-level-extent" id="chapter-in-part">
<h2 class="chapter"><span>2 chapter in part<a class="copiable-link" href="#chapter-in-part"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="second-chapter-in-part">
<h2 class="chapter"><span>3 second chapter in part<a class="copiable-link" href="#second-chapter-in-part"> &para;</a></span></h2>

</div>
<div class="unnumbered-level-extent" id="unnumbered">
<h2 class="unnumbered"><span>unnumbered<a class="copiable-link" href="#unnumbered"> &para;</a></span></h2>

</div>
<div class="appendix-level-extent" id="appendix">
<h2 class="appendix"><span>Appendix A appendix<a class="copiable-link" href="#appendix"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#appendixsec" accesskey="1">appendixsec</a></li>
</ul>
<div class="appendixsec-level-extent" id="appendixsec">
<h3 class="appendixsec"><span>A.1 appendixsec<a class="copiable-link" href="#appendixsec"> &para;</a></span></h3>


</div>
</div>
</div>



</body>
</html>
';

1;
