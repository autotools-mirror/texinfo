use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_arg_brace_command_on_table_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet l1
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l3
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'no_arg_brace_command_on_table_line'} = '@table @bullet
@item item
@end table
';


$result_texts{'no_arg_brace_command_on_table_line'} = 'item
';

$result_errors{'no_arg_brace_command_on_table_line'} = '* E l1|command @bullet not accepting argument in brace should not be on @table line
 command @bullet not accepting argument in brace should not be on @table line

';

$result_nodes_list{'no_arg_brace_command_on_table_line'} = '';

$result_sections_list{'no_arg_brace_command_on_table_line'} = '';

$result_sectioning_root{'no_arg_brace_command_on_table_line'} = '';

$result_headings_list{'no_arg_brace_command_on_table_line'} = '';

1;
