use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_for_ignored_line_command'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{pagemacro}
    *arguments_line C1
     {macro_line: pagemacro\\n}
    {raw:@page\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@pagemacro C1
     >*brace_arg
  *normal_command@page C1
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<end;1>
    {rawline_text:on the line}
    {spaces_after_argument:\\n}
';


$result_texis{'macro_for_ignored_line_command'} = '@macro pagemacro
@page
@end macro

@page on the line
';


$result_texts{'macro_for_ignored_line_command'} = '

';

$result_errors{'macro_for_ignored_line_command'} = '* W l5:@pagemacro|remaining argument on @page line: on the line
 warning: remaining argument on @page line: on the line (possibly involving @pagemacro)

';

$result_nodes_list{'macro_for_ignored_line_command'} = '';

$result_sections_list{'macro_for_ignored_line_command'} = '';

$result_sectioning_root{'macro_for_ignored_line_command'} = '';

$result_headings_list{'macro_for_ignored_line_command'} = '';

1;
