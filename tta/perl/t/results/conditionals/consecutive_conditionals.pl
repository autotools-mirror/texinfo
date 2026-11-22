use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'consecutive_conditionals'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C4
   {normal_text:}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifinfo C3 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:in ifinfo\\n}
     >*normal_command@end C1 l3
     >|EXTRA
     >|text_arg:{ifinfo}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifinfo}
       >{spaces_after_argument:\\n}
   >ignored_conditional_block<2>
    >*normal_command@iftex C3 l4
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:in iftex\\n}
     >*normal_command@end C1 l6
     >|EXTRA
     >|text_arg:{iftex}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:iftex}
       >{spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{b|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:b}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >ignored_conditional_block<3><p:1>
    >*normal_command@ifclear C3 l10
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:b}
       >{spaces_after_argument:\\n}
     >{raw:in ifclear\\n}
     >*normal_command@end C1 l12
     >|EXTRA
     >|text_arg:{ifclear}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifclear}
       >{spaces_after_argument:\\n}
   >ignored_conditional_block<4><p:1>
    >*normal_command@ifset C3 l13
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:in ifset\\n}
     >*normal_command@end C1 l15
     >|EXTRA
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
';


$result_texis{'consecutive_conditionals'} = '
@set b

';


$result_texts{'consecutive_conditionals'} = '

';

$result_errors{'consecutive_conditionals'} = '';

$result_nodes_list{'consecutive_conditionals'} = '';

$result_sections_list{'consecutive_conditionals'} = '';

$result_sectioning_root{'consecutive_conditionals'} = '';

$result_headings_list{'consecutive_conditionals'} = '';

1;
