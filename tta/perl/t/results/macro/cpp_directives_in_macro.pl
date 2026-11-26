use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cpp_directives_in_macro'} = '*document_root C1
 *before_node_section C9
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@macro C3 cpp_directives_in_macro.texi:l2
   |formal_args:A{out}
   |macro_name:{simplemacro}
    *arguments_line C1
     {macro_line: simplemacro{out}\\n}
    {raw:\\out\\\\n}
    *normal_command@end C1 cpp_directives_in_macro.texi:l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:#line 100 "in_arg_file"\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@simplemacro C1
     >*brace_arg C2
      >{spaces_before_argument:\\n}
      >{macro_call_arg_text:#line 100 "in_arg_file"\\n\\n@unknownin\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<end;1><p:1>
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'cpp_directives_in_macro'} = '
@macro simplemacro{out}
\\out\\
@end macro

#line 100 "in_arg_file"






';


$result_texts{'cpp_directives_in_macro'} = '
#line 100 "in_arg_file"






';

$result_errors{'cpp_directives_in_macro'} = '* E cpp_directives_in_macro.texi:l10:@simplemacro|unknown command `unknownin\'
 unknown command `unknownin\' (possibly involving @simplemacro)

* E cpp_directives_in_macro.texi:l12|unknown command `unknownout\'
 unknown command `unknownout\'

';

$result_nodes_list{'cpp_directives_in_macro'} = '';

$result_sections_list{'cpp_directives_in_macro'} = '';

$result_sectioning_root{'cpp_directives_in_macro'} = '';

$result_headings_list{'cpp_directives_in_macro'} = '';

1;
