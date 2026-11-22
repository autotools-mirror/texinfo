use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protect_comma_source_mark'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{vvv}
    *arguments_line C1
     {macro_line: vvv {}\\n}
    {raw:some text ,,\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |misc_args:A{punct|,,}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:punct ,,}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C8
   {normal_text:There is some text }
   >SOURCEMARKS
   >macro_expansion<start;1><p:9>
    >*macro_call@vvv C1
     >*brace_arg
   *normal_command@comma C1
    *brace_container
   *normal_command@comma C1
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container
   *normal_command@comma C1
   >SOURCEMARKS
   >value_expansion<start;1>{,,}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:punct}
    *brace_container
   *normal_command@comma C1
    *brace_container
   *normal_command@comma C1
   >SOURCEMARKS
   >value_expansion<end;1>
    *brace_container
   *normal_command@comma C1
    *brace_container
   {normal_text: and after.\\n}
';


$result_texis{'protect_comma_source_mark'} = '@macro vvv {}
some text ,,
@end macro

@set punct ,,

There is some text @comma{}@comma{}@comma{}@comma{}@comma{}@comma{} and after.
';


$result_texts{'protect_comma_source_mark'} = '

There is some text ,,,,,, and after.
';

$result_errors{'protect_comma_source_mark'} = '';

$result_nodes_list{'protect_comma_source_mark'} = '';

$result_sections_list{'protect_comma_source_mark'} = '';

$result_sectioning_root{'protect_comma_source_mark'} = '';

$result_headings_list{'protect_comma_source_mark'} = '';

1;
