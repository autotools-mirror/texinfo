use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protect_in_body_one_arg'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{macroone}
  |misc_args:A{arg1|arg2}
   *arguments_line C1
    {macro_line: macroone { arg1 , arg2 }\\n}
   {raw:result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}\\n}
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
  *paragraph C5
   {result: }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@macroone C1
    >|INFO
    >|spaces_after_cmd_before_arg:
     >|{spaces_after_cmd_before_arg: }
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:@samp{f\\irst arg}}
   *@emph C1 l5:@macroone
    *brace_container C1
     *@samp C1 l5:@macroone
      *brace_container C1
       {f\\irst arg}
   { protected \\ -> \\arg1\\ }
   *@emph C1 l5:@macroone
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container
   {\\n}
';


$result_texis{'protect_in_body_one_arg'} = '@macro macroone { arg1 , arg2 }
result: @emph{\\arg1\\} protected \\\\ -> \\\\arg1\\\\ @emph{\\arg2\\}
@end macro

result: @emph{@samp{f\\irst arg}} protected \\ -> \\arg1\\ @emph{}
';


$result_texts{'protect_in_body_one_arg'} = '
result: f\\irst arg protected \\ -> \\arg1\\ 
';

$result_errors{'protect_in_body_one_arg'} = '';

$result_nodes_list{'protect_in_body_one_arg'} = '';

$result_sections_list{'protect_in_body_one_arg'} = '';

$result_sectioning_root{'protect_in_body_one_arg'} = '';

$result_headings_list{'protect_in_body_one_arg'} = '';

1;
