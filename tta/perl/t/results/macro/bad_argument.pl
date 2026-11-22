use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_argument'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C7
   *normal_command@macro C3 l1
   |EXTRA
   |invalid_syntax:{1}
    *arguments_line C1
     {macro_line:\\n}
    {raw:in macro\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@rmacro C3 l5
   |EXTRA
   |formal_args:A{}
   |invalid_syntax:{1}
   |macro_name:{abar}
    *arguments_line C1
     {macro_line: abar aaa\\n}
    {raw:in\\n}
    *normal_command@end C1 l7
    |EXTRA
    |text_arg:{rmacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:rmacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l9
   |EXTRA
   |formal_args:A{ggg}
   |invalid_syntax:{1}
   |macro_name:{aftername}
    *arguments_line C1
     {macro_line: aftername {ggg} more  \\n}
    {raw:in macro\\n}
    *normal_command@end C1 l11
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l13
   |EXTRA
   |invalid_syntax:{1}
    *arguments_line C1
     {macro_line: #badname\\n}
    {raw:in #\\n}
    *normal_command@end C1 l15
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
';


$result_texis{'bad_argument'} = '@macro
in macro
@end macro

@rmacro abar aaa
in
@end rmacro

@macro aftername {ggg} more  
in macro
@end macro

@macro #badname
in #
@end macro
';


$result_texts{'bad_argument'} = '


';

$result_errors{'bad_argument'} = '* E l1|@macro requires a name
 @macro requires a name

* E l5|bad syntax for @rmacro argument: aaa
 bad syntax for @rmacro argument: aaa

* E l9|bad syntax for @macro argument: more  
 bad syntax for @macro argument: more  

* E l13|@macro requires a name
 @macro requires a name

';

$result_nodes_list{'bad_argument'} = '';

$result_sections_list{'bad_argument'} = '';

$result_sectioning_root{'bad_argument'} = '';

$result_headings_list{'bad_argument'} = '';

1;
