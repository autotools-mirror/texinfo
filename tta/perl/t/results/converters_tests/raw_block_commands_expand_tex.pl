use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_block_commands_expand_tex'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C9
   *normal_command@html C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:<blink>html</blink> ``}\\n}
    *normal_command@end C1 l4
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@xml C3 l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:<para>xml</para> ``}\\n}
    *normal_command@end C1 l8
    |text_arg:{xml}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:xml}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@docbook C3 l10
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:<emphasis>docbook</emphasis> ``}\\n}
    *normal_command@end C1 l12
    |text_arg:{docbook}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:docbook}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@tex C3 l14
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C3
     {normal_text:$\\underline{a < b }
     *normal_command@code C1 l15
      *brace_container C2
       {normal_text:tex \\hbox}
       *balanced_braces C1 l15
        {normal_text:{ code }}
     {normal_text:}$ ``\\n}
    *normal_command@end C1 l16
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@latex C3 l18
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C3
     {normal_text:$\\frac{a < b }
     *normal_command@code C1 l19
      *brace_container C2
       {normal_text:tex \\hbox}
       *balanced_braces C1 l19
        {normal_text:{ code }}
     {normal_text:}{b}$ ``\\n}
    *normal_command@end C1 l20
    |text_arg:{latex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:latex}
      {spaces_after_argument:\\n}
';


$result_texis{'raw_block_commands_expand_tex'} = '
@html
<blink>html</blink> ``}
@end html

@xml
<para>xml</para> ``}
@end xml

@docbook
<emphasis>docbook</emphasis> ``}
@end docbook

@tex
$\\underline{a < b @code{tex \\hbox{ code }}}$ ``
@end tex

@latex
$\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``
@end latex
';


$result_texts{'raw_block_commands_expand_tex'} = '<blink>html</blink> ``}

<para>xml</para> ``}

<emphasis>docbook</emphasis> ``}

$\\underline{a < b tex \\hbox{ code }}$ ``

$\\frac{a < b tex \\hbox{ code }}{b}$ ``
';

$result_errors{'raw_block_commands_expand_tex'} = '* W l6|@xml is obsolete
 warning: @xml is obsolete

';

$result_nodes_list{'raw_block_commands_expand_tex'} = '';

$result_sections_list{'raw_block_commands_expand_tex'} = '';

$result_sectioning_root{'raw_block_commands_expand_tex'} = '';

$result_headings_list{'raw_block_commands_expand_tex'} = '';


$result_converted{'plaintext'}->{'raw_block_commands_expand_tex'} = '$\\underline{a < b ‘tex \\hbox{ code }’}$ ``

';


$result_converted{'html_text'}->{'raw_block_commands_expand_tex'} = '


$\\underline{a &lt; b &lt;code class=&quot;code&quot;&gt;tex \\hbox{ code }&lt;/code&gt;}$ ``

';

$result_converted_errors{'html_text'}->{'raw_block_commands_expand_tex'} = '* W l14|raw format tex is not converted
 warning: raw format tex is not converted

';


$result_converted{'xml'}->{'raw_block_commands_expand_tex'} = '<preamblebeforebeginning>
</preamblebeforebeginning><html endspaces=" ">
&lt;blink&gt;html&lt;/blink&gt; &textldquo;}
</html>

<xml endspaces=" ">
&lt;para&gt;xml&lt;/para&gt; &textldquo;}
</xml>

<docbook endspaces=" ">
&lt;emphasis&gt;docbook&lt;/emphasis&gt; &textldquo;}
</docbook>

$\\underline{a < b <code>tex \\hbox{ code }</code>}$ ``

<latex endspaces=" ">
$\\frac{a &lt; b <code>tex \\hbox{ code }</code>}{b}$ &textldquo;
</latex>
';


$result_converted{'docbook'}->{'raw_block_commands_expand_tex'} = '


$\\underline{a < b <literal>tex \\hbox{ code }</literal>}$ ``

';


$result_converted{'latex_text'}->{'raw_block_commands_expand_tex'} = '


$\\underline{a < b \\texttt{tex \\hbox{ code }}}$ ``

\\begin{document}
';

1;
