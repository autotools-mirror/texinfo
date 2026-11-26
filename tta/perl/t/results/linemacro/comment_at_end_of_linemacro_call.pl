use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_at_end_of_linemacro_call'} = '*document_root C1
 *before_node_section C3
  *preamble C2
   *normal_command@linemacro C4 l1
   |formal_args:A{a|b}
   |macro_name:{lm}
    *arguments_line C1
     {macro_line: lm {a, b}\\n}
    {raw:c \\a\\ d\\n}
    {raw:\\b\\\\n}
    *normal_command@end C1 l4
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   *normal_command@math C1 l6
    *brace_arg C5
     {spaces_before_argument:\\n}
     {normal_text:c something protected d\\n}
     >SOURCEMARKS
     >linemacro_expansion<start;1>
      >*linemacro_call@lm C2
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{bracketed_linemacro_arg:something protected}
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{macro_call_arg_text:something }
     {normal_text:something}
     {spaces_after_argument: }
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:1>
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment }}
       {spaces_after_argument:\\n}
   {normal_text:\\n}
   {normal_text:after\\n}
  {empty_line:\\n}
';


$result_texis{'comment_at_end_of_linemacro_call'} = '@linemacro lm {a, b}
c \\a\\ d
\\b\\
@end linemacro

@math{
c something protected d
something @c comment }
}
after

';


$result_texts{'comment_at_end_of_linemacro_call'} = '
c something protected d
something
after

';

$result_errors{'comment_at_end_of_linemacro_call'} = '';

$result_nodes_list{'comment_at_end_of_linemacro_call'} = '';

$result_sections_list{'comment_at_end_of_linemacro_call'} = '';

$result_sectioning_root{'comment_at_end_of_linemacro_call'} = '';

$result_headings_list{'comment_at_end_of_linemacro_call'} = '';

1;
