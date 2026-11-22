use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'texinfo_command_alias_indirect_before'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C6
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
   |misc_args:A{new|strong}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:new = strong}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@alias C1 l7
   |misc_args:A{strong|mystrong}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:strong = mystrong}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *normal_command@strong C1 l9
   |alias_of:{new}
    *brace_container C1
     {normal_text:aa}
   {normal_text:\\n}
';


$result_texis{'texinfo_command_alias_indirect_before'} = '@macro mystrong {arg}
!!\\arg\\!!
@end macro

@alias new = strong

@alias strong = mystrong

@strong{aa}
';


$result_texts{'texinfo_command_alias_indirect_before'} = '


aa
';

$result_errors{'texinfo_command_alias_indirect_before'} = '';

$result_nodes_list{'texinfo_command_alias_indirect_before'} = '';

$result_sections_list{'texinfo_command_alias_indirect_before'} = '';

$result_sectioning_root{'texinfo_command_alias_indirect_before'} = '';

$result_headings_list{'texinfo_command_alias_indirect_before'} = '';


$result_converted{'plaintext'}->{'texinfo_command_alias_indirect_before'} = '*aa*
';

1;
