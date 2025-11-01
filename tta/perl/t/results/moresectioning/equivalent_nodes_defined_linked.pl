use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'equivalent_nodes_defined_linked'} = '*document_root C3
 *before_node_section
 *@node C4 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C2
   *line_arg C1
    {Top}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{@asis{chap}}
   |normalized:{chap}
    *@asis C1 l1
     *brace_container C1
      {chap}
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{@strong{chap}}
    |normalized:{chap}
     *@strong C1 l4
      *brace_container C1
       {chap}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C9 l7 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *@float C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{Figure}
  |global_command_number:{1}
  |normalized:{chap}
   *arguments_line C2
    *block_line_arg C1
     {Figure}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@samp C1 l9
      *brace_container C1
       {chap}
   *paragraph C1
    {A figure\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@listoffloats C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{Figure}
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Figure}
  {empty_line:\\n}
  *paragraph C3
   {Ref to node }
   *@ref C1 l15
    *brace_arg C1
    |EXTRA
    |node_content:{chap}
    |normalized:{chap}
     {chap}
   {.\\n}
  {empty_line:\\n}
  *paragraph C9
   {Ref to }
   *@@
   {samp}
   *@{
   {chap}
   *@}
   { }
   *@ref C1 l17
    *brace_arg C1
    |EXTRA
    |node_content:{@samp{chap}}
    |normalized:{chap}
     *@samp C1 l17
      *brace_container C1
       {chap}
   {.\\n}
';


$result_texis{'equivalent_nodes_defined_linked'} = '@node Top, @asis{chap}

@menu
* @strong{chap}::
@end menu

@node chap

@float Figure, @samp{chap}
A figure
@end float

@listoffloats Figure

Ref to node @ref{chap}.

Ref to @@samp@{chap@} @ref{@samp{chap}}.
';


$result_texts{'equivalent_nodes_defined_linked'} = '
* chap::


Figure, chap
A figure


Ref to node chap.

Ref to @samp{chap} chap.
';

$result_errors{'equivalent_nodes_defined_linked'} = '* E l9|@float `@samp{chap}\' previously defined
 @float `@samp{chap}\' previously defined

* EC l7|here is the previous definition as @node
 here is the previous definition as @node

* W l17|@ref to `@samp{chap}\', different from node name `chap\'
 warning: @ref to `@samp{chap}\', different from node name `chap\'

* W l1|Next pointer `@asis{chap}\' (for node `Top\') different from node name `chap\'
 warning: Next pointer `@asis{chap}\' (for node `Top\') different from node name `chap\'

* W l4|@menu entry node name `@strong{chap}\' different from node name `chap\'
 warning: @menu entry node name `@strong{chap}\' different from node name `chap\'

';

$result_floats{'equivalent_nodes_defined_linked'} = 'Figure: 1
 F1: {chap}
';

$result_nodes_list{'equivalent_nodes_defined_linked'} = '1|Top
 menus:
  @strong{chap}
 node_directions:
  next->chap
2|chap
 node_directions:
  up->Top
';

$result_sections_list{'equivalent_nodes_defined_linked'} = '';

$result_sectioning_root{'equivalent_nodes_defined_linked'} = '';

$result_headings_list{'equivalent_nodes_defined_linked'} = '';


$result_converted{'info'}->{'equivalent_nodes_defined_linked'} = 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

* Menu:

* *chap*::


File: ,  Node: chap,  Up: Top

A figure

Figure 1

* Menu:

* Figure 1: ‘chap’.                      

   Ref to node *note chap::.

   Ref to @samp{chap} *note chap::.


Tag Table:
Node: Top27
Node: chap95

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'equivalent_nodes_defined_linked'} = '<!DOCTYPE html>
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
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body lang="">
<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#chap" accesskey="1"><strong class="strong">chap</strong></a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<a class="node-id" id="chap"></a><div class="nav-panel">
<p>
Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<div class="float">
<p>A figure
</p><div class="type-number-float"><p><strong class="strong">Figure 1</strong></p></div></div>
<dl class="listoffloats">
</dl>

<p>Ref to node <a class="ref" href="#chap">chap</a>.
</p>
<p>Ref to @samp{chap} <a class="ref" href="#chap">chap</a>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'equivalent_nodes_defined_linked'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
