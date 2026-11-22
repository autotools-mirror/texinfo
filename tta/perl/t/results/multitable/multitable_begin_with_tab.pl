use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_begin_with_tab'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *normal_command@multitable C3 l1
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:a}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:b}
     {spaces_after_argument:\\n}
   *before_item C2
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:t\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C4 l5
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l5
      {normal_text:c}
     {normal_text: }
     *bracketed_arg C1 l5
      {normal_text:d}
     {spaces_after_argument:\\n}
   *before_item C2
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:t2\\n}
   *multitable_body C1
    *row C1
    |EXTRA
    |row_number:{1}
     *normal_command@item C2 l7
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:it\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_begin_with_tab'} = '@multitable {a} {b}
 t
@end multitable

@multitable {c} {d}
 t2
@item it
@end multitable
';


$result_texts{'multitable_begin_with_tab'} = 't

t2
it
';

$result_errors{'multitable_begin_with_tab'} = '* E l2|@tab before @item
 @tab before @item

* W l1|@multitable has text but no @item
 warning: @multitable has text but no @item

* E l6|@tab before @item
 @tab before @item

';

$result_nodes_list{'multitable_begin_with_tab'} = '';

$result_sections_list{'multitable_begin_with_tab'} = '';

$result_sectioning_root{'multitable_begin_with_tab'} = '';

$result_headings_list{'multitable_begin_with_tab'} = '';

1;
