use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'float_long_captions'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C7 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C4 l3
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |identifier:{text1}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text1}
     {spaces_after_argument:\\n}
   *normal_command@caption C1 l4
    *brace_command_context C1
     *paragraph C1
      {normal_text:AAAAAAAAAAAAAAAA BBBBB CCCCCCCCCCC}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l5
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C4 l7
  |float_number:{2}
  |float_type:{Text}
  |global_command_number:{2}
  |identifier:{text2}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text2}
     {spaces_after_argument:\\n}
   *normal_command@caption C1 l8
    *brace_command_context C1
     *paragraph C1
      {normal_text:AAAAAAAAAAAAAAAA BBBBBB CCCCCCCCCCC}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l9
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l11
  |float_type:{Text}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Text}
    {spaces_after_argument:\\n}
';


$result_texis{'float_long_captions'} = '@node Top

@float Text, text1
@caption{AAAAAAAAAAAAAAAA BBBBB CCCCCCCCCCC}
@end float

@float Text, text2
@caption{AAAAAAAAAAAAAAAA BBBBBB CCCCCCCCCCC}
@end float

@listoffloats Text
';


$result_texts{'float_long_captions'} = '
Text, text1

Text, text2

';

$result_errors{'float_long_captions'} = '';

$result_floats{'float_long_captions'} = 'Text: 2
 F1: {text1}
  C: AAAAAAAAAAAAAAAA BBBBB CCCCCCCCCCC
 F2: {text2}
  C: AAAAAAAAAAAAAAAA BBBBBB CCCCCCCCCCC
';

$result_nodes_list{'float_long_captions'} = '1|Top
';

$result_sections_list{'float_long_captions'} = '';

$result_sectioning_root{'float_long_captions'} = '';

$result_headings_list{'float_long_captions'} = '';


$result_converted{'info'}->{'float_long_captions'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Text 1: AAAAAAAAAAAAAAAA BBBBB CCCCCCCCCCC

Text 2: AAAAAAAAAAAAAAAA BBBBBB CCCCCCCCCCC

* Menu:

* Text 1: text1.                         AAAAAAAAAAAAAAAA BBBBB
                                         CCCCCCCCCCC
* Text 2: text2.                         AAAAAAAAAAAAAAAA BBBBBB
                                         CCCCCCCCCCC


Tag Table:
Node: Top27
Ref: text161
Ref: text2105

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
