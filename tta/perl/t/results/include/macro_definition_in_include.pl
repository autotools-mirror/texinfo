use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_definition_in_include'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C3
   {normal_text:}
   >SOURCEMARKS
   >include<start;1>
    >*normal_command@include C1 l1
    >|text_arg:{macro_included.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:macro_included.texi}
      >{spaces_after_argument:\\n}
   *normal_command@macro C3 macro_included.texi:l1
   |formal_args:A{}
   |macro_name:{themacro}
   >SOURCEMARKS
   >include<end;1>
    *arguments_line C1
     {macro_line: themacro\\n}
    {raw:in themacro\\n}
    *normal_command@end C1 macro_included.texi:l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:Call macro\\n}
   {normal_text:in themacro\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@themacro C1
     >*brace_arg
   >macro_expansion<end;1><p:11>
';


$result_texis{'macro_definition_in_include'} = '@macro themacro
in themacro
@end macro

Call macro
in themacro
';


$result_texts{'macro_definition_in_include'} = '
Call macro
in themacro
';

$result_errors{'macro_definition_in_include'} = '';

$result_nodes_list{'macro_definition_in_include'} = '';

$result_sections_list{'macro_definition_in_include'} = '';

$result_sectioning_root{'macro_definition_in_include'} = '';

$result_headings_list{'macro_definition_in_include'} = '';

1;
