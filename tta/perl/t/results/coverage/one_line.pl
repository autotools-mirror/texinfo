use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'one_line'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   {normal_text:AB\\n}
';


$result_texis{'one_line'} = 'AB
';


$result_texts{'one_line'} = 'AB
';

$result_errors{'one_line'} = '';

$result_nodes_list{'one_line'} = '';

$result_sections_list{'one_line'} = '';

$result_sectioning_root{'one_line'} = '';

$result_headings_list{'one_line'} = '';


$result_converted{'plaintext'}->{'one_line'} = 'AB
';


$result_converted{'html_text'}->{'one_line'} = '<p>AB
</p>';


$result_converted{'xml'}->{'one_line'} = '<para>AB
</para>';


$result_converted{'latex_text'}->{'one_line'} = '\\begin{document}
AB
';


$result_converted{'docbook'}->{'one_line'} = '<para>AB
</para>';

1;
