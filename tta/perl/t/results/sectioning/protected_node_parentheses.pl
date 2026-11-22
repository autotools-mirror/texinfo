use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protected_node_parentheses'} = '*document_root C4
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 l2 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l3 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |node_content:A{0|1}
    |normalized:{_0028manual_0029-name}
     *normal_command@asis C1 l6
      *brace_container C1
       {normal_text:(}
     {normal_text:manual) name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l9 {@asis{(}manual) name}
 |identifier:{_0028manual_0029-name}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@asis C1 l9
     *brace_container C1
      {normal_text:(}
    {normal_text:manual) name}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l11
  |identifier:{_0028manual2_0029-name2}
  |is_target:{1}
   *brace_arg C2
    *normal_command@asis C1 l11
     *brace_container C1
      {normal_text:(}
    {normal_text:manual2) name2}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l13
    *brace_arg C2
    |node_content:A{0|1}
    |normalized:{_0028manual2_0029-name2}
     *normal_command@asis C1 l13
      *brace_container C1
       {normal_text:(}
     {normal_text:manual2) name2}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l15
    *brace_arg C2
    |node_content:A{0|1}
    |normalized:{_0028manual_0029-name}
     *normal_command@asis C1 l15
      *brace_container C1
       {normal_text:(}
     {normal_text:manual) name}
   {normal_text:.\\n}
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

@ref{@asis{(}manual) name}.
';


$result_texts{'protected_node_parentheses'} = 'top
***

* (manual) name::



(manual2) name2.

(manual) name.
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


$result_converted{'info'}->{'protected_node_parentheses'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: first

top
***

* Menu:

* (manual) name::


File: ,  Node: (manual) name,  Up: first

*note (manual2) name2::.

   *note (manual) name::.


Tag Table:
Node: first27
Node: (manual) name90
Ref: (manual2) name2134

End Tag Table


Local Variables:
coding: utf-8
End:
');

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

<body>
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="g_t_0028manual_0029-name"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#first" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>(manual) name<a class="copiable-link" href="#g_t_0028manual_0029-name"> &para;</a></span></h4>

<a class="anchor" id="g_t_0028manual2_0029-name2"></a>
<p><a class="ref" href="#g_t_0028manual2_0029-name2">(manual2) name2</a>.
</p>
<p><a class="ref" href="#g_t_0028manual_0029-name">(manual) name</a>.
</p></div>



</body>
</html>
';

1;
