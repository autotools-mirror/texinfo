use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'ignored_macro_definition'} = '*document_root C1
 *before_node_section C6
  *@macro C3 l1
  |EXTRA
  |macro_name:{mymacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: mymacro{}\\n}
   {raw:outside\\n}
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
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmt C2 l6
   |EXTRA
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw:\\n@unmacro mymacro\\n@macro mymacro{}\\nin inlinefmt tex\\n@end macro\\n}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {outside.\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C1
     >*brace_arg
   >macro_expansion<end;1><p:7>
';


$result_texis{'ignored_macro_definition'} = '@macro mymacro{}
outside
@end macro


@inlinefmt{tex,
@unmacro mymacro
@macro mymacro{}
in inlinefmt tex
@end macro
}

outside.
';


$result_texts{'ignored_macro_definition'} = '



outside.
';

$result_errors{'ignored_macro_definition'} = '';

$result_nodes_list{'ignored_macro_definition'} = '';

$result_sections_list{'ignored_macro_definition'} = '';

$result_sectioning_root{'ignored_macro_definition'} = '';

$result_headings_list{'ignored_macro_definition'} = '';

1;
