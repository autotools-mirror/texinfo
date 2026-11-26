use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sp'} = '*document_root C1
 *before_node_section C9
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C1
   {normal_text:Text line followed on the same line and another below }
  *normal_command@sp C1 l2
  |misc_args:A{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:1}
    {spaces_after_argument:\\n}
  *normal_command@sp C1 l3
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Text line after the sp followed by a sp }
  *normal_command@sp C1 l4
  |misc_args:A{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:1}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Text line after the text line followed by the sp.\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:50>
    >*normal_command@ifnottex C1 l6
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
  *normal_command@sp C1 l7
  >SOURCEMARKS
  >expanded_conditional_command<end;1>
   >*normal_command@end C1 l8
   >|text_arg:{ifnottex}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifnottex}
     >{spaces_after_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2 a number after sp}
    {spaces_after_argument:\\n}
';


$result_texis{'sp'} = '
Text line followed on the same line and another below @sp 1
@sp 2
Text line after the sp followed by a sp @sp 1
Text line after the text line followed by the sp.
@sp 2 a number after sp
';


$result_texts{'sp'} = 'Text line followed on the same line and another below 


Text line after the sp followed by a sp 
Text line after the text line followed by the sp.
';

$result_errors{'sp'} = '* W l2|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

* W l4|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

* E l7|@sp arg must be numeric, not `2 a number after sp\'
 @sp arg must be numeric, not `2 a number after sp\'

';

$result_nodes_list{'sp'} = '';

$result_sections_list{'sp'} = '';

$result_sectioning_root{'sp'} = '';

$result_headings_list{'sp'} = '';

1;
