use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_two_columns_too_much_cells'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l1
     |EXTRA
     |misc_args:A{0.4|0.6}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.4 0.6}
       {spaces_after_argument:\\n}
   *multitable_body C3
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:first }
     *@tab C8 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:second }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:first out }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:second out }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:third out\\n}
    *row C1
    |EXTRA
    |row_number:{2}
     *@item C2 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:first1 \\n}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l4
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:first2 }
     *@tab C4 l4
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:second2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:first2 out\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_two_columns_too_much_cells'} = '@multitable @columnfractions 0.4 0.6
@item first @tab second  first out  second out  third out
@item first1 
@item first2 @tab second2  first2 out
@end multitable
';


$result_texts{'multitable_two_columns_too_much_cells'} = 'first second first out second out third out
first1 
first2 second2 first2 out
';

$result_errors{'multitable_two_columns_too_much_cells'} = '* E l2|too many columns in multitable item (max 2)
 too many columns in multitable item (max 2)

* E l2|too many columns in multitable item (max 2)
 too many columns in multitable item (max 2)

* E l2|too many columns in multitable item (max 2)
 too many columns in multitable item (max 2)

* E l4|too many columns in multitable item (max 2)
 too many columns in multitable item (max 2)

';

$result_nodes_list{'multitable_two_columns_too_much_cells'} = '';

$result_sections_list{'multitable_two_columns_too_much_cells'} = '';

$result_sectioning_root{'multitable_two_columns_too_much_cells'} = '';

$result_headings_list{'multitable_two_columns_too_much_cells'} = '';

1;
