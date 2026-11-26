use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_table_empty_before_item'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@macro C2 l1
   |formal_args:A{}
   |macro_name:{emptymacro}
    *arguments_line C1
     {macro_line: emptymacro\\n}
    *normal_command@end C1 l2
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@table C4 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l4
     {spaces_after_argument:\\n}
   *before_item C1
    {normal_text:}
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@emptymacro C1
      >*brace_arg
    >macro_expansion<end;1>
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l5
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:citem}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_table_empty_before_item'} = '@macro emptymacro
@end macro

@table @code
@item citem
@end table
';


$result_texts{'macro_in_table_empty_before_item'} = '
citem
';

$result_errors{'macro_in_table_empty_before_item'} = '';

$result_nodes_list{'macro_in_table_empty_before_item'} = '';

$result_sections_list{'macro_in_table_empty_before_item'} = '';

$result_sectioning_root{'macro_in_table_empty_before_item'} = '';

$result_headings_list{'macro_in_table_empty_before_item'} = '';

1;
