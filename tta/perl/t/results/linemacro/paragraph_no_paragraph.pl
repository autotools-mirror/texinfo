use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraph_no_paragraph'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content C4
   *normal_command@linemacro C3 l1
   |formal_args:A{a|b|c}
   |macro_name:{mycommand}
    *arguments_line C1
     {macro_line: mycommand {a, b, c}\\n}
    {raw:\\a\\, \\b\\ \\c\\\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@*
   {normal_text: }
   >SOURCEMARKS
   >linemacro_expansion<start;1><p:1>
    >*linemacro_call@mycommand C3
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@anchor{aa}}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:definite}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:and @code{more}}
  *normal_command@anchor C1 l5:@mycommand
  |identifier:{aa}
  |is_target:{1}
   *brace_arg C1
    {normal_text:aa}
  *paragraph C3
   {normal_text:, definite and }
   *normal_command@code C1 l5:@mycommand
   >SOURCEMARKS
   >linemacro_expansion<end;1>
    *brace_container C1
     {normal_text:more}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:Some text a\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;2><p:10>
    >*linemacro_call@mycommand C3
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{bracketed_linemacro_arg:a\\n  protected}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:in}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@var{the\\n call}}
   {normal_text:  protected, in }
   *normal_command@var C1 l9:@mycommand
   >SOURCEMARKS
   >linemacro_expansion<end;2>
    *brace_container C2
     {normal_text:the\\n}
     {normal_text: call}
   {normal_text:\\n}
   {normal_text:and after.\\n}
';


$result_texis{'paragraph_no_paragraph'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@* @anchor{aa}, definite and @code{more}

Some text a
  protected, in @var{the
 call}
and after.
';


$result_texts{'paragraph_no_paragraph'} = '

 , definite and more

Some text a
  protected, in the
 call
and after.
';

$result_errors{'paragraph_no_paragraph'} = '';

$result_nodes_list{'paragraph_no_paragraph'} = '';

$result_sections_list{'paragraph_no_paragraph'} = '';

$result_sectioning_root{'paragraph_no_paragraph'} = '';

$result_headings_list{'paragraph_no_paragraph'} = '';

1;
