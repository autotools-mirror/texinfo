use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'exdent_in_top_level'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@exdent C1 l1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:in exdented not in block command}
    {spaces_after_argument:\\n}
';


$result_texis{'exdent_in_top_level'} = '@exdent in exdented not in block command
';


$result_texts{'exdent_in_top_level'} = 'in exdented not in block command
';

$result_errors{'exdent_in_top_level'} = '';

$result_nodes_list{'exdent_in_top_level'} = '';

$result_sections_list{'exdent_in_top_level'} = '';

$result_sectioning_root{'exdent_in_top_level'} = '';

$result_headings_list{'exdent_in_top_level'} = '';


$result_converted{'plaintext'}->{'exdent_in_top_level'} = 'in exdented not in block command
';


$result_converted{'html_text'}->{'exdent_in_top_level'} = '<p class="exdent">in exdented not in block command
</p>';


$result_converted{'xml'}->{'exdent_in_top_level'} = '<exdent> in exdented not in block command</exdent>
';


$result_converted{'latex_text'}->{'exdent_in_top_level'} = '\\begin{document}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
in exdented not in block command
\\\\
';


$result_converted{'docbook'}->{'exdent_in_top_level'} = '<simpara role="exdent">in exdented not in block command</simpara>
';

1;
