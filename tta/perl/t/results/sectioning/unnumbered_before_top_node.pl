use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unnumbered_before_top_node'} = 'U0 unit{C3}{S:@unnumbered before nodes}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section C1
  *preamble_before_content
 *normal_command@unnumbered C2 l1 {before nodes}
 |EXTRA
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
 *normal_command@node C5 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  {empty_line:\\n}
  *normal_command@titlefont C1 l6
  |EXTRA
  |global_command_number:{1}
   *brace_container C1
    {normal_text:Title titlefont}
  {normal_text:\\n}
';


$result_texis{'unnumbered_before_top_node'} = '@unnumbered before nodes

@node Top
Top node

@titlefont{Title titlefont}
';


$result_texts{'unnumbered_before_top_node'} = 'before nodes
************

Top node

Title titlefont
';

$result_errors{'unnumbered_before_top_node'} = '';

$result_nodes_list{'unnumbered_before_top_node'} = '1|Top
';

$result_sections_list{'unnumbered_before_top_node'} = '1|before nodes
';

$result_sectioning_root{'unnumbered_before_top_node'} = 'level: 0
list:
 1|before nodes
';

$result_headings_list{'unnumbered_before_top_node'} = '';


$result_converted{'info'}->{'unnumbered_before_top_node'} = Encode::encode('utf-8', 'This is , produced from .

before nodes
************


File: ,  Node: Top,  Up: (dir)

Top node

Title titlefont
***************


Tag Table:
Ref: before nodes27
Node: Top54

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'unnumbered_before_top_node'} = '* W l1|@unnumbered outside of any node
 warning: @unnumbered outside of any node

';


$result_converted{'html'}->{'unnumbered_before_top_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Title titlefont</title>

<meta name="description" content="Title titlefont">
<meta name="keywords" content="Title titlefont">
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

<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<p>Top node
</p>
<h1 class="titlefont">Title titlefont</h1>
</div>



</body>
</html>
';


$result_converted{'docbook'}->{'unnumbered_before_top_node'} = '<chapter label="" id="before-nodes">
<title>before nodes</title>

</chapter>
';

1;
