use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_recursive_macro_call'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble C5
   *normal_command@macro C3 l2
   |formal_args:A{arg}
   |macro_name:{macone}
    *arguments_line C1
     {macro_line: macone {arg}\\n}
    {raw:@mactwo{}\\n}
    *normal_command@end C1 l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l6
   |formal_args:A{arg}
   |macro_name:{mactwo}
    *arguments_line C1
     {macro_line: mactwo{arg}\\n}
    {raw:@macone{}\\n}
    *normal_command@end C1 l8
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mactwo C1
     >*brace_arg
   >macro_expansion<start;2>
    >*macro_call@macone C1
     >*brace_arg
   >macro_expansion<3>
    >*macro_call@mactwo C1
     >*brace_arg
   >macro_expansion<end;2>
   >macro_expansion<end;1>
';


$result_texis{'double_recursive_macro_call'} = '
@macro macone {arg}
@mactwo{}
@end macro

@macro mactwo{arg}
@macone{}
@end macro


';


$result_texts{'double_recursive_macro_call'} = '


';

$result_errors{'double_recursive_macro_call'} = '* E l10:@macone|recursive call of macro mactwo is not allowed; use @rmacro if needed
 recursive call of macro mactwo is not allowed; use @rmacro if needed (possibly involving @macone)

';

$result_nodes_list{'double_recursive_macro_call'} = '';

$result_sections_list{'double_recursive_macro_call'} = '';

$result_sectioning_root{'double_recursive_macro_call'} = '';

$result_headings_list{'double_recursive_macro_call'} = '';

1;
