use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable_in_example_extraneous_item_tab'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@multitable C3 l2
   |EXTRA
   |max_columns:{0}
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:a}
      {spaces_after_argument:\\n}
    *before_item C4
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:ita }
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:tmp\\n}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:secit }
     *preformatted C1
      {ignorable_spaces_after_command:\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{multitable}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:multitable}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable_in_example_extraneous_item_tab'} = '@example
@multitable a
 ita  tmp
 secit 
@end multitable
@end example
';


$result_texts{'multitable_in_example_extraneous_item_tab'} = 'ita tmp
secit ';

$result_errors{'multitable_in_example_extraneous_item_tab'} = '* W l2|empty multitable
 warning: empty multitable

* W l3|@item in empty multitable
 warning: @item in empty multitable

* W l3|@tab in empty multitable
 warning: @tab in empty multitable

* W l4|@item in empty multitable
 warning: @item in empty multitable

* W l4|@tab in empty multitable
 warning: @tab in empty multitable

* W l2|@multitable has text but no @item
 warning: @multitable has text but no @item

';

$result_nodes_list{'multitable_in_example_extraneous_item_tab'} = '';

$result_sections_list{'multitable_in_example_extraneous_item_tab'} = '';

$result_sectioning_root{'multitable_in_example_extraneous_item_tab'} = '';

$result_headings_list{'multitable_in_example_extraneous_item_tab'} = '';


$result_converted{'plaintext'}->{'multitable_in_example_extraneous_item_tab'} = '     ita
     tmp
     secit
';

1;
