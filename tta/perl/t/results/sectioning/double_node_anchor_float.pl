use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_node_anchor_float'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C2 l1 {node1}
 |identifier:{node1}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l3 {node1}
 |identifier:{node1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l5
  |identifier:{node1}
   *brace_arg C1
    {normal_text:node1}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l7
  |identifier:{anchor1}
  |is_target:{1}
   *brace_arg C1
    {normal_text:anchor1}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l9 {anchor1}
 |identifier:{anchor1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:anchor1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C2 l11
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |identifier:{node1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:node1}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C2 l14
  |float_number:{2}
  |float_type:{Text}
  |global_command_number:{2}
  |identifier:{anchor1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:anchor1}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l15
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C2 l17
  |float_number:{3}
  |float_type:{Text}
  |global_command_number:{3}
  |identifier:{float1}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:float1}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l18
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l20 {float1}
 |identifier:{float1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:float1}
    {spaces_after_argument:\\n}
';


$result_texis{'double_node_anchor_float'} = '@node node1

@node node1

@anchor{node1}

@anchor{anchor1}

@node anchor1

@float Text, node1
@end float

@float Text, anchor1
@end float

@float Text, float1
@end float

@node float1
';


$result_texts{'double_node_anchor_float'} = '




Text, node1

Text, anchor1

Text, float1

';

$result_errors{'double_node_anchor_float'} = '* E l3|@node `node1\' previously defined
 @node `node1\' previously defined

* EC l1|here is the previous definition as @node
 here is the previous definition as @node

* E l5|@anchor `node1\' previously defined
 @anchor `node1\' previously defined

* EC l1|here is the previous definition as @node
 here is the previous definition as @node

* E l9|@node `anchor1\' previously defined
 @node `anchor1\' previously defined

* EC l7|here is the previous definition as @anchor
 here is the previous definition as @anchor

* E l11|@float `node1\' previously defined
 @float `node1\' previously defined

* EC l1|here is the previous definition as @node
 here is the previous definition as @node

* E l14|@float `anchor1\' previously defined
 @float `anchor1\' previously defined

* EC l7|here is the previous definition as @anchor
 here is the previous definition as @anchor

* E l20|@node `float1\' previously defined
 @node `float1\' previously defined

* EC l17|here is the previous definition as @float
 here is the previous definition as @float

* W l1|node `node1\' not in menu
 warning: node `node1\' not in menu

';

$result_floats{'double_node_anchor_float'} = 'Text: 3
 F1: {node1}
 F2: {anchor1}
 F3: {float1}
';

$result_nodes_list{'double_node_anchor_float'} = '1|node1
2|node1
3|anchor1
4|float1
';

$result_sections_list{'double_node_anchor_float'} = '';

$result_sectioning_root{'double_node_anchor_float'} = '';

$result_headings_list{'double_node_anchor_float'} = '';


$result_converted{'info'}->{'double_node_anchor_float'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: node1

Text 1

Text 2

Text 3


Tag Table:
Node: node127
Ref: anchor151
Ref: float167

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'double_node_anchor_float'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'double_node_anchor_float'} = '<!DOCTYPE html>
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

<link href="#node1" rel="start" title="node1">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<h4 class="node" id="node1"><span>node1<a class="copiable-link" href="#node1"> &para;</a></span></h4>

<hr>


<a class="anchor" id="anchor1"></a>
<hr>

<div class="float">
<div class="type-number-float"><p><strong class="strong">Text 1</strong></p></div></div>
<div class="float">
<div class="type-number-float"><p><strong class="strong">Text 2</strong></p></div></div>
<div class="float" id="float1">
<div class="type-number-float"><p><strong class="strong">Text 3</strong></p></div></div>
<hr>



</body>
</html>
';

$result_converted_errors{'html'}->{'double_node_anchor_float'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'double_node_anchor_float'} = '<node identifier="node1"><nodename> node1</nodename></node>

<node identifier=""><nodename></nodename></node>

<anchor identifier="">node1</anchor>

<anchor identifier="anchor1">anchor1</anchor>

<node identifier=""><nodename></nodename></node>

<float type="Text" number="1" endspaces=" "><floattype> Text</floattype><floatname> node1</floatname>
</float>

<float type="Text" number="2" endspaces=" "><floattype> Text</floattype><floatname> anchor1</floatname>
</float>

<float identifier="float1" type="Text" number="3" endspaces=" "><floattype> Text</floattype><floatname> float1</floatname>
</float>

<node identifier=""><nodename></nodename></node>
';


$result_converted{'docbook'}->{'double_node_anchor_float'} = '<anchor id="node1"/>



<anchor id="anchor1"/>



<anchor id="float1"/>

';

1;
