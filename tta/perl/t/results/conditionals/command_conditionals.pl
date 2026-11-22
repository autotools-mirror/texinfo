use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_conditionals'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifset C1 l1
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:txicommandconditionals}
       >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Good, the txicommandconditionals variable was set.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:51>
    >*normal_command@end C1 l3
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*normal_command@ifcommanddefined C3 l5
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:nodexyz}
      >{spaces_after_argument:\\n}
    >{raw:Bad, @@nodexyz is defined.\\n}
    >*normal_command@end C1 l7
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
  >expanded_conditional_command<start;2><p:1>
   >*normal_command@ifcommandnotdefined C1 l8
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:nodexyz}
      >{spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:Good, }
   *normal_command@@
   {normal_text:nodexyz is not defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:24>
    >*normal_command@end C1 l10
    >|text_arg:{ifcommandnotdefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommandnotdefined}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*normal_command@ifcommanddefined C1 l12
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:node}
      >{spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:Good, }
   *normal_command@@
   {normal_text:node is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:17>
    >*normal_command@end C1 l14
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<2><p:17>
    >*normal_command@ifcommandnotdefined C3 l15
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:node}
       >{spaces_after_argument:\\n}
     >{raw:Bad, @@node is not defined.\\n}
     >*normal_command@end C1 l17
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifcommandnotdefined}
       >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*normal_command@ifcommanddefined C3 l19
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:mathcode}
      >{spaces_after_argument:\\n}
    >{raw:Unfortunately, @@mathcode is defined.\\n}
    >*normal_command@end C1 l21
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
  >expanded_conditional_command<start;4><p:1>
   >*normal_command@ifcommandnotdefined C1 l22
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:mathcode}
      >{spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:Happily, }
   *normal_command@@
   {normal_text:mathcode is not defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:25>
    >*normal_command@end C1 l24
    >|text_arg:{ifcommandnotdefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommandnotdefined}
      >{spaces_after_argument:\\n}
';


$result_texis{'command_conditionals'} = 'Good, the txicommandconditionals variable was set.

Good, @@nodexyz is not defined.

Good, @@node is defined.

Happily, @@mathcode is not defined.
';


$result_texts{'command_conditionals'} = 'Good, the txicommandconditionals variable was set.

Good, @nodexyz is not defined.

Good, @node is defined.

Happily, @mathcode is not defined.
';

$result_errors{'command_conditionals'} = '';

$result_nodes_list{'command_conditionals'} = '';

$result_sections_list{'command_conditionals'} = '';

$result_sectioning_root{'command_conditionals'} = '';

$result_headings_list{'command_conditionals'} = '';

1;
