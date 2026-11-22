use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraph_and_macro'} = '*document_root C1
 *before_node_section C9
  *preamble_before_content C11
   *normal_command@macro C2 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{aempty}
    *arguments_line C1
     {macro_line: aempty\\n}
    *normal_command@end C1 l2
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l4
   |EXTRA
   |formal_args:A{}
   |macro_name:{aspace}
    *arguments_line C1
     {macro_line: aspace\\n}
    {raw:   \\n}
    *normal_command@end C1 l6
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l8
   |EXTRA
   |formal_args:A{}
   |macro_name:{word}
    *arguments_line C1
     {macro_line: word\\n}
    {raw:a word\\n}
    *normal_command@end C1 l10
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@aempty C1
     >*brace_arg
   >macro_expansion<end;1>
   {empty_line:\\n}
   {empty_line:    \\n}
   >SOURCEMARKS
   >macro_expansion<start;2><p:2>
    >*macro_call@aempty C1
     >*brace_arg
   >macro_expansion<end;2><p:2>
   {empty_line:\\n}
   {spaces_before_paragraph: }
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call@aempty C1
     >*brace_arg
   >macro_expansion<end;3>
  *paragraph C1
   {normal_text:text after empty.\\n}
  {empty_line:\\n}
  {empty_line:   \\n}
  >SOURCEMARKS
  >macro_expansion<start;4>
   >*macro_call@aspace C1
    >*brace_arg
  >macro_expansion<end;4><p:3>
  {empty_line:\\n}
  {empty_line:       \\n}
  >SOURCEMARKS
  >macro_expansion<start;5><p:2>
   >*macro_call@aspace C1
    >*brace_arg
  >macro_expansion<end;5><p:5>
  {empty_line:\\n}
  {spaces_before_paragraph:    }
  >SOURCEMARKS
  >macro_expansion<start;6>
   >*macro_call@aspace C1
    >*brace_arg
  >macro_expansion<end;6><p:3>
  *paragraph C1
   {normal_text:text after space.\\n}
';


$result_texis{'paragraph_and_macro'} = '@macro aempty
@end macro

@macro aspace
   
@end macro

@macro word
a word
@end macro



    

 text after empty.

   

       

    text after space.
';


$result_texts{'paragraph_and_macro'} = '




    

text after empty.

   

       

text after space.
';

$result_errors{'paragraph_and_macro'} = '';

$result_nodes_list{'paragraph_and_macro'} = '';

$result_sections_list{'paragraph_and_macro'} = '';

$result_sectioning_root{'paragraph_and_macro'} = '';

$result_headings_list{'paragraph_and_macro'} = '';

1;
