use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_for_dot_in_menu_not_separator'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{macrodot}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: macrodot\\n}
   {raw:.\\n}
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
  *@menu C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {ref}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:{name.after}
    |normalized:{name_002eafter}
     {name.after}
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
      {desc\\n}
   *@end C1 l7
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
