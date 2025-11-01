use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'chapter_before_part'} = 'U0 unit{S:1 chapter}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@chapter C2 l1 {chapter}
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
    {chapter}
  {empty_line:\\n}
U1 unit{S:part}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
 *@part C1 l3 {part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {part}
';


$result_texis{'chapter_before_part'} = '@chapter chapter

@part part
';


$result_texts{'chapter_before_part'} = '1 chapter
*********

part
****
';

$result_errors{'chapter_before_part'} = '* W l3|no sectioning command associated with @part
 warning: no sectioning command associated with @part

';

$result_nodes_list{'chapter_before_part'} = '';

$result_sections_list{'chapter_before_part'} = '1|chapter
2|part
';

$result_sectioning_root{'chapter_before_part'} = 'level: -1
list:
 1|chapter
 2|part
';

$result_headings_list{'chapter_before_part'} = '';


$result_converted{'plaintext'}->{'chapter_before_part'} = '1 chapter
*********

';


$result_converted{'html'}->{'chapter_before_part'} = '<!DOCTYPE html>
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
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>

</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'chapter_before_part'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'chapter_before_part'} = '<chapter spaces=" "><sectiontitle>chapter</sectiontitle>

</chapter>
<part spaces=" "><sectiontitle>part</sectiontitle>
</part>
';

1;
