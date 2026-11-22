use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'table_on_item_line'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@table C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l1
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l2
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item }
       *normal_command@table C1 l2
        *arguments_line C1
         *block_line_arg C3
          {spaces_before_argument: }
          *normal_command@asis l2
          {spaces_after_argument:\\n}
    *table_definition C1
     {spaces_before_paragraph:   }
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l3
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in nested table item}
       {spaces_after_argument:\\n}
    *table_definition C2
     {spaces_before_paragraph:   }
     *paragraph C2
      {normal_text:in nested table line\\n}
      {normal_text:   }
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:in table line\\n}
';


$result_texis{'table_on_item_line'} = '@table @asis
@item item @table @asis
   @item in nested table item
   in nested table line
   @end table
in table line
';


$result_texts{'table_on_item_line'} = 'item 
in nested table item
in nested table line
   in table line
';

$result_errors{'table_on_item_line'} = '* W l2|@table should only appear at the beginning of a line
 warning: @table should only appear at the beginning of a line

* W l2|@table should not appear in @item
 warning: @table should not appear in @item

* E l2|no matching `@end table\'
 no matching `@end table\'

* E l7|unmatched `@end table\'
 unmatched `@end table\'

';

$result_nodes_list{'table_on_item_line'} = '';

$result_sections_list{'table_on_item_line'} = '';

$result_sectioning_root{'table_on_item_line'} = '';

$result_headings_list{'table_on_item_line'} = '';

1;
