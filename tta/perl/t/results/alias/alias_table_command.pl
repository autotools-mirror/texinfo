use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'alias_table_command'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@alias C1 l1
   |misc_args:A{myalias|code}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:myalias = code}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@table C3 l3
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l3
     |alias_of:{myalias}
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:table item (code)}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'alias_table_command'} = '@alias myalias = code

@table @code
@item table item (code)
@end table
';


$result_texts{'alias_table_command'} = '
table item (code)
';

$result_errors{'alias_table_command'} = '';

$result_nodes_list{'alias_table_command'} = '';

$result_sections_list{'alias_table_command'} = '';

$result_sectioning_root{'alias_table_command'} = '';

$result_headings_list{'alias_table_command'} = '';

1;
