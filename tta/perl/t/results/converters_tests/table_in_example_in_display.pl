use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'table_in_example_in_display'} = '*document_root C1
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C1
   {normal_text:T\\n}
  {empty_line:\\n}
  *normal_command@display C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:Disp\\n}
   *normal_command@example C4 l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:Ex\\n}
    *normal_command@table C3 l8
     *arguments_line C1
      *block_line_arg C3
       {spaces_before_argument: }
       *normal_command@asis l8
       {spaces_after_argument:\\n}
     *table_entry C2
      *table_term C1
       *normal_command@item C1 l9
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:item}
         {spaces_after_argument:\\n}
      *table_definition C1
       *preformatted C1
        {normal_text:Line\\n}
     *normal_command@end C1 l11
     |text_arg:{table}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:table}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l12
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l13
   |text_arg:{display}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:display}
     {spaces_after_argument:\\n}
';


$result_texis{'table_in_example_in_display'} = '
T

@display
Disp
@example
Ex
@table @asis
@item item
Line
@end table
@end example
@end display
';


$result_texts{'table_in_example_in_display'} = 'T

Disp
Ex
item
Line
';

$result_errors{'table_in_example_in_display'} = '';

$result_nodes_list{'table_in_example_in_display'} = '';

$result_sections_list{'table_in_example_in_display'} = '';

$result_sectioning_root{'table_in_example_in_display'} = '';

$result_headings_list{'table_in_example_in_display'} = '';


$result_converted{'plaintext'}->{'table_in_example_in_display'} = 'T

     Disp
          Ex
          item
               Line
';


$result_converted{'html_text'}->{'table_in_example_in_display'} = '<p>T
</p>
<div class="display">
<pre class="display-preformatted">Disp
</pre><div class="example">
<pre class="example-preformatted">Ex
</pre><dl class="table">
<dt><code class="table-term-preformatted-code">item</code></dt>
<dd><pre class="example-preformatted">Line
</pre></dd>
</dl>
</div>
</div>
';


$result_converted{'xml'}->{'table_in_example_in_display'} = '<preamblebeforebeginning>
</preamblebeforebeginning><para>T
</para>
<display endspaces=" ">
<pre xml:space="preserve">Disp
</pre><example endspaces=" ">
<pre xml:space="preserve">Ex
</pre><table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">Line
</pre></tableitem></tableentry></table>
</example>
</display>
';


$result_converted{'docbook'}->{'table_in_example_in_display'} = '<para>T
</para>
<literallayout>Disp
</literallayout><screen>Ex
</screen><variablelist><varlistentry><term>item
</term><listitem><screen>Line
</screen></listitem></varlistentry></variablelist>';


$result_converted{'latex_text'}->{'table_in_example_in_display'} = '\\begin{document}
T

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
Disp
\\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Ex
\\end{Texinfopreformatted}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
item}}]
\\begin{Texinfopreformatted}%
\\ttfamily Line
\\end{Texinfopreformatted}
\\end{description}
\\end{Texinfoindented}
\\end{Texinfoindented}
';

1;
