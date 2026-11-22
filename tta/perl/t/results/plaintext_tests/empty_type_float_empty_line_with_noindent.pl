use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_type_float_empty_line_with_noindent'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *normal_command@float C3 l1
  |EXTRA
  |float_type:{}
  |global_command_number:{1}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:toto\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  *normal_command@noindent l4
  {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |EXTRA
  |noindent:{1}
   {normal_text:Titi\\n}
  {empty_line:\\n}
';


$result_texis{'empty_type_float_empty_line_with_noindent'} = '@float
toto
@end float
@noindent
Titi

';


$result_texts{'empty_type_float_empty_line_with_noindent'} = 'toto
Titi

';

$result_errors{'empty_type_float_empty_line_with_noindent'} = '';

$result_floats{'empty_type_float_empty_line_with_noindent'} = ': 1
 F
';

$result_nodes_list{'empty_type_float_empty_line_with_noindent'} = '';

$result_sections_list{'empty_type_float_empty_line_with_noindent'} = '';

$result_sectioning_root{'empty_type_float_empty_line_with_noindent'} = '';

$result_headings_list{'empty_type_float_empty_line_with_noindent'} = '';


$result_converted{'plaintext'}->{'empty_type_float_empty_line_with_noindent'} = 'toto
Titi

';

1;
