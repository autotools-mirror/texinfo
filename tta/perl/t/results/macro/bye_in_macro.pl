use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bye_in_macro'} = '*document_root C3
 *before_node_section C3
  *@macro C6 l1
  |EXTRA
  |macro_name:{byeinmacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: byeinmacro\\n}
   {raw:Text\\n}
   {raw:@bye\\n}
   {raw:\\n}
   {raw:after bye\\n}
   *@end C1 l6
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
  *paragraph C1
   {Text\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@byeinmacro
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
 *postamble_after_end C5
  {text_after_end:\\n}
  {text_after_end:after bye}
  >SOURCEMARKS
  >macro_expansion<end;1><p:9>
  {text_after_end:\\n}
  {text_after_end:\\n}
  {text_after_end:After end\\n}
';


$result_texis{'bye_in_macro'} = '@macro byeinmacro
Text
@bye

after bye
@end macro

Text
@bye

after bye

After end
';


$result_texts{'bye_in_macro'} = '
Text
';

$result_errors{'bye_in_macro'} = '';

$result_nodes_list{'bye_in_macro'} = '';

$result_sections_list{'bye_in_macro'} = '';

$result_sectioning_root{'bye_in_macro'} = '';

$result_headings_list{'bye_in_macro'} = '';

1;
