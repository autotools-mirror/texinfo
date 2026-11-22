use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '*document_root C5
 *before_node_section C4
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C5
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
    *elided_rawpreformatted C1
     {raw:This is html text.\\n}
    *normal_command@end C1 cond.texi:l7
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifhtml C3 cond.texi:l9
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:This is ifhtml text.\\n}
     >*normal_command@end C1 cond.texi:l11
     >|EXTRA
     >|text_arg:{ifhtml}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifhtml}
       >{spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifnothtml C1 cond.texi:l13
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifnothtml text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:24>
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
  >ignored_conditional_block<2><p:1>
   >*normal_command@ifinfo C3 cond.texi:l23
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is ifinfo text.\\n}
    >*normal_command@end C1 cond.texi:l25
    >|EXTRA
    >|text_arg:{ifinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifinfo}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*normal_command@ifnotinfo C1 cond.texi:l27
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifnotinfo text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:24>
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


$result_texis{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '\\input texinfo

@c test conditions

@html
This is html text.
@end html


This is ifnothtml text.

@node Top
@top conditionals

@node chap



This is ifnotinfo text.


@tex
This is tex text.
@end tex


This is ifnottex text.

@bye
';


$result_texts{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '


This is ifnothtml text.

conditionals
************




This is ifnotinfo text.




This is ifnottex text.

';

$result_errors{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '* W cond.texi:l20|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '1|Top
 associated_section: conditionals
 associated_title_command: conditionals
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '1|conditionals
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = 'level: -1
list:
 1|conditionals
';

$result_headings_list{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = '';


$result_converted{'info'}->{'cond_info_no-ifhtml_no-ifinfo_no-iftex'} = Encode::encode('utf-8', 'This is , produced from cond.texi.

This is ifnothtml text.


File: ,  Node: Top,  Next: chap,  Up: (dir)

conditionals
************


File: ,  Node: chap,  Prev: Top

This is ifnotinfo text.

   This is ifnottex text.


Tag Table:
Node: Top61
Node: chap135

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
