use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_menu'} = '*document_root C9
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {c1}
 |identifier:{c1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c1}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {c1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {c2}
 |identifier:{c2}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l8 {c2}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {c3}
 |identifier:{c3}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l11 {c3}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c3}
    {spaces_after_argument:\\n}
';


$result_texis{'no_menu'} = '@node Top
@top

@node c1
@chapter c1

@node c2
@chapter c2

@node c3
@chapter c3
';


$result_texts{'no_menu'} = '
1 c1
****

2 c2
****

3 c3
****
';

$result_errors{'no_menu'} = '';

$result_nodes_list{'no_menu'} = '1|Top
 associated_section
 associated_title_command
 node_directions:
  next->c1
2|c1
 associated_section: 1 c1
 associated_title_command: 1 c1
 node_directions:
  next->c2
  prev->Top
  up->Top
3|c2
 associated_section: 2 c2
 associated_title_command: 2 c2
 node_directions:
  next->c3
  prev->c1
  up->Top
4|c3
 associated_section: 3 c3
 associated_title_command: 3 c3
 node_directions:
  prev->c2
  up->Top
';

$result_sections_list{'no_menu'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->c1
 section_children:
  1|c1
  2|c2
  3|c3
2|c1
 associated_anchor_command: c1
 associated_node: c1
 section_directions:
  next->c2
  up->
 toplevel_directions:
  next->c2
  prev->
  up->
3|c2
 associated_anchor_command: c2
 associated_node: c2
 section_directions:
  next->c3
  prev->c1
  up->
 toplevel_directions:
  next->c3
  prev->c1
  up->
4|c3
 associated_anchor_command: c3
 associated_node: c3
 section_directions:
  prev->c2
  up->
 toplevel_directions:
  prev->c2
  up->
';

$result_sectioning_root{'no_menu'} = 'level: -1
list:
 1|
';

$result_headings_list{'no_menu'} = '';


$result_converted{'info'}->{'no_menu'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: c1,  Up: (dir)

* Menu:

* c1::
* c2::
* c3::


File: ,  Node: c1,  Next: c2,  Prev: Top,  Up: Top

1 c1
****


File: ,  Node: c2,  Next: c3,  Prev: c1,  Up: Top

2 c2
****


File: ,  Node: c3,  Prev: c2,  Up: Top

3 c3
****


Tag Table:
Node: Top27
Node: c1103
Node: c2168
Node: c3232

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'no_menu'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#c1" accesskey="n" rel="next">c1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<a class="top" id="SEC_Top"></a>
<ul class="mini-toc">
<li><a href="#c1" accesskey="1">c1</a></li>
<li><a href="#c2" accesskey="2">c2</a></li>
<li><a href="#c3" accesskey="3">c3</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="c1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#c2" accesskey="n" rel="next">c2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="c1-1"><span>1 c1<a class="copiable-link" href="#c1-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="c2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#c3" accesskey="n" rel="next">c3</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#c1" accesskey="p" rel="prev">c1</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="c2-1"><span>2 c2<a class="copiable-link" href="#c2-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="c3">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#c2" accesskey="p" rel="prev">c2</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="c3-1"><span>3 c3<a class="copiable-link" href="#c3-1"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'no_menu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
