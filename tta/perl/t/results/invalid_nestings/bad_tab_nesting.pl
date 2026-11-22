use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_tab_nesting'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C3 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:truc}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:bidule}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |row_number:{1}
     *normal_command@item C2 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:truc\\n}
       *normal_command@code C1 l3
        *brace_container
     *normal_command@tab C2 l3
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bidule\\n}
   *normal_command@end C1 l4
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'bad_tab_nesting'} = '@multitable {truc} {bidule}
@item truc
@code{}@tab bidule
@end multitable
';


$result_texts{'bad_tab_nesting'} = 'truc
bidule
';

$result_errors{'bad_tab_nesting'} = '* E l3|@code missing closing brace
 @code missing closing brace

* E l3|misplaced }
 misplaced }

';

$result_nodes_list{'bad_tab_nesting'} = '';

$result_sections_list{'bad_tab_nesting'} = '';

$result_sectioning_root{'bad_tab_nesting'} = '';

$result_headings_list{'bad_tab_nesting'} = '';

1;
