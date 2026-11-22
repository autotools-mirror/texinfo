use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_in_linemacro_call'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@linemacro C6 l1
   |EXTRA
   |formal_args:A{a|b|c|d}
   |macro_name:{mycommand}
    *arguments_line C1
     {macro_line: mycommand {a, b, c, d}\\n}
    {raw:first \\a\\\\n}
    {raw:second \\b\\\\n}
    {raw:third \\c\\\\n}
    {raw:@defline \\a\\ \\d\\\\n}
    *normal_command@end C1 l6
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C4 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_defline C1
    *paragraph C7
     {normal_text:first Name\\n}
     >SOURCEMARKS
     >linemacro_expansion<start;1>
      >*linemacro_call@mycommand C4
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{bracketed_linemacro_arg:Name}
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{macro_call_arg_text:@verb{: in verb :}}
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{bracketed_linemacro_arg:A @verb{| in bracketed |} }
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{macro_call_arg_text:other {j}}
     {normal_text:second }
     *normal_command@verb C1 l9:@mycommand
      *brace_container C3
       {verb_delimiter::}
       {raw: in verb }
       {verb_delimiter::}
     {normal_text:\\n}
     {normal_text:third A }
     *normal_command@verb C1 l9:@mycommand
      *brace_container C3
       {verb_delimiter:|}
       {raw: in bracketed }
       {verb_delimiter:|}
     {normal_text: \\n}
   *normal_command@defline C1 l9:@mycommand
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Name}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:other}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l9:@mycommand
      >SOURCEMARKS
      >linemacro_expansion<end;1>
       {normal_text:j}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'verb_in_linemacro_call'} = '@linemacro mycommand {a, b, c, d}
first \\a\\
second \\b\\
third \\c\\
@defline \\a\\ \\d\\
@end linemacro

@defblock
first Name
second @verb{: in verb :}
third A @verb{| in bracketed |} 
@defline Name other {j}
@end defblock
';


$result_texts{'verb_in_linemacro_call'} = '
first Name
second  in verb 
third A  in bracketed  
Name: other j
';

$result_errors{'verb_in_linemacro_call'} = '';

$result_nodes_list{'verb_in_linemacro_call'} = '';

$result_sections_list{'verb_in_linemacro_call'} = '';

$result_sectioning_root{'verb_in_linemacro_call'} = '';

$result_headings_list{'verb_in_linemacro_call'} = '';

1;
