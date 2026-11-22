use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protect_first_parenthesis_after_parenthesis_source_mark'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{vvv}
    *arguments_line C1
     {macro_line: vvv {}\\n}
    {raw:(\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@anchor C1 l5
  |EXTRA
  |identifier:{_0028my_005ff_0029}
  |is_target:{1}
   *brace_arg C2
    *@asis C1
     *brace_container C1
      {normal_text:(}
      >SOURCEMARKS
      >macro_expansion<start;1>
       >*macro_call@vvv C1
        >*brace_arg
      >macro_expansion<end;1><p:1>
    {normal_text:my_f)}
  *paragraph C1
   {normal_text:.\\n}
';


$result_texis{'protect_first_parenthesis_after_parenthesis_source_mark'} = '@macro vvv {}
(
@end macro

@anchor{@asis{(}my_f)}.
';


$result_texts{'protect_first_parenthesis_after_parenthesis_source_mark'} = '
.
';

$result_errors{'protect_first_parenthesis_after_parenthesis_source_mark'} = '* E l5|syntax for an external node used for `(my_f)\'
 syntax for an external node used for `(my_f)\'

';

$result_nodes_list{'protect_first_parenthesis_after_parenthesis_source_mark'} = '';

$result_sections_list{'protect_first_parenthesis_after_parenthesis_source_mark'} = '';

$result_sectioning_root{'protect_first_parenthesis_after_parenthesis_source_mark'} = '';

$result_headings_list{'protect_first_parenthesis_after_parenthesis_source_mark'} = '';

1;
