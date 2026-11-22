use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnotestyle_separate_html_text_no_monolithic'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@footnotestyle C1 l1
   |misc_args:A{separate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:separate}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C3 l4 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:In top}
   *normal_command@footnote C1 l5
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:Additional text}
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l8 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'footnotestyle_separate_html_text_no_monolithic'} = '@footnotestyle separate

@node Top
@top top
In top@footnote{Additional text}.

@node chap
@chapter Chap

';


$result_texts{'footnotestyle_separate_html_text_no_monolithic'} = '
top
***
In top.

1 Chap
******

';

$result_errors{'footnotestyle_separate_html_text_no_monolithic'} = '';

$result_nodes_list{'footnotestyle_separate_html_text_no_monolithic'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'footnotestyle_separate_html_text_no_monolithic'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'footnotestyle_separate_html_text_no_monolithic'} = 'level: -1
list:
 1|top
';

$result_headings_list{'footnotestyle_separate_html_text_no_monolithic'} = '';


$result_converted{'html_text'}->{'footnotestyle_separate_html_text_no_monolithic'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>
<p>In top<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p>
<ul class="mini-toc">
<li><a href="#chap">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<hr>
</div>
</div>
<div class="element-footnotes" id="SEC_Footnotes">
<p class="nav-panel">
<span class="nav-button">[<a href="#Top" title="Cover (top) of document" rel="start">Top</a>]</span></p>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>Additional text</p>
</div><hr>
<p class="nav-panel">
<span class="nav-button">[<a href="#Top" title="Cover (top) of document" rel="start">Top</a>]</span></p>
';

1;
