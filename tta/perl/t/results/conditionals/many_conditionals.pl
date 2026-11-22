use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'many_conditionals'} = '*document_root C1
 *before_node_section C13
  *preamble_before_content C2
   *@html C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:This is html text.\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*@ifhtml C1 l5
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifhtml text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:21>
    >*@end C1 l7
    >|EXTRA
    >|text_arg:{ifhtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifhtml}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifnothtml C3 l9
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is ifnothtml text.\\n}
    >*@end C1 l11
    >|EXTRA
    >|text_arg:{ifnothtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnothtml}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*@ifinfo C1 l14
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifinfo text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:21>
    >*@end C1 l16
    >|EXTRA
    >|text_arg:{ifinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifinfo}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<2><p:1>
   >*@ifnotinfo C3 l18
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is ifnotinfo text.\\n}
    >*@end C1 l20
    >|EXTRA
    >|text_arg:{ifnotinfo}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnotinfo}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *@tex C3 l23
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *elided_rawpreformatted C1
    {raw:This is tex text.\\n}
   *@end C1 l25
   |EXTRA
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:tex}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*@iftex C3 l27
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
    >{raw:This is iftex text.\\n}
    >*@end C1 l29
    >|EXTRA
    >|text_arg:{iftex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:iftex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*@ifnottex C1 l31
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:This is ifnottex text.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:23>
    >*@end C1 l33
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
';


$result_texis{'many_conditionals'} = '@html
This is html text.
@end html

This is ifhtml text.



This is ifinfo text.



@tex
This is tex text.
@end tex


This is ifnottex text.
';


$result_texts{'many_conditionals'} = 'This is html text.

This is ifhtml text.



This is ifinfo text.





This is ifnottex text.
';

$result_errors{'many_conditionals'} = '';

$result_nodes_list{'many_conditionals'} = '';

$result_sections_list{'many_conditionals'} = '';

$result_sectioning_root{'many_conditionals'} = '';

$result_headings_list{'many_conditionals'} = '';

1;
