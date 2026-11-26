use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'tab_in_table_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@table C4 l2
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@code l2
      {spaces_after_argument:\\n}
    *before_item C1
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:in tab\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l4
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:table item}
        {spaces_after_argument:\\n}
     *table_definition C2
      *preformatted C1
       {normal_text:T\\n}
      *preformatted C2
       {ignorable_spaces_after_command: }
       {normal_text:other tab\\n}
    *normal_command@end C1 l7
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'tab_in_table_in_example'} = '@example
@table @code
 in tab
@item table item
T
 other tab
@end table
@end example
';


$result_texts{'tab_in_table_in_example'} = 'in tab
table item
T
other tab
';

$result_errors{'tab_in_table_in_example'} = '* E l3|@tab not meaningful inside `@table\' block
 @tab not meaningful inside `@table\' block

* E l6|@tab not meaningful inside `@table\' block
 @tab not meaningful inside `@table\' block

';

$result_nodes_list{'tab_in_table_in_example'} = '';

$result_sections_list{'tab_in_table_in_example'} = '';

$result_sectioning_root{'tab_in_table_in_example'} = '';

$result_headings_list{'tab_in_table_in_example'} = '';


$result_converted{'plaintext'}->{'tab_in_table_in_example'} = '          in tab
     ‘table item’
          T
          other tab
';

1;
