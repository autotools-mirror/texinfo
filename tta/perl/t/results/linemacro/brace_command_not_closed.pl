use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'brace_command_not_closed'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C2
   *@linemacro C3 l1
   |EXTRA
   |formal_args:A{a|b|c}
   |macro_name:{mycommand}
    *arguments_line C1
     {macro_line: mycommand {a, b, c}\\n}
    {raw:\\a\\, \\b\\ \\c\\\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1><p:1>
    >*linemacro_call@mycommand C1
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@code{in code\\n\\n}
  *paragraph C1
   *@code C1 l6:@mycommand
    *brace_container C2
     {normal_text:in code\\n}
     {empty_line:\\n}
  *paragraph C1
   {normal_text:,  }
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:3>
';


$result_texis{'brace_command_not_closed'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@code{in code

},  ';


$result_texts{'brace_command_not_closed'} = '
in code

,  ';

$result_errors{'brace_command_not_closed'} = '* E l6|@mycommand missing closing brace
 @mycommand missing closing brace

* E l6:@mycommand|@code missing closing brace
 @code missing closing brace (possibly involving @mycommand)

';

$result_nodes_list{'brace_command_not_closed'} = '';

$result_sections_list{'brace_command_not_closed'} = '';

$result_sectioning_root{'brace_command_not_closed'} = '';

$result_headings_list{'brace_command_not_closed'} = '';

1;
