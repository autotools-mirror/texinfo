use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accent_and_dash'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@^ C1 l1
    *brace_container C1
     {normal_text:a--}
';


$result_texis{'accent_and_dash'} = '@^{a--}';


$result_texts{'accent_and_dash'} = 'a-^';

$result_errors{'accent_and_dash'} = '';

$result_nodes_list{'accent_and_dash'} = '';

$result_sections_list{'accent_and_dash'} = '';

$result_sectioning_root{'accent_and_dash'} = '';

$result_headings_list{'accent_and_dash'} = '';


$result_converted{'plaintext'}->{'accent_and_dash'} = 'a-̂
';


$result_converted{'html_text'}->{'accent_and_dash'} = '<p>a&ndash;&#770;</p>';


$result_converted{'xml'}->{'accent_and_dash'} = '<para><accent type="circ">a&textndash;</accent></para>';


$result_converted{'latex_text'}->{'accent_and_dash'} = '\\begin{document}
\\^{a--}';


$result_converted{'docbook'}->{'accent_and_dash'} = '<para>a&#8211;&#770;</para>';

1;
