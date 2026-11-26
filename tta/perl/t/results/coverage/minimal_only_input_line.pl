use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'minimal_only_input_line'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {raw:\\input texinfo.tex\\n}
  *preamble
';


$result_texis{'minimal_only_input_line'} = '\\input texinfo.tex
';


$result_texts{'minimal_only_input_line'} = '';

$result_errors{'minimal_only_input_line'} = '';

$result_nodes_list{'minimal_only_input_line'} = '';

$result_sections_list{'minimal_only_input_line'} = '';

$result_sectioning_root{'minimal_only_input_line'} = '';

$result_headings_list{'minimal_only_input_line'} = '';


$result_converted{'plaintext'}->{'minimal_only_input_line'} = '';


$result_converted{'html_text'}->{'minimal_only_input_line'} = '';


$result_converted{'xml'}->{'minimal_only_input_line'} = '<preamblebeforebeginning>\\input texinfo.tex
</preamblebeforebeginning>';


$result_converted{'latex_text'}->{'minimal_only_input_line'} = '\\begin{document}
';


$result_converted{'docbook'}->{'minimal_only_input_line'} = '';

1;
