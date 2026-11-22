use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_node_up_url'} = 'U0 unit{C3}{N:Top}{s:@top internal top node up}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
NodeNext: [U1]
NodeForward: [U1]
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
 *@top C4 l2 {internal top node up}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:internal top node up}
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
U1 unit{C1}{N:chap}
unit_directions:D[prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Back: [U0]
FastBack: [U0]
NodePrev: [U0]
NodeUp: [U0]
NodeBack: [U0]
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


$result_texis{'top_node_up_url'} = '@node Top
@top internal top node up

@menu
* chap::
@end menu

@node chap
';


$result_texts{'top_node_up_url'} = 'internal top node up
********************

* chap::

';

$result_errors{'top_node_up_url'} = '';

$result_nodes_list{'top_node_up_url'} = '1|Top
 associated_section: internal top node up
 associated_title_command: internal top node up
 menus:
  chap
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'top_node_up_url'} = '1|internal top node up
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'top_node_up_url'} = 'level: -1
list:
 1|internal top node up
';

$result_headings_list{'top_node_up_url'} = '';


$result_converted{'info'}->{'top_node_up_url'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: @acronym{GNU, @acronym{GNU}\'s Not Unix} manuals

internal top node up
********************

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top


Tag Table:
Node: Top27
Node: chap178

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'top_node_up_url'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>internal top node up</title>

<meta name="description" content="internal top node up">
<meta name="keywords" content="internal top node up">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="https://www.gnu.org/manual/" rel="up" title="@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="https://www.gnu.org/manual/" accesskey="u" rel="up">@acronym{GNU, @acronym{GNU}\'s Not Unix} manuals</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="internal-top-node-up"><span>internal top node up<a class="copiable-link" href="#internal-top-node-up"> &para;</a></span></h1>


<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">internal top node up</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">internal top node up</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>
</div>



</body>
</html>
';

1;
