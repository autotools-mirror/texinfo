use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'w_argument'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@itemize C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@w C1 l1
      *brace_container
     {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     *normal_command@option C1 l2
      *brace_container C1
       {normal_text:--build=}
     {normal_text: platform on which the program is compiled,\\n}
   *normal_command@item C2 l3
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C2
     *normal_command@option C1 l3
      *brace_container C1
       {normal_text:--target=}
     {normal_text: target platform on which the program is processed.\\n}
   *normal_command@end C1 l4
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'w_argument'} = '@itemize @w{}
@item @option{--build=} platform on which the program is compiled,
@item @option{--target=} target platform on which the program is processed.
@end itemize
';


$result_texts{'w_argument'} = '--build= platform on which the program is compiled,
--target= target platform on which the program is processed.
';

$result_errors{'w_argument'} = '';

$result_nodes_list{'w_argument'} = '';

$result_sections_list{'w_argument'} = '';

$result_sectioning_root{'w_argument'} = '';

$result_headings_list{'w_argument'} = '';


$result_converted{'plaintext'}->{'w_argument'} = '     ‘--build=’ platform on which the program is compiled,
     ‘--target=’ target platform on which the program is processed.
';


$result_converted{'html_text'}->{'w_argument'} = '<ul class="itemize mark-none">
<li><samp class="option">--build=</samp> platform on which the program is compiled,
</li><li><samp class="option">--target=</samp> target platform on which the program is processed.
</li></ul>
';


$result_converted{'xml'}->{'w_argument'} = '<itemize commandarg="w" endspaces=" "><itemprepend> <w></w></itemprepend>
<listitem><prepend><w></w></prepend> <para><option>--build=</option> platform on which the program is compiled,
</para></listitem><listitem><prepend><w></w></prepend> <para><option>--target=</option> target platform on which the program is processed.
</para></listitem></itemize>
';


$result_converted{'latex_text'}->{'w_argument'} = '\\begin{document}
\\begin{itemize}[label={}]
\\item \\texttt{{-}{-}build=} platform on which the program is compiled,
\\item \\texttt{{-}{-}target=} target platform on which the program is processed.
\\end{itemize}
';

1;
