use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'item_container'} = '*document_root C1
 *before_node_section C7
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@itemize C3 l2
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:+}
     {spaces_after_argument:\\n}
   *normal_command@item C2 l3
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:i--tem +\\n}
   *normal_command@end C1 l4
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet l6
     {spaces_after_argument:\\n}
   *normal_command@item C3 l7
   |item_number:{1}
    {ignorable_spaces_after_command:\\n}
    {spaces_before_paragraph: }
    *paragraph C1
     {normal_text:b--ullet\\n}
   *normal_command@end C1 l9
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@item C2 l12
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:no itemize argument\\n}
   *normal_command@end C1 l13
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'item_container'} = '
@itemize +
@item i--tem +
@end itemize

@itemize @bullet
@item
 b--ullet
@end itemize

@itemize
@item no itemize argument
@end itemize
';


$result_texts{'item_container'} = 'i-tem +

b-ullet

no itemize argument
';

$result_errors{'item_container'} = '';

$result_nodes_list{'item_container'} = '';

$result_sections_list{'item_container'} = '';

$result_sectioning_root{'item_container'} = '';

$result_headings_list{'item_container'} = '';


$result_converted{'plaintext'}->{'item_container'} = '   + i-tem +

   • b-ullet

   • no itemize argument
';


$result_converted{'html_text'}->{'item_container'} = '<ul class="itemize" style="list-style-type: \'+\'">
<li>i&ndash;tem +
</li></ul>

<ul class="itemize mark-bullet">
<li>b&ndash;ullet
</li></ul>

<ul class="itemize mark-bullet">
<li>no itemize argument
</li></ul>
';


$result_converted{'xml'}->{'item_container'} = '<preamblebeforebeginning>
</preamblebeforebeginning><itemize endspaces=" "><itemprepend> +</itemprepend>
<listitem><prepend>+</prepend> <para>i&textndash;tem +
</para></listitem></itemize>

<itemize commandarg="bullet" endspaces=" "><itemprepend> <formattingcommand command="bullet"/></itemprepend>
<listitem><prepend>&bullet;</prepend>
 <para>b&textndash;ullet
</para></listitem></itemize>

<itemize endspaces=" ">
<listitem><prepend>&bullet;</prepend> <para>no itemize argument
</para></listitem></itemize>
';


$result_converted{'latex_text'}->{'item_container'} = '\\begin{document}
\\begin{itemize}[label=+]
\\item i--tem +
\\end{itemize}

\\begin{itemize}[label=\\textbullet{}]
\\item  b--ullet
\\end{itemize}

\\begin{itemize}
\\item no itemize argument
\\end{itemize}
';


$result_converted{'docbook'}->{'item_container'} = '<itemizedlist><listitem><para>+ i&#8211;tem +
</para></listitem></itemizedlist>
<itemizedlist><listitem><para>b&#8211;ullet
</para></listitem></itemizedlist>
<itemizedlist><listitem><para>no itemize argument
</para></listitem></itemizedlist>';

1;
