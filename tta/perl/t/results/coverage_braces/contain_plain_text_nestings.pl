use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contain_plain_text_nestings'} = '*document_root C5
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
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chap}
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
 *@chapter C8 l5 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   {Text }
   *@w C1 l7
    *brace_container C2
     *@code C1 l7
      *brace_container C1
       {code in w}
     { text}
   {.\\n}
   *@hyphenation C1 l8
   |EXTRA
   |global_command_number:{1}
    *brace_arg C2
     *@code C1 l8
      *brace_container C1
       {code in hyphenation}
     { text}
   {spaces_after_close_brace:\\n}
   *@key C1 l9
    *brace_container C2
     *@code C1 l9
      *brace_container C1
       {code in key}
     { text}
   {\\n}
   *index_entry_command@cindex C1 l10
   |EXTRA
   |element_node:{chap}
   |index_entry:I{cp,1}
   |sortas:{ text}
    *line_arg C5
     {spaces_before_argument: }
     {ii}
     {spaces_at_end: }
     *@sortas C1 l10
      *brace_arg C2
       *@code C1 l10
        *brace_container C1
         {code in sortas}
       { text}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:no warning for @ref in @w}
    {spaces_after_argument:\\n}
  *paragraph C8
   {Text }
   *@w C1 l13
    *brace_container C2
     *@ref C2 l13
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
      |normalized:{Top}
       {Top}
      *brace_arg C2
       {spaces_before_argument: }
       {cross in w}
     { text}
   {.\\n}
   *@hyphenation C1 l14
   |EXTRA
   |global_command_number:{2}
    *brace_arg C2
     *@ref C2 l14
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
      |normalized:{Top}
       {Top}
      *brace_arg C2
       {spaces_before_argument: }
       {cross in hyphenation}
     { text}
   {spaces_after_close_brace:\\n}
   *@key C1 l15
    *brace_container C2
     *@ref C2 l15
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
      |normalized:{Top}
       {Top}
      *brace_arg C2
       {spaces_before_argument: }
       {cross in key}
     { text}
   {\\n}
   *index_entry_command@cindex C1 l16
   |EXTRA
   |element_node:{chap}
   |index_entry:I{cp,2}
   |sortas:{ text}
    *line_arg C5
     {spaces_before_argument: }
     {ii}
     {spaces_at_end: }
     *@sortas C1 l16
      *brace_arg C2
       *@ref C2 l16
        *brace_arg C1
        |EXTRA
        |node_content:A{0|0}
        |normalized:{Top}
         {Top}
        *brace_arg C2
         {spaces_before_argument: }
         {cross in sortas}
       { text}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l18
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {cp}
    {spaces_after_argument:\\n}
';


$result_texis{'contain_plain_text_nestings'} = '@node Top
@top top

@node chap
@chapter Chap

Text @w{@code{code in w} text}.
@hyphenation{@code{code in hyphenation} text}
@key{@code{code in key} text}
@cindex ii @sortas{@code{code in sortas} text}

@c no warning for @ref in @w
Text @w{@ref{Top, cross in w} text}.
@hyphenation{@ref{Top, cross in hyphenation} text}
@key{@ref{Top, cross in key} text}
@cindex ii @sortas{@ref{Top, cross in sortas} text}

@printindex cp
';


$result_texts{'contain_plain_text_nestings'} = 'top
***

1 Chap
******

Text code in w text.
code in key text

Text Top text.
Top text

';

$result_errors{'contain_plain_text_nestings'} = '* W l8|@code should not appear in @hyphenation
 warning: @code should not appear in @hyphenation

* W l9|@code should not appear in @key
 warning: @code should not appear in @key

* W l10|@code should not appear in @sortas
 warning: @code should not appear in @sortas

* W l13|@ref should not appear anywhere inside @w
 warning: @ref should not appear anywhere inside @w

* W l14|@ref should not appear in @hyphenation
 warning: @ref should not appear in @hyphenation

* W l15|@ref should not appear in @key
 warning: @ref should not appear in @key

* W l16|@ref should not appear in @sortas
 warning: @ref should not appear in @sortas

* W l16|@ref should not appear on @cindex line
 warning: @ref should not appear on @cindex line

';

$result_nodes_list{'contain_plain_text_nestings'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'contain_plain_text_nestings'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'contain_plain_text_nestings'} = 'level: -1
list:
 1|top
';

$result_headings_list{'contain_plain_text_nestings'} = '';

$result_indices_sort_strings{'contain_plain_text_nestings'} = 'cp:
  text
  text
';


$result_converted{'plaintext'}->{'contain_plain_text_nestings'} = 'top
***

1 Chap
******

Text ‘code in w’ text.  <‘code in key’ text>

   Text cross in w: Top text.  <cross in key: Top text>

* Menu:

* ii:                                    chap.                  (line 6)
* ii <1>:                                chap.                  (line 8)

';

$result_converted_sort_strings{'plaintext'}->{'contain_plain_text_nestings'} = 'cp:
  text
  text
';


$result_converted{'html_text'}->{'contain_plain_text_nestings'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p>Text <code class="code">code&nbsp;in&nbsp;w</code>&nbsp;text<!-- /@w -->.
<kbd class="key"><code class="code">code in key</code> text</kbd>
<a class="index-entry-id" id="index-ii"></a>
</p>
<p>Text <a class="ref" href="#Top">cross&nbsp;in&nbsp;w</a>&nbsp;text<!-- /@w -->.
<kbd class="key"><a class="ref" href="#Top">cross in key</a> text</kbd>
<a class="index-entry-id" id="index-ii-1"></a>
</p>
<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chap_cp_symbol-1"> </th></tr>
<tr><td class="printindex-index-entry"><a href="#index-ii">ii</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-ii-1">ii</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
</div>
</div>
';


$result_converted{'latex_text'}->{'contain_plain_text_nestings'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chap}%

Text \\hbox{\\texttt{code in w} text}.
\\hyphenation{\\texttt{code in hyphenation} text}\\texttt{\\texttt{code in key}\\ text}
\\index[cp]{ text@ii}%

Text \\hbox{\\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}} text}.
\\hyphenation{\\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}} text}\\texttt{\\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}\\ text}
\\index[cp]{ text@ii}%

\\printindex[cp]
';


$result_converted{'docbook'}->{'contain_plain_text_nestings'} = '<chapter label="1" id="chap">
<title>Chap</title>

<para>Text <literal>code&amp;#160;in&amp;#160;w</literal>&amp;#160;text<!-- /@w -->.
<keycap><literal>code in key</literal> text</keycap>
<indexterm role="cp"><primary>ii</primary></indexterm>
</para>
<!-- no warning for @ref in @w -->
<para>Text <link linkend="Top">cross&amp;#160;in&amp;#160;w</link>&amp;#160;text<!-- /@w -->.
<keycap><link linkend="Top">cross in key</link> text</keycap>
<indexterm role="cp"><primary>ii</primary></indexterm>
</para>
<index role="cp"></index>
</chapter>
';

1;
