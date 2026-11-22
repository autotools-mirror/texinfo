use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inline_expand_tex'} = '*document_root C1
 *before_node_section C6
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C12
   *normal_command@inlinefmt C2 l2
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *elided_brace_command_arg C1
     {raw: <blink>html</blink> ``}
   {normal_text:, \\n}
   *normal_command@inlinefmt C2 l3
   |format:{plaintext}
    *brace_arg C1
     {normal_text:plaintext}
    *elided_brace_command_arg C1
     {raw: plaintext ``}
   {normal_text:, \\n}
   *normal_command@inlinefmt C2 l4
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *elided_brace_command_arg C1
     {raw: <para>xml</para> ``}
   {normal_text:,\\n}
   *normal_command@inlinefmt C2 l5
   |format:{docbook}
    *brace_arg C1
     {normal_text:docbook}
    *elided_brace_command_arg C1
     {raw: <emphasis>docbook</emphasis> ``}
   {normal_text:, \\n}
   *normal_command@inlinefmt C2 l6
   |expand_index:{1}
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:$\\underlinea < b }
     *normal_command@code C1 l6
      *brace_container C1
       {normal_text:tex \\hbox code }
   {normal_text:$ ``\\n}
   *normal_command@inlinefmt C2 l7
   |format:{latex}
    *brace_arg C1
     {normal_text:latex}
    *elided_brace_command_arg C1
     {raw: @math{\\frac{a < b @code{tex \\hbox{ code }}}{b}} ``}
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C12
   *normal_command@inlineraw C2 l10
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *elided_brace_command_arg C1
     {raw: raw <blink>html</blink> ``}
   {normal_text:, \\n}
   *normal_command@inlineraw C2 l11
   |format:{plaintext}
    *brace_arg C1
     {normal_text:plaintext}
    *elided_brace_command_arg C1
     {raw: raw plaintext ``}
   {normal_text:, \\n}
   *normal_command@inlineraw C2 l12
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *elided_brace_command_arg C1
     {raw: raw <para>xml</para> ``}
   {normal_text:,\\n}
   *normal_command@inlineraw C2 l13
   |format:{docbook}
    *brace_arg C1
     {normal_text:docbook}
    *elided_brace_command_arg C1
     {raw: raw <emphasis>docbook</emphasis> ``}
   {normal_text:, \\n}
   *normal_command@inlineraw C2 l14
   |expand_index:{1}
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *brace_arg C4
     {spaces_before_argument: }
     {normal_text:raw $\\underline}
     *balanced_braces C3 l14
      {normal_text:{a < b }
      *normal_command@code C1 l14
       *brace_container C2
        {normal_text:tex \\hbox}
        *balanced_braces C1 l14
         {normal_text:{ code }}
      {normal_text:}}
     {normal_text:$ ``}
   {normal_text:\\n}
   *normal_command@inlineraw C2 l15
   |format:{latex}
    *brace_arg C1
     {normal_text:latex}
    *elided_brace_command_arg C1
     {raw: raw $\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``}
   {normal_text:\\n}
';


$result_texis{'inline_expand_tex'} = '
@inlinefmt{html, <blink>html</blink> ``}, 
@inlinefmt{plaintext, plaintext ``}, 
@inlinefmt{xml, <para>xml</para> ``},
@inlinefmt{docbook, <emphasis>docbook</emphasis> ``}, 
@inlinefmt{tex, $\\underlinea < b @code{tex \\hbox code }}$ ``
@inlinefmt{latex, @math{\\frac{a < b @code{tex \\hbox{ code }}}{b}} ``}


@inlineraw{html, raw <blink>html</blink> ``}, 
@inlineraw{plaintext, raw plaintext ``}, 
@inlineraw{xml, raw <para>xml</para> ``},
@inlineraw{docbook, raw <emphasis>docbook</emphasis> ``}, 
@inlineraw{tex, raw $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
@inlineraw{latex, raw $\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``}
';


$result_texts{'inline_expand_tex'} = ', 
, 
,
, 
$\\underlinea < b tex \\hbox code $ "



, 
, 
,
, 
raw $\\underline{a < b tex \\hbox{ code }}$ ``

';

$result_errors{'inline_expand_tex'} = '* E l6|misplaced {
 misplaced {

* E l6|misplaced {
 misplaced {

* E l6|misplaced }
 misplaced }

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'inline_expand_tex'} = '';

$result_sections_list{'inline_expand_tex'} = '';

$result_sectioning_root{'inline_expand_tex'} = '';

$result_headings_list{'inline_expand_tex'} = '';


$result_converted{'plaintext'}->{'inline_expand_tex'} = ', , , , $\\underlinea < b ‘tex \\hbox code ’$ "

   , , , , raw $\\underline{a < b ‘tex \\hbox{ code }’}$ ``
';


$result_converted{'html_text'}->{'inline_expand_tex'} = '<p>, 
, 
,
, 
$\\underlinea &lt; b <code class="code">tex \\hbox code </code>$ &ldquo;

</p>

<p>, 
, 
,
, 
raw $\\underline{a < b <code class="code">tex \\hbox{ code }</code>}$ ``

</p>';


$result_converted{'xml'}->{'inline_expand_tex'} = '<preamblebeforebeginning>
</preamblebeforebeginning><para><inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent> &lt;blink&gt;html&lt;/blink&gt; ``</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>plaintext</inlinefmtformat><inlinefmtcontent> plaintext ``</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>xml</inlinefmtformat><inlinefmtcontent> &lt;para&gt;xml&lt;/para&gt; ``</inlinefmtcontent></inlinefmt>,
<inlinefmt><inlinefmtformat>docbook</inlinefmtformat><inlinefmtcontent> &lt;emphasis&gt;docbook&lt;/emphasis&gt; ``</inlinefmtcontent></inlinefmt>, 
 $\\underlinea &lt; b <code>tex \\hbox code </code>$ &textldquo;
<inlinefmt><inlinefmtformat>latex</inlinefmtformat><inlinefmtcontent> @math{\\frac{a &lt; b @code{tex \\hbox{ code }}}{b}} ``</inlinefmtcontent></inlinefmt>
</para>

<para><inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> raw &lt;blink&gt;html&lt;/blink&gt; ``</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent> raw plaintext ``</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>xml</inlinerawformat><inlinerawcontent> raw &lt;para&gt;xml&lt;/para&gt; ``</inlinerawcontent></inlineraw>,
<inlineraw><inlinerawformat>docbook</inlinerawformat><inlinerawcontent> raw &lt;emphasis&gt;docbook&lt;/emphasis&gt; ``</inlinerawcontent></inlineraw>, 
 raw $\\underline{a < b <code>tex \\hbox{ code }</code>}$ ``
<inlineraw><inlinerawformat>latex</inlinerawformat><inlinerawcontent> raw $\\frac{a &lt; b @code{tex \\hbox{ code }}}{b}$ ``</inlinerawcontent></inlineraw>
</para>';


$result_converted{'docbook'}->{'inline_expand_tex'} = '<para>, 
, 
,
, 
$\\underlinea &lt; b <literal>tex \\hbox code </literal>$ &#8220;

</para>

<para>, 
, 
,
, 
raw $\\underline{a < b <literal>tex \\hbox{ code }</literal>}$ ``

</para>';


$result_converted{'latex_text'}->{'inline_expand_tex'} = '\\begin{document}
, 
, 
,
, 
\\$\\textbackslash{}underlinea < b \\texttt{tex \\textbackslash{}hbox code }\\$ ``



, 
, 
,
, 
raw $\\underline{a < b \\texttt{tex \\hbox{ code }}}$ ``

';

1;
