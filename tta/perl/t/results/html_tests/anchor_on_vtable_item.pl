use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'anchor_on_vtable_item'} = '*document_root C7
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l2 {top}
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
 *@node C1 l4 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C4 l5 {Chap}
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
    {Chap}
  {empty_line:\\n}
  *@vtable C6 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@code l7
   *before_item C1
    {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l9
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,1}
      *line_arg C2
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@anchor C1 l9
       |EXTRA
       |is_target:{1}
       |normalized:{label1}
        *brace_arg C1
         {label1}
       {label1}
    *table_definition C2
     *paragraph C1
      {Text1\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l12
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,2}
      *line_arg C3
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@anchor C1 l12
       |EXTRA
       |is_target:{1}
       |normalized:{label2}
        *brace_arg C1
         {label2}
       {spaces_after_close_brace: }
       {label2}
    *table_definition C2
     *paragraph C1
      {Text2\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l15
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,3}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {lab3}
    *table_definition C1
     {empty_line:\\n}
   *@end C1 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
 *@node C1 l19 {Idx}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{Idx}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Idx}
 *@chapter C5 l20 {Idx}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Idx}
  {empty_line:\\n}
  *@printindex C1 l22
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{vr}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {vr}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l24
    *brace_arg C1
    |EXTRA
    |node_content:{label1}
    |normalized:{label1}
     {label1}
   {.\\n}
';


$result_texis{'anchor_on_vtable_item'} = '@node Top
@top top

@node chap
@chapter Chap

@vtable @code

@item @anchor{label1}label1
Text1

@item @anchor{label2} label2
Text2

@item lab3

@end vtable

@node Idx
@chapter Idx

@printindex vr

@xref{label1}.
';


$result_texts{'anchor_on_vtable_item'} = 'top
***

1 Chap
******


label1
Text1

label2
Text2

lab3


2 Idx
*****


label1.
';

$result_errors{'anchor_on_vtable_item'} = '';

$result_nodes_list{'anchor_on_vtable_item'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->Idx
  prev->Top
  up->Top
3|Idx
 associated_section: 2 Idx
 associated_title_command: 2 Idx
 node_directions:
  prev->chap
  up->Top
';

$result_sections_list{'anchor_on_vtable_item'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
  2|Idx
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->Idx
  up->top
 toplevel_directions:
  next->Idx
  prev->top
  up->top
3|Idx
 associated_anchor_command: Idx
 associated_node: Idx
 section_directions:
  prev->Chap
  up->top
 toplevel_directions:
  prev->Chap
  up->top
';

$result_sectioning_root{'anchor_on_vtable_item'} = 'level: -1
list:
 1|top
';

$result_headings_list{'anchor_on_vtable_item'} = '';

$result_indices_sort_strings{'anchor_on_vtable_item'} = 'vr:
 lab3
 label1
 label2
';


$result_converted{'html'}->{'anchor_on_vtable_item'} = '<!DOCTYPE html>
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
<link href="#Idx" rel="index" title="Idx">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
span:hover a.copiable-link {visibility: visible}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">Chap</a> &nbsp; [<a href="#Idx" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chap</a></li>
<li><a href="#Idx" accesskey="2">Idx</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Next: <a href="#Idx" accesskey="n" rel="next">Idx</a>, Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; [<a href="#Idx" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<dl class="vtable">
<dt><a id="index-label1"></a><span><code class="code"><a class="anchor" id="label1"></a>label1</code><a class="copiable-link" href="#index-label1"> &para;</a></span></dt>
<dd><p>Text1
</p>
</dd>
<dt><a id="index-label2"></a><span><code class="code"><a class="anchor" id="label2"></a>label2</code><a class="copiable-link" href="#index-label2"> &para;</a></span></dt>
<dd><p>Text2
</p>
</dd>
<dt><a id="index-lab3"></a><span><code class="code">lab3</code><a class="copiable-link" href="#index-lab3"> &para;</a></span></dt>
</dl>

<hr>
</div>
<div class="chapter-level-extent" id="Idx">
<div class="nav-panel">
<p>
Previous: <a href="#chap" accesskey="p" rel="prev">Chap</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; [<a href="#Idx" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Idx-1"><span>2 Idx<a class="copiable-link" href="#Idx-1"> &para;</a></span></h2>

<div class="printindex vr-printindex">
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Idx_vr_letter-L">L</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-lab3"><code>lab3</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-label1"><code><a class="anchor" id="label1"></a>label1</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-label2"><code><a class="anchor" id="label2"></a>label2</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<p>See <a class="xref" href="#label1">label1</a>.
</p></div>
</div>



</body>
</html>
';

1;
