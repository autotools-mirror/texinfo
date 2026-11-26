use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_css_info_in_init'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C8 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@sansserif C1 l4
    *brace_container C1
     {normal_text:SSSSSSSSSSs ssss}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l6
    *brace_container C1
     *normal_command@r C1 l6
      *brace_container C1
       {normal_text:in r in code}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@titlefont C1 l8
  |global_command_number:{1}
   *brace_container C1
    {normal_text:in a new heading}
  {normal_text:\\n}
';


$result_texis{'text_css_info_in_init'} = '@node Top
@top top

@sansserif{SSSSSSSSSSs ssss}.

@code{@r{in r in code}}

@titlefont{in a new heading}
';


$result_texts{'text_css_info_in_init'} = 'top
***

SSSSSSSSSSs ssss.

in r in code

in a new heading
';

$result_errors{'text_css_info_in_init'} = '';

$result_nodes_list{'text_css_info_in_init'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'text_css_info_in_init'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'text_css_info_in_init'} = 'level: -1
list:
 1|top
';

$result_headings_list{'text_css_info_in_init'} = '';

1;
