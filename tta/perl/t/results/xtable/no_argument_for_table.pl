use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_argument_for_table'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@table C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:In item.\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'no_argument_for_table'} = '@table
@item item
In item.
@end table
';


$result_texts{'no_argument_for_table'} = 'item
In item.
';

$result_errors{'no_argument_for_table'} = '* E l1|missing @table argument
 missing @table argument

';

$result_nodes_list{'no_argument_for_table'} = '';

$result_sections_list{'no_argument_for_table'} = '';

$result_sectioning_root{'no_argument_for_table'} = '';

$result_headings_list{'no_argument_for_table'} = '';

1;
