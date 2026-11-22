use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'base_for_css_info_in_init_test'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C8 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@sansserif C1 l4
    *brace_container C1
     {normal_text:SSSSSSSSSSs ssss}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@code C1 l6
    *brace_container C1
     *@r C1 l6
      *brace_container C1
       {normal_text:in r in code}
   {normal_text:\\n}
  {empty_line:\\n}
  *@titlefont C1 l8
  |EXTRA
  |global_command_number:{1}
   *brace_container C1
    {normal_text:in a new heading}
  {normal_text:\\n}
';


$result_texis{'base_for_css_info_in_init_test'} = '@node Top
@top top

@sansserif{SSSSSSSSSSs ssss}.

@code{@r{in r in code}}

@titlefont{in a new heading}
';


$result_texts{'base_for_css_info_in_init_test'} = 'top
***

SSSSSSSSSSs ssss.

in r in code

in a new heading
';

$result_errors{'base_for_css_info_in_init_test'} = '';

$result_nodes_list{'base_for_css_info_in_init_test'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'base_for_css_info_in_init_test'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'base_for_css_info_in_init_test'} = 'level: -1
list:
 1|top
';

$result_headings_list{'base_for_css_info_in_init_test'} = '';

1;
