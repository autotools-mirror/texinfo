use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protection_of_end_of_line_by_command'} = '*document_root C1
 *before_node_section C3
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{lm}
  |misc_args:A{one}
   *arguments_line C1
    {macro_line: lm {one}\\n}
   {raw:\\one\\bullet{}\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;1><p:1>
   >*linemacro_call@lm C1
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*linemacro_arg C1
     >{macro_call_arg_text:@\\n}
  *paragraph C2
   *@\\n
   {bullet\\n}
   >SOURCEMARKS
   >linemacro_expansion<end;1><p:6>
';


$result_texis{'protection_of_end_of_line_by_command'} = '@linemacro lm {one}
\\one\\bullet{}
@end linemacro

@
bullet
';


$result_texts{'protection_of_end_of_line_by_command'} = '
 bullet
';

$result_errors{'protection_of_end_of_line_by_command'} = '* E l6:@lm|misplaced {
 misplaced { (possibly involving @lm)

* E l6:@lm|misplaced }
 misplaced } (possibly involving @lm)

';

$result_nodes_list{'protection_of_end_of_line_by_command'} = '';

$result_sections_list{'protection_of_end_of_line_by_command'} = '';

$result_sectioning_root{'protection_of_end_of_line_by_command'} = '';

$result_headings_list{'protection_of_end_of_line_by_command'} = '';

1;
