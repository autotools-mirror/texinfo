use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_zero'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{zero}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: zero\\n}
   {raw:0\\n}
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
  *paragraph C2
   {Macro\\n}
   {0\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@zero C1
     >*brace_arg
   >macro_expansion<end;1><p:1>
';


$result_texis{'macro_zero'} = '@macro zero
0
@end macro

Macro
0
';


$result_texts{'macro_zero'} = '
Macro
0
';

$result_errors{'macro_zero'} = '';

$result_nodes_list{'macro_zero'} = '';

$result_sections_list{'macro_zero'} = '';

$result_sectioning_root{'macro_zero'} = '';

$result_headings_list{'macro_zero'} = '';

1;
