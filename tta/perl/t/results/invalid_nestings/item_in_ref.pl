use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'item_in_ref'} = '*document_root C1
 *before_node_section C2
  *preamble
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
       {normal_text:first item}
       {spaces_after_argument:\\n}
    *table_definition C3
     *paragraph C1
      {normal_text:First item text\\n}
     {empty_line:\\n}
     *paragraph C1
      *normal_command@ref C3 l5
       *brace_arg C1
        {normal_text:Top}
       *brace_arg
       *brace_arg C3
        {spaces_before_argument: }
        {normal_text:title in first item}
        {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l6
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:second item}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l7
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'item_in_ref'} = '@table @asis
@item first item
First item text

@ref{Top,, title in first item
}@item second item
@end table
';


$result_texts{'item_in_ref'} = 'first item
First item text

Topsecond item
';

$result_errors{'item_in_ref'} = '* E l5|@ref missing closing brace
 @ref missing closing brace

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'item_in_ref'} = '';

$result_sections_list{'item_in_ref'} = '';

$result_sectioning_root{'item_in_ref'} = '';

$result_headings_list{'item_in_ref'} = '';

1;
