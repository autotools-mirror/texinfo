use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protect_hashchar_at_line_beginning_source_mark'} = '*document_root C1
 *before_node_section C17
  *before_beginning C1
   {empty_line:\\n}
  *preamble C2
   *normal_command@macro C3 cpp_directives_line_value_macro.texi:l2
   |formal_args:A{}
   |macro_name:{vvv}
    *arguments_line C1
     {macro_line: vvv {}\\n}
    {raw:#line 30 "toto"\\n}
    *normal_command@end C1 cpp_directives_line_value_macro.texi:l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@vvv C1
     >*brace_arg
   *normal_command@hashchar C1
    *brace_container
   {normal_text:line 30 "toto"\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:14>
  {empty_line:\\n}
  *normal_command@macro C3 cpp_directives_line_value_macro.texi:l8
  |formal_args:A{}
  |macro_name:{machash}
   *arguments_line C1
    {macro_line: machash {}\\n}
   {raw:#\\n}
   *normal_command@end C1 cpp_directives_line_value_macro.texi:l10
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@machash C1
     >*brace_arg
   *normal_command@hashchar C1
   >SOURCEMARKS
   >macro_expansion<end;2>
    *brace_container
   {normal_text: 130\\n}
  {empty_line:\\n}
  *normal_command@macro C3 cpp_directives_line_value_macro.texi:l14
  |formal_args:A{arg}
  |macro_name:{numberfileflag}
   *arguments_line C1
    {macro_line: numberfileflag {arg}\\n}
   {raw:\\arg\\ "titi" 3\\arg\\\\n}
   *normal_command@end C1 cpp_directives_line_value_macro.texi:l16
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@hashchar C1
    *brace_container
   {normal_text: 900 "titi" 3900\\n}
   >SOURCEMARKS
   >macro_expansion<start;3><p:1>
    >*macro_call@numberfileflag C1
     >*brace_arg C1
      >{macro_call_arg_text:900}
   >macro_expansion<end;3><p:16>
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{hash|#}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:hash #}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:}
   >SOURCEMARKS
   >value_expansion<start;1>{#}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:hash}
   *normal_command@hashchar C1
   >SOURCEMARKS
   >value_expansion<end;1>
    *brace_container
   {normal_text:line 71 "example.c"\\n}
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'protect_hashchar_at_line_beginning_source_mark'} = '
@macro vvv {}
#line 30 "toto"
@end macro

@hashchar{}line 30 "toto"

@macro machash {}
#
@end macro

@hashchar{} 130

@macro numberfileflag {arg}
\\arg\\ "titi" 3\\arg\\
@end macro

@hashchar{} 900 "titi" 3900

@set hash #

@hashchar{}line 71 "example.c"


';


$result_texts{'protect_hashchar_at_line_beginning_source_mark'} = '
#line 30 "toto"


# 130


# 900 "titi" 3900


#line 71 "example.c"


';

$result_errors{'protect_hashchar_at_line_beginning_source_mark'} = '* E cpp_directives_line_value_macro.texi:l24|unknown command `unknown\'
 unknown command `unknown\'

* W cpp_directives_line_value_macro.texi:l2|could not protect hash character in @macro
 warning: could not protect hash character in @macro

';

$result_nodes_list{'protect_hashchar_at_line_beginning_source_mark'} = '';

$result_sections_list{'protect_hashchar_at_line_beginning_source_mark'} = '';

$result_sectioning_root{'protect_hashchar_at_line_beginning_source_mark'} = '';

$result_headings_list{'protect_hashchar_at_line_beginning_source_mark'} = '';

1;
