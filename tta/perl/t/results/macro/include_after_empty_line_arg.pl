use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'include_after_empty_line_arg'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{body}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro{body}\\n}
    {raw:@code{\\body\\}\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call_line@mymacro C1
     >*line_arg C1
      >{spaces_before_argument:}
  *paragraph C3
   *normal_command@code C1 l5:@mymacro
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container
   {normal_text:\\n}
   >SOURCEMARKS
   >include<start;1><p:1>
    >*normal_command@include C1 l6
    >|EXTRA
    >|text_arg:{inc_file.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:inc_file.texi}
      >{spaces_after_argument:\\n}
   {normal_text:In included file.\\n}
   >SOURCEMARKS
   >include<end;1><p:18>
';


$result_texis{'include_after_empty_line_arg'} = '@macro mymacro{body}
@code{\\body\\}
@end macro

@code{}
In included file.
';


$result_texts{'include_after_empty_line_arg'} = '

In included file.
';

$result_errors{'include_after_empty_line_arg'} = '';

$result_nodes_list{'include_after_empty_line_arg'} = '';

$result_sections_list{'include_after_empty_line_arg'} = '';

$result_sectioning_root{'include_after_empty_line_arg'} = '';

$result_headings_list{'include_after_empty_line_arg'} = '';

1;
