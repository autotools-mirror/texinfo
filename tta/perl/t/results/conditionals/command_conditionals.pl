use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_conditionals'} = '*document_root C1
 *before_node_section C8
  {}
  >SOURCEMARKS
  >expanded_conditional_command<start;1>
   >*@ifset C1 l1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{txicommandconditionals}
  *paragraph C1
   {Good, the txicommandconditionals variable was set.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:51>
    >*@end C1 l3
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
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<1><p:1>
   >*@ifcommanddefined C3 l5
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{nodexyz}
    >{raw:Bad, @@nodexyz is defined.\\n}
    >*@end C1 l7
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
  >expanded_conditional_command<start;2><p:1>
   >*@ifcommandnotdefined C1 l8
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{nodexyz}
  *paragraph C3
   {Good, }
   *@@
   {nodexyz is not defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:24>
    >*@end C1 l10
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommandnotdefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommandnotdefined}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*@ifcommanddefined C1 l12
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{node}
  *paragraph C3
   {Good, }
   *@@
   {node is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:17>
    >*@end C1 l14
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
   >ignored_conditional_block<2><p:17>
    >*@ifcommandnotdefined C3 l15
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >*arguments_line C1
      >*block_line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{node}
     >{raw:Bad, @@node is not defined.\\n}
     >*@end C1 l17
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C1
      >|INFO
      >|spaces_after_argument:
       >|{spaces_after_argument:\\n}
       >{ifcommandnotdefined}
  {empty_line:\\n}
  >SOURCEMARKS
  >ignored_conditional_block<3><p:1>
   >*@ifcommanddefined C3 l19
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{mathcode}
    >{raw:Unfortunately, @@mathcode is defined.\\n}
    >*@end C1 l21
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommanddefined}
  >expanded_conditional_command<start;4><p:1>
   >*@ifcommandnotdefined C1 l22
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*arguments_line C1
     >*block_line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{mathcode}
  *paragraph C3
   {Happily, }
   *@@
   {mathcode is not defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:25>
    >*@end C1 l24
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{ifcommandnotdefined}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{ifcommandnotdefined}
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
