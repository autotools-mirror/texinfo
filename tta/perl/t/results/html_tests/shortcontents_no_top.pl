use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'shortcontents_no_top'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *normal_command@chapter C2 l1 {chap}
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l3 {chap2}
 |identifier:{chap2}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C3 l5 {sec}
 |identifier:{sec}
 |is_target:{1}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@shortcontents C1 l7
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'shortcontents_no_top'} = '@chapter chap

@chapter chap2

@section sec

@shortcontents
';


$result_texts{'shortcontents_no_top'} = '1 chap
******

2 chap2
*******

2.1 sec
=======

';

$result_errors{'shortcontents_no_top'} = '';

$result_nodes_list{'shortcontents_no_top'} = '';

$result_sections_list{'shortcontents_no_top'} = '1|chap
 section_directions:
  next->chap2
 toplevel_directions:
  next->chap2
2|chap2
 section_directions:
  prev->chap
 toplevel_directions:
  prev->chap
 section_children:
  1|sec
3|sec
 section_directions:
  up->chap2
';

$result_sectioning_root{'shortcontents_no_top'} = 'level: 0
list:
 1|chap
 2|chap2
';

$result_headings_list{'shortcontents_no_top'} = '';


$result_converted{'html'}->{'shortcontents_no_top'} = '<!DOCTYPE html>
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

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="chap2">
<h2 class="chapter"><span>2 chap2<a class="copiable-link" href="#chap2"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#sec" accesskey="1">sec</a></li>
</ul>
<div class="section-level-extent" id="sec">
<h3 class="section"><span>2.1 sec<a class="copiable-link" href="#sec"> &para;</a></span></h3>

<div class="region-shortcontents" id="SEC_Shortcontents">
<h2 class="shortcontents-heading">Short Table of Contents</h2>

<div class="shortcontents">
<ul class="toc-numbered-mark">
<li><a id="stoc-chap" href="#chap">1 chap</a></li>
<li><a id="stoc-chap2" href="#chap2">2 chap2</a></li>

</ul>
</div>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'shortcontents_no_top'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
