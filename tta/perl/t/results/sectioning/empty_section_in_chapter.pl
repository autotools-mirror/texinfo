use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_section_in_chapter'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@chapter C2 l1 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
 *@section C1 l3
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'empty_section_in_chapter'} = '@chapter chap

@section
';


$result_texts{'empty_section_in_chapter'} = '1 chap
******

1.1 
====
';

$result_errors{'empty_section_in_chapter'} = '* W l3|@section missing argument
 warning: @section missing argument

';

$result_nodes_list{'empty_section_in_chapter'} = '';

$result_sections_list{'empty_section_in_chapter'} = '1|chap
 section_children:
  1|
2
 section_directions:
  up->chap
';

$result_sectioning_root{'empty_section_in_chapter'} = 'level: 0
list:
 1|chap
';

$result_headings_list{'empty_section_in_chapter'} = '';


$result_converted{'plaintext'}->{'empty_section_in_chapter'} = '1 chap
******

';


$result_converted{'html'}->{'empty_section_in_chapter'} = '<!DOCTYPE html>
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

<body lang="">
<div class="chapter-level-extent" id="chap">
<h2 class="chapter"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<ul class="mini-toc">
</ul>
<div class="section-level-extent">
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'empty_section_in_chapter'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
