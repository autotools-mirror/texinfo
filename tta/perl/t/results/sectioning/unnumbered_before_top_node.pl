use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unnumbered_before_top_node'} = 'U0 unit{S:before nodes}
UNIT_DIRECTIONS
This: [U0]
 *before_node_section
 *@unnumbered C2 l1 {before nodes}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {before nodes}
  {empty_line:\\n}
 *@node C5 l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  *paragraph C1
   {Top node\\n}
  {empty_line:\\n}
  *@titlefont C1 l6
  |EXTRA
  |global_command_number:{1}
   *brace_container C1
    {Title titlefont}
  {\\n}
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


$result_converted{'info'}->{'unnumbered_before_top_node'} = 'This is , produced from .

before nodes
************


File: ,  Node: Top,  Up: (dir)

Top node

Title titlefont
***************


Tag Table:
Node: Top54

End Tag Table


Local Variables:
coding: utf-8
End:
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

<body lang="">
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


$result_converted{'docbook'}->{'unnumbered_before_top_node'} = '<chapter label="">
<title>before nodes</title>

</chapter>
';

1;
