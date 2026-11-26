use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ifset_in_command'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *paragraph C2
   *normal_command@file C1 l2
    *brace_container C2
     {normal_text:\\n}
     >SOURCEMARKS
     >ignored_conditional_block<1><p:1>
      >*normal_command@ifset C3 l3
       >*arguments_line C1
        >*block_line_arg C3
         >{spaces_before_argument: }
         >{normal_text:x}
         >{spaces_after_argument:\\n}
       >{raw:xset\\n}
       >*normal_command@end C1 l5
       >|text_arg:{ifset}
        >*line_arg C3
         >{spaces_before_argument: }
         >{normal_text:ifset}
         >{spaces_after_argument:\\n}
     >expanded_conditional_command<start;1><p:1>
      >*normal_command@ifclear C1 l6
       >*arguments_line C1
        >*block_line_arg C3
         >{spaces_before_argument: }
         >{normal_text:x}
         >{spaces_after_argument:\\n}
     {normal_text:xclear\\n}
     >SOURCEMARKS
     >expanded_conditional_command<end;1><p:7>
      >*normal_command@end C1 l8
      >|text_arg:{ifclear}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:ifclear}
        >{spaces_after_argument:\\n}
   {normal_text:\\n}
';


$result_texis{'ifset_in_command'} = '
@file{
xclear
}
';


$result_texts{'ifset_in_command'} = '
xclear

';

$result_errors{'ifset_in_command'} = '';

$result_nodes_list{'ifset_in_command'} = '';

$result_sections_list{'ifset_in_command'} = '';

$result_sectioning_root{'ifset_in_command'} = '';

$result_headings_list{'ifset_in_command'} = '';

1;
