use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_zero'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   {normal_text::\\n}
';


$result_texis{'command_zero'} = ':
';


$result_texts{'command_zero'} = ':
';

$result_errors{'command_zero'} = '* E l1|unknown command `0\'
 unknown command `0\'

';

$result_nodes_list{'command_zero'} = '';

$result_sections_list{'command_zero'} = '';

$result_sectioning_root{'command_zero'} = '';

$result_headings_list{'command_zero'} = '';


$result_converted{'plaintext'}->{'command_zero'} = ':
';


$result_converted{'html_text'}->{'command_zero'} = '<p>:
</p>';


$result_converted{'xml'}->{'command_zero'} = '<para>:
</para>';


$result_converted{'latex_text'}->{'command_zero'} = '\\begin{document}
:
';


$result_converted{'docbook'}->{'command_zero'} = '<para>:
</para>';

1;
