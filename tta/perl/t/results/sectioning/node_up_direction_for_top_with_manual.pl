use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_up_direction_for_top_with_manual'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C4
   *line_arg C1
    {Top}
   *line_arg
   *line_arg
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |EXTRA
   |manual_content:{dir}
   |node_content:{top}
   |normalized:{Top}
    {(}
    {dir}
    {)}
    {top}
';


$result_texis{'node_up_direction_for_top_with_manual'} = '@node Top,,,(dir)top
';


$result_texts{'node_up_direction_for_top_with_manual'} = '';

$result_errors{'node_up_direction_for_top_with_manual'} = '';

$result_nodes_list{'node_up_direction_for_top_with_manual'} = '1|Top
 node_directions:
  up->(dir)top

';

$result_sections_list{'node_up_direction_for_top_with_manual'} = '';

$result_sectioning_root{'node_up_direction_for_top_with_manual'} = '';

$result_headings_list{'node_up_direction_for_top_with_manual'} = '';


$result_converted{'info'}->{'node_up_direction_for_top_with_manual'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)Top


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'node_up_direction_for_top_with_manual'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>



</body>
</html>
';

$result_converted_errors{'html'}->{'node_up_direction_for_top_with_manual'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
