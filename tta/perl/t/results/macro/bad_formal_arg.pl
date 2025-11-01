use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bad_formal_arg'} = '*document_root C1
 *before_node_section C6
  {empty_line:\\n}
  *@macro C3 l2
  |EXTRA
  |invalid_syntax:{1}
  |macro_name:{bad}
  |misc_args:A{|not_empty}
   *arguments_line C1
    {macro_line: bad  { , not_empty}\\n}
   {raw:in bad macro\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@macro C3 l6
  |EXTRA
  |invalid_syntax:{1}
  |macro_name:{badspace}
  |misc_args:A{first|in 2arg}
   *arguments_line C1
    {macro_line: badspace{first, in 2arg}\\n}
   {raw:bad space\\n}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@macro C6 l10
  |EXTRA
  |invalid_syntax:{1}
  |macro_name:{abar}
  |misc_args:A{:::}
   *arguments_line C1
    {macro_line: abar {:::}\\n}
   {raw:in bar\\n}
   {raw:@macro foo {? aaa}\\n}
   {raw:in macro foo\\n}
   {raw:@end macro\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
';


$result_texis{'bad_formal_arg'} = '
@macro bad  { , not_empty}
in bad macro
@end macro

@macro badspace{first, in 2arg}
bad space
@end macro

@macro abar {:::}
in bar
@macro foo {? aaa}
in macro foo
@end macro
@end macro
';


$result_texts{'bad_formal_arg'} = '


';

$result_errors{'bad_formal_arg'} = '* E l2|bad or empty @macro formal argument: 
 bad or empty @macro formal argument: 

* E l6|bad or empty @macro formal argument: in 2arg
 bad or empty @macro formal argument: in 2arg

* E l10|bad or empty @macro formal argument: :::
 bad or empty @macro formal argument: :::

';

$result_nodes_list{'bad_formal_arg'} = '';

$result_sections_list{'bad_formal_arg'} = '';

$result_sectioning_root{'bad_formal_arg'} = '';

$result_headings_list{'bad_formal_arg'} = '';

1;
