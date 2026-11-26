use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_ifset_in_format'} = '*document_root C1
 *before_node_section C7
  *before_beginning C1
   {empty_line:\\n}
  *preamble C3
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
   *normal_command@ignore C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:@end ifset\\n}
    *normal_command@end C1 l7
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:text\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:5>
    >*normal_command@end C1 l9
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*normal_command@ifset C1 l11
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:notset}
      >{spaces_after_argument:\\n}
  *normal_command@verbatim C3 l12
  >SOURCEMARKS
  >expanded_conditional_command<end;2>
   >*normal_command@end C1 l15
   >|text_arg:{ifset}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifset}
     >{spaces_after_argument:\\n}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:@end ifset\\n}
   *normal_command@end C1 l14
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*normal_command@ifset C1 l17
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:notset}
      >{spaces_after_argument:\\n}
  *paragraph C2
   *normal_command@verb C1 l18
    *brace_container C4
     {verb_delimiter:%}
     {raw:\\n}
     {raw:@end ifset\\n}
     {verb_delimiter:%}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:1>
    >*normal_command@end C1 l21
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
';


$result_texis{'end_ifset_in_format'} = '
@set notset

@ignore
@end ifset
@end ignore
text

@verbatim
@end ifset
@end verbatim

@verb{%
@end ifset
%}
';


$result_texts{'end_ifset_in_format'} = '
text

@end ifset


@end ifset

';

$result_errors{'end_ifset_in_format'} = '';

$result_nodes_list{'end_ifset_in_format'} = '';

$result_sections_list{'end_ifset_in_format'} = '';

$result_sectioning_root{'end_ifset_in_format'} = '';

$result_headings_list{'end_ifset_in_format'} = '';

1;
