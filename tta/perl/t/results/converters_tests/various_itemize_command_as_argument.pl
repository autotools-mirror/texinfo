use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'various_itemize_command_as_argument'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C16 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l7
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@inlineraw l7
     {spaces_after_argument:\\n}
   *normal_command@item C2 l8
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:Inlineraw\\n}
   *normal_command@end C1 l9
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 l11
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@image l11
     {spaces_after_argument:\\n}
   *normal_command@item C2 l12
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:Image\\n}
   *normal_command@item C2 l13
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:Second\\n}
   *normal_command@end C1 l14
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 l16
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@footnote l16
     {spaces_after_argument:\\n}
   *normal_command@item C2 l17
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aa\\n}
   *normal_command@item C5 l18
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {normal_text:F2\\n}
     {normal_text:aa\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:T\\n}
    {empty_line:\\n}
   *normal_command@end C1 l23
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l25
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@caption l25
     {spaces_after_argument:\\n}
   *normal_command@item C2 l26
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:Caption\\n}
   *normal_command@end C1 l27
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 l29
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@math l29
     {spaces_after_argument:\\n}
   *normal_command@item C2 l30
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:a + b\\n}
   *normal_command@item C5 l31
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:a}
     *normal_command@sup C1 l31
      *brace_container C1
       {normal_text:c}
     {normal_text:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:2\\n}
    {empty_line:\\n}
   *normal_command@end C1 l35
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 l37
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@anchor l37
     {spaces_after_argument:\\n}
   *normal_command@item C2 l38
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:anchor 1\\n}
   *normal_command@item C2 l39
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:anchor 2\\n}
   *normal_command@end C1 l40
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l42
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@verb l42
     {spaces_after_argument:\\n}
   *normal_command@item C2 l43
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text::uu:\\n}
   *normal_command@end C1 l44
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'various_itemize_command_as_argument'} = '@node Top
@top top

@node chap
@chapter Chap

@itemize @inlineraw
@item Inlineraw
@end itemize

@itemize @image
@item Image
@item Second
@end itemize

@itemize @footnote
@item aa
@item F2
aa

T

@end itemize

@itemize @caption
@item Caption
@end itemize

@itemize @math
@item a + b
@item a@sup{c}

2

@end itemize

@itemize @anchor
@item anchor 1
@item anchor 2
@end itemize

@itemize @verb
@item :uu:
@end itemize

';


$result_texts{'various_itemize_command_as_argument'} = 'top
***

1 Chap
******

Inlineraw

Image
Second

aa
F2
aa

T


Caption

a + b
ac

2


anchor 1
anchor 2

:uu:

';

$result_errors{'various_itemize_command_as_argument'} = '* W l7|@inlineraw expected braces
 warning: @inlineraw expected braces

* W l11|@image expected braces
 warning: @image expected braces

* W l16|@footnote should not appear on @itemize line
 warning: @footnote should not appear on @itemize line

* W l16|@footnote expected braces
 warning: @footnote expected braces

* W l25|@caption should not appear on @itemize line
 warning: @caption should not appear on @itemize line

* W l25|@caption expected braces
 warning: @caption expected braces

* W l29|@math expected braces
 warning: @math expected braces

* W l37|@anchor should not appear on @itemize line
 warning: @anchor should not appear on @itemize line

* W l37|@anchor expected braces
 warning: @anchor expected braces

* W l42|@verb should not appear on @itemize line
 warning: @verb should not appear on @itemize line

* W l42|@verb expected braces
 warning: @verb expected braces

';

$result_nodes_list{'various_itemize_command_as_argument'} = '1|Top
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

$result_sections_list{'various_itemize_command_as_argument'} = '1|top
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

$result_sectioning_root{'various_itemize_command_as_argument'} = 'level: -1
list:
 1|top
';

$result_headings_list{'various_itemize_command_as_argument'} = '';


