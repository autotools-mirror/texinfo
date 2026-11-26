use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_ifset_in_ifset_set'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@set C1
   |misc_args:A{notset|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:notset}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l4
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:notset}
       >{spaces_after_argument:\\n}
  *normal_command@verbatim C3 l5
  >SOURCEMARKS
  >expanded_conditional_command<end;1>
   >*normal_command@end C1 l8
   >|text_arg:{ifset}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifset}
     >{spaces_after_argument:\\n}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:@ifset\\n}
   *normal_command@end C1 l7
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_ifset_in_ifset_set'} = '
@set notset

@verbatim
@ifset
@end verbatim
';


$result_texts{'empty_ifset_in_ifset_set'} = '
@ifset
';

$result_errors{'empty_ifset_in_ifset_set'} = '';

$result_nodes_list{'empty_ifset_in_ifset_set'} = '';

$result_sections_list{'empty_ifset_in_ifset_set'} = '';

$result_sectioning_root{'empty_ifset_in_ifset_set'} = '';

$result_headings_list{'empty_ifset_in_ifset_set'} = '';

1;
