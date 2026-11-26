use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'missing_formal_arg'} = '*document_root C1
 *before_node_section C2
  *preamble C3
   *normal_command@linemacro C3 l1
   |formal_args:A{a||b}
   |invalid_syntax:{1}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro {a, , b}\\n}
    {raw:\\a\\ and \\b\\.\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:one two three\\n}
';


$result_texis{'missing_formal_arg'} = '@linemacro mymacro {a, , b}
\\a\\ and \\b\\.
@end linemacro

 one two three
';


$result_texts{'missing_formal_arg'} = '
one two three
';

$result_errors{'missing_formal_arg'} = '* E l1|bad or empty @linemacro formal argument: 
 bad or empty @linemacro formal argument: 

* E l5|unknown command `mymacro\'
 unknown command `mymacro\'

';

$result_nodes_list{'missing_formal_arg'} = '';

$result_sections_list{'missing_formal_arg'} = '';

$result_sectioning_root{'missing_formal_arg'} = '';

$result_headings_list{'missing_formal_arg'} = '';

1;
