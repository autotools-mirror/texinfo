use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cond_info_ifhtml_ifinfo_iftex'} = '*document_root C5
 *before_node_section C5
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:test conditions}
   {empty_line:\\n}
   *@html C3 cond.texi:l5
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *rawpreformatted C1
     {This is html text.\\n}
    *@end C1 cond.texi:l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{html}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {html}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*@ifhtml C1 cond.texi:l9
     >*arguments_line C1
      >*block_line_arg
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
  *paragraph C1
   {This is ifhtml text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:21>
    >*@end C1 cond.texi:l11
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifhtml}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifhtml}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifnothtml C3 cond.texi:l13
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
    >{raw:This is ifnothtml text.\\n}
    >*@end C1 cond.texi:l15
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnothtml}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnothtml}
  {empty_line:\\n}
 *@node C1 cond.texi:l17 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 cond.texi:l18 {conditionals}
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
    {conditionals}
  {empty_line:\\n}
 *@node C12 cond.texi:l20 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*@ifinfo C1 cond.texi:l23
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C1
   {This is ifinfo text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:21>
    >*@end C1 cond.texi:l25
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifinfo}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifinfo}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*@ifnotinfo C3 cond.texi:l27
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
    >{raw:This is ifnotinfo text.\\n}
    >*@end C1 cond.texi:l29
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnotinfo}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnotinfo}
  {empty_line:\\n}
  {empty_line:\\n}
  *@tex C3 cond.texi:l32
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {This is tex text.\\n}
   *@end C1 cond.texi:l34
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*@iftex C1 cond.texi:l36
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
  *paragraph C1
   {This is iftex text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:20>
    >*@end C1 cond.texi:l38
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{iftex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{iftex}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*@ifnottex C3 cond.texi:l40
    >*arguments_line C1
     >*block_line_arg
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
    >{raw:This is ifnottex text.\\n}
    >*@end C1 cond.texi:l42
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifnottex}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'cond_info_ifhtml_ifinfo_iftex'} = '\\input texinfo

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

This is iftex text.


@bye
';


$result_texts{'cond_info_ifhtml_ifinfo_iftex'} = '
This is html text.

This is ifhtml text.


conditionals
************



This is ifinfo text.



This is tex text.

This is iftex text.


';

$result_errors{'cond_info_ifhtml_ifinfo_iftex'} = '* W cond.texi:l20|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'cond_info_ifhtml_ifinfo_iftex'} = '1|Top
 associated_section: conditionals
 associated_title_command: conditionals
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'cond_info_ifhtml_ifinfo_iftex'} = '1|conditionals
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'cond_info_ifhtml_ifinfo_iftex'} = 'level: -1
list:
 1|conditionals
';

$result_headings_list{'cond_info_ifhtml_ifinfo_iftex'} = '';


$result_converted{'info'}->{'cond_info_ifhtml_ifinfo_iftex'} = 'This is , produced from cond.texi.

This is html text.

   This is ifhtml text.


File: ,  Node: Top,  Next: chap,  Up: (dir)

conditionals
************


File: ,  Node: chap,  Prev: Top

This is ifinfo text.

This is tex text.

   This is iftex text.


Tag Table:
Node: Top81
Node: chap155

End Tag Table


Local Variables:
coding: utf-8
End:
';

1;
