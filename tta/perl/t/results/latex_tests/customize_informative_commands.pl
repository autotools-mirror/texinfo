use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'customize_informative_commands'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@chapter C1 l1 {chap}
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
';


$result_texis{'customize_informative_commands'} = '@chapter chap
';


$result_texts{'customize_informative_commands'} = '1 chap
******
';

$result_errors{'customize_informative_commands'} = '';

$result_nodes_list{'customize_informative_commands'} = '';

$result_sections_list{'customize_informative_commands'} = '1|chap
';

$result_sectioning_root{'customize_informative_commands'} = 'level: 0
list:
 1|chap
';

$result_headings_list{'customize_informative_commands'} = '';


$result_converted{'latex_text'}->{'customize_informative_commands'} = '\\begin{document}
\\Texinfochapter{{chap}}
\\label{anchor:chap}%
';

1;
