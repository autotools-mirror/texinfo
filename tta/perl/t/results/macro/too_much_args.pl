use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'too_much_args'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C4 l1
   |EXTRA
   |formal_args:A{first|second}
   |macro_name:{twoargs}
    *arguments_line C1
     {macro_line: twoargs {first, second}\\n}
    {raw:first arg: \\first\\\\n}
    {raw:second arg: \\second\\\\n}
    *normal_command@end C1 l4
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:first arg: one\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@twoargs C2
     >*brace_arg C1
      >{macro_call_arg_text:one}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:two, three}
   {normal_text:second arg: two, three.\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:22>
';


$result_texis{'too_much_args'} = '@macro twoargs {first, second}
first arg: \\first\\
second arg: \\second\\
@end macro

first arg: one
second arg: two, three.
';


$result_texts{'too_much_args'} = '
first arg: one
second arg: two, three.
';

$result_errors{'too_much_args'} = '* E l6|macro `twoargs\' called with too many args
 macro `twoargs\' called with too many args

';

$result_nodes_list{'too_much_args'} = '';

$result_sections_list{'too_much_args'} = '';

$result_sectioning_root{'too_much_args'} = '';

$result_headings_list{'too_much_args'} = '';

1;
