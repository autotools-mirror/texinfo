use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'character_and_spaces_in_node'} = '*document_root C6
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
 *normal_command@node C1 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l3 {chap nodes}
 |identifier:{chap-nodes}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap nodes}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {spaces_before_argument: }
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l4 {!_"#$%&\'()*+-.}
 |identifier:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {spaces_before_argument: }
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{chap-nodes}
    {spaces_before_argument: }
    {normal_text:chap nodes}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{chap-nodes}
    {spaces_before_argument: }
    {normal_text:chap nodes}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l5 {/;<=>?[\\]^_`|~}
 |identifier:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{local-node}
    {normal_text:local   node}
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{chap-nodes}
    {spaces_before_argument: }
    {normal_text:chap nodes}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l6 {local   node}
 |identifier:{local-node}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument:  }
    {normal_text:local   node}
   *line_arg
   *line_arg C1
   |node_content:A{0|0}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C2
   |node_content:A{0|0}
   |normalized:{chap-nodes}
    {normal_text:chap nodes}
    {spaces_after_argument:\\n}
';


$result_texis{'character_and_spaces_in_node'} = '
@node Top
@node chap nodes, !_"#$%&\'()*+-., Top, Top
@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, chap nodes, chap nodes
@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., chap nodes
@node  local   node,,/;<=>?[\\]^_`|~,chap nodes
';


$result_texts{'character_and_spaces_in_node'} = '';

$result_errors{'character_and_spaces_in_node'} = '* W l3|node `chap nodes\' not in menu
 warning: node `chap nodes\' not in menu

* W l4|node `!_"#$%&\'()*+-.\' not in menu
 warning: node `!_"#$%&\'()*+-.\' not in menu

* W l5|node `/;<=>?[\\]^_`|~\' not in menu
 warning: node `/;<=>?[\\]^_`|~\' not in menu

* W l6|node `local   node\' not in menu
 warning: node `local   node\' not in menu

';

$result_nodes_list{'character_and_spaces_in_node'} = '1|Top
 node_directions:
  next->chap nodes
2|chap nodes
 node_directions:
  next->!_"#$%&\'()*+-.
  prev->Top
  up->Top
3|!_"#$%&\'()*+-.
 node_directions:
  next->/;<=>?[\\]^_`|~
  prev->chap nodes
  up->chap nodes
4|/;<=>?[\\]^_`|~
 node_directions:
  next->local   node
  prev->!_"#$%&\'()*+-.
  up->chap nodes
5|local   node
 node_directions:
  prev->/;<=>?[\\]^_`|~
  up->chap nodes
';

$result_sections_list{'character_and_spaces_in_node'} = '';

$result_sectioning_root{'character_and_spaces_in_node'} = '';

$result_headings_list{'character_and_spaces_in_node'} = '';


$result_converted{'info'}->{'character_and_spaces_in_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap nodes,  Up: (dir)


File: ,  Node: chap nodes,  Next: !_"#$%&\'()*+-.,  Prev: Top,  Up: Top


File: ,  Node: !_"#$%&\'()*+-.,  Next: /;<=>?[\\]^_`|~,  Prev: chap nodes,  Up: chap nodes


File: ,  Node: /;<=>?[\\]^_`|~,  Next: local node,  Prev: !_"#$%&\'()*+-.,  Up: chap nodes


File: ,  Node: local node,  Prev: /;<=>?[\\]^_`|~,  Up: chap nodes


Tag Table:
Node: Top27
Node: chap nodes80
Node: !_"#$%&\'()*+-.154
Node: /;<=>?[\\]^_`|~246
Node: local node338

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'character_and_spaces_in_node'} = '<!DOCTYPE html>
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

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap-nodes" accesskey="n" rel="next">chap nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap-nodes"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e" accesskey="n" rel="next">!_&quot;#$%&amp;\'()*+-.</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap nodes<a class="copiable-link" href="#chap-nodes"> &para;</a></span></h4>
<hr>
<a class="node-id" id="g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e" accesskey="n" rel="next">/;&lt;=&gt;?[\\]^_`|~</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chap-nodes" accesskey="p" rel="prev">chap nodes</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chap-nodes" accesskey="u" rel="up">chap nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>!_&quot;#$%&amp;\'()*+-.<a class="copiable-link" href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e"> &para;</a></span></h4>
<hr>
<a class="node-id" id="g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#local-node" accesskey="n" rel="next">local   node</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e" accesskey="p" rel="prev">!_&quot;#$%&amp;\'()*+-.</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chap-nodes" accesskey="u" rel="up">chap nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>/;&lt;=&gt;?[\\]^_`|~<a class="copiable-link" href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e"> &para;</a></span></h4>
<hr>
<a class="node-id" id="local-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e" accesskey="p" rel="prev">/;&lt;=&gt;?[\\]^_`|~</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chap-nodes" accesskey="u" rel="up">chap nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>local   node<a class="copiable-link" href="#local-node"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'character_and_spaces_in_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
