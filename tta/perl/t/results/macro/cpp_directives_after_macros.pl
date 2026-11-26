use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cpp_directives_after_macros'} = '*document_root C1
 *before_node_section C9
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C6
   *normal_command@macro C3 cpp_directives_after_macros.texi:l2
   |formal_args:A{}
   |macro_name:{noargsspaces}
    *arguments_line C1
     {macro_line: noargsspaces\\n}
    {raw:  \\n}
    *normal_command@end C1 cpp_directives_after_macros.texi:l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 cpp_directives_after_macros.texi:l6
   |formal_args:A{}
   |macro_name:{emptyexpansion}
    *arguments_line C1
     {macro_line: emptyexpansion\\n}
    {raw:\\n}
    *normal_command@end C1 cpp_directives_after_macros.texi:l8
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >line_directive<1><p:1>{  #line 98 "a_test_after_spaces"\\n}
   {empty_line:\\n}
   {spaces_before_paragraph:  }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@noargsspaces C1
     >*brace_arg
   >macro_expansion<end;1><p:2>
  *paragraph C1
   {normal_text:#line 46 "a_file_after_macro_call"\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:#line 75 "a_file_after_macro_call_no_spaces"\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@emptyexpansion C1
     >*brace_arg
   >macro_expansion<end;2>
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'cpp_directives_after_macros'} = '
@macro noargsspaces
  
@end macro

@macro emptyexpansion

@end macro


  #line 46 "a_file_after_macro_call"



#line 75 "a_file_after_macro_call_no_spaces"


';


$result_texts{'cpp_directives_after_macros'} = '


#line 46 "a_file_after_macro_call"



#line 75 "a_file_after_macro_call_no_spaces"


';

$result_errors{'cpp_directives_after_macros'} = '* E a_test_after_spaces:l102|unknown command `unknown1\'
 unknown command `unknown1\'

* E a_test_after_spaces:l106|unknown command `unknown2\'
 unknown command `unknown2\'

';

$result_nodes_list{'cpp_directives_after_macros'} = '';

$result_sections_list{'cpp_directives_after_macros'} = '';

$result_sectioning_root{'cpp_directives_after_macros'} = '';

$result_headings_list{'cpp_directives_after_macros'} = '';

1;
