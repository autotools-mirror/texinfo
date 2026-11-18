use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'at_commands_in_raw'} = '*document_root C5
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
 *@top C4 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l4
  |EXTRA
  |formal_args:A{}
  |macro_name:{othermacro}
   *arguments_line C1
    {macro_line: othermacro{}\\n}
   {raw:Other macro\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l8 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C36 l9 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@html C3 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *rawpreformatted C5
    {<b>in b}
    *@footnote C1 l12
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {in footnote}
    {.</b>\\n}
    *@anchor C1 l13
    |EXTRA
    |identifier:{anchor-in-html}
    |is_target:{1}
     *brace_arg C1
      {anchor in html}
    {spaces_after_close_brace:\\n}
   *@end C1 l14
   |EXTRA
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {html}
     {spaces_after_argument:\\n}
  *paragraph C3
   *@kbd C1 l15
    *brace_container C1
     {in kbd before tex}
   *@footnote C1 l15
   |EXTRA
   |global_command_number:{2}
    *brace_command_context C1
     *paragraph C1
      {second footnote}
   {.\\n}
  {empty_line:\\n}
  *@tex C3 l17
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *elided_rawpreformatted C43
    {raw:@kbdinputstyle code\\n}
    {raw:in tex@footnote{footnote in tex}\\n}
    {raw:@anchor{anchor in tex}\\n}
    {raw:@cindex entry\\n}
    {raw:@findex fentry1\\n}
    {raw:\\n}
    {raw:@float Figs, f1\\n}
    {raw:Float\\n}
    {raw:@caption{Fcaption}\\n}
    {raw:@end float\\n}
    {raw:\\n}
    {raw:@menu\\n}
    {raw:* n::\\n}
    {raw:@end menu\\n}
    {raw:\\n}
    {raw:@acronym{FF, Fi Foo}\\n}
    {raw:\\n}
    {raw:@synindex cp fn\\n}
    {raw:\\n}
    {raw:@defindex new\\n}
    {raw:\\n}
    {raw:@definfoenclose a,:,:\\n}
    {raw:\\n}
    {raw:@alias moviecite = cite\\n}
    {raw:\\n}
    {raw:@documentlanguage fr\\n}
    {raw:\\n}
    {raw:@errormsg{mymsg}\\n}
    {raw:\\n}
    {raw:@ref{Somewhere}.\\n}
    {raw:\\n}
    {raw:@set flag soemthing\\n}
    {raw:\\n}
    {raw:@macro mymacro{}\\n}
    {raw:truc\\n}
    {raw:@end macro\\n}
    {raw:\\n}
    {raw:@macro macroarg{arg}\\n}
    {raw:Some \\arg\\.\\n}
    {raw:@end macro\\n}
    {raw:\\n}
    {raw:@unmacro othermacro\\n}
    {raw:\\n}
   *@end C1 l61
   |EXTRA
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument: }
     {tex}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *@value C1
   *brace_container C1
    {flag}
  *paragraph C1
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@kbd C1 l67
    *brace_container C1
     {in kbd after tex}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l69
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{anchor-in-html}
     {anchor in html}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   *@ref C1 l71
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{anchor-in-tex}
     {anchor in tex}
   {.\\n}
   *index_entry_command@findex C1 l72
   |EXTRA
   |element_node:{chap}
   |index_entry:I{fn,1}
    *line_arg C3
     {spaces_before_argument: }
     {fentry2}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {newidx entry\\n}
  {empty_line:\\n}
  *@printindex C1 l76
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
  *@printindex C1 l77
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@listoffloats C1 l79
  |EXTRA
  |float_type:{Figs}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {Figs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@acronym C1 l81
    *brace_arg C1
     {FF}
   {.\\n}
  {empty_line:\\n}
  *paragraph C1
   {tt.\\n}
  {empty_line:\\n}
  *paragraph C1
   {movie name\\n}
  {empty_line:\\n}
  *paragraph C1
   {Macro not unmacroed Other macro.\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:20>
    >*macro_call@othermacro C1
     >*brace_arg
   >macro_expansion<end;1><p:31>
  {empty_line:\\n}
  *paragraph C1
   {Macros that should not be defined: . with arg.\\n}
  {empty_line:\\n}
';


$result_texis{'at_commands_in_raw'} = '@node Top
@top top

@macro othermacro{}
Other macro
@end macro

@node chap
@chapter Chapter

@html
<b>in b@footnote{in footnote}.</b>
@anchor{anchor in html}
@end html
@kbd{in kbd before tex}@footnote{second footnote}.

@tex
@kbdinputstyle code
in tex@footnote{footnote in tex}
@anchor{anchor in tex}
@cindex entry
@findex fentry1

@float Figs, f1
Float
@caption{Fcaption}
@end float

@menu
* n::
@end menu

@acronym{FF, Fi Foo}

@synindex cp fn

@defindex new

@definfoenclose a,:,:

@alias moviecite = cite

@documentlanguage fr

@errormsg{mymsg}

@ref{Somewhere}.

@set flag soemthing

@macro mymacro{}
truc
@end macro

@macro macroarg{arg}
Some \\arg\\.
@end macro

@unmacro othermacro

@end tex



@value{flag}.

@kbd{in kbd after tex}.

@xref{anchor in html}.

@ref{anchor in tex}.
@findex fentry2

 newidx entry

@printindex cp
@printindex fn

@listoffloats Figs

@acronym{FF}.

tt.

movie name

Macro not unmacroed Other macro.

Macros that should not be defined: . with arg.

';


$result_texts{'at_commands_in_raw'} = 'top
***


1 Chapter
*********

<b>in b.</b>
in kbd before tex.




flag.

in kbd after tex.

anchor in html.

anchor in tex.

newidx entry



FF.

tt.

movie name

Macro not unmacroed Other macro.

Macros that should not be defined: . with arg.

';

$result_errors{'at_commands_in_raw'} = '* W l65|undefined flag: flag
 warning: undefined flag: flag

* E l74|unknown command `newindex\'
 unknown command `newindex\'

* E l83|unknown command `a\'
 unknown command `a\'

* E l83|misplaced {
 misplaced {

* E l83|misplaced }
 misplaced }

* E l85|unknown command `moviecite\'
 unknown command `moviecite\'

* E l85|misplaced {
 misplaced {

* E l85|misplaced }
 misplaced }

* E l89|unknown command `mymacro\'
 unknown command `mymacro\'

* E l89|misplaced {
 misplaced {

* E l89|misplaced }
 misplaced }

* E l89|unknown command `macroarg\'
 unknown command `macroarg\'

* E l89|misplaced {
 misplaced {

* E l89|misplaced }
 misplaced }

* E l71|@ref reference to nonexistent node `anchor in tex\'
 @ref reference to nonexistent node `anchor in tex\'

';

$result_nodes_list{'at_commands_in_raw'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'at_commands_in_raw'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'at_commands_in_raw'} = 'level: -1
list:
 1|top
';

$result_headings_list{'at_commands_in_raw'} = '';

$result_indices_sort_strings{'at_commands_in_raw'} = 'fn:
 fentry2
';


$result_converted{'plaintext'}->{'at_commands_in_raw'} = 'top
***

1 Chapter
*********

<b>in b(1).</b>
   ‘in kbd before tex’(2).

   {No value for \'flag\'}
   .

   ‘in kbd after tex’.

   See anchor in html.

   anchor in tex.

   newidx entry

* Menu:

* fentry2:                               chap.                 (line 16)

   FF.

   tt.

   movie name

   Macro not unmacroed Other macro.

   Macros that should not be defined: .  with arg.

   ---------- Footnotes ----------

   (1) in footnote

   (2) second footnote

';

$result_converted_sort_strings{'plaintext'}->{'at_commands_in_raw'} = 'fn:
 fentry2
';


$result_converted{'html_text'}->{'at_commands_in_raw'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<b>in b<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.</b>
<a class="anchor" id="anchor-in-html"></a><p><kbd class="kbd">in kbd before tex</kbd><a class="footnote" id="DOCF2" href="#FOOT2"><sup>2</sup></a>.
</p>



{No value for &lsquo;flag&rsquo;}<p>.
</p>
<p><kbd class="kbd">in kbd after tex</kbd>.
</p>
<p>See <a class="xref" href="#anchor-in-html">anchor in html</a>.
</p>
<p>&lsquo;anchor in tex&rsquo;.
<a class="index-entry-id" id="index-fentry2"></a>
</p>
<p>newidx entry
</p>
<div class="printindex fn-printindex">
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-fentry2"><code>fentry2</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>


<p><abbr class="acronym">FF</abbr>.
</p>
<p>tt.
</p>
<p>movie name
</p>
<p>Macro not unmacroed Other macro.
</p>
<p>Macros that should not be defined: . with arg.
</p>
</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote</p>
<h5 class="footnote-body-heading"><a id="FOOT2" href="#DOCF2">(2)</a></h5>
<p>second footnote</p>
</div>
';


$result_converted{'xml'}->{'at_commands_in_raw'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<macro name="othermacro" line=" othermacro{}" endspaces=" ">
Other macro
</macro>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<b>in b<footnote><para>in footnote</para></footnote>.</b>
<anchor identifier="anchor-in-html">anchor in html</anchor>
<para><kbd>in kbd before tex</kbd><footnote><para>second footnote</para></footnote>.
</para>
<tex endspaces=" ">
@kbdinputstyle code
in tex@footnote{footnote in tex}
@anchor{anchor in tex}
@cindex entry
@findex fentry1

@float Figs, f1
Float
@caption{Fcaption}
@end float

@menu
* n::
@end menu

@acronym{FF, Fi Foo}

@synindex cp fn

@defindex new

@definfoenclose a,:,:

@alias moviecite = cite

@documentlanguage fr

@errormsg{mymsg}

@ref{Somewhere}.

@set flag soemthing

@macro mymacro{}
truc
@end macro

@macro macroarg{arg}
Some \\arg\\.
@end macro

@unmacro othermacro

</tex>



<para>.
</para>
<para><kbd>in kbd after tex</kbd>.
</para>
<para><xref label="anchor-in-html"><xrefnodename>anchor in html</xrefnodename></xref>.
</para>
<para><ref label="anchor-in-tex"><xrefnodename>anchor in tex</xrefnodename></ref>.
<findex index="fn"> <indexterm index="fn" number="1">fentry2</indexterm></findex>
</para>
 <para>newidx entry
</para>
<printindex value="cp" line=" cp"></printindex>
<printindex value="fn" line=" fn"></printindex>

<listoffloats type="Figs"> Figs</listoffloats>

<para><acronym><acronymword>FF</acronymword></acronym>.
</para>
<para>tt.
</para>
<para>movie name
</para>
<para>Macro not unmacroed Other macro.
</para>
<para>Macros that should not be defined: . with arg.
</para>
</chapter>
';


$result_converted{'docbook'}->{'at_commands_in_raw'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<b>in b<footnote><para>in footnote</para></footnote>.</b>
<anchor id="anchor-in-html"/><para><userinput>in kbd before tex</userinput><footnote><para>second footnote</para></footnote>.
</para>



<para>.
</para>
<para><userinput>in kbd after tex</userinput>.
</para>
<para>See <link linkend="anchor-in-html">anchor in html</link>.
</para>
<para><link linkend="anchor-in-tex">anchor in tex</link>.
<indexterm role="fn"><primary>fentry2</primary></indexterm>
</para>
<para>newidx entry
</para>
<index role="cp"></index>
<index role="fn"></index>


<para><acronym>FF</acronym>.
</para>
<para>tt.
</para>
<para>movie name
</para>
<para>Macro not unmacroed Other macro.
</para>
<para>Macros that should not be defined: . with arg.
</para>
</chapter>
';


$result_converted{'latex_text'}->{'at_commands_in_raw'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

<b>in b\\footnote{in footnote}.</b>
\\label{anchor:anchor-in-html}%
\\Texinfocommandstyletextkbd{in kbd before tex}\\footnote{second footnote}.




\\{No value for `flag\'\\}.

\\Texinfocommandstyletextkbd{in kbd after tex}.

See \\hyperref[anchor:anchor-in-html]{[anchor in html], page~\\pageref*{anchor:anchor-in-html}}.

anchor in tex.
\\index[fn]{fentry2@\\texttt{fentry2}}%

 newidx entry

\\printindex[fn]


FF.

tt.

movie name

Macro not unmacroed Other macro.

Macros that should not be defined: . with arg.

';

1;
