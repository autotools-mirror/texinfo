use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'alias_macro_target_removed'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content C4
   *normal_command@macro C3 l1
   |formal_args:A{arg}
   |macro_name:{mystrong}
    *arguments_line C1
     {macro_line: mystrong {arg}\\n}
    {raw:!!\\arg\\!!\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@alias C1 l5
   |misc_args:A{new|mystrong}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:new = mystrong}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:!!aa!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mystrong C1
    >|alias_of:{new}
     >*brace_arg C1
      >{macro_call_arg_text:aa}
   >macro_expansion<end;1><p:6>
  {empty_line:\\n}
  *normal_command@unmacro C1
  |misc_args:A{mystrong}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:mystrong}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:bb\\n}
';


$result_texis{'alias_macro_target_removed'} = '@macro mystrong {arg}
!!\\arg\\!!
@end macro

@alias new = mystrong

!!aa!!

@unmacro mystrong

bb
';


$result_texts{'alias_macro_target_removed'} = '

!!aa!!


bb
';

$result_errors{'alias_macro_target_removed'} = '* E l11|unknown command `mystrong\'
 unknown command `mystrong\'

* E l11|misplaced {
 misplaced {

* E l11|misplaced }
 misplaced }

';

$result_nodes_list{'alias_macro_target_removed'} = '';

$result_sections_list{'alias_macro_target_removed'} = '';

$result_sectioning_root{'alias_macro_target_removed'} = '';

$result_headings_list{'alias_macro_target_removed'} = '';

1;
