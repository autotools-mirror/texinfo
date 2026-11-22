use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion_in_raw_line_leading_spaces'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C7
   *@macro C3 l1
   |EXTRA
   |formal_args:A{a}
   |macro_name:{mymac}
    *arguments_line C1
     {macro_line: mymac {a}\\n}
    {raw:@set \\n}
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
    >*macro_call@mymac C1
     >*brace_arg
   *@set C1
   |EXTRA
   |misc_args:A{b|c}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >macro_expansion<end;1><p:1>
     {rawline_text:b c}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l7
   |EXTRA
   |formal_args:A{}
   |macro_name:{mycontents}
    *arguments_line C1
     {macro_line: mycontents {} \\n}
    {raw:@contents\\n}
    *@end C1 l9
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;2><p:1>
    >*macro_call@mycontents C1
     >*brace_arg
   *@contents C1 l11:@mycontents
   |EXTRA
   |global_command_number:{1}
    *line_arg C2
     {spaces_before_argument:  }
     >SOURCEMARKS
     >macro_expansion<end;2>
     *@c C1
      *line_arg C2
       {rawline_text:}
       {spaces_after_argument:\\n}
';


$result_texis{'macro_expansion_in_raw_line_leading_spaces'} = '@macro mymac {a}
@set 
@end macro

@set  b c

@macro mycontents {} 
@contents
@end macro

@contents  @c
';


$result_texts{'macro_expansion_in_raw_line_leading_spaces'} = '


';

$result_errors{'macro_expansion_in_raw_line_leading_spaces'} = '';

$result_nodes_list{'macro_expansion_in_raw_line_leading_spaces'} = '';

$result_sections_list{'macro_expansion_in_raw_line_leading_spaces'} = '';

$result_sectioning_root{'macro_expansion_in_raw_line_leading_spaces'} = '';

$result_headings_list{'macro_expansion_in_raw_line_leading_spaces'} = '';

1;
