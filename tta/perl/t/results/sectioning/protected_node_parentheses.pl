use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protected_node_parentheses'} = '*document_root C4
 *before_node_section C1
  {empty_line:\\n}
 *@node C1 l2 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
 *@top C4 l3 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@menu C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:{@asis{(}manual) name}
    |normalized:{_0028manual_0029-name}
     *@asis C1 l6
      *brace_container C1
       {(}
     {manual) name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l7
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
 *@node C6 l9 {@asis{(}manual) name}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{_0028manual_0029-name}
  *arguments_line C1
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@asis C1 l9
     *brace_container C1
      {(}
    {manual) name}
  {empty_line:\\n}
  *@anchor C1 l11
  |EXTRA
  |is_target:{1}
  |normalized:{_0028manual2_0029-name2}
   *brace_arg C2
    *@asis C1 l11
     *brace_container C1
      {(}
    {manual2) name2}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l13
    *brace_arg C2
    |EXTRA
    |node_content:{@asis{(}manual2) name2}
    |normalized:{_0028manual2_0029-name2}
     *@asis C1 l13
      *brace_container C1
       {(}
     {manual2) name2}
   {.\\n}
';


$result_texis{'protected_node_parentheses'} = '
@node first
@top top

@menu
* @asis{(}manual) name::
@end menu

@node @asis{(}manual) name

@anchor{@asis{(}manual2) name2}

@ref{@asis{(}manual2) name2}.
';


$result_texts{'protected_node_parentheses'} = '
top
***

* (manual) name::



(manual2) name2.
';

$result_errors{'protected_node_parentheses'} = '';

$result_nodes_list{'protected_node_parentheses'} = '1|first
 associated_section: top
 associated_title_command: top
 menus:
  @asis{(}manual) name
2|@asis{(}manual) name
 node_directions:
  up->first
';

$result_sections_list{'protected_node_parentheses'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'protected_node_parentheses'} = 'level: -1
list:
 1|top
';

$result_headings_list{'protected_node_parentheses'} = '';


$result_converted{'info'}->{'protected_node_parentheses'} = 'This is , produced from .


File: ,  Node: first

top
***

* Menu:

* (manual) name::


File: ,  Node: (manual) name,  Up: first

*note (manual2) name2::.


Tag Table:
Node: first27
Node: (manual) name88
Ref: (manual2) name2132

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'protected_node_parentheses'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'protected_node_parentheses'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#first" rel="start" title="first">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">

<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="g_t_0028manual_0029-name"></a><div class="nav-panel">
<p>
Up: <a href="#first" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h4 class="node"><span>(manual) name<a class="copiable-link" href="#g_t_0028manual_0029-name"> &para;</a></span></h4>

<a class="anchor" id="g_t_0028manual2_0029-name2"></a>
<p><a class="ref" href="#g_t_0028manual2_0029-name2">(manual2) name2</a>.
</p></div>



</body>
</html>
';

1;
