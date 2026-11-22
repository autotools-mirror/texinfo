use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inline'} = '*document_root C1
 *before_node_section C6
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C12
   *normal_command@inlinefmt C2 l2
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:<blink>html</blink> ``}
   {normal_text:, \\n}
   *normal_command@inlinefmt C2 l3
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {normal_text:plaintext}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:plaintext ``}
   {normal_text:, \\n}
   *normal_command@inlinefmt C2 l4
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *elided_brace_command_arg C1
     {raw: <para>xml</para> ``}
   {normal_text:,\\n}
   *normal_command@inlinefmt C2 l5
   |expand_index:{1}
   |format:{docbook}
    *brace_arg C1
     {normal_text:docbook}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:<emphasis>docbook</emphasis> ``}
   {normal_text:, \\n}
   *normal_command@inlinefmt C2 l6
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *elided_brace_command_arg C1
     {raw: $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
   {normal_text:\\n}
   *normal_command@inlinefmt C2 l7
   |expand_index:{1}
   |format:{latex}
    *brace_arg C1
     {normal_text:latex}
    *brace_arg C3
     {spaces_before_argument: }
     *normal_command@math C1 l7
      *brace_arg C3
       {normal_text:\\frac}
       *balanced_braces C3 l7
        {normal_text:{a < b }
        *normal_command@code C1 l7
         *brace_container C2
          {normal_text:tex \\hbox}
          *balanced_braces C1 l7
           {normal_text:{ code }}
        {normal_text:}}
       *balanced_braces C1 l7
        {normal_text:{b}}
     {normal_text: ``}
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C12
   *normal_command@inlineraw C2 l10
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:raw <blink>html</blink> ``}
   {normal_text:, \\n}
   *normal_command@inlineraw C2 l11
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {normal_text:plaintext}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:raw plaintext ``}
   {normal_text:, \\n}
   *normal_command@inlineraw C2 l12
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *elided_brace_command_arg C1
     {raw: raw <para>xml</para> ``}
   {normal_text:,\\n}
   *normal_command@inlineraw C2 l13
   |expand_index:{1}
   |format:{docbook}
    *brace_arg C1
     {normal_text:docbook}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:raw <emphasis>docbook</emphasis> ``}
   {normal_text:, \\n}
   *normal_command@inlineraw C2 l14
   |format:{tex}
    *brace_arg C1
     {normal_text:tex}
    *elided_brace_command_arg C1
     {raw: raw $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
   {normal_text:\\n}
   *normal_command@inlineraw C2 l15
   |expand_index:{1}
   |format:{latex}
    *brace_arg C1
     {normal_text:latex}
    *brace_arg C5
     {spaces_before_argument: }
     {normal_text:raw $\\frac}
     *balanced_braces C3 l15
      {normal_text:{a < b }
      *normal_command@code C1 l15
       *brace_container C2
        {normal_text:tex \\hbox}
        *balanced_braces C1 l15
         {normal_text:{ code }}
      {normal_text:}}
     *balanced_braces C1 l15
      {normal_text:{b}}
     {normal_text:$ ``}
   {normal_text:\\n}
';


$result_texis{'inline'} = '
@inlinefmt{html, <blink>html</blink> ``}, 
@inlinefmt{plaintext, plaintext ``}, 
@inlinefmt{xml, <para>xml</para> ``},
@inlinefmt{docbook, <emphasis>docbook</emphasis> ``}, 
@inlinefmt{tex, $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
@inlinefmt{latex, @math{\\frac{a < b @code{tex \\hbox{ code }}}{b}} ``}


@inlineraw{html, raw <blink>html</blink> ``}, 
@inlineraw{plaintext, raw plaintext ``}, 
@inlineraw{xml, raw <para>xml</para> ``},
@inlineraw{docbook, raw <emphasis>docbook</emphasis> ``}, 
@inlineraw{tex, raw $\\underline{a < b @code{tex \\hbox{ code }}}$ ``}
@inlineraw{latex, raw $\\frac{a < b @code{tex \\hbox{ code }}}{b}$ ``}
';


$result_texts{'inline'} = '<blink>html</blink> ", 
plaintext ", 
,
<emphasis>docbook</emphasis> ", 

\\frac{a < b tex \\hbox{ code }}{b} "


raw <blink>html</blink> ``, 
raw plaintext ``, 
,
raw <emphasis>docbook</emphasis> ``, 

raw $\\frac{a < b tex \\hbox{ code }}{b}$ ``
';

$result_errors{'inline'} = '';

$result_nodes_list{'inline'} = '';

$result_sections_list{'inline'} = '';

$result_sectioning_root{'inline'} = '';

$result_headings_list{'inline'} = '';


$result_converted{'plaintext'}->{'inline'} = ', plaintext ", , ,

   , raw plaintext ``, , ,
';


$result_converted{'html_text'}->{'inline'} = '<p>&lt;blink&gt;html&lt;/blink&gt; &ldquo;, 
, 
,
, 


</p>

<p>raw <blink>html</blink> ``, 
, 
,
, 


</p>';


$result_converted{'xml'}->{'inline'} = '<preamblebeforebeginning>
</preamblebeforebeginning><para><inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent> &lt;blink&gt;html&lt;/blink&gt; &textldquo;</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>plaintext</inlinefmtformat><inlinefmtcontent> plaintext &textldquo;</inlinefmtcontent></inlinefmt>, 
 &lt;para&gt;xml&lt;/para&gt; ``,
<inlinefmt><inlinefmtformat>docbook</inlinefmtformat><inlinefmtcontent> &lt;emphasis&gt;docbook&lt;/emphasis&gt; &textldquo;</inlinefmtcontent></inlinefmt>, 
<inlinefmt><inlinefmtformat>tex</inlinefmtformat><inlinefmtcontent> $\\underline{a &lt; b @code{tex \\hbox{ code }}}$ ``</inlinefmtcontent></inlinefmt>
<inlinefmt><inlinefmtformat>latex</inlinefmtformat><inlinefmtcontent> <math>\\frac{a &lt; b <code>tex \\hbox{ code }</code>}{b}</math> &textldquo;</inlinefmtcontent></inlinefmt>
</para>

<para><inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> raw &lt;blink&gt;html&lt;/blink&gt; &textldquo;</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent> raw plaintext &textldquo;</inlinerawcontent></inlineraw>, 
 raw <para>xml</para> ``,
<inlineraw><inlinerawformat>docbook</inlinerawformat><inlinerawcontent> raw &lt;emphasis&gt;docbook&lt;/emphasis&gt; &textldquo;</inlinerawcontent></inlineraw>, 
<inlineraw><inlinerawformat>tex</inlinerawformat><inlinerawcontent> raw $\\underline{a &lt; b @code{tex \\hbox{ code }}}$ ``</inlinerawcontent></inlineraw>
<inlineraw><inlinerawformat>latex</inlinerawformat><inlinerawcontent> raw $\\frac{a &lt; b <code>tex \\hbox{ code }</code>}{b}$ &textldquo;</inlinerawcontent></inlineraw>
</para>';


$result_converted{'docbook'}->{'inline'} = '<para>, 
, 
,
&lt;emphasis&gt;docbook&lt;/emphasis&gt; &#8220;, 


</para>

<para>, 
, 
,
raw <emphasis>docbook</emphasis> ``, 


</para>';


$result_converted{'latex_text'}->{'inline'} = '\\begin{document}
, 
, 
,
, 

$\\frac{a < b \\mathtt{tex \\hbox{ code }}}{b}$ ``


, 
, 
,
, 

raw $\\frac{a < b \\texttt{tex \\hbox{ code }}}{b}$ ``
';

1;
