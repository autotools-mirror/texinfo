use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_call_in_ignored_inlinefmtifelse'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{commafmt}
    *arguments_line C1
     {macro_line: commafmt\\n}
    {raw:before comma, after\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:Toto }
   *@inlinefmtifelse C2 l5
   |EXTRA
   |expand_index:{2}
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *elided_brace_command_arg C1
     {raw: here @commafmt{} finish}
   {normal_text: done.\\n}
';


$result_texis{'macro_call_in_ignored_inlinefmtifelse'} = '@macro commafmt
before comma, after
@end macro

Toto @inlinefmtifelse{tex, here @commafmt{} finish} done.
';


$result_texts{'macro_call_in_ignored_inlinefmtifelse'} = '
Toto  done.
';

$result_errors{'macro_call_in_ignored_inlinefmtifelse'} = '';

$result_nodes_list{'macro_call_in_ignored_inlinefmtifelse'} = '';

$result_sections_list{'macro_call_in_ignored_inlinefmtifelse'} = '';

$result_sectioning_root{'macro_call_in_ignored_inlinefmtifelse'} = '';

$result_headings_list{'macro_call_in_ignored_inlinefmtifelse'} = '';

1;
