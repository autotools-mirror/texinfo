use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_before_line_command'} = '*document_root C3
 *before_node_section C4
  *preamble_before_content
  *paragraph C2
   {normal_text:before title }
   *normal_command@title C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:the title}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:i}
 *normal_command@node C2 l3 {LD Version Scripts}
 |identifier:{LD-Version-Scripts}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:LD Version Scripts}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:--- }
 *normal_command@chapter C6 l4 {LD Version Scripts}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:LD Version Scripts}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:ddd }
  *normal_command@contents C1 l6
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:aaa }
    *normal_command@author C1 l9
    |global_command_number:{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation author}
      {spaces_after_argument:\\n}
    {normal_text:quotation\\n}
   *normal_command@end C1 l11
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'text_before_line_command'} = 'before title @title the title

i@node LD Version Scripts
--- @chapter LD Version Scripts

ddd @contents

@quotation
aaa @author quotation author
quotation
@end quotation
';


$result_texts{'text_before_line_command'} = 'before title the title

i-- 1 LD Version Scripts
********************

ddd 
aaa quotation author
quotation
';

$result_errors{'text_before_line_command'} = '* W l1|@title should only appear at the beginning of a line
 warning: @title should only appear at the beginning of a line

* W l3|@node should only appear at the beginning of a line
 warning: @node should only appear at the beginning of a line

* W l4|@chapter should only appear at the beginning of a line
 warning: @chapter should only appear at the beginning of a line

* W l6|@contents should only appear at the beginning of a line
 warning: @contents should only appear at the beginning of a line

* W l9|@author should only appear at the beginning of a line
 warning: @author should only appear at the beginning of a line

';

$result_nodes_list{'text_before_line_command'} = '1|LD Version Scripts
 associated_section: 1 LD Version Scripts
 associated_title_command: 1 LD Version Scripts
';

$result_sections_list{'text_before_line_command'} = '1|LD Version Scripts
 associated_anchor_command: LD Version Scripts
 associated_node: LD Version Scripts
';

$result_sectioning_root{'text_before_line_command'} = 'level: 0
list:
 1|LD Version Scripts
';

$result_headings_list{'text_before_line_command'} = '';

1;
