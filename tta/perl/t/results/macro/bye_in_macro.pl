use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bye_in_macro'} = '*document_root C3
 *before_node_section C2
  *preamble C2
   *normal_command@macro C6 l1
   |formal_args:A{}
   |macro_name:{byeinmacro}
    *arguments_line C1
     {macro_line: byeinmacro\\n}
    {raw:Text\\n}
    {raw:@bye\\n}
    {raw:\\n}
    {raw:after bye\\n}
    *normal_command@end C1 l6
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:Text\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@byeinmacro
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *after_end C5
  {raw:\\n}
  {raw:after bye}
  >SOURCEMARKS
  >macro_expansion<end;1><p:9>
  {raw:\\n}
  {raw:\\n}
  {raw:After end\\n}
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
