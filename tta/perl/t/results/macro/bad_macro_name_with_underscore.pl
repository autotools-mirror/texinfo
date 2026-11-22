use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_macro_name_with_underscore'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@macro C3 l1
   |formal_args:A{arg1|arg2}
   |macro_name:{the_macro}
    *arguments_line C1
     {macro_line: the_macro {arg1, arg2}\\n}
    {raw:In macro\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
';


$result_texis{'bad_macro_name_with_underscore'} = '@macro the_macro {arg1, arg2}
In macro
@end macro
';


$result_texts{'bad_macro_name_with_underscore'} = '';

$result_errors{'bad_macro_name_with_underscore'} = '';

$result_nodes_list{'bad_macro_name_with_underscore'} = '';

$result_sections_list{'bad_macro_name_with_underscore'} = '';

$result_sectioning_root{'bad_macro_name_with_underscore'} = '';

$result_headings_list{'bad_macro_name_with_underscore'} = '';

1;
