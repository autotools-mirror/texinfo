use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_with_arobase_in_linemacro_call'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@linemacro C3 l1
   |formal_args:A{a|b|c}
   |macro_name:{mycommand}
    *arguments_line C1
     {macro_line: mycommand {a, b, c}\\n}
    {raw:\\a\\, \\b\\ \\c\\\\n}
    *normal_command@end C1 l3
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
      >{macro_call_arg_text:@verb{@ in verb @} and next\\n}
  *paragraph C3
   *normal_command@verb C1 l5:@mycommand
    *brace_container C3
     {verb_delimiter:@}
     {raw: in verb }
     {verb_delimiter:@}
   {normal_text: and next\\n}
   {normal_text:,  }
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:3>
';


$result_texis{'verb_with_arobase_in_linemacro_call'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@verb{@ in verb @} and next
,  ';


$result_texts{'verb_with_arobase_in_linemacro_call'} = '
 in verb  and next
,  ';

$result_errors{'verb_with_arobase_in_linemacro_call'} = '* E l5|@mycommand missing closing brace
 @mycommand missing closing brace

';

$result_nodes_list{'verb_with_arobase_in_linemacro_call'} = '';

$result_sections_list{'verb_with_arobase_in_linemacro_call'} = '';

$result_sectioning_root{'verb_with_arobase_in_linemacro_call'} = '';

$result_headings_list{'verb_with_arobase_in_linemacro_call'} = '';

1;
