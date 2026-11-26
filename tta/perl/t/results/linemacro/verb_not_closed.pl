use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble C2
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
      >{macro_call_arg_text:@verb{: in verb\\n\\n}
  *paragraph C1
   *normal_command@verb C1 l6:@mycommand
    *brace_container C5
     {verb_delimiter::}
     {raw: in verb\\n}
     {raw:\\n}
     {raw:,  }
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:3>
     {verb_delimiter::}
';


$result_texis{'verb_not_closed'} = '@linemacro mycommand {a, b, c}
\\a\\, \\b\\ \\c\\
@end linemacro

@verb{: in verb

,  :}';


$result_texts{'verb_not_closed'} = '
 in verb

,  ';

$result_errors{'verb_not_closed'} = '* E l6|@mycommand missing closing brace
 @mycommand missing closing brace

* E l6:@mycommand|@verb missing closing delimiter sequence: :}
 @verb missing closing delimiter sequence: :} (possibly involving @mycommand)

';

$result_nodes_list{'verb_not_closed'} = '';

$result_sections_list{'verb_not_closed'} = '';

$result_sectioning_root{'verb_not_closed'} = '';

$result_headings_list{'verb_not_closed'} = '';

1;
