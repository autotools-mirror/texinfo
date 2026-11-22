use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'style_not_closed_in_table_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@table C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l1
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:first item}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C3
      {normal_text:line\\n}
      {normal_text:line }
      *normal_command@code C1 l4
       *brace_container C1
        {normal_text:in code }
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in item}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'style_not_closed_in_table_line'} = '@table @asis
@item first item
line
line @code{in code }@item in item
@end table
';


$result_texts{'style_not_closed_in_table_line'} = 'first item
line
line in code in item
';

$result_errors{'style_not_closed_in_table_line'} = '* E l4|@code missing closing brace
 @code missing closing brace

';

$result_nodes_list{'style_not_closed_in_table_line'} = '';

$result_sections_list{'style_not_closed_in_table_line'} = '';

$result_sectioning_root{'style_not_closed_in_table_line'} = '';

$result_headings_list{'style_not_closed_in_table_line'} = '';

1;
