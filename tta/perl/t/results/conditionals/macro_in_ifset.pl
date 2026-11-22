use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_ifset'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *normal_command@macro C3 l2
   |formal_args:A{}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc {}\\n}
    {raw:truc\\n}
    *normal_command@end C1 l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifset C6 l6
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:@unmacro truc\\n}
     >{raw:@macro truc{}\\n}
     >{raw:in ifset\\n}
     >{raw:@end macro\\n}
     >*normal_command@end C1 l11
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:truc\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@truc C1
     >*brace_arg
   >macro_expansion<end;1><p:4>
';


$result_texis{'macro_in_ifset'} = '
@macro truc {}
truc
@end macro


truc
';


$result_texts{'macro_in_ifset'} = '

truc
';

$result_errors{'macro_in_ifset'} = '';

$result_nodes_list{'macro_in_ifset'} = '';

$result_sections_list{'macro_in_ifset'} = '';

$result_sectioning_root{'macro_in_ifset'} = '';

$result_headings_list{'macro_in_ifset'} = '';

1;
