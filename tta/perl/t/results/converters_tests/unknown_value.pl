use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_value'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@value C1
   *brace_container C1
    {normal_text:unknown}
';


$result_texis{'unknown_value'} = '@value{unknown}';


$result_texts{'unknown_value'} = 'unknown';

$result_errors{'unknown_value'} = '* W l1|undefined flag: unknown
 warning: undefined flag: unknown

';

$result_nodes_list{'unknown_value'} = '';

$result_sections_list{'unknown_value'} = '';

$result_sectioning_root{'unknown_value'} = '';

$result_headings_list{'unknown_value'} = '';


$result_converted{'plaintext'}->{'unknown_value'} = '{No value for \'unknown\'}
';


$result_converted{'html_text'}->{'unknown_value'} = '{No value for &lsquo;unknown&rsquo;}';


$result_converted{'xml'}->{'unknown_value'} = '';


$result_converted{'docbook'}->{'unknown_value'} = '';


$result_converted{'latex_text'}->{'unknown_value'} = '\\begin{document}
\\{No value for `unknown\'\\}';

1;
