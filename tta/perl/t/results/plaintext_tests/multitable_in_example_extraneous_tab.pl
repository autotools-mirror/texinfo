use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_in_example_extraneous_tab'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@multitable C3 l2
   |max_columns:{1}
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *bracketed_arg C1 l2
       {normal_text:a}
      {spaces_after_argument:\\n}
    *multitable_body C2
     *row C1
     |row_number:{1}
      *normal_command@item C2 l3
      |cell_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {normal_text:ita }
       *preformatted C2
        {ignorable_spaces_after_command: }
        {normal_text:tmp\\n}
     *row C1
     |row_number:{2}
      *normal_command@item C2 l4
      |cell_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {normal_text:secit }
       *preformatted C1
        {ignorable_spaces_after_command:\\n}
    *normal_command@end C1 l5
    |text_arg:{multitable}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:multitable}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_in_example_extraneous_tab'} = '@example
@multitable {a}
@item ita  tmp
@item secit 
@end multitable
@end example
';


$result_texts{'multitable_in_example_extraneous_tab'} = 'ita tmp
secit ';

$result_errors{'multitable_in_example_extraneous_tab'} = '* E l3|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

* E l4|too many columns in multitable item (max 1)
 too many columns in multitable item (max 1)

';

$result_nodes_list{'multitable_in_example_extraneous_tab'} = '';

$result_sections_list{'multitable_in_example_extraneous_tab'} = '';

$result_sectioning_root{'multitable_in_example_extraneous_tab'} = '';

$result_headings_list{'multitable_in_example_extraneous_tab'} = '';


$result_converted{'plaintext'}->{'multitable_in_example_extraneous_tab'} = '     ita
     tmp
     secit
';

1;
