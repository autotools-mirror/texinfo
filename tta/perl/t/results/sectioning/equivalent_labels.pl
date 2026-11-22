use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'equivalent_labels'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C8 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l3
  |identifier:{anch}
  |is_target:{1}
   *brace_arg C1
    *normal_command@samp C1 l3
     *brace_container C1
      {normal_text:anch}
  *paragraph C1
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@float C3 l5
  |float_number:{1}
  |float_type:{truc}
  |global_command_number:{1}
  |identifier:{floa}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:truc}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:floa}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In float\\n}
   *normal_command@end C1 l7
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{anch}
     {normal_text:anch}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{floa}
     *normal_command@code C1 l11
      *brace_container C1
       {normal_text:floa}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l12
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'equivalent_labels'} = '@node first

@anchor{@samp{anch}}.

@float truc, floa
In float
@end float

@menu
* anch::
* @code{floa}::
@end menu
';


$result_texts{'equivalent_labels'} = '
.

truc, floa
In float

* anch::
* floa::
';

$result_errors{'equivalent_labels'} = '* W l10|@menu entry node name `anch\' different from anchor name `@samp{anch}\'
 warning: @menu entry node name `anch\' different from anchor name `@samp{anch}\'

* W l11|@menu entry node name `@code{floa}\' different from float name `floa\'
 warning: @menu entry node name `@code{floa}\' different from float name `floa\'

';

$result_floats{'equivalent_labels'} = 'truc: 1
 F1: {floa}
';

$result_nodes_list{'equivalent_labels'} = '1|first
 menus:
  anch
  @code{floa}
';

$result_sections_list{'equivalent_labels'} = '';

$result_sectioning_root{'equivalent_labels'} = '';

$result_headings_list{'equivalent_labels'} = '';


$result_converted{'info'}->{'equivalent_labels'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: first

.

In float

truc 1
* Menu:

* anch::
* floa::


Tag Table:
Node: first27
Ref: anch51
Ref: floa54

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'equivalent_labels'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'equivalent_labels'} = '<!DOCTYPE html>
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
<h4 class="node" id="first"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>

<a class="anchor" id="anch"></a><p>.
</p>
<div class="float" id="floa">
<p>In float
</p><div class="type-number-float"><p><strong class="strong">truc 1</strong></p></div></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'equivalent_labels'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
