use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_in_sc'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {commands in sc}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {commands in sc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C3 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   *@sc C1 l7
    *brace_container C38
     {a }
     *@~ C1 l7
      *following_arg C1
       {n}
     { }
     *@aa C1 l7
      *brace_container
     { }
     *@TeX C1 l7
      *brace_container
     { }
     *@image C1 l7
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {myimage}
     { }
     *@ref C1 l7
      *brace_arg C1
      |EXTRA
      |node_content:{chap}
      |normalized:{chap}
       {chap}
     { }
     *@xref C1 l7
      *brace_arg C1
      |EXTRA
      |node_content:{(f)node}
      |normalized:{_0028f_0029node}
       {(f)node}
     {\\n}
     *@ref C4 l8
      *brace_arg C1
      |EXTRA
      |node_content:{ext}
       {ext}
      *brace_arg
      *brace_arg C1
       {name}
      *brace_arg C1
       {argf}
     { }
     *@inlinefmtifelse C3 l8
     |EXTRA
     |expand_index:{2}
     |format:{latex}
      *brace_arg C1
       {latex}
      *elided_brace_command_arg C1
       {raw:}
      *brace_arg C1
       *@verb C1 l8
       |INFO
       |delimiter:{!}
        *brace_container C1
         {raw:inverb}
     { }
     *@anchor C1 l8
     |EXTRA
     |identifier:{inanchor}
     |is_target:{1}
      *brace_arg C1
       {inanchor}
     {spaces_after_close_brace: }
     *@hyphenation C1 l8
     |EXTRA
     |global_command_number:{1}
      *brace_arg C1
       {hyphena-te}
     {spaces_after_close_brace:\\n}
     *@U C1 l9
      *brace_arg C1
       {00ff}
     { }
     *@math C1 l9
      *brace_arg C1
       {ma+th}
     { }
     *@footnote C1 l9
     |EXTRA
     |global_command_number:{1}
      *brace_command_context C1
       *paragraph C1
        {infootnote}
     { }
     *@url C1 l9
      *brace_arg C1
       {la}
     { }
     *@url C2 l9
      *brace_arg C1
       {a}
      *brace_arg C1
       {b}
     { }
     *@url C2 l9
      *brace_arg C1
       {spaces_before_argument: }
      *brace_arg C1
       {lb}
     {\\n}
     *@url C3 l10
      *brace_arg
      *brace_arg
      *brace_arg C1
       {c}
     { }
     *@email C2 l10
      *brace_arg C3
       {a}
       *@@
       {c}
      *brace_arg C2
       {spaces_before_argument: }
       {e}
     { }
     *@abbr C2 l10
      *brace_arg C1
       {ab}
      *brace_arg C2
       {spaces_before_argument: }
       {d}
';


$result_texis{'commands_in_sc'} = '@node Top
@top commands in sc

@node chap
@chapter chap

@sc{a @~n @aa{} @TeX{} @image{myimage} @ref{chap} @xref{(f)node}
@ref{ext,,name,argf} @inlinefmtifelse{latex,,@verb{!inverb!}} @anchor{inanchor} @hyphenation{hyphena-te}
@U{00ff} @math{ma+th} @footnote{infootnote} @url{la} @url{a,b} @url{ ,lb}
@url{,,c} @email{a@@c, e} @abbr{ab, d}}';


$result_texts{'commands_in_sc'} = 'commands in sc
**************

1 chap
******

A N~ AA TeX MYIMAGE CHAP (F)NODE
EXT inverb U+00ff MA+TH  LA A (B)  (LB)
C E AB (D)';

$result_errors{'commands_in_sc'} = '* E l7|@xref reference to nonexistent node `(f)node\'
 @xref reference to nonexistent node `(f)node\'

';

$result_nodes_list{'commands_in_sc'} = '1|Top
 associated_section: commands in sc
 associated_title_command: commands in sc
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'commands_in_sc'} = '1|commands in sc
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->commands in sc
 toplevel_directions:
  prev->commands in sc
  up->commands in sc
';

$result_sectioning_root{'commands_in_sc'} = 'level: -1
list:
 1|commands in sc
';

$result_headings_list{'commands_in_sc'} = '';


$result_converted{'plaintext'}->{'commands_in_sc'} = 'commands in sc
**************

1 chap
******

A Ñ Å TeX [myimage] chap SEE (f)node NAME: (argf)ext inverb ÿ MA+TH (1) <la> B
(a) LB c E <a@c> AB (D)

   ---------- Footnotes ----------

   (1) infootnote

';

$result_converted_errors{'plaintext'}->{'commands_in_sc'} = '* W l7|could not find @image file `myimage.txt\' nor alternate text
 warning: could not find @image file `myimage.txt\' nor alternate text

';


$result_converted{'html_text'}->{'commands_in_sc'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="commands-in-sc"><span>commands in sc<a class="copiable-link" href="#commands-in-sc"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<p><small class="sc">A &Ntilde; &Aring; TeX <img class="image" src="myimage.jpg" alt="myimage"> <a class="ref" href="#chap">chap</a> SEE &lsquo;(F)NODE&rsquo;
<a data-manual="argf" href="argf.html#ext">NAME</a> <code class="verb">INVERB</code> <a class="anchor" id="inanchor"></a>&#x00FF; <em class="math">ma+th</em> <a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> <a class="url" href="la">la</a> <a class="url" href="a">B</a> LB
C <a class="email" href="mailto:a@c">E</a> <abbr class="abbr" title="d">AB</abbr> (D)</small></p></div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>infootnote</p>
</div>
';

$result_converted_errors{'html_text'}->{'commands_in_sc'} = '* W l7|@image file `myimage\' (for HTML) not found, using `myimage.jpg\'
 warning: @image file `myimage\' (for HTML) not found, using `myimage.jpg\'

