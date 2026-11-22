use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_macros'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@macro C8 l1
   |EXTRA
   |formal_args:A{arg|ex}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc   { arg,  ex}\\n}
    {raw:in macro \\arg\\\\n}
    {raw:@macro othermacro \\n}
    {raw:other macro\\n}
    {raw:@end macro\\n}
    {raw:@macro\\n}
    {raw:@end macro\\n}
    *normal_command@end C1 l8
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
';


$result_texis{'nested_macros'} = '@macro truc   { arg,  ex}
in macro \\arg\\
@macro othermacro 
other macro
@end macro
@macro
@end macro
@end macro
';


$result_texts{'nested_macros'} = '';

$result_errors{'nested_macros'} = '';

$result_nodes_list{'nested_macros'} = '';

$result_sections_list{'nested_macros'} = '';

$result_sectioning_root{'nested_macros'} = '';

$result_headings_list{'nested_macros'} = '';


$result_converted{'plaintext'}->{'nested_macros'} = '';


$result_converted{'xml'}->{'nested_macros'} = '<macro name="truc" line=" truc   { arg,  ex}" endspaces=" "><formalarg>arg</formalarg><formalarg>ex</formalarg>
in macro \\arg\\
@macro othermacro 
other macro
@end macro
@macro
@end macro
</macro>
';

1;
