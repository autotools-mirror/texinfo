use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'equivalent_nodes'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{node}
    {spaces_before_argument: }
    *normal_command@emph C1 l1
     *brace_container C1
      {normal_text:node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node}
     *normal_command@strong C1 l4
      *brace_container C1
       {normal_text:node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l5
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 l7 {@samp{node}}
 |identifier:{node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@samp C1 l7
     *brace_container C1
      {normal_text:node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l9
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{node}
     {normal_text:node}
   {normal_text:.\\n}
';


$result_texis{'equivalent_nodes'} = '@node first, @emph{node}

@menu
* @strong{node}::
@end menu

@node @samp{node}

@xref{node}.
';


$result_texts{'equivalent_nodes'} = '
* node::


node.
';

$result_errors{'equivalent_nodes'} = '* W l9|@xref to `node\', different from node name `@samp{node}\'
 warning: @xref to `node\', different from node name `@samp{node}\'

* W l1|Next pointer `@emph{node}\' (for node `first\') different from node name `@samp{node}\'
 warning: Next pointer `@emph{node}\' (for node `first\') different from node name `@samp{node}\'

* W l4|@menu entry node name `@strong{node}\' different from node name `@samp{node}\'
 warning: @menu entry node name `@strong{node}\' different from node name `@samp{node}\'

* W l1|node `first\' not in menu
 warning: node `first\' not in menu

';

$result_nodes_list{'equivalent_nodes'} = '1|first
 menus:
  @strong{node}
 node_directions:
  next->@samp{node}
2|@samp{node}
 node_directions:
  up->first
';

$result_sections_list{'equivalent_nodes'} = '';

$result_sectioning_root{'equivalent_nodes'} = '';

$result_headings_list{'equivalent_nodes'} = '';


$result_converted{'info'}->{'equivalent_nodes'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: first,  Next: node

* Menu:

* *node*::


File: ,  Node: node,  Up: first

*Note node::.


Tag Table:
Node: first27
Node: node85

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'equivalent_nodes'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'equivalent_nodes'} = '<!DOCTYPE html>
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

<link href="#first" rel="start" title="first">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="first"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node" accesskey="n" rel="next">&lsquo;<samp class="samp">node</samp>&rsquo;</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>


<hr>
<a class="node-id" id="node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#first" accesskey="u" rel="up">first</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>&lsquo;<samp class="samp">node</samp>&rsquo;<a class="copiable-link" href="#node"> &para;</a></span></h4>

<p>See <a class="xref" href="#node">&lsquo;<samp class="samp">node</samp>&rsquo;</a>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'equivalent_nodes'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
