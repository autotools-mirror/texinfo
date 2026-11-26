use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion_in_set_comment_command'} = '*document_root C1
 *before_node_section C1
  *preamble C4
   *normal_command@macro C3 l1
   |formal_args:A{a}
   |macro_name:{mymac}
    *arguments_line C1
     {macro_line: mymac {a}\\n}
    {raw:@set flag \\a\\ @com\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@mymac C1
     >*brace_arg C1
      >{macro_call_arg_text:v}
   *normal_command@set C1
   |misc_args:A{flag|v}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:flag v }
     *normal_command@comment C1
      *line_arg C3
       {spaces_before_argument: }
       >SOURCEMARKS
       >macro_expansion<end;1>
       {rawline_text:here}
       {spaces_after_argument:\\n}
   {empty_line:\\n}
';


$result_texis{'macro_expansion_in_set_comment_command'} = '@macro mymac {a}
@set flag \\a\\ @com
@end macro

@set flag v @comment here

';


$result_texts{'macro_expansion_in_set_comment_command'} = '

';

$result_errors{'macro_expansion_in_set_comment_command'} = '';

$result_nodes_list{'macro_expansion_in_set_comment_command'} = '';

$result_sections_list{'macro_expansion_in_set_comment_command'} = '';

$result_sectioning_root{'macro_expansion_in_set_comment_command'} = '';

$result_headings_list{'macro_expansion_in_set_comment_command'} = '';

1;
