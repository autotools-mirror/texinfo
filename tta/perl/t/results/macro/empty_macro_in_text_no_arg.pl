use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_macro_in_text_no_arg'} = '*document_root C1
 *before_node_section C6
  *preamble C3
   *normal_command@macro C2 l1
   |formal_args:A{}
   |macro_name:{texnl}
    *arguments_line C1
     {macro_line: texnl{}\\n}
    *normal_command@end C1 l2
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:This.  It.\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:5>
    >*macro_call@texnl
   >macro_expansion<end;1><p:5>
  {empty_line:\\n}
  *normal_command@macro C2 l6
  |formal_args:A{}
  |macro_name:{texnltwo}
   *arguments_line C1
    {macro_line: texnltwo\\n}
   *normal_command@end C1 l7
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:This 2 see.  A.\\n}
   >SOURCEMARKS
   >macro_expansion<start;2><p:11>
    >*macro_call@texnltwo
   >macro_expansion<end;2><p:11>
';


$result_texis{'empty_macro_in_text_no_arg'} = '@macro texnl{}
@end macro

 This.  It.

@macro texnltwo
@end macro

This 2 see.  A.
';


$result_texts{'empty_macro_in_text_no_arg'} = '
This.  It.


This 2 see.  A.
';

$result_errors{'empty_macro_in_text_no_arg'} = '';

$result_nodes_list{'empty_macro_in_text_no_arg'} = '';

$result_sections_list{'empty_macro_in_text_no_arg'} = '';

$result_sectioning_root{'empty_macro_in_text_no_arg'} = '';

$result_headings_list{'empty_macro_in_text_no_arg'} = '';

1;
