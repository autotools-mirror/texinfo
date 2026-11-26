use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protect_colon_source_mark'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@macro C3 l1
   |formal_args:A{arg}
   |macro_name:{klm}
    *arguments_line C1
     {macro_line: klm {arg}\\n}
    {raw:some text : \\arg\\ then more\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:There is some text }
   >SOURCEMARKS
   >macro_expansion<start;1><p:9>
    >*macro_call@klm C1
     >*brace_arg C1
      >{macro_call_arg_text:nop}
   *normal_command@asis C1
    *brace_container C1
     {normal_text::}
   {normal_text: nop then more and after.\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:14>
';


$result_texis{'protect_colon_source_mark'} = '@macro klm {arg}
some text : \\arg\\ then more
@end macro

There is some text @asis{:} nop then more and after.
';


$result_texts{'protect_colon_source_mark'} = '
There is some text : nop then more and after.
';

$result_errors{'protect_colon_source_mark'} = '';

$result_nodes_list{'protect_colon_source_mark'} = '';

$result_sections_list{'protect_colon_source_mark'} = '';

$result_sectioning_root{'protect_colon_source_mark'} = '';

$result_headings_list{'protect_colon_source_mark'} = '';

1;
