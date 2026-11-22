use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_in_one_argument_linemacro_call'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C2
   *normal_command@linemacro C3 l1
   |formal_args:A{a}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a}\\n}
    {raw:c \\a\\ d\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:c }
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@lm C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@code{something @comment in} out}
   *normal_command@code C1 l5:@lm
    *brace_container C2
     {normal_text:something }
     *normal_command@comment C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:in} out d}
       >SOURCEMARKS
       >linemacro_expansion<end;1><p:9>
       {spaces_after_argument:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:next\\n}
';


$result_texis{'comment_in_one_argument_linemacro_call'} = '@linemacro lm {a}
c \\a\\ d
@end linemacro

c @code{something @comment in} out d
}

next
';


$result_texts{'comment_in_one_argument_linemacro_call'} = '
c something 

next
';

$result_errors{'comment_in_one_argument_linemacro_call'} = '';

$result_nodes_list{'comment_in_one_argument_linemacro_call'} = '';

$result_sections_list{'comment_in_one_argument_linemacro_call'} = '';

$result_sectioning_root{'comment_in_one_argument_linemacro_call'} = '';

$result_headings_list{'comment_in_one_argument_linemacro_call'} = '';

1;