';


$result_converted{'xml'}->{'commands_in_sc'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> commands in sc</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<para><sc>a <accent type="tilde" bracketed="off">n</accent> &aring; &tex; <image where="inline"><imagefile>myimage</imagefile></image> <ref label="chap"><xrefnodename>chap</xrefnodename></ref> <xref label="_0028f_0029node"><xrefnodename>(f)node</xrefnodename></xref>
<ref label="ext" manual="argf"><xrefnodename>ext</xrefnodename><xrefprinteddesc>name</xrefprinteddesc><xrefinfofile>argf</xrefinfofile></ref> <inlinefmtifelse><inlinefmtifelseformat>latex</inlinefmtifelseformat><inlinefmtifelsecontentelse><verb delimiter="!">inverb</verb></inlinefmtifelsecontentelse></inlinefmtifelse> <anchor identifier="inanchor">inanchor</anchor> <hyphenation>hyphena-te</hyphenation>
<U>00ff</U> <math>ma+th</math> <footnote><para>infootnote</para></footnote> <url><urefurl>la</urefurl></url> <url><urefurl>a</urefurl><urefdesc>b</urefdesc></url> <url><urefurl> </urefurl><urefdesc>lb</urefdesc></url>
<url><urefreplacement>c</urefreplacement></url> <email><emailaddress>a&arobase;c</emailaddress><emailname> e</emailname></email> <abbr><abbrword>ab</abbrword><abbrdesc> d</abbrdesc></abbr></sc></para></chapter>
';


$result_converted{'docbook'}->{'commands_in_sc'} = '<chapter label="1" id="chap">
<title>chap</title>

<para>A &#209; &#197; &tex; <inlinemediaobject><imageobject><imagedata fileref="myimage.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject> <link linkend="chap">chap</link> See <link linkend="_0028f_0029node">(f)node</link>
section &#8220;NAME&#8221; in <filename>argf</filename> <literal>INVERB</literal> <anchor id="inanchor"/>&#x00ff; <inlineequation><mathphrase>ma+th</mathphrase></inlineequation> <footnote><para>infootnote</para></footnote> <ulink url="la">la</ulink> <ulink url="a">B</ulink> <ulink url="">LB</ulink>
<ulink url="">C</ulink> <ulink url="mailto:a@c">E</ulink> <abbrev>AB</abbrev> (D)</para></chapter>
';

$result_converted_errors{'docbook'}->{'commands_in_sc'} = '* W l7|@image file `myimage\' not found, using `myimage.jpg\'
 warning: @image file `myimage\' not found, using `myimage.jpg\'

';


$result_converted{'latex_text'}->{'commands_in_sc'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

\\textsc{a \\~{n} \\aa{} \\TeX{} \\includegraphics{myimage} \\hyperref[anchor:chap]{\\chaptername~\\ref*{anchor:chap} [chap], page~\\pageref*{anchor:chap}} See (f)node
Section ``name\'\' in \\texttt{argf}  \\label{anchor:inanchor}%
\\hyphenation{hyphena-te}ÿ $ma+th$ \\footnote{infootnote} \\url{la} \\href{a}{b (\\nolinkurl{a})} lb
c \\href{mailto:a@c}{e} ab (d)}';

$result_converted_errors{'latex_text'}->{'commands_in_sc'} = '* W l7|@image file `myimage\' (for LaTeX) not found
 warning: @image file `myimage\' (for LaTeX) not found

';


$result_converted{'info'}->{'commands_in_sc'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

commands in sc
**************

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 chap
******

A Ñ Å TeX [myimage] *note chap:: *Note (f)node:: *note NAME: (argf)ext. inverb
ÿ MA+TH (1) <la> B (a) LB c E <a@c> AB (D)

   ---------- Footnotes ----------

   (1) infootnote


Tag Table:
Node: Top27
Node: chap124
Ref: inanchor264
Ref: chap-Footnote-1346

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'commands_in_sc'} = '* W l7|could not find @image file `myimage.txt\' nor alternate text
 warning: could not find @image file `myimage.txt\' nor alternate text

';

1;
