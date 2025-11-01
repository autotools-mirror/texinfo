use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'contents_in_html_text'} = '*document_root C5
 *before_node_section
 *@top C2 l1 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
 *@chapter C2 l3 {Chap1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap1}
  {empty_line:\\n}
 *@section C2 l5 {Sec 1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Sec 1}
  {empty_line:\\n}
 *@chapter C4 l7 {Chap2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chap2}
  {empty_line:\\n}
  *@shortcontents C1 l9
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *@contents C1 l10
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'contents_in_html_text'} = '@top top

@chapter Chap1

@section Sec 1

@chapter Chap2

@shortcontents
@contents
';


$result_texts{'contents_in_html_text'} = 'top
***

1 Chap1
*******

1.1 Sec 1
=========

2 Chap2
*******

';

$result_errors{'contents_in_html_text'} = '';

$result_nodes_list{'contents_in_html_text'} = '';

$result_sections_list{'contents_in_html_text'} = '1|top
 toplevel_directions:
  next->Chap1
 section_children:
  1|Chap1
  2|Chap2
2|Chap1
 section_directions:
  next->Chap2
  up->top
 toplevel_directions:
  next->Chap2
  prev->top
  up->top
 section_children:
  1|Sec 1
3|Sec 1
 section_directions:
  up->Chap1
4|Chap2
 section_directions:
  prev->Chap1
  up->top
 toplevel_directions:
  prev->Chap1
  up->top
';

$result_sectioning_root{'contents_in_html_text'} = 'level: -1
list:
 1|top
';

$result_headings_list{'contents_in_html_text'} = '';


$result_converted{'html_text'}->{'contents_in_html_text'} = '<div class="top-level-extent" id="top">
<h1 class="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#Chap1">Chap1</a></li>
<li><a href="#Chap2">Chap2</a></li>
</ul>
<div class="chapter-level-extent" id="Chap1">
<h2 class="chapter"><span>1 Chap1<a class="copiable-link" href="#Chap1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#Sec-1">Sec 1</a></li>
</ul>
<div class="section-level-extent" id="Sec-1">
<h3 class="section"><span>1.1 Sec 1<a class="copiable-link" href="#Sec-1"> &para;</a></span></h3>

</div>
</div>
<div class="chapter-level-extent" id="Chap2">
<h2 class="chapter"><span>2 Chap2<a class="copiable-link" href="#Chap2"> &para;</a></span></h2>

<div class="region-shortcontents" id="SEC_Shortcontents">
<h2 class="shortcontents-heading">Short Table of Contents</h2>

<div class="shortcontents">
<ul class="toc-numbered-mark">
<li><a id="stoc-Chap1" href="#toc-Chap1">1 Chap1</a></li>
<li><a id="stoc-Chap2" href="#toc-Chap2">2 Chap2</a></li>
</ul>
</div>
</div>
<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Chap1" href="#Chap1">1 Chap1</a>
  <ul class="toc-numbered-mark">
    <li><a id="toc-Sec-1" href="#Sec-1">1.1 Sec 1</a></li>
  </ul></li>
  <li><a id="toc-Chap2" href="#Chap2">2 Chap2</a></li>
</ul>
</div>
</div>
</div>
</div>
';

1;
