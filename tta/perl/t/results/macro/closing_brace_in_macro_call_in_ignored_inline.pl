use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'closing_brace_in_macro_call_in_ignored_inline'} = '*document_root C1
 *before_node_section C4
  *preamble C2
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{closebrace}
    *arguments_line C1
     {macro_line: closebrace\\n}
    {raw:}\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   *normal_command@inlinefmt C2 l5
   |expand_index:{1}
   |format:{html}
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_arg C1
     {normal_text:html}
    *brace_arg C2
     {spaces_before_argument:\\n}
     {normal_text:truc }
     >SOURCEMARKS
     >macro_expansion<start;1><p:5>
      >*macro_call@closebrace C1
       >*brace_arg
   {normal_text:\\n}
   {normal_text:machin\\n}
  {empty_line:\\n}
  *paragraph C1
   *normal_command@inlinefmt C2 l9
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *elided_brace_command_arg C1
     {raw:\\nbidule @closebrace\\nafter\\n}
';


$result_texis{'closing_brace_in_macro_call_in_ignored_inline'} = '@macro closebrace
}
@end macro

@inlinefmt{html,
truc }
machin

@inlinefmt{tex,
bidule @closebrace
after
}';


$result_texts{'closing_brace_in_macro_call_in_ignored_inline'} = '
truc 
machin

';

$result_errors{'closing_brace_in_macro_call_in_ignored_inline'} = '* E l9|@inlinefmt missing closing brace
 @inlinefmt missing closing brace

';

$result_nodes_list{'closing_brace_in_macro_call_in_ignored_inline'} = '';

$result_sections_list{'closing_brace_in_macro_call_in_ignored_inline'} = '';

$result_sectioning_root{'closing_brace_in_macro_call_in_ignored_inline'} = '';

$result_headings_list{'closing_brace_in_macro_call_in_ignored_inline'} = '';

1;
