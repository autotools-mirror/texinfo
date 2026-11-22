use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'braces_after_text'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@linemacro C3 l1
   |formal_args:A{a|b|c}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro {a, b, c}\\n}
    {raw:@defline \\a\\ \\b\\ \\c\\\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C3 l5
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@mymacro C3
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:text{in paren}}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:rest{in paren}}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:}
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l6:@mymacro
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C2
       {normal_text:text}
       *bracketed_arg C1 l6:@mymacro
        {normal_text:in paren}
     {spaces: }
     *def_name C1
      *def_line_arg C2
       {normal_text:rest}
       *bracketed_arg C1 l6:@mymacro
        {normal_text:in paren}
     {spaces_after_argument: \\n}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:1>
   *normal_command@end C1 l7
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'braces_after_text'} = '@linemacro mymacro {a, b, c}
@defline \\a\\ \\b\\ \\c\\
@end linemacro

@defblock
@defline text{in paren} rest{in paren} 
@end defblock
';


$result_texts{'braces_after_text'} = '
textin paren: restin paren
';

$result_errors{'braces_after_text'} = '';

$result_nodes_list{'braces_after_text'} = '';

$result_sections_list{'braces_after_text'} = '';

$result_sectioning_root{'braces_after_text'} = '';

$result_headings_list{'braces_after_text'} = '';

1;
