use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion_end_in_ignored_ifset_content'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@macro C4 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{beginifsetcontent}
    *arguments_line C1
     {macro_line: beginifsetcontent\\n}
    {raw:@ifset a\\n}
    {raw:going \\n}
    *normal_command@end C1 l4
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@beginifsetcontent C1
     >*brace_arg
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifset C4 l6:@beginifsetcontent
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:going }
     >>SOURCEMARKS
     >>macro_expansion<end;1><p:6>
     >{raw: into the code\\n}
     >*normal_command@end C1 l7
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'macro_expansion_end_in_ignored_ifset_content'} = '@macro beginifsetcontent
@ifset a
going 
@end macro

';


$result_texts{'macro_expansion_end_in_ignored_ifset_content'} = '
';

$result_errors{'macro_expansion_end_in_ignored_ifset_content'} = '';

$result_nodes_list{'macro_expansion_end_in_ignored_ifset_content'} = '';

$result_sections_list{'macro_expansion_end_in_ignored_ifset_content'} = '';

$result_sectioning_root{'macro_expansion_end_in_ignored_ifset_content'} = '';

$result_headings_list{'macro_expansion_end_in_ignored_ifset_content'} = '';

1;
