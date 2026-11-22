use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'chapter_before_and_after_part'} = 'U0 unit{C2}{S:@chapter 1 chapter}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@chapter C2 l1 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
U1 unit{C2}{S:@chapter 2 chapter 2}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
 *@part C2 l3 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C3 l5 {chapter 2}
 |EXTRA
 |identifier:{chapter-2}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter 2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 l7
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'chapter_before_and_after_part'} = '@chapter chapter

@part part

@chapter chapter 2

@contents
';


$result_texts{'chapter_before_and_after_part'} = '1 chapter
*********

part
****

2 chapter 2
***********

';

$result_errors{'chapter_before_and_after_part'} = '';

$result_nodes_list{'chapter_before_and_after_part'} = '';

$result_sections_list{'chapter_before_and_after_part'} = '1|chapter
 toplevel_directions:
  next->chapter 2
2|part
 part_associated_section: 2 chapter 2
 section_children:
  1|chapter 2
3|chapter 2
 associated_part: part
 section_directions:
  up->part
 toplevel_directions:
  prev->chapter
';

$result_sectioning_root{'chapter_before_and_after_part'} = 'level: -1
list:
 1|chapter
 2|part
';

$result_headings_list{'chapter_before_and_after_part'} = '';


$result_converted{'plaintext'}->{'chapter_before_and_after_part'} = '1 chapter
*********

2 chapter 2
***********

1 chapter
part
2 chapter 2
';


$result_converted{'html'}->{'chapter_before_and_after_part'} = '<!DOCTYPE html>
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

<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>

</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter-2" accesskey="1">chapter 2</a></li>
</ul>
<div class="chapter-level-extent" id="chapter-2">
<h2 class="chapter"><span>2 chapter 2<a class="copiable-link" href="#chapter-2"> &para;</a></span></h2>

<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter" href="#chapter">1 chapter</a></li>
<li><a id="toc-part" href="#part">part</a>
<ul class="toc-numbered-mark">
  <li><a id="toc-chapter-2" href="#chapter-2">2 chapter 2</a></li>
</ul></li>

</ul>
</div>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'chapter_before_and_after_part'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'chapter_before_and_after_part'} = '<chapter><sectiontitle> chapter</sectiontitle>

</chapter>
<part><sectiontitle> part</sectiontitle>

<chapter><sectiontitle> chapter 2</sectiontitle>

<contents></contents>
</chapter>
</part>
';

1;
