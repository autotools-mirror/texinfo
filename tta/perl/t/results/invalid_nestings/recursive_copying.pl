use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_copying'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@copying C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:In copying.\\n}
    {empty_line:\\n}
    *normal_command@end C1 l6
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@insertcopying C1 l8
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'recursive_copying'} = '@copying

In copying.

@end copying

@insertcopying
';


$result_texts{'recursive_copying'} = '
';

$result_errors{'recursive_copying'} = '* E l5|@insertcopying not allowed inside `@copying\' block
 @insertcopying not allowed inside `@copying\' block

';

$result_nodes_list{'recursive_copying'} = '';

$result_sections_list{'recursive_copying'} = '';

$result_sectioning_root{'recursive_copying'} = '';

$result_headings_list{'recursive_copying'} = '';

1;
