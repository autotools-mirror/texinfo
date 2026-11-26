use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unnumbered_before_node_top_top'} = 'U0 unit{C2}{S:@unnumbered before nodes}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
Next: [U1]
 *before_node_section C1
  *preamble
 *normal_command@unnumbered C4 l1 {before nodes}
 |identifier:{before-nodes}
 |is_target:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:before nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in unnumbered\\n}
  {empty_line:\\n}
U1 unit{C2}{S:@top top section}{n:Top}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
Prev: [U0]
 *normal_command@node C1 l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l6 {top section}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
';


$result_texis{'unnumbered_before_node_top_top'} = '@unnumbered before nodes

in unnumbered

@node Top
@top top section
Top node
';


$result_texts{'unnumbered_before_node_top_top'} = 'before nodes
************

in unnumbered

top section
***********
Top node
';

$result_errors{'unnumbered_before_node_top_top'} = '* W l6|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'unnumbered_before_node_top_top'} = '1|Top
 associated_section: top section
 associated_title_command: top section
';

$result_sections_list{'unnumbered_before_node_top_top'} = '1|before nodes
 section_directions:
  next->top section
 toplevel_directions:
  next->top section
2|top section
 associated_anchor_command: Top
 associated_node: Top
 section_directions:
  prev->before nodes
 toplevel_directions:
  prev->before nodes
';

$result_sectioning_root{'unnumbered_before_node_top_top'} = 'level: 0
list:
 1|before nodes
 2|top section
';

$result_headings_list{'unnumbered_before_node_top_top'} = '';


$result_converted{'info'}->{'unnumbered_before_node_top_top'} = Encode::encode('utf-8', 'This is , produced from .

before nodes
************

in unnumbered


File: ,  Node: Top,  Up: (dir)

top section
***********

Top node


Tag Table:
Ref: before nodes27
Node: Top69

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'unnumbered_before_node_top_top'} = '* W l1|@unnumbered outside of any node
 warning: @unnumbered outside of any node

';


$result_converted{'html'}->{'unnumbered_before_node_top_top'} = '<!DOCTYPE html>
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
<div class="unnumbered-level-extent" id="before-nodes">
<h2 class="unnumbered"><span>before nodes<a class="copiable-link" href="#before-nodes"> &para;</a></span></h2>

<p>in unnumbered
</p>
</div>
<div class="unnumbered-level-extent" id="Top">
<h2 class="unnumbered top-level-set-unnumbered" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h2>
<p>Top node
</p></div>



</body>
</html>
';

1;
