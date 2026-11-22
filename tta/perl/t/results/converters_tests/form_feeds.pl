use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'form_feeds'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C2 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C40 l3 {chapnode}
 |identifier:{chap-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap\\fnode}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\f \\f\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:aa}
  {empty_line:\\f}
  *paragraph C1
   {normal_text:bb\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:cc }
  {empty_line:\\f}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:dd\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l11
    *brace_container C1
     {normal_text:end in code\\f}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l13
    *brace_container C1
     {normal_text:\\fbegin in code}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l15
    *brace_container C1
     {normal_text:middle\\f in code}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l17
  |identifier:{aa}
  |is_target:{1}
   *brace_arg C1
    {normal_text:aa}
  {spaces_after_close_brace:\\f}
  *paragraph C6
   {normal_text:something }
   *normal_command@email C2 l17
    *brace_arg C2
     {spaces_before_argument:\\f}
     {normal_text:aaa}
    *brace_arg C2
     {spaces_before_argument: \\f }
     {normal_text:fff}
   *normal_command@footnote C1 l17
   |global_command_number:{1}
    *brace_command_context C4
     {spaces_before_argument:\\n}
     {spaces_before_paragraph:\\f }
     *paragraph C1
      {normal_text:f1 }
     {empty_line:\\f}
   {normal_text: }
   *normal_command@footnote C1 l18
   |global_command_number:{2}
    *brace_command_context C4
     {spaces_before_argument: \\f }
     *paragraph C1
      {normal_text:gg}
     {empty_line:\\f}
     *paragraph C1
      {normal_text:jj}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l20
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{chap-node}
     {normal_text:chap\\fnode}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l22
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\f\\n}
   *preformatted C1
    {normal_text:in example\\n}
   *normal_command@end C1 l24
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l26
   *line_arg C3
    {spaces_before_argument: \\f }
    {normal_text:around center}
    {spaces_after_argument: \\f\\n}
  *normal_command@center C1 l27
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:in \\fcenter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@indicateurl C1 l29
    *brace_container C1
     {normal_text: \\f in indicateurl}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@deffn C4 l31
   *def_line C1 l31
   |def_command:{deffn}
   |element_node:{chap-node}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: \\f }
     *def_category C1
      *bracketed_arg C3 l31
       {spaces_before_argument: \\f}
       {normal_text:truc}
       {spaces_after_argument: }
     {spaces: }
     *def_name C1
      *bracketed_arg C3 l31
       {spaces_before_argument: }
       {normal_text:machin}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l31
       {spaces_before_argument: }
       {normal_text:bidule}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l31
       {spaces_before_argument: \\f }
       {normal_text:chose}
       {spaces_after_argument: \\f}
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l31
       {spaces_before_argument:  }
       {normal_text:arg}
       {spaces_after_argument:\\f }
     {spaces_after_argument: \\f\\n}
   *normal_command@deffnx C1 l32
   |def_command:{deffn}
   |element_node:{chap-node}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     {spaces_before_argument: \\f }
     *def_category C1
      *bracketed_arg C3 l32
       {spaces_before_argument: \\f}
       {normal_text:xtruc}
       {spaces_after_argument: }
     {spaces: }
     *def_name C1
      *bracketed_arg C3 l32
       {spaces_before_argument: }
       {normal_text:xmachin}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l32
       {spaces_before_argument: }
       {normal_text:xbidule}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l32
       {spaces_before_argument: \\f }
       {normal_text:xchose}
       {spaces_after_argument: \\f}
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l32
       {spaces_before_argument:  }
       {normal_text:xarg}
       {spaces_after_argument:\\f }
     {spaces_after_argument: \\f\\n}
   *def_item C1
    *paragraph C1
     {normal_text:T\\n}
   *normal_command@end C1 l34
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C9 l36
  |float_type:{}
  |global_command_number:{1}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:a float\\n}
   *normal_command@caption C1 l38
    *brace_command_context C6
     {spaces_before_argument:\\f }
     *paragraph C1
      {normal_text:within }
     {empty_line:\\f}
     {spaces_before_paragraph: }
     *paragraph C1
      {normal_text:cation }
     {empty_line:\\f}
   {spaces_after_close_brace: \\f }
   *paragraph C1
    {normal_text:Toto\\n}
   *normal_command@shortcaption C1 l39
    *brace_command_context C6
     {spaces_before_argument:\\f }
     *paragraph C1
      {normal_text:shc within }
     {empty_line:\\f}
     {spaces_before_paragraph: }
     *paragraph C1
      {normal_text:shortcaption }
     {empty_line:\\f}
   {spaces_after_close_brace: \\f }
   *paragraph C1
    {normal_text:After shc\\n}
   *normal_command@end C1 l40
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument: \\f\\n}
  {empty_line:\\n}
  *normal_command@float C3 l42
  |float_number:{1}
  |float_type:{type}
  |global_command_number:{2}
  |identifier:{fl}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:type}
     {spaces_after_argument: \\f}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:fl}
     {spaces_after_argument: \\f\\n}
   *paragraph C1
    {normal_text:in float\\n}
   *normal_command@end C1 l44
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l46
  |float_type:{type}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:type}
    {spaces_after_argument: \\f\\n}
  {empty_line:\\n}
