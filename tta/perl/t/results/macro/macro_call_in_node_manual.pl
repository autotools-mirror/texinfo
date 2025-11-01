use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_call_in_node_manual'} = '*document_root C1
 *before_node_section C13
  *@macro C3 l1
  |EXTRA
  |macro_name:{openbrace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: openbrace\\n}
   {raw:(\\n}
   *@end C1 l3
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
  *@macro C3 l5
  |EXTRA
  |macro_name:{openbracetext}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: openbracetext\\n}
   {raw:(begin\\n}
   *@end C1 l7
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
  *@macro C3 l9
  |EXTRA
  |macro_name:{manualnameend}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: manualnameend\\n}
   {raw:last\\n}
   *@end C1 l11
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
  *@macro C3 l13
  |EXTRA
  |macro_name:{manualnameendbrace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: manualnameendbrace\\n}
   {raw:last)\\n}
   *@end C1 l15
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
  *@macro C3 l17
  |EXTRA
  |macro_name:{manualnameendbracespace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: manualnameendbracespace\\n}
   {raw:last)   \\n}
   *@end C1 l19
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
  *@macro C3 l21
  |EXTRA
  |macro_name:{manualnameendbracespacetext}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: manualnameendbracespacetext\\n}
   {raw:last)  mynode\\n}
   *@end C1 l23
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
  *@menu C10 l25
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{a_man}
     {(}
     >SOURCEMARKS
     >macro_expansion<start;1>
      >*macro_call@openbrace C1
       >*brace_arg
     >macro_expansion<end;1><p:1>
     {a_man}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{begin}
     {(}
     >SOURCEMARKS
     >macro_expansion<start;2>
      >*macro_call@openbracetext C1
       >*brace_arg
     {begin}
     >SOURCEMARKS
     >macro_expansion<end;2><p:5>
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{begin}
    |node_content:{the node}
    |normalized:{the-node}
     {(}
     >SOURCEMARKS
     >macro_expansion<start;3>
      >*macro_call@openbracetext C1
       >*brace_arg
     {begin}
     >SOURCEMARKS
     >macro_expansion<end;3><p:5>
     {)}
     {the node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{beginlast}
     {(}
     >SOURCEMARKS
     >macro_expansion<start;4>
      >*macro_call@openbracetext C1
       >*brace_arg
     {beginlast}
     >SOURCEMARKS
     >macro_expansion<end;4><p:5>
     >macro_expansion<start;5><p:5>
      >*macro_call@manualnameend C1
       >*brace_arg
     >macro_expansion<end;5><p:9>
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |manual_content:{nomlast}
    |node_content:{distant}
    |normalized:{distant}
     {(}
     {nomlast}
     >SOURCEMARKS
     >macro_expansion<start;6><p:3>
      >*macro_call@manualnameendbrace C1
       >*brace_arg
     {)}
     >SOURCEMARKS
     >macro_expansion<end;6><p:1>
     { }
     {distant}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l31
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |manual_content:{begin@code{in code}last}
     {(}
     >SOURCEMARKS
     >macro_expansion<start;7>
      >*macro_call@openbracetext C1
       >*brace_arg
     {begin}
     >SOURCEMARKS
     >macro_expansion<end;7><p:5>
     *@code C1 l31
     >SOURCEMARKS
     >macro_expansion<start;8>
      >*macro_call@manualnameendbrace C1
       >*brace_arg
      *brace_container C1
       {in code}
     {last}
     {)}
     >SOURCEMARKS
     >macro_expansion<end;8><p:1>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l32
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |manual_content:{nomlast}
    |node_content:{thenode}
    |normalized:{thenode}
     {(}
     {nomlast}
     >SOURCEMARKS
     >macro_expansion<start;9><p:3>
      >*macro_call@manualnameendbracespace C1
       >*brace_arg
     {)}
     {    }
     >SOURCEMARKS
     >macro_expansion<end;9><p:3>
     {thenode}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l33
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |manual_content:{nomlast}
    |node_content:{mynodeand after}
    |normalized:{mynodeand-after}
     {(}
     {nomlast}
     >SOURCEMARKS
     >macro_expansion<start;10><p:3>
      >*macro_call@manualnameendbracespacetext C1
       >*brace_arg
     {)}
     {  }
     {mynodeand after}
     >SOURCEMARKS
     >macro_expansion<end;10><p:6>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l34
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
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
