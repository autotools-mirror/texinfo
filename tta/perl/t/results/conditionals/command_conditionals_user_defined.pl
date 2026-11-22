use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_conditionals_user_defined'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content C8
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc\\n}
    {raw:machin\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@defindex C1 l5
   |EXTRA
   |misc_args:A{auth}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:auth}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@definfoenclose C1 l7
   |EXTRA
   |misc_args:A{infoencl|:|:}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:infoencl, :,:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@alias C1 l9
   |EXTRA
   |misc_args:A{strongalias|strong}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:strongalias = strong}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*@ifcommanddefined C1 l11
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:truc}
       >{spaces_after_argument:\\n}
  *paragraph C2
   *@@
   {normal_text:macro truc is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:23>
    >*@end C1 l13
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<1><p:23>
    >*@ifcommandnotdefined C3 l14
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:truc}
       >{spaces_after_argument:\\n}
     >{raw:@@macro truc is wrongly not defined\\n}
     >*@end C1 l16
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifcommandnotdefined}
       >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*@ifcommanddefined C1 l18
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:authindex}
      >{spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:index command }
   *@@
   {normal_text:authindex is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:22>
    >*@end C1 l20
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<2><p:22>
    >*@ifcommandnotdefined C3 l21
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:authindex}
       >{spaces_after_argument:\\n}
     >{raw:index command @@authindex is wrongly not defined\\n}
     >*@end C1 l23
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifcommandnotdefined}
       >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*@ifcommanddefined C1 l25
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:infoencl}
      >{spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:definfoenclose }
   *@@
   {normal_text:infoencl is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:21>
    >*@end C1 l27
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<3><p:21>
    >*@ifcommandnotdefined C3 l28
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:infoencl}
       >{spaces_after_argument:\\n}
     >{raw:definfoenclose @@infoencl is wrongly not defined\\n}
     >*@end C1 l30
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifcommandnotdefined}
       >{spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;4><p:1>
   >*@ifcommanddefined C1 l32
    >*arguments_line C1
     >*block_line_arg C3
      >{spaces_before_argument: }
      >{normal_text:strongalias}
      >{spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:strongalias }
   *@@
   {normal_text:alias is defined.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:18>
    >*@end C1 l34
    >|EXTRA
    >|text_arg:{ifcommanddefined}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifcommanddefined}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<4><p:18>
    >*@ifcommandnotdefined C3 l35
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:strongalias}
       >{spaces_after_argument:\\n}
     >{raw:strongalias @@alias is wrongly not defined\\n}
     >*@end C1 l37
     >|EXTRA
     >|text_arg:{ifcommandnotdefined}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifcommandnotdefined}
       >{spaces_after_argument:\\n}
';


$result_texis{'command_conditionals_user_defined'} = '@macro truc
machin
@end macro

@defindex auth

@definfoenclose infoencl, :,:

@alias strongalias = strong

@@macro truc is defined.

index command @@authindex is defined.

definfoenclose @@infoencl is defined.

strongalias @@alias is defined.
';


$result_texts{'command_conditionals_user_defined'} = '



@macro truc is defined.

index command @authindex is defined.

definfoenclose @infoencl is defined.

strongalias @alias is defined.
';

$result_errors{'command_conditionals_user_defined'} = '* W l7|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_indices{'command_conditionals_user_defined'} = 'auth
cp
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'command_conditionals_user_defined'} = '';

$result_sections_list{'command_conditionals_user_defined'} = '';

$result_sectioning_root{'command_conditionals_user_defined'} = '';

$result_headings_list{'command_conditionals_user_defined'} = '';

1;
