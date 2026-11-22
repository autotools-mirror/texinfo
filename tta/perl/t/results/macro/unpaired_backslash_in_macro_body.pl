use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unpaired_backslash_in_macro_body'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C4 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro {arg}\\n}
    {raw:In macro \\not arg\\n}
    {raw:not paired\\n}
    *@end C1 l4
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:In macro not arg\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C1
     >*brace_arg
   {normal_text:not paired\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:10>
';


$result_texis{'unpaired_backslash_in_macro_body'} = '@macro mymacro {arg}
In macro \\not arg
not paired
@end macro

In macro not arg
not paired
';


$result_texts{'unpaired_backslash_in_macro_body'} = '
In macro not arg
not paired
';

$result_errors{'unpaired_backslash_in_macro_body'} = '';

$result_nodes_list{'unpaired_backslash_in_macro_body'} = '';

$result_sections_list{'unpaired_backslash_in_macro_body'} = '';

$result_sectioning_root{'unpaired_backslash_in_macro_body'} = '';

$result_headings_list{'unpaired_backslash_in_macro_body'} = '';

1;
