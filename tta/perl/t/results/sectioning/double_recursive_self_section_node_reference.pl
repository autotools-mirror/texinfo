use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'double_recursive_self_section_node_reference'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content
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
 *@node C1 l4 {node1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{node1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {node1}
 *@chapter C2 l5 {@ref{to node1}}
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
    *@ref C1 l5
     *brace_arg C1
     |EXTRA
     |node_content:{to node1}
     |normalized:{to-node1}
      {to node1}
  {empty_line:\\n}
 *@node C1 l7 {to @ref{node1}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{to-node1}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {to }
    *@ref C1 l7
     *brace_arg C1
     |EXTRA
     |node_content:{node1}
     |normalized:{node1}
      {node1}
';


$result_texis{'double_recursive_self_section_node_reference'} = '@node Top
@top top

@node node1
@chapter @ref{to node1}

@node to @ref{node1}
';


$result_texts{'double_recursive_self_section_node_reference'} = 'top
***

1 to node1
**********

';

$result_errors{'double_recursive_self_section_node_reference'} = '* W l7|@ref should not appear on @node line
 warning: @ref should not appear on @node line

* W l5|@ref to `to node1\', different from node name `to @ref{node1}\'
 warning: @ref to `to node1\', different from node name `to @ref{node1}\'

* W l7|node `to @ref{node1}\' not in menu
 warning: node `to @ref{node1}\' not in menu

';

$result_nodes_list{'double_recursive_self_section_node_reference'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->node1
2|node1
 associated_section: 1 @ref{to node1}
 associated_title_command: 1 @ref{to node1}
 node_directions:
  prev->Top
  up->Top
3|to @ref{node1}
';

$result_sections_list{'double_recursive_self_section_node_reference'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@ref{to node1}
 section_children:
  1|@ref{to node1}
2|@ref{to node1}
 associated_anchor_command: node1
 associated_node: node1
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'double_recursive_self_section_node_reference'} = 'level: -1
list:
 1|top
';

$result_headings_list{'double_recursive_self_section_node_reference'} = '';


$result_converted{'plaintext'}->{'double_recursive_self_section_node_reference'} = 'top
***

1 to node1
**********

';


$result_converted{'html'}->{'double_recursive_self_section_node_reference'} = '<!DOCTYPE html>
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

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#node1" accesskey="n" rel="next"><a class="ref" href="#to-node1">to <a class="ref" href="#node1">node1</a></a></a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#node1" accesskey="1"><a class="ref" href="#to-node1">to <a class="ref" href="#node1">node1</a></a></a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node1">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="to-node1-1"><span>1 <a class="ref" href="#to-node1">to <a class="ref" href="#node1">node1</a></a><a class="copiable-link" href="#to-node1-1"> &para;</a></span></h2>

<hr>
<h4 class="node" id="to-node1"><span>to <a class="ref" href="#node1"><a class="ref" href="#to-node1">to <a class="ref" href="#node1">node1</a></a></a><a class="copiable-link" href="#to-node1"> &para;</a></span></h4>
</div>
</div>



</body>
</html>
';

1;