$result_converted{'plaintext'}->{'various_itemize_command_as_argument'} = 'top
***

1 Chap
******

     Inlineraw

    Image
    Second

   (1) aa
   (2) F2 aa

     T

     Caption

     a + b
     a^{c}

     2

     anchor 1
     anchor 2

     :uu:

   ---------- Footnotes ----------

   (1) 
   (2) 
';


$result_converted{'html_text'}->{'various_itemize_command_as_argument'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<ul class="itemize">
<li>Inlineraw
</li></ul>

<ul class="itemize">
<li>Image
</li><li>Second
</li></ul>

<ul class="itemize" style="list-style-type: \'(1)\'">
<li>aa
</li><li>F2
aa

<p>T
</p>
</li></ul>

<ul class="itemize">
<li>Caption
</li></ul>

<ul class="itemize">
<li>a + b
</li><li>a<sup class="sup">c</sup>

<p>2
</p>
</li></ul>

<ul class="itemize">
<li>anchor 1
</li><li>anchor 2
</li></ul>

<ul class="itemize">
<li>:uu:
</li></ul>

</div>
</div>
';


$result_converted{'xml'}->{'various_itemize_command_as_argument'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>

<itemize commandarg="inlineraw" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>Inlineraw
</para></listitem></itemize>

<itemize commandarg="image" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>Image
</para></listitem><listitem><prepend></prepend> <para>Second
</para></listitem></itemize>

<itemize commandarg="footnote" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>aa
</para></listitem><listitem><prepend></prepend> <para>F2
aa
</para>
<para>T
</para>
</listitem></itemize>

<itemize commandarg="caption" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>Caption
</para></listitem></itemize>

<itemize commandarg="math" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>a + b
</para></listitem><listitem><prepend></prepend> <para>a<sup>c</sup>
</para>
<para>2
</para>
</listitem></itemize>

<itemize commandarg="anchor" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>anchor 1
</para></listitem><listitem><prepend></prepend> <para>anchor 2
</para></listitem></itemize>

<itemize commandarg="verb" endspaces=" "><itemprepend> </itemprepend>
<listitem><prepend></prepend> <para>:uu:
</para></listitem></itemize>

</chapter>
';


$result_converted{'docbook'}->{'various_itemize_command_as_argument'} = '<chapter label="1" id="chap">
<title>Chap</title>

<itemizedlist><listitem><para> Inlineraw
</para></listitem></itemizedlist>
<itemizedlist><listitem><para> Image
</para></listitem><listitem><para> Second
</para></listitem></itemizedlist>
<itemizedlist><listitem><para> aa
</para></listitem><listitem><para> F2
aa
</para>
<para>T
</para>
</listitem></itemizedlist>
<itemizedlist><listitem><para> Caption
</para></listitem></itemizedlist>
<itemizedlist><listitem><para> a + b
</para></listitem><listitem><para> a<superscript>c</superscript>
</para>
<para>2
</para>
</listitem></itemizedlist>
<itemizedlist><listitem><para> anchor 1
</para></listitem><listitem><para> anchor 2
</para></listitem></itemizedlist>
<itemizedlist><listitem><para> :uu:
</para></listitem></itemizedlist>
</chapter>
';


$result_converted{'latex_text'}->{'various_itemize_command_as_argument'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chap}%

\\begin{itemize}
\\item Inlineraw
\\end{itemize}

\\begin{itemize}
\\item Image
\\item Second
\\end{itemize}

\\begin{itemize}[label=\\footnote{}]
\\item aa
\\item F2
aa

T

\\end{itemize}

\\begin{itemize}
\\item Caption
\\end{itemize}

\\begin{itemize}
\\item a + b
\\item a\\textsuperscript{c}

2

\\end{itemize}

\\begin{itemize}
\\item anchor 1
\\item anchor 2
\\end{itemize}

\\begin{itemize}
\\item :uu:
\\end{itemize}

';

1;
