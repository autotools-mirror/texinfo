use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_empty_multitable_empty_before_item'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C2 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{emptymacro}
    *arguments_line C1
     {macro_line: emptymacro\\n}
    *@end C1 l2
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@multitable C3 l4
  |EXTRA
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l4
     |EXTRA
     |misc_args:A{0.4|.6|5.}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.4 .6 5.}
       {spaces_after_argument:\\n}
   *before_item
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@emptymacro C1
     >*brace_arg
   >macro_expansion<end;1>
   *@end C1 l5
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_empty_multitable_empty_before_item'} = '@macro emptymacro
@end macro

@multitable @columnfractions 0.4 .6 5.
@end multitable
';


$result_texts{'macro_in_empty_multitable_empty_before_item'} = '
';

$result_errors{'macro_in_empty_multitable_empty_before_item'} = '';

$result_nodes_list{'macro_in_empty_multitable_empty_before_item'} = '';

$result_sections_list{'macro_in_empty_multitable_empty_before_item'} = '';

$result_sectioning_root{'macro_in_empty_multitable_empty_before_item'} = '';

$result_headings_list{'macro_in_empty_multitable_empty_before_item'} = '';

1;
