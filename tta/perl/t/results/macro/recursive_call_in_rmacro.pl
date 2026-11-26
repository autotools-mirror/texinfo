use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_call_in_rmacro'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C4
   *normal_command@rmacro C3 l2
   |formal_args:A{}
   |macro_name:{rec}
    *arguments_line C1
     {macro_line: rec\\n}
    {raw:@rec{}\\n}
    *normal_command@end C1 l4
    |text_arg:{rmacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:rmacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;2>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;3>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;4>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;5>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;6>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;7>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;8>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;9>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;10>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;11>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;12>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;13>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;14>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;15>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;16>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;17>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;18>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;19>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;20>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;21>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;22>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;23>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;24>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;25>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;26>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;27>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;28>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;29>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;30>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;31>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;32>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;33>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;34>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;35>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;36>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;37>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;38>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;39>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;40>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;41>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;42>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;43>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;44>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;45>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;46>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;47>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;48>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;49>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;50>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;51>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;52>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;53>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;54>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;55>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;56>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;57>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;58>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;59>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;60>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;61>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;62>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;63>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;64>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;65>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;66>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;67>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;68>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;69>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;70>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;71>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;72>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;73>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;74>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;75>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;76>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;77>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;78>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;79>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;80>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;81>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;82>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;83>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;84>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;85>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;86>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;87>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;88>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;89>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;90>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;91>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;92>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;93>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;94>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;95>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;96>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;97>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;98>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;99>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<start;100>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<101>
    >*rmacro_call@rec C1
     >*brace_arg
   >macro_expansion<end;100>
   >macro_expansion<end;99>
   >macro_expansion<end;98>
   >macro_expansion<end;97>
   >macro_expansion<end;96>
   >macro_expansion<end;95>
   >macro_expansion<end;94>
   >macro_expansion<end;93>
   >macro_expansion<end;92>
   >macro_expansion<end;91>
   >macro_expansion<end;90>
   >macro_expansion<end;89>
   >macro_expansion<end;88>
   >macro_expansion<end;87>
   >macro_expansion<end;86>
   >macro_expansion<end;85>
   >macro_expansion<end;84>
   >macro_expansion<end;83>
   >macro_expansion<end;82>
   >macro_expansion<end;81>
   >macro_expansion<end;80>
   >macro_expansion<end;79>
   >macro_expansion<end;78>
   >macro_expansion<end;77>
   >macro_expansion<end;76>
   >macro_expansion<end;75>
   >macro_expansion<end;74>
   >macro_expansion<end;73>
   >macro_expansion<end;72>
   >macro_expansion<end;71>
   >macro_expansion<end;70>
   >macro_expansion<end;69>
   >macro_expansion<end;68>
   >macro_expansion<end;67>
   >macro_expansion<end;66>
   >macro_expansion<end;65>
   >macro_expansion<end;64>
   >macro_expansion<end;63>
   >macro_expansion<end;62>
   >macro_expansion<end;61>
   >macro_expansion<end;60>
   >macro_expansion<end;59>
   >macro_expansion<end;58>
   >macro_expansion<end;57>
   >macro_expansion<end;56>
   >macro_expansion<end;55>
   >macro_expansion<end;54>
   >macro_expansion<end;53>
   >macro_expansion<end;52>
   >macro_expansion<end;51>
   >macro_expansion<end;50>
   >macro_expansion<end;49>
   >macro_expansion<end;48>
   >macro_expansion<end;47>
   >macro_expansion<end;46>
   >macro_expansion<end;45>
   >macro_expansion<end;44>
   >macro_expansion<end;43>
   >macro_expansion<end;42>
   >macro_expansion<end;41>
   >macro_expansion<end;40>
   >macro_expansion<end;39>
   >macro_expansion<end;38>
   >macro_expansion<end;37>
   >macro_expansion<end;36>
   >macro_expansion<end;35>
   >macro_expansion<end;34>
   >macro_expansion<end;33>
   >macro_expansion<end;32>
   >macro_expansion<end;31>
   >macro_expansion<end;30>
   >macro_expansion<end;29>
   >macro_expansion<end;28>
   >macro_expansion<end;27>
   >macro_expansion<end;26>
   >macro_expansion<end;25>
   >macro_expansion<end;24>
   >macro_expansion<end;23>
   >macro_expansion<end;22>
   >macro_expansion<end;21>
   >macro_expansion<end;20>
   >macro_expansion<end;19>
   >macro_expansion<end;18>
   >macro_expansion<end;17>
   >macro_expansion<end;16>
   >macro_expansion<end;15>
   >macro_expansion<end;14>
   >macro_expansion<end;13>
   >macro_expansion<end;12>
   >macro_expansion<end;11>
   >macro_expansion<end;10>
   >macro_expansion<end;9>
   >macro_expansion<end;8>
   >macro_expansion<end;7>
   >macro_expansion<end;6>
   >macro_expansion<end;5>
   >macro_expansion<end;4>
   >macro_expansion<end;3>
   >macro_expansion<end;2>
   >macro_expansion<end;1>
   {empty_line:\\n}
';


$result_texis{'recursive_call_in_rmacro'} = '
@rmacro rec
@rec{}
@end rmacro



';


$result_texts{'recursive_call_in_rmacro'} = '


';

$result_errors{'recursive_call_in_rmacro'} = '* W l6:@rec|macro call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value 100)
 warning: macro call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value 100) (possibly involving @rec)

';

$result_nodes_list{'recursive_call_in_rmacro'} = '';

$result_sections_list{'recursive_call_in_rmacro'} = '';

$result_sectioning_root{'recursive_call_in_rmacro'} = '';

$result_headings_list{'recursive_call_in_rmacro'} = '';

1;
