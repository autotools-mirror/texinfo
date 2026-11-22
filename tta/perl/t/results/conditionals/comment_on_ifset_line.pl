use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_on_ifset_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@set C1
   |misc_args:A{x|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:x}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l3
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:x}
       >*normal_command@c C1
        >*line_arg C2
         >{rawline_text:}
         >{spaces_after_argument:\\n}
  *paragraph C6
   {normal_text:Y1\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:3>
    >*normal_command@end C1 l5
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;2><p:3>
    >*normal_command@ifset C1 l6
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:x}
       >*normal_command@c C1
        >*line_arg C3
         >{spaces_before_argument: }
         >{rawline_text:comm}
         >{spaces_after_argument:\\n}
   {normal_text:Y2\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:3>
    >*normal_command@end C1 l8
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;3><p:3>
    >*normal_command@ifset C1 l9
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:x}
       >*normal_command@c C1
        >*line_arg C2
         >{rawline_text:@ggg}
         >{spaces_after_argument:\\n}
   {normal_text:Y3\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:3>
    >*normal_command@end C1 l11
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;4><p:3>
    >*normal_command@ifset C1 l12
     >*arguments_line C1
      >*block_line_arg C4
       >{spaces_before_argument: }
       >{normal_text:x}
       >{spaces_after_argument: }
       >*normal_command@c C1
        >*line_arg C2
         >{rawline_text:}
         >{spaces_after_argument:\\n}
   {normal_text:Y4\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:3>
    >*normal_command@end C1 l14
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;5><p:3>
    >*normal_command@ifset C1 l15
     >*arguments_line C1
      >*block_line_arg C4
       >{spaces_before_argument: }
       >{normal_text:x}
       >{spaces_after_argument: }
       >*normal_command@c C1
        >*line_arg C3
         >{spaces_before_argument: }
         >{rawline_text:comm}
         >{spaces_after_argument:\\n}
   {normal_text:Y5\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;5><p:3>
    >*normal_command@end C1 l17
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;6><p:3>
    >*normal_command@ifset C1 l18
     >*arguments_line C1
      >*block_line_arg C4
       >{spaces_before_argument: }
       >{normal_text:x}
       >{spaces_after_argument: }
       >*normal_command@c C1
        >*line_arg C2
         >{rawline_text:@ggg}
         >{spaces_after_argument:\\n}
   {normal_text:Y6\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;6><p:3>
    >*normal_command@end C1 l20
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
';


$result_texis{'comment_on_ifset_line'} = '@set x

Y1
Y2
Y3
Y4
Y5
Y6
';


$result_texts{'comment_on_ifset_line'} = '
Y1
Y2
Y3
Y4
Y5
Y6
';

$result_errors{'comment_on_ifset_line'} = '';

$result_nodes_list{'comment_on_ifset_line'} = '';

$result_sections_list{'comment_on_ifset_line'} = '';

$result_sectioning_root{'comment_on_ifset_line'} = '';

$result_headings_list{'comment_on_ifset_line'} = '';

1;
