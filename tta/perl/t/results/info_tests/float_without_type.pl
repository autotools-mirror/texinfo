use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'float_without_type'} = '*document_root C2
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C5 l2 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C3 l4
  |EXTRA
  |float_type:{a}
  |global_command_number:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:a}
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:aa\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l8
  |EXTRA
  |float_type:{a}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument:\\n}
';


$result_texis{'float_without_type'} = '
@node Top

@float a,
aa
@end float

@listoffloats a
';


$result_texts{'float_without_type'} = '
a
aa

';

$result_errors{'float_without_type'} = '';

$result_floats{'float_without_type'} = 'a: 1
 F
';

$result_nodes_list{'float_without_type'} = '1|Top
';

$result_sections_list{'float_without_type'} = '';

$result_sectioning_root{'float_without_type'} = '';

$result_headings_list{'float_without_type'} = '';


$result_converted{'info'}->{'float_without_type'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

aa

a

* Menu:



Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
