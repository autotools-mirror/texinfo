use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_top_node_up'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {empty top node up}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:empty top node up}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap}
     {normal_text:chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l8 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
';


$result_texis{'empty_top_node_up'} = '@node Top
@top empty top node up

@menu
* chap::
@end menu

@node chap
';


$result_texts{'empty_top_node_up'} = 'empty top node up
*****************

* chap::

';

$result_errors{'empty_top_node_up'} = '';

$result_nodes_list{'empty_top_node_up'} = '1|Top
 associated_section: empty top node up
 associated_title_command: empty top node up
 menus:
  chap
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'empty_top_node_up'} = '1|empty top node up
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'empty_top_node_up'} = 'level: -1
list:
 1|empty top node up
';

$result_headings_list{'empty_top_node_up'} = '';


$result_converted{'info'}->{'empty_top_node_up'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: 

empty top node up
*****************

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top


Tag Table:
Node: Top27
Node: chap125

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'empty_top_node_up'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>empty top node up</title>

<meta name="description" content="empty top node up">
<meta name="keywords" content="empty top node up">
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
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="empty-top-node-up"><span>empty top node up<a class="copiable-link" href="#empty-top-node-up"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">empty top node up</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">empty top node up</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>
</div>



</body>
</html>
';

1;
