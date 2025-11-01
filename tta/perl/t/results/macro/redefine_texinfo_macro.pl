use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'redefine_texinfo_macro'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{code}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: code{arg}\\n}
   {raw:@emph{\\arg\\}\\n}
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
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@code C1
    >*brace_arg C1
     >{macro_call_arg_text:code}
  *paragraph C2
   *@emph C1 l5:@code
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container C1
     {code}
   {\\n}
';


$result_texis{'redefine_texinfo_macro'} = '@macro code{arg}
@emph{\\arg\\}
@end macro

@emph{code}
';


$result_texts{'redefine_texinfo_macro'} = '
code
';

$result_errors{'redefine_texinfo_macro'} = '* W l1|redefining Texinfo language command: @code
 warning: redefining Texinfo language command: @code

';

$result_nodes_list{'redefine_texinfo_macro'} = '';

$result_sections_list{'redefine_texinfo_macro'} = '';

$result_sectioning_root{'redefine_texinfo_macro'} = '';

$result_headings_list{'redefine_texinfo_macro'} = '';

1;
