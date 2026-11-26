use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_arguments'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@linemacro C3 l1
   |formal_args:A{one|two|three}
   |macro_name:{nospace}
    *arguments_line C1
     {macro_line: nospace{one, two, three}\\n}
    {raw:\\three\\@bullet{}\\two\\@minus{}\\one\\\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C5
   {normal_text:Z}
   >SOURCEMARKS
   >linemacro_expansion<start;1>
    >*linemacro_call@nospace C3
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:X}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:Y}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:Z}
   *normal_command@bullet C1 l5:@nospace
    *brace_container
   {normal_text:Y}
   *normal_command@minus C1 l5:@nospace
    *brace_container
   {normal_text:X\\n}
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:1>
';


$result_texis{'text_arguments'} = '@linemacro nospace{one, two, three}
\\three\\@bullet{}\\two\\@minus{}\\one\\
@end linemacro

Z@bullet{}Y@minus{}X
';


$result_texts{'text_arguments'} = '
Z*Y-X
';

$result_errors{'text_arguments'} = '';

$result_nodes_list{'text_arguments'} = '';

$result_sections_list{'text_arguments'} = '';

$result_sectioning_root{'text_arguments'} = '';

$result_headings_list{'text_arguments'} = '';

1;
