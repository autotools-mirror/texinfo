use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_copying_in_footnote'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@copying C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C3
     {normal_text:Copying}
     *normal_command@footnote C1 l3
     |global_command_number:{1}
      *brace_command_context C2
       {spaces_before_argument:\\n}
       *paragraph C3
        {normal_text:In footnote.\\n}
        *normal_command@anchor C1 l5
        |identifier:{Copying-footnote}
        |is_target:{1}
         *brace_arg C1
         |element_region:{copying}
          {normal_text:Copying footnote}
        {spaces_after_close_brace:\\n}
     {normal_text:.\\n}
    {empty_line:\\n}
    *normal_command@end C1 l8
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C2 l10 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l12 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l14
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l16
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l18
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Copying-footnote}
     {normal_text:Copying footnote}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'anchor_in_copying_in_footnote'} = '@copying

Copying@footnote{
In footnote.
@anchor{Copying footnote}
}.

@end copying

@node Top

@node chap

@insertcopying

@insertcopying

@xref{Copying footnote}.

';


$result_texts{'anchor_in_copying_in_footnote'} = '




Copying footnote.

';

$result_errors{'anchor_in_copying_in_footnote'} = '* W l12|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'anchor_in_copying_in_footnote'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'anchor_in_copying_in_footnote'} = '';

$result_sectioning_root{'anchor_in_copying_in_footnote'} = '';

$result_headings_list{'anchor_in_copying_in_footnote'} = '';


$result_converted{'info'}->{'anchor_in_copying_in_footnote'} = Encode::encode('utf-8', 'This is , produced from .

Copying(1).

   ---------- Footnotes ----------

   (1) In footnote.


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

Copying(1).

   Copying(2).

   *Note Copying footnote::.

   ---------- Footnotes ----------

   (1) In footnote.

   (2) In footnote.


Tag Table:
Node: Top97
Node: chap144
Ref: chap-Footnote-1274
Ref: Copying footnote293
Ref: chap-Footnote-2295

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'anchor_in_copying_in_footnote'} = '* E l5|@anchor output more than once: Copying footnote
 @anchor output more than once: Copying footnote

';


$result_converted{'html'}->{'anchor_in_copying_in_footnote'} = '<!DOCTYPE html>
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


<p>Copying<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p>


<p>Copying<a class="footnote" id="DOCF1_2" href="#FOOT1_2"><sup>2</sup></a>.
</p>

<p>See <a class="xref" href="#Copying-footnote">Copying footnote</a>.
</p>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote.
<a class="anchor" id="Copying-footnote"></a></p>
<h5 class="footnote-body-heading"><a id="FOOT1_2" href="#DOCF1_2">(2)</a></h5>
<p>In footnote.
<a class="anchor" id="Copying-footnote"></a></p>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_in_copying_in_footnote'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex_text'}->{'anchor_in_copying_in_footnote'} = '
\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap}%


Copying\\footnote{In footnote.
\\label{anchor:Copying-footnote}%
}.



Copying\\footnote{In footnote.
\\label{anchor:Copying-footnote}%
}.


See \\hyperref[anchor:Copying-footnote]{[Copying footnote], page~\\pageref*{anchor:Copying-footnote}}.

';

1;
