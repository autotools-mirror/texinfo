use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{endcallinignoredinlineelse}
    *arguments_line C1
     {macro_line: endcallinignoredinlineelse\\n}
    {raw:own, ignored\\n}
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
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:before shown}
     >SOURCEMARKS
     >macro_expansion<start;1><p:9>
      >*macro_call@endcallinignoredinlineelse C1
       >*brace_arg
    *elided_brace_command_arg C1
     {raw: ignored after}
     >SOURCEMARKS
     >macro_expansion<end;1><p:8>
   {normal_text: done.\\n}
';


$result_texis{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '@macro endcallinignoredinlineelse
own, ignored
@end macro

Toto @inlinefmtifelse{html, before shown, ignored after} done.
';


$result_texts{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '
Toto before shown done.
';

$result_errors{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_nodes_list{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_sections_list{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_sectioning_root{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

$result_headings_list{'macro_end_call_in_ignored_inlinefmtifelse_else'} = '';

1;
