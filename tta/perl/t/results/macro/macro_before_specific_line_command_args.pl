use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_before_specific_line_command_args'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{cpfn}
    *arguments_line C1
     {macro_line: cpfn\\n}
    {raw: cp fn\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@syncodeindex C1 l5
   |EXTRA
   |misc_args:A{cp|fn}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<start;1>
      >*macro_call@cpfn C1
       >*brace_arg
     {normal_text:cp fn}
     >SOURCEMARKS
     >macro_expansion<end;1><p:5>
     {spaces_after_argument:\\n}
';


$result_texis{'macro_before_specific_line_command_args'} = '@macro cpfn
 cp fn
@end macro

@syncodeindex cp fn
';


$result_texts{'macro_before_specific_line_command_args'} = '
';

$result_errors{'macro_before_specific_line_command_args'} = '';

$result_indices{'macro_before_specific_line_command_args'} = 'cp C ->fn
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'macro_before_specific_line_command_args'} = '';

$result_sections_list{'macro_before_specific_line_command_args'} = '';

$result_sectioning_root{'macro_before_specific_line_command_args'} = '';

$result_headings_list{'macro_before_specific_line_command_args'} = '';

1;
