use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_on_ifset'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C3
   *normal_command@set C1
   |EXTRA
   |misc_args:A{xval|x}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:xval x}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{x|1}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:x 1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l4
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >>SOURCEMARKS
       >>value_expansion<start;1><p:1>{x}
        >>*normal_command@value C1
         >>*brace_container C1
          >>{normal_text:xval}
       >{normal_text:x}
       >>SOURCEMARKS
       >>value_expansion<end;1><p:1>
       >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:XVAL SET\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:9>
    >*normal_command@end C1 l6
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@ifset C5 l8
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:b}
      >{spaces_after_argument:\\n}
    >{raw:@ifset @value{xval}\\n}
    >{raw:INTERNALXV\\n}
    >{raw:@end ifset\\n}
    >*normal_command@end C1 l12
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
';


$result_texis{'value_on_ifset'} = '@set xval x
@set x 1

XVAL SET

';


$result_texts{'value_on_ifset'} = '
XVAL SET

';

$result_errors{'value_on_ifset'} = '';

$result_nodes_list{'value_on_ifset'} = '';

$result_sections_list{'value_on_ifset'} = '';

$result_sectioning_root{'value_on_ifset'} = '';

$result_headings_list{'value_on_ifset'} = '';

1;
