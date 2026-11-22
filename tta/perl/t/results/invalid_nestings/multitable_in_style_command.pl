use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_in_style_command'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *paragraph C1
   *@code C1 l1
    *brace_container C2
     {normal_text:\\n}
     {normal_text:Multitable\\n}
  *@multitable C3 l3
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l3
      {normal_text:truc}
     {normal_text: }
     *bracketed_arg C1 l3
      {normal_text:machin}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l4
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:truc }
     *@tab C2 l4
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:machin\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_in_style_command'} = '@code{
Multitable
}@multitable {truc} {machin}
@item truc @tab machin
@end multitable
';


$result_texts{'multitable_in_style_command'} = '
Multitable
truc machin
';

$result_errors{'multitable_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'multitable_in_style_command'} = '';

$result_sections_list{'multitable_in_style_command'} = '';

$result_sectioning_root{'multitable_in_style_command'} = '';

$result_headings_list{'multitable_in_style_command'} = '';

1;
