use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_line_in_anchor'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@anchor C1 l1
  |EXTRA
  |identifier:{an-anchor}
  |is_target:{1}
   *brace_arg C2
    {normal_text:an\\n}
    {normal_text:anchor}
  {spaces_after_close_brace:\\n}
';


$result_texis{'end_line_in_anchor'} = '@anchor{an
anchor}
';


$result_texts{'end_line_in_anchor'} = '';

$result_errors{'end_line_in_anchor'} = '';

$result_nodes_list{'end_line_in_anchor'} = '';

$result_sections_list{'end_line_in_anchor'} = '';

$result_sectioning_root{'end_line_in_anchor'} = '';

$result_headings_list{'end_line_in_anchor'} = '';


$result_converted{'plaintext'}->{'end_line_in_anchor'} = '';


$result_converted{'html_text'}->{'end_line_in_anchor'} = '<a class="anchor" id="an-anchor"></a>';


$result_converted{'latex_text'}->{'end_line_in_anchor'} = '\\begin{document}
\\label{anchor:an-anchor}%
';


$result_converted{'docbook'}->{'end_line_in_anchor'} = '<anchor id="an-anchor"/>';

1;
