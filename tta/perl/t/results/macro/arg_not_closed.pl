use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'arg_not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{foo}
    *arguments_line C1
     {macro_line: foo {arg}\\n}
    {raw:foo\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:call foo\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:5>
    >*macro_call@foo C1
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:something\\n}
   >macro_expansion<end;1><p:8>
';


$result_texis{'arg_not_closed'} = '@macro foo {arg}
foo
@end macro

call foo
';


$result_texts{'arg_not_closed'} = '
call foo
';

$result_errors{'arg_not_closed'} = '* E l5|@foo missing closing brace
 @foo missing closing brace

';

$result_nodes_list{'arg_not_closed'} = '';

$result_sections_list{'arg_not_closed'} = '';

$result_sectioning_root{'arg_not_closed'} = '';

$result_headings_list{'arg_not_closed'} = '';

1;
