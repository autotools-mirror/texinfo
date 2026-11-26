use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_in_anchor'} = '*document_root C1
 *before_node_section C3
  *preamble
  *normal_command@anchor C1 l1
  |identifier:{anchor-name}
  |is_target:{1}
   *brace_arg C3
    {spaces_before_argument:   }
    {normal_text:anchor  name}
    {spaces_after_argument:   }
  *paragraph C1
   {normal_text:.\\n}
';


$result_texis{'space_in_anchor'} = '@anchor{   anchor  name   }.
';


$result_texts{'space_in_anchor'} = '.
';

$result_errors{'space_in_anchor'} = '';

$result_nodes_list{'space_in_anchor'} = '';

$result_sections_list{'space_in_anchor'} = '';

$result_sectioning_root{'space_in_anchor'} = '';

$result_headings_list{'space_in_anchor'} = '';


$result_converted{'plaintext'}->{'space_in_anchor'} = '.
';


$result_converted{'html_text'}->{'space_in_anchor'} = '<a class="anchor" id="anchor-name"></a><p>.
</p>';


$result_converted{'latex_text'}->{'space_in_anchor'} = '\\begin{document}
\\label{anchor:anchor-name}%
.
';


$result_converted{'docbook'}->{'space_in_anchor'} = '<anchor id="anchor-name"/><para>.
</para>';

1;
