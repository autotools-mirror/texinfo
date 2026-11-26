use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_tie'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C3
   {normal_text:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA}
   *normal_command@tie C1 l1
    *brace_container
   {normal_text:BBBBBBBBBBB\\n}
';


$result_texis{'test_tie'} = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA@tie{}BBBBBBBBBBB
';


$result_texts{'test_tie'} = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBBBBBBBB
';

$result_errors{'test_tie'} = '';

$result_nodes_list{'test_tie'} = '';

$result_sections_list{'test_tie'} = '';

$result_sectioning_root{'test_tie'} = '';

$result_headings_list{'test_tie'} = '';


$result_converted{'plaintext'}->{'test_tie'} = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA BBBBBBBBBBB
';


$result_converted{'html_text'}->{'test_tie'} = '<p>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;BBBBBBBBBBB
</p>';


$result_converted{'xml'}->{'test_tie'} = '<para>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&nbsp;BBBBBBBBBBB
</para>';


$result_converted{'latex_text'}->{'test_tie'} = '\\begin{document}
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA~BBBBBBBBBBB
';


$result_converted{'docbook'}->{'test_tie'} = '<para>AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA&#160;BBBBBBBBBBB
</para>';

1;
