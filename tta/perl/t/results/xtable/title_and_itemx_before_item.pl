use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'title_and_itemx_before_item'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@table C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@emph l1
     {spaces_after_argument:\\n}
   *before_item C1
    *paragraph C1
     {normal_text:Title\\n}
   *table_entry C1
    *table_term C1
     *normal_command@itemx C1 l3
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in itemx}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l4
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'title_and_itemx_before_item'} = '@table @emph
Title
@itemx in itemx
@end table
';


$result_texts{'title_and_itemx_before_item'} = 'Title
in itemx
';

$result_errors{'title_and_itemx_before_item'} = '* E l3|@itemx should not begin @table
 @itemx should not begin @table

';

$result_nodes_list{'title_and_itemx_before_item'} = '';

$result_sections_list{'title_and_itemx_before_item'} = '';

$result_sectioning_root{'title_and_itemx_before_item'} = '';

$result_headings_list{'title_and_itemx_before_item'} = '';

1;
