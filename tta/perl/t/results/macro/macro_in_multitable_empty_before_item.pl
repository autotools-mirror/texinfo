use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_multitable_empty_before_item'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C2 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{emptymacro}
    *arguments_line C1
     {macro_line: emptymacro\\n}
    *normal_command@end C1 l2
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@multitable C4 l4
  |EXTRA
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l4
     |EXTRA
     |misc_args:A{0.4|.6|5.}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.4 .6 5.}
       {spaces_after_argument:\\n}
   *before_item C1
    {normal_text:}
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@emptymacro C1
      >*brace_arg
    >macro_expansion<end;1>
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *normal_command@item C2 l5
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:fc }
     *normal_command@tab C2 l5
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:sc\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_multitable_empty_before_item'} = '@macro emptymacro
@end macro

@multitable @columnfractions 0.4 .6 5.
@item fc @tab sc
@end multitable
';


$result_texts{'macro_in_multitable_empty_before_item'} = '
fc sc
';

$result_errors{'macro_in_multitable_empty_before_item'} = '';

$result_nodes_list{'macro_in_multitable_empty_before_item'} = '';

$result_sections_list{'macro_in_multitable_empty_before_item'} = '';

$result_sectioning_root{'macro_in_multitable_empty_before_item'} = '';

$result_headings_list{'macro_in_multitable_empty_before_item'} = '';

1;
