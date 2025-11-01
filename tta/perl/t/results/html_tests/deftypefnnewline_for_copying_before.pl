use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'deftypefnnewline_for_copying_before'} = '*document_root C5
 *before_node_section C5
  {empty_line:\\n}
  *@deftypefnnewline C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {on}
  {empty_line:\\n}
  *@copying C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@deftypefun C3 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *def_line C1 l5
    |EXTRA
    |def_command:{deftypefun}
    |def_index_element:
     |* C1
      |*def_line_arg C1
       |{NAME}
    |element_region:{copying}
    |index_entry:I{fn,1}
    |original_def_cmdname:{deftypefun}
     *block_line_arg C7
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *def_category C1
      |INFO
      |inserted:{1}
       *def_line_arg C1
        {Function}
      (i){spaces: }
      *def_type C1
       *def_line_arg C1
        {TYPE}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        {NAME}
      {spaces: }
      *def_typearg C1
       *def_line_arg C1
        {ARGUMENTS...}
    *def_item C1
     *paragraph C1
      {BODY-OF-DESCRIPTION\\n}
    *@end C1 l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{deftypefun}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {deftypefun}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{copying}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {copying}
  {empty_line:\\n}
 *@node C1 l10 {Top}
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
 *@top C2 l11 {top}
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
 *@node C1 l13 {chap}
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
 *@chapter C4 l14 {Chapter}
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
    {Chapter}
  {empty_line:\\n}
  *@deftypefun C3 l16
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l16
   |EXTRA
   |def_command:{deftypefun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{something}
   |element_node:{chap}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_type C1
      *def_line_arg C1
       {void}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {input}
   *def_item C1
    *paragraph C1
     {do something with input\\n}
   *@end C1 l18
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypefun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypefun}
  {empty_line:\\n}
';


$result_texis{'deftypefnnewline_for_copying_before'} = '
@deftypefnnewline on

@copying
@deftypefun TYPE NAME ARGUMENTS...
BODY-OF-DESCRIPTION
@end deftypefun
@end copying

@node Top
@top top

@node chap
@chapter Chapter

@deftypefun void something input
do something with input
@end deftypefun

';


$result_texts{'deftypefnnewline_for_copying_before'} = '


top
***

1 Chapter
*********

Function: void something input
do something with input

';

$result_errors{'deftypefnnewline_for_copying_before'} = '';

$result_nodes_list{'deftypefnnewline_for_copying_before'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'deftypefnnewline_for_copying_before'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'deftypefnnewline_for_copying_before'} = 'level: -1
list:
 1|top
';

$result_headings_list{'deftypefnnewline_for_copying_before'} = '';

$result_indices_sort_strings{'deftypefnnewline_for_copying_before'} = 'fn:
 NAME
 something
';


$result_converted{'html'}->{'deftypefnnewline_for_copying_before'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Function: TYPE NAME ARGUMENTS...
BODY-OF-DESCRIPTION -->
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
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
</style>


</head>

<body lang="">



<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">Chapter</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<dl class="first-deftypefn first-deftypefun-alias-first-deftypefn def-block">
<dt class="deftypefn deftypefun-alias-deftypefn def-line" id="index-something"><span class="category-def">Function:<br> </span><span><code class="def-type">void</code><br> <strong class="def-name">something</strong> <code class="def-code-arguments">input</code><a class="copiable-link" href="#index-something"> &para;</a></span></dt>
<dd><p>do something with input
</p></dd></dl>

</div>
</div>



</body>
</html>
';

1;
