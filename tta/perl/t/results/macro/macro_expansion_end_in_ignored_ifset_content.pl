use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_expansion_end_in_ignored_ifset_content'} = '*document_root C1
 *before_node_section C2
  *@macro C4 l1
  |EXTRA
  |macro_name:{beginifsetcontent}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: beginifsetcontent\\n}
   {raw:@ifset a\\n}
   {raw:going \\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@beginifsetcontent C1
    >*brace_arg
  >ignored_conditional_block<1><p:1>
   >*@ifset C4 l6:@beginifsetcontent
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{a}
    >{raw:going }
    >>SOURCEMARKS
    >>macro_expansion<end;1><p:6>
    >{raw: into the code\\n}
    >*@end C1 l7
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifset}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifset}
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
