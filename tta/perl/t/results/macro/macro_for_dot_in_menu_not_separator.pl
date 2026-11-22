use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_for_dot_in_menu_not_separator'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{macrodot}
    *arguments_line C1
     {macro_line: macrodot\\n}
    {raw:.\\n}
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
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:ref}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{name_002eafter}
     {normal_text:name.after}
     >SOURCEMARKS
     >macro_expansion<start;1><p:4>
      >*macro_call@macrodot C1
       >*brace_arg
     >macro_expansion<end;1><p:5>
     >macro_expansion<start;2><p:10>
      >*macro_call@macrodot C1
       >*brace_arg
    {menu_entry_separator:. }
    >SOURCEMARKS
    >macro_expansion<end;2><p:1>
    *menu_entry_description C1
     *preformatted C1
      {normal_text:desc\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_for_dot_in_menu_not_separator'} = '@macro macrodot
.
@end macro

@menu
* ref: name.after. desc
@end menu
';


$result_texts{'macro_for_dot_in_menu_not_separator'} = '
* ref: name.after. desc
';

$result_errors{'macro_for_dot_in_menu_not_separator'} = '';

$result_nodes_list{'macro_for_dot_in_menu_not_separator'} = '';

$result_sections_list{'macro_for_dot_in_menu_not_separator'} = '';

$result_sectioning_root{'macro_for_dot_in_menu_not_separator'} = '';

$result_headings_list{'macro_for_dot_in_menu_not_separator'} = '';

1;
