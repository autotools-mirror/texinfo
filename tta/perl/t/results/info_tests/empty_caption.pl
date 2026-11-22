use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_caption'} = '*document_root C2
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C5 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l4
  |float_number:{1}
  |float_type:{a}
  |global_command_number:{1}
  |identifier:{b}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:a}
    *block_line_arg C2
     {normal_text:b}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:aa\\n}
   *normal_command@caption C1 l6
    *brace_command_context
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l7
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l9
  |float_type:{a}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument:\\n}
';


$result_texis{'empty_caption'} = '
@node Top

@float a,b
aa
@caption{}
@end float

@listoffloats a
';


$result_texts{'empty_caption'} = '
a, b
aa

';

$result_errors{'empty_caption'} = '';

$result_floats{'empty_caption'} = 'a: 1
 F1: {b}
  C(E)
';

$result_nodes_list{'empty_caption'} = '1|Top
';

$result_sections_list{'empty_caption'} = '';

$result_sectioning_root{'empty_caption'} = '';

$result_headings_list{'empty_caption'} = '';


$result_converted{'info'}->{'empty_caption'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

aa

a 1: 

* Menu:

* a 1: b.                                


Tag Table:
Node: Top27
Ref: b61

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
