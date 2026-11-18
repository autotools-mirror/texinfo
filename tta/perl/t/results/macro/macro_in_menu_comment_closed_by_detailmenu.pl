use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_menu_comment_closed_by_detailmenu'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{emptystring}
    *arguments_line C1
     {macro_line: emptystring\\n}
    {raw:\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@menu C4 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@emptystring C1
     >*brace_arg
   >macro_expansion<end;1>
   *@detailmenu C3 l6
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 l7
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{second}
      {second}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1 l8
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {detailmenu}
      {spaces_after_argument:\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_menu_comment_closed_by_detailmenu'} = '@macro emptystring

@end macro

@menu
@detailmenu
* second::
@end detailmenu
@end menu
';


$result_texts{'macro_in_menu_comment_closed_by_detailmenu'} = '
* second::
';

$result_errors{'macro_in_menu_comment_closed_by_detailmenu'} = '';

$result_nodes_list{'macro_in_menu_comment_closed_by_detailmenu'} = '';

$result_sections_list{'macro_in_menu_comment_closed_by_detailmenu'} = '';

$result_sectioning_root{'macro_in_menu_comment_closed_by_detailmenu'} = '';

$result_headings_list{'macro_in_menu_comment_closed_by_detailmenu'} = '';

1;
