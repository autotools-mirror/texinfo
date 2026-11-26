use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_in_table'} = '*document_root C2
 *before_node_section C2
  *preamble
  *normal_command@table C2 l1
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
       {normal_text:Before}
       {spaces_after_argument:\\n}
    *table_definition C1
     {empty_line:\\n}
 *normal_command@section C5 l4 {Subsection}
 |identifier:{Subsection}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {ignorable_spaces_after_command: }
  *paragraph C1
   {normal_text:After\\n}
  {empty_line:\\n}
';


$result_texis{'section_in_table'} = '@table @asis
@item Before

@section Subsection

 After

';


$result_texts{'section_in_table'} = 'Before

1 Subsection
============

After

';

$result_errors{'section_in_table'} = '* E l4|@section seen before @end table
 @section seen before @end table

* E l6|@item outside of table or list
 @item outside of table or list

* E l8|unmatched `@end table\'
 unmatched `@end table\'

';

$result_nodes_list{'section_in_table'} = '';

$result_sections_list{'section_in_table'} = '1|Subsection
';

$result_sectioning_root{'section_in_table'} = 'level: 1
list:
 1|Subsection
';

$result_headings_list{'section_in_table'} = '';

1;
