use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_in_macro_body'} = '*document_root C1
 *before_node_section C2
  *preamble C4
   *normal_command@set C1
   |misc_args:A{bodyarg|\\arg\\}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:bodyarg \\arg\\ }
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l3
   |formal_args:A{arg}
   |macro_name:{testvaluebody}
    *arguments_line C1
     {macro_line: testvaluebody { arg }\\n}
    {raw:result: @emph{\\@value{bodyarg}\\  }\\n}
    *normal_command@end C1 l5
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:result: }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@testvaluebody C1
     >*brace_arg C1
      >{macro_call_arg_text:macro_arg1}
   *normal_command@emph C1 l7:@testvaluebody
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container C1
     {normal_text:\\\\arg\\  }
     >SOURCEMARKS
     >value_expansion<start;1><p:1>{\\arg\\}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:bodyarg}
     >value_expansion<end;1><p:6>
   {normal_text:\\n}
';


$result_texis{'value_in_macro_body'} = '@set bodyarg \\arg\\ 

@macro testvaluebody { arg }
result: @emph{\\@value{bodyarg}\\  }
@end macro

result: @emph{\\\\arg\\  }
';


$result_texts{'value_in_macro_body'} = '

result: \\\\arg\\  
';

$result_errors{'value_in_macro_body'} = '* E l7|\\ in @testvaluebody expansion followed `@value{bodyarg}\' instead of parameter name or \\
 \\ in @testvaluebody expansion followed `@value{bodyarg}\' instead of parameter name or \\

';

$result_nodes_list{'value_in_macro_body'} = '';

$result_sections_list{'value_in_macro_body'} = '';

$result_sectioning_root{'value_in_macro_body'} = '';

$result_headings_list{'value_in_macro_body'} = '';

1;
