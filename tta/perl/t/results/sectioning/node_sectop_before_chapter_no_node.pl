use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_sectop_before_chapter_no_node'} = '*document_root C4
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
 *normal_command@top C2 l2 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
';


$result_texis{'node_sectop_before_chapter_no_node'} = '@node Top
@top top section

@chapter chap
';


$result_texts{'node_sectop_before_chapter_no_node'} = 'top section
***********

1 chap
******
';

$result_errors{'node_sectop_before_chapter_no_node'} = '';

$result_nodes_list{'node_sectop_before_chapter_no_node'} = '1|Top
 associated_section: top section
 associated_title_command: top section
';

$result_sections_list{'node_sectop_before_chapter_no_node'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'node_sectop_before_chapter_no_node'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'node_sectop_before_chapter_no_node'} = '';


$result_converted{'plaintext'}->{'node_sectop_before_chapter_no_node'} = 'top section
***********

1 chap
******

';


$result_converted{'html'}->{'node_sectop_before_chapter_no_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
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
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">chap</a></li>
</ul>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'docbook'}->{'node_sectop_before_chapter_no_node'} = '';


$result_converted{'latex_text'}->{'node_sectop_before_chapter_no_node'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap}%
';

1;
