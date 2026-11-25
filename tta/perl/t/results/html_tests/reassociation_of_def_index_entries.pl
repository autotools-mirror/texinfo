use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'reassociation_of_def_index_entries'} = '*document_root C9
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {no node}
 |added:{1}
 |identifier:{no-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:no node}
    {spaces_after_argument:\\n}
 *normal_command@section C4 l7 {no node}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:no node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defun C4 l9
   *def_line C1 l9
   |def_command:{defun}
   |element_node:{no-node}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:some}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bibliography}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:aa}
     {spaces_after_argument:\\n}
   *normal_command@defunx C1 l10
   |def_command:{defun}
   |element_node:{no-node}
   |index_entry:I{fn,2}
   |original_def_cmdname:{defunx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:other}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:baba}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:toto}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:Add\\n}
   *normal_command@end C1 l12
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l14 {app}
 |identifier:{app}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:app}
    {spaces_after_argument:\\n}
 *normal_command@appendix C3 l15 {App}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:App}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l17
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'reassociation_of_def_index_entries'} = '@node Top
@top top

@node chapter
@chapter Chap

@node no node
@section no node

@defun some bibliography aa
@defunx other baba toto
Add
@end defun

@node app
@appendix App

@printindex fn
';


$result_texts{'reassociation_of_def_index_entries'} = 'top
***

1 Chap
******

1.1 no node
===========

Function: some bibliography aa
Function: other baba toto
Add

Appendix A App
**************

';

$result_errors{'reassociation_of_def_index_entries'} = '';

$result_nodes_list{'reassociation_of_def_index_entries'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->app
  prev->Top
  up->Top
3|no node
 associated_section: 1.1 no node
 associated_title_command: 1.1 no node
 node_directions:
  up->chapter
4|app
 associated_section: A App
 associated_title_command: A App
 node_directions:
  prev->chapter
  up->Top
';

$result_sections_list{'reassociation_of_def_index_entries'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
  2|App
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->App
  up->top
 toplevel_directions:
  next->App
  prev->top
  up->top
 section_children:
  1|no node
3|no node
 associated_anchor_command: no node
 associated_node: no node
 section_directions:
  up->Chap
4|App
 associated_anchor_command: app
 associated_node: app
 section_directions:
  prev->Chap
  up->top
 toplevel_directions:
  prev->Chap
  up->top
';

$result_sectioning_root{'reassociation_of_def_index_entries'} = 'level: -1
list:
 1|top
';

$result_headings_list{'reassociation_of_def_index_entries'} = '';

$result_indices_sort_strings{'reassociation_of_def_index_entries'} = 'fn:
 other
 some
';


$result_converted{'html'}->{'reassociation_of_def_index_entries'} = '<!DOCTYPE html>
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
<link href="#app" rel="index" title="app">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#app" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chap</a></li>
<li><a href="#app" accesskey="2">App</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#app" accesskey="n" rel="next">App</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#app" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#no-node" accesskey="1">no node</a></li>
</ul>
<hr>
<div class="section-level-extent" id="no-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chapter" accesskey="u" rel="up">Chap</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#app" title="Index" rel="index">Index</a>]</span></p>
<h3 class="section" id="no-node-1"><span>1.1 no node<a class="copiable-link" href="#no-node-1"> &para;</a></span></h3>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-some"><span class="category-def">Function: </span><span><strong class="def-name">some</strong> <var class="def-var-arguments">bibliography aa</var><a class="copiable-link" href="#index-some"> &para;</a></span></dt>
<dt class="deffnx defunx-alias-deffnx def-cmd-deffn def-line" id="index-other"><span class="category-def">Function: </span><span><strong class="def-name">other</strong> <var class="def-var-arguments">baba toto</var><a class="copiable-link" href="#index-other"> &para;</a></span></dt>
<dd><p>Add
</p></dd></dl>

<hr>
</div>
</div>
<div class="appendix-level-extent" id="app">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter" accesskey="p" rel="prev">Chap</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#app" title="Index" rel="index">Index</a>]</span></p>
<h2 class="appendix" id="App"><span>Appendix A App<a class="copiable-link" href="#App"> &para;</a></span></h2>

<div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#app_fn_letter-O"><b>O</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#app_fn_letter-S"><b>S</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="app_fn_letter-O">O</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-other"><code>other</code></a></td><td class="printindex-index-section"><a href="#no-node">no node</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="app_fn_letter-S">S</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-some"><code>some</code></a></td><td class="printindex-index-section"><a href="#no-node">no node</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#app_fn_letter-O"><b>O</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#app_fn_letter-S"><b>S</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'reassociation_of_def_index_entries'} = 'fn:
 other
 some
';

1;
