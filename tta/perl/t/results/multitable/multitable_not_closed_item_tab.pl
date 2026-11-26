use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_not_closed_item_tab'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@multitable C2 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:r}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:t}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |row_number:{1}
     *normal_command@item C2 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:rt }
     *normal_command@tab C2 l2
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:ds\\n}
';


$result_texis{'multitable_not_closed_item_tab'} = '@multitable {r} {t}
@item rt @tab ds
';


$result_texts{'multitable_not_closed_item_tab'} = 'rt ds
';

$result_errors{'multitable_not_closed_item_tab'} = '* E l1|no matching `@end multitable\'
 no matching `@end multitable\'

';

$result_nodes_list{'multitable_not_closed_item_tab'} = '';

$result_sections_list{'multitable_not_closed_item_tab'} = '';

$result_sectioning_root{'multitable_not_closed_item_tab'} = '';

$result_headings_list{'multitable_not_closed_item_tab'} = '';

1;
