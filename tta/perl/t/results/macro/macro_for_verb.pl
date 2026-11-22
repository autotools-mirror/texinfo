use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_for_verb'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{verbopen}
    *arguments_line C1
     {macro_line: verbopen {}\\n}
    {raw:@verb{\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@verbopen C1
     >*brace_arg
  *paragraph C2
   *@verb C1 l5:@verbopen
    *brace_container C5
     {verb_delimiter:@}
     >SOURCEMARKS
     >macro_expansion<end;1>
     {raw: some text\\n}
     {raw:\\n}
     {raw:@code\\n}
     {verb_delimiter:@}
   {normal_text:\\n}
';


$result_texis{'macro_for_verb'} = '@macro verbopen {}
@verb{
@end macro

@verb{@ some text

@code
@}
';


$result_texts{'macro_for_verb'} = '
 some text

@code

';

$result_errors{'macro_for_verb'} = '';

$result_nodes_list{'macro_for_verb'} = '';

$result_sections_list{'macro_for_verb'} = '';

$result_sectioning_root{'macro_for_verb'} = '';

$result_headings_list{'macro_for_verb'} = '';

1;
