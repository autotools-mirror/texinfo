use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_call_in_macro'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@macro C3 l1
   |formal_args:A{arg}
   |macro_name:{anorecurse}
    *arguments_line C1
     {macro_line: anorecurse{arg}\\n}
    {raw:@anorecurse{arg}\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@anorecurse C1
     >*brace_arg
   >macro_expansion<2>
    >*macro_call@anorecurse C1
     >*brace_arg C1
      >{macro_call_arg_text:arg}
   >macro_expansion<end;1>
';


$result_texis{'recursive_call_in_macro'} = '@macro anorecurse{arg}
@anorecurse{arg}
@end macro


';


$result_texts{'recursive_call_in_macro'} = '

';

$result_errors{'recursive_call_in_macro'} = '* E l5:@anorecurse|recursive call of macro anorecurse is not allowed; use @rmacro if needed
 recursive call of macro anorecurse is not allowed; use @rmacro if needed (possibly involving @anorecurse)

';

$result_nodes_list{'recursive_call_in_macro'} = '';

$result_sections_list{'recursive_call_in_macro'} = '';

$result_sectioning_root{'recursive_call_in_macro'} = '';

$result_headings_list{'recursive_call_in_macro'} = '';

1;
