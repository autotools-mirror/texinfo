use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'part_before_top'} = 'U0 unit{C3}{S:@top top}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section C1
  *preamble_before_content
 *@part C2 l1 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@top C1 l3 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
';


$result_texis{'part_before_top'} = '@part part

@top top
';


$result_texts{'part_before_top'} = 'part
****

top
***
';

$result_errors{'part_before_top'} = '* W l1|@part should not be associated with @top
 warning: @part should not be associated with @top

';

$result_nodes_list{'part_before_top'} = '';

$result_sections_list{'part_before_top'} = '1|part
 part_associated_section: top
 section_directions:
  next->top
2|top
 associated_part: part
 section_directions:
  prev->part
';

$result_sectioning_root{'part_before_top'} = 'level: -1
list:
 1|part
 2|top
';

$result_headings_list{'part_before_top'} = '';


$result_converted{'plaintext'}->{'part_before_top'} = 'top
***

';


$result_converted{'html'}->{'part_before_top'} = '<!DOCTYPE html>
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

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

</div>
<div class="top-level-extent" id="Top">
<h1 class="top"><span>top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'part_before_top'} = '<part><sectiontitle> part</sectiontitle>

</part>
<top><sectiontitle> top</sectiontitle>
</top>
';

1;
