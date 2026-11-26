use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'enumerate_above_ten'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@enumerate C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:14}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:a\\n}
   *normal_command@end C1 l3
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'enumerate_above_ten'} = '@enumerate 14
@item a
@end enumerate
';


$result_texts{'enumerate_above_ten'} = '14. a
';

$result_errors{'enumerate_above_ten'} = '';

$result_nodes_list{'enumerate_above_ten'} = '';

$result_sections_list{'enumerate_above_ten'} = '';

$result_sectioning_root{'enumerate_above_ten'} = '';

$result_headings_list{'enumerate_above_ten'} = '';


$result_converted{'plaintext'}->{'enumerate_above_ten'} = '  14. a
';


$result_converted{'html_text'}->{'enumerate_above_ten'} = '<ol class="enumerate" start="14">
<li> a
</li></ol>
';


$result_converted{'xml'}->{'enumerate_above_ten'} = '<enumerate first="14" endspaces=" "><enumeratefirst> 14</enumeratefirst>
<listitem> <para>a
</para></listitem></enumerate>
';


$result_converted{'docbook'}->{'enumerate_above_ten'} = '<orderedlist numeration="arabic"><listitem><para>a
</para></listitem></orderedlist>';


$result_converted{'latex_text'}->{'enumerate_above_ten'} = '\\begin{document}
\\begin{enumerate}[start=14]
\\item a
\\end{enumerate}
';

1;
