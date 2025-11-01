use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cpp_directives_after_macros'} = '*document_root C1
 *before_node_section C9
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C6
   *@macro C3 cpp_directives_after_macros.texi:l2
   |EXTRA
   |macro_name:{noargsspaces}
   |misc_args:A{}
    *arguments_line C1
     {macro_line: noargsspaces\\n}
    {raw:  \\n}
    *@end C1 cpp_directives_after_macros.texi:l4
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{macro}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {macro}
   {empty_line:\\n}
   *@macro C3 cpp_directives_after_macros.texi:l6
   |EXTRA
   |macro_name:{emptyexpansion}
   |misc_args:A{}
    *arguments_line C1
     {macro_line: emptyexpansion\\n}
    {raw:\\n}
    *@end C1 cpp_directives_after_macros.texi:l8
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{macro}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {macro}
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
   {#line 46 "a_file_after_macro_call"\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   {#line 75 "a_file_after_macro_call_no_spaces"\\n}
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
