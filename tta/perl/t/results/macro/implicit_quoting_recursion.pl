use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'implicit_quoting_recursion'} = '*document_root C1
 *before_node_section C3
  *@rmacro C3 l1
  |EXTRA
  |macro_name:{cat}
  |misc_args:A{a|b}
   *arguments_line C1
    {macro_line: cat{a,b}\\n}
   {raw:\\a\\\\b\\\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{rmacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rmacro}
  {empty_line:\\n}
  *paragraph C1
   {natopocotuototam\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*rmacro_call@cat C2
     >*brace_arg C1
      >{macro_call_arg_text:@cat{@cat{@cat{@cat{@cat{na, to}, po}, co}, tu}, oto}}
     >*brace_arg C1
      >{macro_call_arg_text:tam}
   >macro_expansion<start;2>
    >*rmacro_call@cat C2
     >*brace_arg C1
      >{macro_call_arg_text:@cat{@cat{@cat{@cat{na, to}, po}, co}, tu}}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:oto}
   >macro_expansion<start;3>
    >*rmacro_call@cat C2
     >*brace_arg C1
      >{macro_call_arg_text:@cat{@cat{@cat{na, to}, po}, co}}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:tu}
   >macro_expansion<start;4>
    >*rmacro_call@cat C2
     >*brace_arg C1
      >{macro_call_arg_text:@cat{@cat{na, to}, po}}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:co}
   >macro_expansion<start;5>
    >*rmacro_call@cat C2
     >*brace_arg C1
      >{macro_call_arg_text:@cat{na, to}}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:po}
   >macro_expansion<start;6>
    >*rmacro_call@cat C2
     >*brace_arg C1
      >{macro_call_arg_text:na}
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:to}
   >macro_expansion<end;6><p:4>
   >macro_expansion<end;5><p:6>
   >macro_expansion<end;4><p:8>
   >macro_expansion<end;3><p:10>
   >macro_expansion<end;2><p:13>
   >macro_expansion<end;1><p:16>
';


$result_texis{'implicit_quoting_recursion'} = '@rmacro cat{a,b}
\\a\\\\b\\
@end rmacro

natopocotuototam
';


$result_texts{'implicit_quoting_recursion'} = '
natopocotuototam
';

$result_errors{'implicit_quoting_recursion'} = '';

$result_nodes_list{'implicit_quoting_recursion'} = '';

$result_sections_list{'implicit_quoting_recursion'} = '';

$result_sectioning_root{'implicit_quoting_recursion'} = '';

$result_headings_list{'implicit_quoting_recursion'} = '';

1;
