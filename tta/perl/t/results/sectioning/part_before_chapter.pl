use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_before_chapter'} = 'U0 unit{C3}{S:@chapter 1 chapter}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section C1
  *preamble_before_content
 *normal_command@part C2 l1 {part}
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C1 l3 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
';


$result_texis{'part_before_chapter'} = '@part part

@chapter chapter
';


$result_texts{'part_before_chapter'} = 'part
****

1 chapter
*********
';

$result_errors{'part_before_chapter'} = '';

$result_nodes_list{'part_before_chapter'} = '';

$result_sections_list{'part_before_chapter'} = '1|part
 part_associated_section: 1 chapter
 section_children:
  1|chapter
2|chapter
 associated_part: part
 section_directions:
  up->part
';

$result_sectioning_root{'part_before_chapter'} = 'level: -1
list:
 1|part
';

$result_headings_list{'part_before_chapter'} = '';


$result_converted{'plaintext'}->{'part_before_chapter'} = '1 chapter
*********

';


$result_converted{'html'}->{'part_before_chapter'} = '<!DOCTYPE html>
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
</style>


</head>

<body>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chapter</a></li>
</ul>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'part_before_chapter'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
