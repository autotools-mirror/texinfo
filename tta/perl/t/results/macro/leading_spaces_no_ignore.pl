use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'leading_spaces_no_ignore'} = '*document_root C1
 *before_node_section C4
  *@macro C4 l1
  |EXTRA
  |macro_name:{mymacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: mymacro\\n}
   {raw:  Some  here\\n}
   {raw:  text\\n}
   *@end C1 l4
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
  {spaces_before_paragraph:  }
  >SOURCEMARKS
  >macro_expansion<start;1>
   >*macro_call@mymacro C1
    >*brace_arg
  *paragraph C2
   {Some  here\\n}
   {  text\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:6>
';


$result_texis{'leading_spaces_no_ignore'} = '@macro mymacro
  Some  here
  text
@end macro

  Some  here
  text
';


$result_texts{'leading_spaces_no_ignore'} = '
Some  here
  text
';

$result_errors{'leading_spaces_no_ignore'} = '';

$result_nodes_list{'leading_spaces_no_ignore'} = '';

$result_sections_list{'leading_spaces_no_ignore'} = '';

$result_sectioning_root{'leading_spaces_no_ignore'} = '';

$result_headings_list{'leading_spaces_no_ignore'} = '';

1;
