use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_empty_menu_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{emptystring}
    *arguments_line C1
     {macro_line: emptystring\\n}
    {raw:\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@menu C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@emptystring C1
      >*brace_arg
    >macro_expansion<end;1>
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Copying-Conditions}
     {normal_text:Copying Conditions}
    {menu_entry_separator:::          }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:Your rights.\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_empty_menu_comment'} = '@macro emptystring

@end macro

@menu
* Copying Conditions::          Your rights.
@end menu
';


$result_texts{'macro_in_empty_menu_comment'} = '
* Copying Conditions::          Your rights.
';

$result_errors{'macro_in_empty_menu_comment'} = '';

$result_nodes_list{'macro_in_empty_menu_comment'} = '';

$result_sections_list{'macro_in_empty_menu_comment'} = '';

$result_sectioning_root{'macro_in_empty_menu_comment'} = '';

$result_headings_list{'macro_in_empty_menu_comment'} = '';

1;
