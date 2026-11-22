use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_node_part_top'} = 'U0 unit{C4}{S:@top top}{n:Top}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C2 l3 {part}
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
 *@top C1 l5 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
';


$result_texis{'top_node_part_top'} = '@node Top

@part part

@top top
';


$result_texts{'top_node_part_top'} = '
part
****

top
***
';

$result_errors{'top_node_part_top'} = '* W l3|@node precedes @part, but parts may not be associated with nodes
 warning: @node precedes @part, but parts may not be associated with nodes

* W l3|@part should not be associated with @top
 warning: @part should not be associated with @top

';

$result_nodes_list{'top_node_part_top'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'top_node_part_top'} = '1|part
 part_associated_section: top
 section_directions:
  next->top
2|top
 associated_anchor_command: Top
 associated_node: Top
 associated_part: part
 section_directions:
  prev->part
';

$result_sectioning_root{'top_node_part_top'} = 'level: -1
list:
 1|part
 2|top
';

$result_headings_list{'top_node_part_top'} = '';


$result_converted{'info'}->{'top_node_part_top'} = Encode::encode('utf-8', 'This is , produced from top_node_part_top.texi.


File: ,  Node: Top,  Up: (dir)

top
***


Tag Table:
Node: Top49

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'top_node_part_top'} = '<!DOCTYPE html>
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

<body>
<div class="top-level-extent" id="Top">

</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'top_node_part_top'} = '<node identifier="Top"><nodename> Top</nodename></node>

<part><sectiontitle> part</sectiontitle>

</part>
<top><sectiontitle> top</sectiontitle>
</top>
';


$result_converted{'docbook'}->{'top_node_part_top'} = '
</part>
</chapter>
';


$result_converted{'latex_text'}->{'top_node_part_top'} = '\\begin{document}
\\Texinfounnumberedpart{{part}}

\\part*{{top}}
\\label{anchor:Top}%
';

1;
