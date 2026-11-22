use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'deftypefnnewline_on_in_middle'} = '*document_root C5
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
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefun C3 l7
   *def_line C1 l7
   |def_command:{deftypefun}
   |element_node:{chap}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:void}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:something}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:input}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:do something with input\\n}
   *normal_command@end C1 l9
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefnnewline C1 l11
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefun C3 l13
   *def_line C1 l13
   |def_command:{deftypefun}
   |element_node:{chap}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:TYPE}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:NAME}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:ARGUMENTS...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:BODY-OF-DESCRIPTION\\n}
   *normal_command@end C1 l15
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
';


$result_texis{'deftypefnnewline_on_in_middle'} = '@node Top
@top top

@node chap
@chapter Chapter

@deftypefun void something input
do something with input
@end deftypefun

@deftypefnnewline on

@deftypefun TYPE NAME ARGUMENTS...
BODY-OF-DESCRIPTION
@end deftypefun
';


$result_texts{'deftypefnnewline_on_in_middle'} = 'top
***

1 Chapter
*********

Function: void something input
do something with input


Function: TYPE NAME ARGUMENTS...
BODY-OF-DESCRIPTION
';

$result_errors{'deftypefnnewline_on_in_middle'} = '';

$result_nodes_list{'deftypefnnewline_on_in_middle'} = '1|Top
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

$result_sections_list{'deftypefnnewline_on_in_middle'} = '1|top
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

$result_sectioning_root{'deftypefnnewline_on_in_middle'} = 'level: -1
list:
 1|top
';

$result_headings_list{'deftypefnnewline_on_in_middle'} = '';

$result_indices_sort_strings{'deftypefnnewline_on_in_middle'} = 'fn:
 NAME
 something
';


$result_converted{'html_text'}->{'deftypefnnewline_on_in_middle'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<dl class="first-deftypefn first-deftypefun-alias-first-deftypefn def-block">
<dt class="deftypefn deftypefun-alias-deftypefn def-line" id="index-something"><span class="category-def">Function: </span><span><code class="def-type">void</code> <strong class="def-name">something</strong> <code class="def-code-arguments">input</code><a class="copiable-link" href="#index-something"> &para;</a></span></dt>
<dd><p>do something with input
</p></dd></dl>


<dl class="first-deftypefn first-deftypefun-alias-first-deftypefn def-block">
<dt class="deftypefn deftypefun-alias-deftypefn def-line" id="index-NAME"><span class="category-def">Function:<br> </span><span><code class="def-type">TYPE</code><br> <strong class="def-name">NAME</strong> <code class="def-code-arguments">ARGUMENTS...</code><a class="copiable-link" href="#index-NAME"> &para;</a></span></dt>
<dd><p>BODY-OF-DESCRIPTION
</p></dd></dl>
</div>
</div>
';

1;
