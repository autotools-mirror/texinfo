use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'caption_not_closed'} = '*document_root C2
 *before_node_section C3
  *preamble_before_content
  *normal_command@float C4 l1
  |EXTRA
  |float_type:{Text}
  |global_command_number:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Text}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l3
    *brace_command_context C4
     *paragraph C1
      {normal_text:Not closed caption\\n}
     {empty_line:\\n}
     *paragraph C6
      {normal_text:The caption is closed as soon as }
      *normal_command@@
      {normal_text:end float is encountered, since\\n}
      {normal_text:as much as possible is closed in order to find the }
      *normal_command@@
      {normal_text:float beginning.\\n}
     {empty_line:\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'caption_not_closed'} = '@float Text

@caption{Not closed caption

The caption is closed as soon as @@end float is encountered, since
as much as possible is closed in order to find the @@float beginning.

}@end float

@bye
';


$result_texts{'caption_not_closed'} = 'Text


';

$result_errors{'caption_not_closed'} = '* E l3|@end float seen before @caption closing brace
 @end float seen before @caption closing brace

';

$result_floats{'caption_not_closed'} = 'Text: 1
 F
  C: Not closed caption
   
   The caption is closed as soon as @@end float is encountered, since
   as much as possible is closed in order to find the @@float beginning.
   
';

$result_nodes_list{'caption_not_closed'} = '';

$result_sections_list{'caption_not_closed'} = '';

$result_sectioning_root{'caption_not_closed'} = '';

$result_headings_list{'caption_not_closed'} = '';

1;
