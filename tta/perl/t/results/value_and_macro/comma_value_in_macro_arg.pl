use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comma_value_in_macro_arg'} = '*document_root C1
 *before_node_section C5
  *@set C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{comma|,}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:comma ,}
  {empty_line:\\n}
  *@macro C3 l3
  |EXTRA
  |macro_name:{macro1}
  |misc_args:A{arg1|arg2}
   *arguments_line C1
    {macro_line: macro1 { arg1 , arg2 }\\n}
   {raw:result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}\\n}
   *@end C1 l5
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
  *paragraph C5
   {result: }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@macro1 C1
    >|INFO
    >|spaces_after_cmd_before_arg:
     >|{spaces_after_cmd_before_arg: }
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:arg1 @value{comma} arg2 }
   *@emph C1 l7:@macro1
    *brace_container C1
     {arg1 , arg2 }
     >SOURCEMARKS
     >value_expansion<start;1><p:5>{,}
      >*@value C1
       >*brace_container C1
        >{comma}
     >value_expansion<end;1><p:6>
   { protected \\ -> \\arg1\\ }
   *@emph C1 l7:@macro1
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container
   {\\n}
';


$result_texis{'comma_value_in_macro_arg'} = '@set comma ,

@macro macro1 { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

result: @emph{arg1 , arg2 } protected \\ -> \\arg1\\ @emph{}
';


$result_texts{'comma_value_in_macro_arg'} = '

result: arg1 , arg2  protected \\ -> \\arg1\\ 
';

$result_errors{'comma_value_in_macro_arg'} = '';

$result_nodes_list{'comma_value_in_macro_arg'} = '';

$result_sections_list{'comma_value_in_macro_arg'} = '';

$result_sectioning_root{'comma_value_in_macro_arg'} = '';

$result_headings_list{'comma_value_in_macro_arg'} = '';

1;
