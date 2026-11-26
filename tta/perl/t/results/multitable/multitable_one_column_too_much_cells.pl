use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_one_column_too_much_cells'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@multitable C3 l1
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:a}
     {spaces_after_argument:\\n}
   *multitable_body C4
    *row C1
    |row_number:{1}
     *normal_command@item C8 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:additional tab }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:other additional tab }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3rd  additiona tab\\n}
    *row C1
    |row_number:{2}
     *normal_command@item C2 l3
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a1\\n}
    *row C1
    |row_number:{3}
     *normal_command@item C8 l4
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:additional tab2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:other additional tab2 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3rd  additional tab2\\n}
    *row C1
    |row_number:{4}
     *normal_command@item C4 l5
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a3 }
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:one additional tab\\n}
   *normal_command@end C1 l6
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_one_column_too_much_cells'} = '@multitable {a}
@item a  additional tab  other additional tab  3rd  additiona tab
@item a1
@item a2  additional tab2  other additional tab2  3rd  additional tab2
@item a3  one additional tab
@end multitable
';


$result_texts{'multitable_one_column_too_much_cells'} = 'a additional tab other additional tab 3rd  additiona tab
a1
a2 additional tab2 other additional tab2 3rd  additional tab2
a3 one additional tab
';

$result_errors{'multitable_one_column_too_much_cells'} = '* E l2|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l2|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l2|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l5|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

';

$result_nodes_list{'multitable_one_column_too_much_cells'} = '';

$result_sections_list{'multitable_one_column_too_much_cells'} = '';

$result_sectioning_root{'multitable_one_column_too_much_cells'} = '';

$result_headings_list{'multitable_one_column_too_much_cells'} = '';

1;
