use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_in_macro_formal_arg'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@set C1
   |EXTRA
   |misc_args:A{argument|arg}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:argument arg }
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l3
   |EXTRA
   |formal_args:A{arg|the@value{argument}
   |invalid_syntax:{1}
   |macro_name:{testvalue}
    *arguments_line C1
     {macro_line: testvalue { arg , the@value{argument} }\\n}
    {raw:result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:macro_arg1\\n}
';


$result_texis{'value_in_macro_formal_arg'} = '@set argument arg 

@macro testvalue { arg , the@value{argument} }
result: @emph{\\arg\\} the \\the\\ thearg \\thearg\\ with value \\the@value{argument}\\
@end macro

macro_arg1
';


$result_texts{'value_in_macro_formal_arg'} = '

macro_arg1
';

$result_errors{'value_in_macro_formal_arg'} = '* E l3|bad or empty @macro formal argument: the@value{argument
 bad or empty @macro formal argument: the@value{argument

* E l3|bad syntax for @macro argument: }
 bad syntax for @macro argument: }

* E l7|unknown command `testvalue\'
 unknown command `testvalue\'

* E l7|misplaced {
 misplaced {

* E l7|misplaced }
 misplaced }

';

$result_nodes_list{'value_in_macro_formal_arg'} = '';

$result_sections_list{'value_in_macro_formal_arg'} = '';

$result_sectioning_root{'value_in_macro_formal_arg'} = '';

$result_headings_list{'value_in_macro_formal_arg'} = '';

1;
