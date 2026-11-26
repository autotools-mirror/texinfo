use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'invalid_command_and_brace_in_table'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l1
     {spaces_after_argument:\\n}
   *before_item C2
    {spaces_before_paragraph: }
    *paragraph C3
     {normal_text:,, title\\n}
     {normal_text:long title\\n}
     {normal_text:Item line\\n}
   *normal_command@end C1 l5
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'invalid_command_and_brace_in_table'} = '@table @asis
 ,, title
long title
Item line
@end table
';


$result_texts{'invalid_command_and_brace_in_table'} = ',, title
long title
Item line
';

$result_errors{'invalid_command_and_brace_in_table'} = '* E l2|misplaced {
 misplaced {

* E l2|unknown command `itemTop\'
 unknown command `itemTop\'

* E l3|misplaced }
 misplaced }

* W l1|@table has text but no @item
 warning: @table has text but no @item

';

$result_nodes_list{'invalid_command_and_brace_in_table'} = '';

$result_sections_list{'invalid_command_and_brace_in_table'} = '';

$result_sectioning_root{'invalid_command_and_brace_in_table'} = '';

$result_headings_list{'invalid_command_and_brace_in_table'} = '';

1;
