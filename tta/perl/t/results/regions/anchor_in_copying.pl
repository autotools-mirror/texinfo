use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_copying'} = '*document_root C3
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C2
   *normal_command@copying C5 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C3
     {normal_text:Copying.\\n}
     *normal_command@anchor C1 l5
     |identifier:{Copying-information}
     |is_target:{1}
      *brace_arg C1
      |element_region:{copying}
       {normal_text:Copying information}
     {spaces_after_close_brace:\\n}
    {empty_line:\\n}
    *normal_command@end C1 l7
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C2 l9 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l11 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l13
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l15
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l17
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Copying-information}
     {normal_text:Copying information}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'anchor_in_copying'} = '
@copying

Copying.
@anchor{Copying information}

@end copying

@node Top

@node chap

@insertcopying

@insertcopying

@xref{Copying information}.

';


$result_texts{'anchor_in_copying'} = '




Copying information.

';

$result_errors{'anchor_in_copying'} = '* W l11|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'anchor_in_copying'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'anchor_in_copying'} = '';

$result_sectioning_root{'anchor_in_copying'} = '';

$result_headings_list{'anchor_in_copying'} = '';


$result_converted{'info'}->{'anchor_in_copying'} = Encode::encode('utf-8', 'This is , produced from .

Copying.


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

Copying.

   Copying.

   *Note Copying information::.


Tag Table:
Node: Top37
Node: chap84
Ref: Copying information127

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'anchor_in_copying'} = '* E l5|@anchor output more than once: Copying information
 @anchor output more than once: Copying information

';


$result_converted{'html'}->{'anchor_in_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 
Copying.
 -->
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
</style>


</head>

<body>

<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>


<p>Copying.
<a class="anchor" id="Copying-information"></a></p>


<p>Copying.
<a class="anchor" id="Copying-information"></a></p>

<p>See <a class="xref" href="#Copying-information">Copying information</a>.
</p>



</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_in_copying'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex_text'}->{'anchor_in_copying'} = '
\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap}%


Copying.
\\label{anchor:Copying-information}%



Copying.
\\label{anchor:Copying-information}%


See \\hyperref[anchor:Copying-information]{[Copying information], page~\\pageref*{anchor:Copying-information}}.

';

1;
