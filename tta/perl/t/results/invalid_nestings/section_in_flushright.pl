use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_in_flushright'} = '*document_root C2
 *before_node_section C2
  *preamble_before_content
  *normal_command@flushright C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:text flushed right\\n}
   {empty_line:\\n}
 *normal_command@section C1 l5 {a section}
 |identifier:{a-section}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a section}
    {spaces_after_argument:\\n}
';


$result_texis{'section_in_flushright'} = '@flushright

text flushed right

@section a section
';


$result_texts{'section_in_flushright'} = '
text flushed right

1 a section
===========
';

$result_errors{'section_in_flushright'} = '* E l5|@section seen before @end flushright
 @section seen before @end flushright

';

$result_nodes_list{'section_in_flushright'} = '';

$result_sections_list{'section_in_flushright'} = '1|a section
';

$result_sectioning_root{'section_in_flushright'} = 'level: 1
list:
 1|a section
';

$result_headings_list{'section_in_flushright'} = '';

1;
