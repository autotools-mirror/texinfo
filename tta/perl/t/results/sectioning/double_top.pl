use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_top'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {ToP}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:ToP}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C4 l3 {top}
 |EXTRA
 |identifier:{Top}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:top}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:ToP}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{Top}
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@anchor C1 l5
  |EXTRA
  |identifier:{Top}
   *brace_arg C1
    {normal_text:TOP}
  *paragraph C1
   {normal_text:.\\n}
';


$result_texis{'double_top'} = '@node ToP, top

@node top,,ToP,Top

@anchor{TOP}.
';


$result_texts{'double_top'} = '

.
';

$result_errors{'double_top'} = '* E l3|@node `top\' previously defined
 @node `top\' previously defined

* EC l1|here is the previous definition as @node
 here is the previous definition as @node

* E l5|@anchor `TOP\' previously defined
 @anchor `TOP\' previously defined

* EC l1|here is the previous definition as @node
 here is the previous definition as @node

* W l1|Next pointer `top\' (for node `ToP\') different from node name `ToP\'
 warning: Next pointer `top\' (for node `ToP\') different from node name `ToP\'

* W l3|Up pointer `Top\' (for node `top\') different from node name `ToP\'
 warning: Up pointer `Top\' (for node `top\') different from node name `ToP\'

';

$result_nodes_list{'double_top'} = '1|ToP
 node_directions:
  next->ToP
2|top
 node_directions:
  prev->ToP
  up->ToP
';

$result_sections_list{'double_top'} = '';

$result_sectioning_root{'double_top'} = '';

$result_headings_list{'double_top'} = '';


$result_converted{'info'}->{'double_top'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: Top,  Up: (dir)

.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'double_top'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="ToP">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Top" accesskey="n" rel="next">ToP</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>ToP<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<hr>
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">ToP</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">ToP</a></span></span><span class="nav-button"> &nbsp; </span></p>

<p>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'double_top'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
