use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_call_in_inlinefmtifelse_format'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{inlinefirstarg}
    *arguments_line C1
     {macro_line: inlinefirstarg\\n}
    {raw:ex, before, after\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:Toto }
   *normal_command@inlinefmtifelse C3 l5
   |expand_index:{2}
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
     >SOURCEMARKS
     >macro_expansion<start;1><p:1>
      >*macro_call@inlinefirstarg C1
       >*brace_arg
    *elided_brace_command_arg C1
     {raw: before}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:after}
     >SOURCEMARKS
     >macro_expansion<end;1><p:5>
   {normal_text: done.\\n}
';


$result_texis{'macro_call_in_inlinefmtifelse_format'} = '@macro inlinefirstarg
ex, before, after
@end macro

Toto @inlinefmtifelse{tex, before, after} done.
';


$result_texts{'macro_call_in_inlinefmtifelse_format'} = '
Toto after done.
';

$result_errors{'macro_call_in_inlinefmtifelse_format'} = '';

$result_nodes_list{'macro_call_in_inlinefmtifelse_format'} = '';

$result_sections_list{'macro_call_in_inlinefmtifelse_format'} = '';

$result_sectioning_root{'macro_call_in_inlinefmtifelse_format'} = '';

$result_headings_list{'macro_call_in_inlinefmtifelse_format'} = '';

1;