';


$result_texis{'form_feeds'} = '@node Top

@node chapnode

 

aabb

cc  dd

@code{end in code}

@code{begin in code}

@code{middle in code}

@anchor{aa}something @email{aaa,  fff}@footnote{
 f1 } @footnote{  ggjj}.

@xref{chapnode}

@example 
in example
@end example

@center  around center 
@center in center

@indicateurl{  in indicateurl}

@deffn  { truc } { machin }  { bidule }  {  chose } {  arg } 
@deffnx  { xtruc } { xmachin }  { xbidule }  {  xchose } {  xarg } 
T
@end deffn

@float
a float
@caption{ within  cation }  Toto
@shortcaption{ shc within  shortcaption }  After shc
@end float 

@float type , fl 
in float
@end float

@listoffloats type 

';


$result_texts{'form_feeds'} = '

 

aabb

cc dd

end in code

begin in code

middle in code

something fff .

chapnode

in example

around center
in center

  in indicateurl

truc: machin bidule  chose arg
xtruc: xmachin xbidule  xchose xarg
T

a float
Toto
After shc

type, fl
in float


';

$result_errors{'form_feeds'} = '* W l3|node `chapnode\' not in menu
 warning: node `chapnode\' not in menu

';

$result_floats{'form_feeds'} = ': 1
 F
  S: shc within  shortcaption 
  C: within  cation 
type: 1
 F1: {fl}
';

$result_nodes_list{'form_feeds'} = '1|Top
 node_directions:
  next->chapnode
2|chapnode
 node_directions:
  prev->Top
';

$result_sections_list{'form_feeds'} = '';

$result_sectioning_root{'form_feeds'} = '';

$result_headings_list{'form_feeds'} = '';

$result_indices_sort_strings{'form_feeds'} = 'fn:
 machin
 xmachin
';


$result_converted{'plaintext'}->{'form_feeds'} = ' 

aa

   bb

   cc

   dd

   ‘end in code ’

   ‘ begin in code’

   ‘middle in code’

   something fff <aaa>(1) (2).

   See chap node

     in example

                             around center
                               in center

   ‘ in indicateurl’

 -- truc: machin bidule chose arg
 -- xtruc: xmachin xbidule xchose xarg
     T

a float
Toto
After shc

within

cation


in float

type 1

* Menu:

* type 1: fl.                            

   ---------- Footnotes ----------

   (1) f1


   (2) gg

   jj

';

$result_converted_sort_strings{'plaintext'}->{'form_feeds'} = 'fn:
 machin
 xmachin
';


$result_converted{'html_text'}->{'form_feeds'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<hr>
<h4 class="node" id="chap-node"><span>chap&#12;node<a class="copiable-link" href="#chap-node"> &para;</a></span></h4>

&#12; &#12;

<p>aa</p>&#12;<p>bb
</p>
<p>cc </p>&#12;<p>dd
</p>
<p><code class="code">end in code&#12;</code>
</p>
<p><code class="code">&#12;begin in code</code>
</p>
<p><code class="code">middle&#12; in code</code>
</p>
<a class="anchor" id="aa"></a><p>something <a class="email" href="mailto:aaa">fff</a><a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> <a class="footnote" id="DOCF2" href="#FOOT2"><sup>2</sup></a>.
</p>
<p>See <a class="xref" href="#chap-node">chap&#12;node</a>
</p>
<div class="example">
<pre class="example-preformatted">in example
</pre></div>

<div class="center">around center
</div><div class="center">in &#12;center
</div>
<p>&lsquo;<code class="indicateurl"> &#12; in indicateurl</code>&rsquo;
</p>
<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-machin"><span class="category-def">truc: </span><span><strong class="def-name">machin</strong> <var class="def-var-arguments">bidule  chose arg</var><a class="copiable-link" href="#index-machin"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-xmachin"><span class="category-def">xtruc: </span><span><strong class="def-name">xmachin</strong> <var class="def-var-arguments">xbidule  xchose xarg</var><a class="copiable-link" href="#index-xmachin"> &para;</a></span></dt>
<dd><p>T
</p></dd></dl>

<div class="float">
<p>a float
</p><p>Toto
</p><p>After shc
</p><div class="caption"><p>within </p>&#12;<p>cation </p>&#12;</div></div>
<div class="float" id="fl">
<p>in float
</p><div class="type-number-float"><p><strong class="strong">type 1</strong></p></div></div>
<dl class="listoffloats">
<dt><a href="#fl">type 1</a></dt><dd></dd>
</dl>

<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>f1 </p>&#12;
<h5 class="footnote-body-heading"><a id="FOOT2" href="#DOCF2">(2)</a></h5>
<p>gg</p>&#12;<p>jj</p>
</div>
';


$result_converted{'xml'}->{'form_feeds'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap&formfeed;node</nodenext></node>

<node identifier="chap-node"><nodename> chap&formfeed;node</nodename><nodeprev automatic="on"> Top</nodeprev></node>

&formfeed; &formfeed;

<para>aa</para>&formfeed;<para>bb
</para>
<para>cc </para>&formfeed; <para>dd
</para>
<para><code>end in code&formfeed;</code>
</para>
<para><code>&formfeed;begin in code</code>
</para>
<para><code>middle&formfeed; in code</code>
</para>
<anchor identifier="aa">aa</anchor>&formfeed;<para>something <email><emailaddress>&formfeed;aaa</emailaddress><emailname> &formfeed; fff</emailname></email><footnote>
&formfeed; <para>f1 </para>&formfeed;</footnote> <footnote> &formfeed; <para>gg</para>&formfeed;<para>jj</para></footnote>.
</para>
<para><xref label="chap-node"><xrefnodename>chap&formfeed;node</xrefnodename></xref>
</para>
<example endspaces=" "> &formfeed;
<pre xml:space="preserve">in example
</pre></example>

<center> &formfeed; around center &formfeed;</center>
<center> in &formfeed;center</center>

<para><indicateurl> &formfeed; in indicateurl</indicateurl>
</para>
<deffn endspaces=" "><definitionterm><indexterm index="fn" number="1"> machin </indexterm> &formfeed; <defcategory bracketed="on"> &formfeed;truc </defcategory> <deffunction bracketed="on"> machin </deffunction>  <defparam bracketed="on"> bidule </defparam>  <defparam bracketed="on"> &formfeed; chose &formfeed;</defparam> <defparam bracketed="on">  arg&formfeed; </defparam> &formfeed;</definitionterm>
<deffnx><definitionterm><indexterm index="fn" number="2"> xmachin </indexterm> &formfeed; <defcategory bracketed="on"> &formfeed;xtruc </defcategory> <deffunction bracketed="on"> xmachin </deffunction>  <defparam bracketed="on"> xbidule </defparam>  <defparam bracketed="on"> &formfeed; xchose &formfeed;</defparam> <defparam bracketed="on">  xarg&formfeed; </defparam> &formfeed;</definitionterm></deffnx>
<definitionitem><para>T
</para></definitionitem></deffn>

<float type="" endspaces=" ">
<para>a float
</para><caption>&formfeed; <para>within </para>&formfeed; <para>cation </para>&formfeed;</caption> &formfeed; <para>Toto
</para><shortcaption>&formfeed; <para>shc within </para>&formfeed; <para>shortcaption </para>&formfeed;</shortcaption> &formfeed; <para>After shc
</para></float> &formfeed;

<float identifier="fl" type="type" number="1" endspaces=" "><floattype> type &formfeed;</floattype><floatname> fl &formfeed;</floatname>
<para>in float
</para></float>

<listoffloats type="type"> type &formfeed;</listoffloats>

';


$result_converted{'docbook'}->{'form_feeds'} = '<anchor id="chap-node"/>

   

<para>aa</para> <para>bb
</para>
<para>cc </para> <para>dd
</para>
<para><literal>end in code </literal>
</para>
<para><literal> begin in code</literal>
</para>
<para><literal>middle  in code</literal>
</para>
<anchor id="aa"/><para>something <ulink url="mailto:aaa">fff</ulink><footnote><para>f1 </para> </footnote> <footnote><para>gg</para> <para>jj</para></footnote>.
</para>
<para>See <link linkend="chap-node">chap node</link>
</para>
<screen>in example
</screen>
<simpara role="center">around center</simpara>
<simpara role="center">in  center</simpara>

<para><literal>   in indicateurl</literal>
</para>
<synopsis><indexterm role="fn"><primary>machin</primary></indexterm><phrase role="category"><emphasis role="bold">truc</emphasis>:</phrase> <function>machin</function>  <emphasis role="arg">bidule</emphasis>  <emphasis role="arg">chose</emphasis> <emphasis role="arg">arg</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>xmachin</primary></indexterm><phrase role="category"><emphasis role="bold">xtruc</emphasis>:</phrase> <function>xmachin</function>  <emphasis role="arg">xbidule</emphasis>  <emphasis role="arg">xchose</emphasis> <emphasis role="arg">xarg</emphasis></synopsis>
<blockquote><para>T
</para></blockquote>
<para>a float
</para><para>Toto
</para><para>After shc
</para>
<anchor id="fl"/>
<para>in float
</para>

';


$result_converted{'latex_text'}->{'form_feeds'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap-node}%

\\par{}

aa\\par{}
bb

cc \\par{}
 dd

\\texttt{end in code}

\\texttt{begin in code}

\\texttt{middle in code}

\\label{anchor:aa}%
\\par{}something \\href{mailto:aaa}{fff}\\footnote{ f1 \\par{}
} \\footnote{gg\\par{}
jj}.

See \\hyperref[anchor:chap-node]{[chapnode], page~\\pageref*{anchor:chap-node}}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in example
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{center}
around center
\\end{center}
\\begin{center}
in center
\\end{center}

`\\texttt{\\  in indicateurl}\'


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{machin \\EmbracOn{}\\textnormal{\\textsl{bidule  chose arg}}\\EmbracOff{}}& [truc]
\\end{tabularx}

\\index[fn]{machin@\\texttt{machin}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{xmachin \\EmbracOn{}\\textnormal{\\textsl{xbidule  xchose xarg}}\\EmbracOff{}}& [xtruc]
\\end{tabularx}

\\index[fn]{xmachin@\\texttt{xmachin}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
T
\\end{Texinfoindented}

\\begin{TexinfoFloat}
a float
\\caption[shc within \\par{}
 shortcaption \\par{}
]{within \\par{}
 cation \\par{}
}
\\par{}Toto
\\par{}After shc
\\end{TexinfoFloat}

\\begin{TexinfoFloattype}
in float
\\label{anchor:fl}%
\\end{TexinfoFloattype}

\\listof{TexinfoFloattype}{}

';

1;
