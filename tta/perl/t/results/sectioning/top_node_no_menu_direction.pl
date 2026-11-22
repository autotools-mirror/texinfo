use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_node_no_menu_direction'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
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
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap-node}
     {normal_text:chap node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:TOP}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:myself\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l8 {chap node}
 |EXTRA
 |identifier:{chap-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chap node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:top}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:TOP}
    {spaces_after_argument:\\n}
';


$result_texis{'top_node_no_menu_direction'} = '@node Top

@menu
* chap node::
* TOP:: myself
@end menu

@node chap node,,top,TOP
';


$result_texts{'top_node_no_menu_direction'} = '
* chap node::
* TOP:: myself

';

$result_errors{'top_node_no_menu_direction'} = '* W l8|Prev pointer `top\' (for node `chap node\') different from node name `Top\'
 warning: Prev pointer `top\' (for node `chap node\') different from node name `Top\'

* W l8|Up pointer `TOP\' (for node `chap node\') different from node name `Top\'
 warning: Up pointer `TOP\' (for node `chap node\') different from node name `Top\'

* W l5|@menu entry node name `TOP\' different from node name `Top\'
 warning: @menu entry node name `TOP\' different from node name `Top\'

';

$result_nodes_list{'top_node_no_menu_direction'} = '1|Top
 menus:
  chap node
  TOP
 node_directions:
  next->chap node
2|chap node
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'top_node_no_menu_direction'} = '';

$result_sectioning_root{'top_node_no_menu_direction'} = '';

$result_headings_list{'top_node_no_menu_direction'} = '';


$result_converted{'info'}->{'top_node_no_menu_direction'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap node,  Up: (dir)

* Menu:

* chap node::
* TOP:: myself


File: ,  Node: chap node,  Prev: Top,  Up: Top


Tag Table:
Node: Top27
Node: chap node118

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'top_node_no_menu_direction'} = '<!DOCTYPE html>
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap-node" accesskey="n" rel="next">chap node</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap node<a class="copiable-link" href="#chap-node"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'top_node_no_menu_direction'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
