use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'non_ascii_in_macro_name'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |invalid_syntax:{1}
    *arguments_line C1
     {macro_line: parenbrève {a}\\n}
    {raw:(@`{\\a\\})\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:èvee\\n}
';


$result_texis{'non_ascii_in_macro_name'} = '@macro parenbrève {a}
(@`{\\a\\})
@end macro

èvee
';


$result_texts{'non_ascii_in_macro_name'} = '
èvee
';

$result_errors{'non_ascii_in_macro_name'} = '* E l1|bad name for @macro
 bad name for @macro

* E l5|unknown command `parenbr\'
 unknown command `parenbr\'

* E l5|misplaced {
 misplaced {

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'non_ascii_in_macro_name'} = '';

$result_sections_list{'non_ascii_in_macro_name'} = '';

$result_sectioning_root{'non_ascii_in_macro_name'} = '';

$result_headings_list{'non_ascii_in_macro_name'} = '';

1;
