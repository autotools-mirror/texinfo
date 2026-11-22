use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_call_in_node_manual'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C12
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{openbrace}
    *arguments_line C1
     {macro_line: openbrace\\n}
    {raw:(\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l5
   |formal_args:A{}
   |macro_name:{openbracetext}
    *arguments_line C1
     {macro_line: openbracetext\\n}
    {raw:(begin\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l9
   |formal_args:A{}
   |macro_name:{manualnameend}
    *arguments_line C1
     {macro_line: manualnameend\\n}
    {raw:last\\n}
    *normal_command@end C1 l11
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l13
   |formal_args:A{}
   |macro_name:{manualnameendbrace}
    *arguments_line C1
     {macro_line: manualnameendbrace\\n}
    {raw:last)\\n}
    *normal_command@end C1 l15
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l17
   |formal_args:A{}
   |macro_name:{manualnameendbracespace}
    *arguments_line C1
     {macro_line: manualnameendbracespace\\n}
    {raw:last)   \\n}
    *normal_command@end C1 l19
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l21
   |formal_args:A{}
   |macro_name:{manualnameendbracespacetext}
    *arguments_line C1
     {macro_line: manualnameendbracespacetext\\n}
    {raw:last)  mynode\\n}
    *normal_command@end C1 l23
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@menu C10 l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     >SOURCEMARKS
     >macro_expansion<start;1>
      >*macro_call@openbrace C1
       >*brace_arg
     >macro_expansion<end;1><p:1>
     {normal_text:a_man}
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     >SOURCEMARKS
     >macro_expansion<start;2>
      >*macro_call@openbracetext C1
       >*brace_arg
     {normal_text:begin}
     >SOURCEMARKS
     >macro_expansion<end;2><p:5>
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{the-node}
     {normal_text:(}
     >SOURCEMARKS
     >macro_expansion<start;3>
      >*macro_call@openbracetext C1
       >*brace_arg
     {normal_text:begin}
     >SOURCEMARKS
     >macro_expansion<end;3><p:5>
     {normal_text:)}
     {normal_text:the node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     >SOURCEMARKS
     >macro_expansion<start;4>
      >*macro_call@openbracetext C1
       >*brace_arg
     {normal_text:beginlast}
     >SOURCEMARKS
     >macro_expansion<end;4><p:5>
     >macro_expansion<start;5><p:5>
      >*macro_call@manualnameend C1
       >*brace_arg
     >macro_expansion<end;5><p:9>
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |manual_content:A{1|1}
    |node_content:A{4|4}
    |normalized:{distant}
     {normal_text:(}
     {normal_text:nomlast}
     >SOURCEMARKS
     >macro_expansion<start;6><p:3>
      >*macro_call@manualnameendbrace C1
       >*brace_arg
     {normal_text:)}
     >SOURCEMARKS
     >macro_expansion<end;6><p:1>
     {normal_text: }
     {normal_text:distant}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l31
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |manual_content:A{1|3}
     {normal_text:(}
     >SOURCEMARKS
     >macro_expansion<start;7>
      >*macro_call@openbracetext C1
       >*brace_arg
     {normal_text:begin}
     >SOURCEMARKS
     >macro_expansion<end;7><p:5>
     *normal_command@code C1 l31
     >SOURCEMARKS
     >macro_expansion<start;8>
      >*macro_call@manualnameendbrace C1
       >*brace_arg
      *brace_container C1
       {normal_text:in code}
     {normal_text:last}
     {normal_text:)}
     >SOURCEMARKS
     >macro_expansion<end;8><p:1>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l32
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |manual_content:A{1|1}
    |node_content:A{4|4}
    |normalized:{thenode}
     {normal_text:(}
     {normal_text:nomlast}
     >SOURCEMARKS
     >macro_expansion<start;9><p:3>
      >*macro_call@manualnameendbracespace C1
       >*brace_arg
     {normal_text:)}
     {normal_text:    }
     >SOURCEMARKS
     >macro_expansion<end;9><p:3>
     {normal_text:thenode}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l33
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |manual_content:A{1|1}
    |node_content:A{4|4}
    |normalized:{mynodeand-after}
     {normal_text:(}
     {normal_text:nomlast}
     >SOURCEMARKS
     >macro_expansion<start;10><p:3>
      >*macro_call@manualnameendbracespacetext C1
       >*brace_arg
     {normal_text:)}
     {normal_text:  }
     {normal_text:mynodeand after}
     >SOURCEMARKS
     >macro_expansion<end;10><p:6>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l34
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_call_in_node_manual'} = '@macro openbrace
(
@end macro

@macro openbracetext
(begin
@end macro

@macro manualnameend
last
@end macro

@macro manualnameendbrace
last)
@end macro

@macro manualnameendbracespace
last)   
@end macro

@macro manualnameendbracespacetext
last)  mynode
@end macro

@menu
* (a_man)::
* (begin)::
* (begin)the node::
* (beginlast)::
* (nomlast) distant::
* (begin@code{in code}last)::
* (nomlast)    thenode::
* (nomlast)  mynodeand after::
@end menu
';


$result_texts{'macro_call_in_node_manual'} = '





* (a_man)::
* (begin)::
* (begin)the node::
* (beginlast)::
* (nomlast) distant::
* (beginin codelast)::
* (nomlast)    thenode::
* (nomlast)  mynodeand after::
';

$result_errors{'macro_call_in_node_manual'} = '';

$result_nodes_list{'macro_call_in_node_manual'} = '';

$result_sections_list{'macro_call_in_node_manual'} = '';

$result_sectioning_root{'macro_call_in_node_manual'} = '';

$result_headings_list{'macro_call_in_node_manual'} = '';

1;
