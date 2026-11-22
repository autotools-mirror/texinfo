use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cond_ifhtml_ifinfo'} = '*document_root C5
 *before_node_section C5
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:test conditions}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@html C3 cond.texi:l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:This is html text.\\n}
    *normal_command@end C1 cond.texi:l7
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifhtml C1 cond.texi:l9
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifhtml text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:21>
    >*normal_command@end C1 cond.texi:l11
    >|EXTRA
    >|text_arg:{ifhtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifhtml}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@ifnothtml C3 cond.texi:l13
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is ifnothtml text.\\n}
    >*normal_command@end C1 cond.texi:l15
    >|EXTRA
    >|text_arg:{ifnothtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnothtml}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 cond.texi:l17 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 cond.texi:l18 {conditionals}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:conditionals}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C12 cond.texi:l20 {chap}
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
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*normal_command@ifinfo C1 cond.texi:l23
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifinfo text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:21>
    >*normal_command@end C1 cond.texi:l25
    >|EXTRA
    >|text_arg:{ifinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifinfo}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*normal_command@ifnotinfo C3 cond.texi:l27
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is ifnotinfo text.\\n}
    >*normal_command@end C1 cond.texi:l29
    >|EXTRA
    >|text_arg:{ifnotinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnotinfo}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@tex C3 cond.texi:l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *elided_rawpreformatted C1
    {raw:This is tex text.\\n}
   *normal_command@end C1 cond.texi:l34
   |EXTRA
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:tex}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*normal_command@iftex C3 cond.texi:l36
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is iftex text.\\n}
    >*normal_command@end C1 cond.texi:l38
    >|EXTRA
    >|text_arg:{iftex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:iftex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*normal_command@ifnottex C1 cond.texi:l40
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifnottex text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:23>
    >*normal_command@end C1 cond.texi:l42
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'cond_ifhtml_ifinfo'} = '\\input texinfo

@c test conditions

@html
This is html text.
@end html

This is ifhtml text.


@node Top
@top conditionals

@node chap


This is ifinfo text.



@tex
This is tex text.
@end tex


This is ifnottex text.

@bye
';


$result_texts{'cond_ifhtml_ifinfo'} = '
This is html text.

This is ifhtml text.


conditionals
************



This is ifinfo text.





This is ifnottex text.

';

$result_errors{'cond_ifhtml_ifinfo'} = '* W cond.texi:l20|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'cond_ifhtml_ifinfo'} = '1|Top
 associated_section: conditionals
 associated_title_command: conditionals
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'cond_ifhtml_ifinfo'} = '1|conditionals
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'cond_ifhtml_ifinfo'} = 'level: -1
list:
 1|conditionals
';

$result_headings_list{'cond_ifhtml_ifinfo'} = '';


$result_converted{'html'}->{'cond_ifhtml_ifinfo'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>conditionals</title>

<meta name="description" content="conditionals">
<meta name="keywords" content="conditionals">
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

This is html text.

<p>This is ifhtml text.
</p>

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="conditionals"><span>conditionals<a class="copiable-link" href="#conditionals"> &para;</a></span></h1>

<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">conditionals</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>


<p>This is ifinfo text.
</p>




<p>This is ifnottex text.
</p>
</div>



</body>
</html>
';

1;
