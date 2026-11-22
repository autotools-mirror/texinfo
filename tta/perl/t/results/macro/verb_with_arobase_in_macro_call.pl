use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_with_arobase_in_macro_call'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C4 l1
   |formal_args:A{a|b}
   |macro_name:{showarg}
    *arguments_line C1
     {macro_line: showarg {a, b}\\n}
    {raw:first: \\a\\\\n}
    {raw:second: \\b\\\\n}
    *normal_command@end C1 l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C6
   {normal_text:first: }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@showarg C2
     >*brace_arg C1
      >{macro_call_arg_text:@verb{, commas ,}}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:@verb{@ arobase @}}
   *normal_command@verb C1 l6:@showarg
    *brace_container C3
     {verb_delimiter:,}
     {raw: commas }
     {verb_delimiter:,}
   {normal_text:\\n}
   {normal_text:second: }
   *normal_command@verb C1 l6:@showarg
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container C3
     {verb_delimiter:@}
     {raw: arobase }
     {verb_delimiter:@}
   {normal_text:\\n}
';


$result_texis{'verb_with_arobase_in_macro_call'} = '@macro showarg {a, b}
first: \\a\\
second: \\b\\
@end macro

first: @verb{, commas ,}
second: @verb{@ arobase @}
';


$result_texts{'verb_with_arobase_in_macro_call'} = '
first:  commas 
second:  arobase 
';

$result_errors{'verb_with_arobase_in_macro_call'} = '';

$result_nodes_list{'verb_with_arobase_in_macro_call'} = '';

$result_sections_list{'verb_with_arobase_in_macro_call'} = '';

$result_sectioning_root{'verb_with_arobase_in_macro_call'} = '';

$result_headings_list{'verb_with_arobase_in_macro_call'} = '';

1;
