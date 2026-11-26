use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_set_in_ifclear'} = '*document_root C1
 *before_node_section C1
  *preamble C2
   *normal_command@set C1
   |misc_args:A{a|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifclear C3 l3
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
     >{raw:a is set to:|@value{a}|.\\n}
     >*normal_command@end C1 l5
     >|text_arg:{ifclear}
      >*line_arg C2
       >{spaces_before_argument: }
       >{normal_text:ifclear}
';


$result_texis{'empty_set_in_ifclear'} = '@set a

';


$result_texts{'empty_set_in_ifclear'} = '
';

$result_errors{'empty_set_in_ifclear'} = '';

$result_nodes_list{'empty_set_in_ifclear'} = '';

$result_sections_list{'empty_set_in_ifclear'} = '';

$result_sectioning_root{'empty_set_in_ifclear'} = '';

$result_headings_list{'empty_set_in_ifclear'} = '';

1;
