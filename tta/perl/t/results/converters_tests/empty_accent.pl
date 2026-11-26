use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_accent'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C2
   *normal_command@` C1 l1
    *brace_container
   {normal_text:\\n}
';


$result_texis{'empty_accent'} = '@`{}
';


$result_texts{'empty_accent'} = '`
';

$result_errors{'empty_accent'} = '';

$result_nodes_list{'empty_accent'} = '';

$result_sections_list{'empty_accent'} = '';

$result_sectioning_root{'empty_accent'} = '';

$result_headings_list{'empty_accent'} = '';


$result_converted{'plaintext'}->{'empty_accent'} = '̀
';


$result_converted{'html_text'}->{'empty_accent'} = '<p>&#768;
</p>';


$result_converted{'xml'}->{'empty_accent'} = '<para><accent type="grave"></accent>
</para>';


$result_converted{'docbook'}->{'empty_accent'} = '<para>&#768;
</para>';


$result_converted{'latex_text'}->{'empty_accent'} = '\\begin{document}
\\`{}
';

1;
