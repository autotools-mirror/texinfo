use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_in_menu'} = '*document_root C1
 *before_node_section C14
  {empty_line:\\n}
  *@macro C3 l2
  |EXTRA
  |macro_name:{astar}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: astar\\n}
   {raw:*\\n}
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
  *@macro C3 l6
  |EXTRA
  |macro_name:{starspaces}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: starspaces\\n}
   {raw:* \\n}
   *@end C1 l8
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
  *@macro C3 l10
  |EXTRA
  |macro_name:{spaces}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: spaces\\n}
   {raw:  \\n}
   *@end C1 l12
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
  *@macro C3 l14
  |EXTRA
  |macro_name:{aspace}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: aspace\\n}
   {raw: \\n}
   *@end C1 l16
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
  *@macro C3 l18
  |EXTRA
  |macro_name:{twocolon}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: twocolon\\n}
   {raw:::\\n}
   *@end C1 l20
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
  *@macro C3 l22
  |EXTRA
  |macro_name:{acolon}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: acolon\\n}
   {raw::\\n}
   *@end C1 l24
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
  *@menu C8 l26
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@starspaces C1
      >*brace_arg
    *menu_entry_node C1
    |EXTRA
    |node_content:{menu entry}
    |normalized:{menu-entry}
     {menu entry}
     >SOURCEMARKS
     >macro_expansion<end;1>
     >macro_expansion<start;2><p:10>
      >*macro_call@twocolon C1
       >*brace_arg
    {menu_entry_separator::: }
    >SOURCEMARKS
    >macro_expansion<end;2><p:2>
    *menu_entry_description C1
     *preformatted C1
      {description\\n}
   *menu_comment C1
    *preformatted C2
     {after_menu_description_line:  \\n}
     >SOURCEMARKS
     >macro_expansion<start;3>
      >*macro_call@spaces C1
       >*brace_arg
     >macro_expansion<end;3><p:2>
     {menu comment\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    >SOURCEMARKS
    >macro_expansion<start;4>
     >*macro_call@astar C1
      >*brace_arg
    >macro_expansion<end;4><p:1>
    *menu_entry_node C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l31
    {menu_entry_leading_text:* }
    >SOURCEMARKS
    >macro_expansion<start;5>
     >*macro_call@astar C1
      >*brace_arg
    >macro_expansion<end;5><p:1>
    >macro_expansion<start;6><p:1>
     >*macro_call@aspace C1
      >*brace_arg
    *menu_entry_node C1
    |EXTRA
    |node_content:{other node}
    |normalized:{other-node}
     {other node}
     >SOURCEMARKS
     >macro_expansion<end;6>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l32
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node colon macro}
    |normalized:{node-colon-macro}
     {node colon macro}
     >SOURCEMARKS
     >macro_expansion<start;7><p:16>
      >*macro_call@acolon C1
       >*brace_arg
    {menu_entry_separator::: }
    >SOURCEMARKS
    >macro_expansion<end;7><p:1>
    >macro_expansion<start;8><p:1>
     >*macro_call@acolon C1
      >*brace_arg
    >macro_expansion<end;8><p:2>
    >macro_expansion<start;9><p:2>
     >*macro_call@aspace C1
      >*brace_arg
    >macro_expansion<end;9><p:3>
    *menu_entry_description C1
     *preformatted C1
      {description\\n}
   *menu_entry C6 l33
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {3rd node}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:{entry}
    |normalized:{entry}
     {entry}
    {menu_entry_separator:. }
    >SOURCEMARKS
    >macro_expansion<start;10><p:1>
     >*macro_call@aspace C1
      >*brace_arg
    >macro_expansion<end;10><p:2>
    *menu_entry_description C1
     *preformatted C1
      {description\\n}
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


$result_texis{'macro_in_menu'} = '
@macro astar
*
@end macro

@macro starspaces
* 
@end macro

@macro spaces
  
@end macro

@macro aspace
 
@end macro

@macro twocolon
::
@end macro

@macro acolon
:
@end macro

@menu
* menu entry:: description
  
menu comment
* node::
* other node::
* node colon macro:: description
* 3rd node: entry. description
@end menu
';


$result_texts{'macro_in_menu'} = '






* menu entry:: description
  
menu comment
* node::
* other node::
* node colon macro:: description
* 3rd node: entry. description
';

$result_errors{'macro_in_menu'} = '';

$result_nodes_list{'macro_in_menu'} = '';

$result_sections_list{'macro_in_menu'} = '';

$result_sectioning_root{'macro_in_menu'} = '';

$result_headings_list{'macro_in_menu'} = '';

1;
