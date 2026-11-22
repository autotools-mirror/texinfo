use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'character_and_spaces_in_refs'} = '*document_root C11
 *before_node_section C1
  *preamble_before_content
 *@node C1 character_and_spaces_in_refs_text.texi:l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 character_and_spaces_in_refs_text.texi:l2 {Test refs}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test refs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 character_and_spaces_in_refs_text.texi:l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
     {normal_text:node to avoid DocBook or LaTeX ignored}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{other-nodes}
     {normal_text:other nodes}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 character_and_spaces_in_refs_text.texi:l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 character_and_spaces_in_refs_text.texi:l9 {node to avoid DocBook or LaTeX ignored}
 |EXTRA
 |identifier:{node-to-avoid-DocBook-or-LaTeX-ignored}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node to avoid DocBook or LaTeX ignored}
    {spaces_after_argument:\\n}
 *@chapter C13 character_and_spaces_in_refs_text.texi:l10 {first chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 character_and_spaces_in_refs_text.texi:l12
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Testing distant nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   *@ref C4 character_and_spaces_in_refs_text.texi:l14
    *brace_arg C3
    |EXTRA
    |node_content:A{1|1}
     {spaces_before_argument: }
     {normal_text:a  node}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:manual}
   {normal_text:\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l15
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text::}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:manual}
   {normal_text:\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l16
    *brace_arg C3
    |EXTRA
    |node_content:A{1|1}
     {spaces_before_argument: }
     {normal_text:top}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:manual}
   {normal_text:\\n}
   *@ref C4 character_and_spaces_in_refs_text.texi:l17
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text:node}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:../manual/doc}
   {normal_text:\\n}
  {empty_line:\\n}
  *@subheading C1 character_and_spaces_in_refs_text.texi:l19
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Testing local nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C10
   *@ref C1 character_and_spaces_in_refs_text.texi:l21
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {normal_text:!_"#$%&\'()*+-.}
   {normal_text:\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l22
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {normal_text:/;<=>?[\\]^_`|~}
   {normal_text:\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l23
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{Top}
     {spaces_before_argument: }
     {normal_text:Top}
   {normal_text:\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l24
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{local-node}
     {spaces_before_argument:  }
     {normal_text:local   node}
   {normal_text:\\n}
   *@ref C1 character_and_spaces_in_refs_text.texi:l25
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0028texinfo_0029Cross-References}
     {normal_text:(texinfo)Cross References}
   {normal_text:\\n}
  {empty_line:\\n}
  *@anchor C1 character_and_spaces_in_refs_text.texi:l27
  |EXTRA
  |identifier:{_0028texinfo_0029Cross-References}
  |is_target:{1}
   *brace_arg C1
    {normal_text:(texinfo)Cross References}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 character_and_spaces_in_refs_text.texi:l29 {other nodes}
 |EXTRA
 |identifier:{other-nodes}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:other nodes}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {spaces_before_argument: }
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{node-to-avoid-DocBook-or-LaTeX-ignored}
    {spaces_before_argument: }
    {normal_text:node to avoid DocBook or LaTeX ignored}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@chapter C4 character_and_spaces_in_refs_text.texi:l30 {Chapter with nodes}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter with nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 character_and_spaces_in_refs_text.texi:l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l33
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {normal_text:!_"#$%&\'()*+-.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {normal_text:/;<=>?[\\]^_`|~}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 character_and_spaces_in_refs_text.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{local-node}
     {normal_text:local node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 character_and_spaces_in_refs_text.texi:l36
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 character_and_spaces_in_refs_text.texi:l38 {!_"#$%&\'()*+-.}
 |EXTRA
 |identifier:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {spaces_before_argument: }
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {normal_text:other nodes}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {normal_text:other nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 character_and_spaces_in_refs_text.texi:l40 {/;<=>?[\\]^_`|~}
 |EXTRA
 |identifier:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{local-node}
    {normal_text:local   node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {normal_text:other nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 character_and_spaces_in_refs_text.texi:l42 {local   node}
 |EXTRA
 |identifier:{local-node}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument:  }
    {normal_text:local   node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{other-nodes}
    {normal_text:other nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'character_and_spaces_in_refs'} = '@node Top
@top Test refs

@menu
* node to avoid DocBook or LaTeX ignored::
* other nodes::
@end menu

@node node to avoid DocBook or LaTeX ignored
@chapter first chapter

@subheading Testing distant nodes

@ref{ a  node ,,, manual}
@ref{:,,,manual}
@ref{ top ,,, manual}
@ref{node,,, ../manual/doc}

@subheading Testing local nodes

@ref{!_"#$%&\'()*+-.}
@ref{/;<=>?[\\]^_`|~}
@ref{ Top}
@ref{  local   node}
@ref{(texinfo)Cross References}

@anchor{(texinfo)Cross References}

@node other nodes, !_"#$%&\'()*+-., node to avoid DocBook or LaTeX ignored, Top
@chapter Chapter with nodes

@menu
* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::
@end menu

@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes

@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes

@node  local   node,,/;<=>?[\\]^_`|~,other nodes

@bye
';


$result_texts{'character_and_spaces_in_refs'} = 'Test refs
*********

* node to avoid DocBook or LaTeX ignored::
* other nodes::

1 first chapter
***************

Testing distant nodes
---------------------

a  node
:
top
node

Testing local nodes
-------------------

!_"#$%&\'()*+-.
/;<=>?[\\]^_`|~
Top
local   node
(texinfo)Cross References


2 Chapter with nodes
********************

* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::




';

$result_errors{'character_and_spaces_in_refs'} = '* E character_and_spaces_in_refs_text.texi:l27|syntax for an external node used for `(texinfo)Cross References\'
 syntax for an external node used for `(texinfo)Cross References\'

';

$result_nodes_list{'character_and_spaces_in_refs'} = '1|Top
 associated_section: Test refs
 associated_title_command: Test refs
 menus:
  node to avoid DocBook or LaTeX ignored
  other nodes
 node_directions:
  next->node to avoid DocBook or LaTeX ignored
2|node to avoid DocBook or LaTeX ignored
 associated_section: 1 first chapter
 associated_title_command: 1 first chapter
 node_directions:
  next->other nodes
  prev->Top
  up->Top
3|other nodes
 associated_section: 2 Chapter with nodes
 associated_title_command: 2 Chapter with nodes
 menus:
  !_"#$%&\'()*+-.
  /;<=>?[\\]^_`|~
  local node
 node_directions:
  next->!_"#$%&\'()*+-.
  prev->node to avoid DocBook or LaTeX ignored
  up->Top
4|!_"#$%&\'()*+-.
 node_directions:
  next->/;<=>?[\\]^_`|~
  prev->other nodes
  up->other nodes
5|/;<=>?[\\]^_`|~
 node_directions:
  next->local   node
  prev->!_"#$%&\'()*+-.
  up->other nodes
6|local   node
 node_directions:
  prev->/;<=>?[\\]^_`|~
  up->other nodes
';

$result_sections_list{'character_and_spaces_in_refs'} = '1|Test refs
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->first chapter
 section_children:
  1|first chapter
  2|Chapter with nodes
2|first chapter
 associated_anchor_command: node to avoid DocBook or LaTeX ignored
 associated_node: node to avoid DocBook or LaTeX ignored
 section_directions:
  next->Chapter with nodes
  up->Test refs
 toplevel_directions:
  next->Chapter with nodes
  prev->Test refs
  up->Test refs
3|Chapter with nodes
 associated_anchor_command: other nodes
 associated_node: other nodes
 section_directions:
  prev->first chapter
  up->Test refs
 toplevel_directions:
  prev->first chapter
  up->Test refs
';

$result_sectioning_root{'character_and_spaces_in_refs'} = 'level: -1
list:
 1|Test refs
';

$result_headings_list{'character_and_spaces_in_refs'} = '1|Testing distant nodes
2|Testing local nodes
';


$result_converted{'info'}->{'character_and_spaces_in_refs'} = Encode::encode('utf-8', 'This is , produced from character_and_spaces_in_refs_text.texi.


File: ,  Node: Top,  Next: node to avoid DocBook or LaTeX ignored,  Up: (dir)

Test refs
*********

* Menu:

* node to avoid DocBook or LaTeX ignored::
* other nodes::


File: ,  Node: node to avoid DocBook or LaTeX ignored,  Next: other nodes,  Prev: Top,  Up: Top

1 first chapter
***************

Testing distant nodes
---------------------

*note (manual)a node:: *note (manual)::: *note (manual)top:: *note
(../manual/doc)node::

Testing local nodes
-------------------

*note !_"#$%&\'()*+-.:: *note /;<=>?[\\]^_`|~:: *note Top:: *note local
node:: *note (texinfo)Cross References::


File: ,  Node: other nodes,  Next: !_"#$%&\'()*+-.,  Prev: node to avoid DocBook or LaTeX ignored,  Up: Top

2 Chapter with nodes
********************

* Menu:

* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::


File: ,  Node: !_"#$%&\'()*+-.,  Next: /;<=>?[\\]^_`|~,  Prev: other nodes,  Up: other nodes


File: ,  Node: /;<=>?[\\]^_`|~,  Next: local node,  Prev: !_"#$%&\'()*+-.,  Up: other nodes


File: ,  Node: local node,  Prev: /;<=>?[\\]^_`|~,  Up: other nodes


Tag Table:
Node: Top65
Node: node to avoid DocBook or LaTeX ignored236
Ref: (texinfo)Cross References660
Node: other nodes660
Node: !_"#$%&\'()*+-.876
Node: /;<=>?[\\]^_`|~970
Node: local node1063

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'character_and_spaces_in_refs'} = '* W character_and_spaces_in_refs_text.texi:l15|@ref node name should not contain `:\'
 warning: @ref node name should not contain `:\'

';


$result_converted{'html'}->{'character_and_spaces_in_refs'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test refs</title>

<meta name="description" content="Test refs">
<meta name="keywords" content="Test refs">
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
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node-to-avoid-DocBook-or-LaTeX-ignored" accesskey="n" rel="next">first chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="Test-refs"><span>Test refs<a class="copiable-link" href="#Test-refs"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#node-to-avoid-DocBook-or-LaTeX-ignored" accesskey="1">first chapter</a></li>
<li><a href="#other-nodes" accesskey="2">Chapter with nodes</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node-to-avoid-DocBook-or-LaTeX-ignored">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#other-nodes" accesskey="n" rel="next">Chapter with nodes</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Test refs</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test refs</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="first-chapter"><span>1 first chapter<a class="copiable-link" href="#first-chapter"> &para;</a></span></h2>

<h4 class="subheading" id="Testing-distant-nodes"><span>Testing distant nodes<a class="copiable-link" href="#Testing-distant-nodes"> &para;</a></span></h4>

<p><a data-manual="manual" href="manual.html#a-node">(manual)a  node</a>
<a data-manual="manual" href="manual.html#g_t_003a">(manual):</a>
<a data-manual="manual" href="manual.html#Top">(manual)top</a>
<a data-manual="../manual/doc" href="doc.html#node">(../manual/doc)node</a>
</p>
<h4 class="subheading" id="Testing-local-nodes"><span>Testing local nodes<a class="copiable-link" href="#Testing-local-nodes"> &para;</a></span></h4>

<p><a class="ref" href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e">!_&quot;#$%&amp;\'()*+-.</a>
<a class="ref" href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e">/;&lt;=&gt;?[\\]^_`|~</a>
<a class="ref" href="#Top">Test refs</a>
<a class="ref" href="#local-node">local   node</a>
<a class="ref" href="#g_t_0028texinfo_0029Cross-References">(texinfo)Cross References</a>
</p>
<a class="anchor" id="g_t_0028texinfo_0029Cross-References"></a>
<hr>
</div>
<div class="chapter-level-extent" id="other-nodes">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e" accesskey="n" rel="next">!_&quot;#$%&amp;\'()*+-.</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#node-to-avoid-DocBook-or-LaTeX-ignored" accesskey="p" rel="prev">first chapter</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test refs</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chapter-with-nodes"><span>2 Chapter with nodes<a class="copiable-link" href="#Chapter-with-nodes"> &para;</a></span></h2>


<hr>
<a class="node-id" id="g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e" accesskey="n" rel="next">/;&lt;=&gt;?[\\]^_`|~</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#other-nodes" accesskey="p" rel="prev">Chapter with nodes</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#other-nodes" accesskey="u" rel="up">Chapter with nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>!_&quot;#$%&amp;\'()*+-.<a class="copiable-link" href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e"> &para;</a></span></h4>

<hr>
<a class="node-id" id="g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#local-node" accesskey="n" rel="next">local   node</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e" accesskey="p" rel="prev">!_&quot;#$%&amp;\'()*+-.</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#other-nodes" accesskey="u" rel="up">Chapter with nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>/;&lt;=&gt;?[\\]^_`|~<a class="copiable-link" href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e"> &para;</a></span></h4>

<hr>
<a class="node-id" id="local-node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e" accesskey="p" rel="prev">/;&lt;=&gt;?[\\]^_`|~</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#other-nodes" accesskey="u" rel="up">Chapter with nodes</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>local   node<a class="copiable-link" href="#local-node"> &para;</a></span></h4>

</div>
</div>



</body>
</html>
';


$result_converted{'docbook'}->{'character_and_spaces_in_refs'} = '<chapter label="1" id="node-to-avoid-DocBook-or-LaTeX-ignored">
<title>first chapter</title>

<bridgehead renderas="sect2">Testing distant nodes</bridgehead>

<para>&#8220;a  node&#8221; in <filename>manual</filename>
&#8220;:&#8221; in <filename>manual</filename>
&#8220;top&#8221; in <filename>manual</filename>
&#8220;node&#8221; in <filename>../manual/doc</filename>
</para>
<bridgehead renderas="sect2">Testing local nodes</bridgehead>

<para><link linkend="_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e">!_&quot;#$%&amp;&#8217;()*+-.</link>
<link linkend="_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e">/;&lt;=&gt;?[\\]^_&#8216;|~</link>
<link linkend="Top">Top</link>
<link linkend="local-node">local   node</link>
<link linkend="_0028texinfo_0029Cross-References">(texinfo)Cross References</link>
</para>
<anchor id="_0028texinfo_0029Cross-References"/>
</chapter>
<chapter label="2" id="other-nodes">
<title>Chapter with nodes</title>


</chapter>
<anchor id="_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e"/>

<anchor id="_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e"/>

<anchor id="local-node"/>

';


$result_converted{'latex_text'}->{'character_and_spaces_in_refs'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{first chapter}}
\\label{anchor:node-to-avoid-DocBook-or-LaTeX-ignored}%

\\subsection*{{Testing distant nodes}}

Section ``a  node\'\' in \\texttt{manual}
Section ``:\'\' in \\texttt{manual}
Section ``top\'\' in \\texttt{manual}
Section ``node\'\' in \\texttt{../manual/doc}

\\subsection*{{Testing local nodes}}

\\hyperref[anchor:_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e]{\\chaptername~\\ref*{anchor:_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e} [!\\_"\\#\\$\\%\\&\'()*+-.], page~\\pageref*{anchor:_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}}
\\hyperref[anchor:_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e]{\\chaptername~\\ref*{anchor:_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e} [/;<=>?[\\textbackslash{}]\\^{}\\_`|\\~{}], page~\\pageref*{anchor:_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}}
\\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}
\\hyperref[anchor:local-node]{\\chaptername~\\ref*{anchor:local-node} [local   node], page~\\pageref*{anchor:local-node}}
\\hyperref[anchor:_0028texinfo_0029Cross-References]{[(texinfo)Cross References], page~\\pageref*{anchor:_0028texinfo_0029Cross-References}}

\\label{anchor:_0028texinfo_0029Cross-References}%

\\Texinfochapter{{Chapter with nodes}}
\\label{anchor:other-nodes}%


\\label{anchor:_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}%

\\label{anchor:_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}%

\\label{anchor:local-node}%

';

1;
