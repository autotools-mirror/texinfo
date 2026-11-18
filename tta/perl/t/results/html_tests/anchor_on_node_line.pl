use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_on_node_line'} = '*document_root C6
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 l4 {lone node @anchor{iln} a}
 |EXTRA
 |identifier:{lone-node-a}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {lone node }
    *@anchor C1 l4
    |EXTRA
    |identifier:{iln}
    |is_target:{1}
     *brace_arg C1
      {iln}
    {spaces_after_close_brace: }
    {a}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l6 {chapter node @anchor{cnl} b}
 |EXTRA
 |identifier:{chapter-node-b}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {chapter node }
    *@anchor C1 l6
    |EXTRA
    |identifier:{cnl}
    |is_target:{1}
     *brace_arg C1
      {cnl}
    {spaces_after_close_brace: }
    {b}
    {spaces_after_argument:\\n}
 *@chapter C6 l7 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l9
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{iln}
     {iln}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{cnl}
     {cnl}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'anchor_on_node_line'} = '@node Top
@top top

@node lone node @anchor{iln} a

@node chapter node @anchor{cnl} b
@chapter chap

@xref{iln}.

@xref{cnl}

';


$result_texts{'anchor_on_node_line'} = 'top
***


1 chap
******

iln.

cnl

';

$result_errors{'anchor_on_node_line'} = '* W l4|@anchor should not appear on @node line
 warning: @anchor should not appear on @node line

* W l6|@anchor should not appear on @node line
 warning: @anchor should not appear on @node line

* W l4|node `lone node @anchor{iln} a\' unreferenced
 warning: node `lone node @anchor{iln} a\' unreferenced

';

$result_nodes_list{'anchor_on_node_line'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter node @anchor{cnl} b
2|lone node @anchor{iln} a
3|chapter node @anchor{cnl} b
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'anchor_on_node_line'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter node @anchor{cnl} b
 associated_node: chapter node @anchor{cnl} b
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'anchor_on_node_line'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_on_node_line'} = '';


$result_converted{'html'}->{'anchor_on_node_line'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter-node-b" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter-node-b" accesskey="1">chap</a></li>
</ul>
<hr>
<h4 class="node" id="lone-node-a"><span>lone node <a class="anchor" id="iln"></a>a<a class="copiable-link" href="#lone-node-a"> &para;</a></span></h4>

<hr>
<div class="chapter-level-extent" id="chapter-node-b">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<p>See <a class="xref" href="#iln">iln</a>.
</p>
<p>See <a class="xref" href="#cnl">cnl</a>
</p>
</div>
</div>



</body>
</html>
';

1;
