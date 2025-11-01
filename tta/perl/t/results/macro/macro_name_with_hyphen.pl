use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_name_with_hyphen'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{macro-one}
  |misc_args:A{arg-one|arg2}
   *arguments_line C1
    {macro_line: macro-one {arg-one, arg2}\\n}
   {raw:This \\arg-one\\ and that \\arg2\\.\\n}
   *@end C1 l3
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
  *paragraph C3
   {This blah and that }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@macro-one C2
     >*brace_arg C1
      >{macro_call_arg_text:blah}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:@code{bli-bli}}
   *@code C1 l5:@macro-one
    *brace_container C1
     {bli-bli}
   {.\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:1>
';


$result_texis{'macro_name_with_hyphen'} = '@macro macro-one {arg-one, arg2}
This \\arg-one\\ and that \\arg2\\.
@end macro

This blah and that @code{bli-bli}.
';


$result_texts{'macro_name_with_hyphen'} = '
This blah and that bli-bli.
';

$result_errors{'macro_name_with_hyphen'} = '';

$result_nodes_list{'macro_name_with_hyphen'} = '';

$result_sections_list{'macro_name_with_hyphen'} = '';

$result_sectioning_root{'macro_name_with_hyphen'} = '';

$result_headings_list{'macro_name_with_hyphen'} = '';

1;
