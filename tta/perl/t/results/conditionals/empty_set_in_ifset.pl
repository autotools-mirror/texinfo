use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_set_in_ifset'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@set C1
   |misc_args:A{a|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l3
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:a is set to:||.\\n}
   >SOURCEMARKS
   >value_expansion<start;1><p:13>{}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:a}
   >value_expansion<end;1><p:13>
   >expanded_conditional_command<end;1><p:16>
    >*normal_command@end C1 l5
    >|text_arg:{ifset}
     >*line_arg C2
      >{spaces_before_argument: }
      >{normal_text:ifset}
';


$result_texis{'empty_set_in_ifset'} = '@set a

a is set to:||.
';


$result_texts{'empty_set_in_ifset'} = '
a is set to:||.
';

$result_errors{'empty_set_in_ifset'} = '';

$result_nodes_list{'empty_set_in_ifset'} = '';

$result_sections_list{'empty_set_in_ifset'} = '';

$result_sectioning_root{'empty_set_in_ifset'} = '';

$result_headings_list{'empty_set_in_ifset'} = '';

1;
