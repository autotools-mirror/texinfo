use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'today_in_copying'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C2
     *normal_command@today C1 l2
      *brace_container
     {normal_text:.\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C3 l8 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l10
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'today_in_copying'} = '@copying
@today{}.
@end copying

@node Top
@top top

@node chap

@insertcopying
';


$result_texts{'today_in_copying'} = '
top
***


';

$result_errors{'today_in_copying'} = '* W l8|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'today_in_copying'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'today_in_copying'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'today_in_copying'} = 'level: -1
list:
 1|top
';

$result_headings_list{'today_in_copying'} = '';


$result_converted{'info'}->{'today_in_copying'} = Encode::encode('utf-8', 'This is , produced from .

a sunny day.


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***


File: ,  Node: chap,  Prev: Top

a sunny day.


Tag Table:
Node: Top41
Node: chap97

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'today_in_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- a sunny day. -->
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
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
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<p>a sunny day.
</p></div>



</body>
</html>
';


$result_converted{'latex_text'}->{'today_in_copying'} = '
\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap}%

\\today{}.
';

1;
