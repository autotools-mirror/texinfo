use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'line_breaks'} = '*document_root C5
 *before_node_section C3
  *preamble C3
   *normal_command@documentdescription C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    *paragraph C3
     {normal_text:a document }
     *normal_command@*
     {normal_text: yes!\\n}
    *normal_command@end C1 l3
    |text_arg:{documentdescription}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentdescription}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@settitle C1 l5
    *line_arg C5
     {spaces_before_argument: }
     {normal_text:the manual }
     *normal_command@*
     {normal_text: new version}
     {spaces_after_argument:\\n}
  *normal_command@title C1 l6
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:AWK As A Major Systems Programming }
    *normal_command@*
    {normal_text: Language---Revisited}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l9 {a @* top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:a }
    *normal_command@*
    {normal_text: top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {a @* new node}
 |identifier:{a-new-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:a }
    *normal_command@*
    {normal_text: new node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 l12 {a @* chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:a }
    *normal_command@*
    {normal_text: chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l14
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:in center }
    *normal_command@*
    {normal_text: line break}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l16
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@strong l16
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *normal_command@item C1 l17
      *line_arg C5
       {spaces_before_argument: }
       {normal_text:with break }
       *normal_command@*
       {normal_text: after}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l18
      *line_arg C5
       {spaces_before_argument: }
       {normal_text:withx breakx }
       *normal_command@*
       {normal_text: afterx}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C3
      {normal_text:Text, }
      *normal_command@ref C2 l19
       *brace_arg C3
       |node_content:A{0|2}
       |normalized:{a-new-node}
        {normal_text:a }
        *normal_command@*
        {normal_text: new node}
       *brace_arg C4
        {spaces_before_argument: }
        {normal_text:a }
        *normal_command@*
        {normal_text: something}
      {normal_text:.\\n}
   *normal_command@end C1 l20
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l22
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     {normal_text:Q}
     *normal_command@*
     {normal_text: uotation}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:T\\n}
   *normal_command@end C1 l24
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C3
    {normal_text:in }
    *normal_command@*
    {normal_text: example\\n}
   *normal_command@end C1 l28
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C5 l30
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:in }
    *normal_command@*
    {normal_text: flushright\\n}
   {empty_line:\\n}
   *paragraph C2
    *normal_command@xref C1 l33
     *brace_arg C3
     |node_content:A{0|2}
     |normalized:{a-new-node}
      {normal_text:a }
      *normal_command@*
      {normal_text: new node}
    {normal_text:.\\n}
   *normal_command@end C1 l34
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
';


$result_texis{'line_breaks'} = '@documentdescription 
a document @* yes!
@end documentdescription

@settitle the manual @* new version
@title AWK As A Major Systems Programming @* Language---Revisited

@node Top
@top a @* top

@node a @* new node
@chapter a @* chapter

@center in center @* line break

@table @strong
@item with break @* after
@itemx withx breakx @* afterx
Text, @ref{a @* new node, a @* something}.
@end table

@quotation Q@* uotation
T
@end quotation

@example
in @* example
@end example

@flushright
in @* flushright

@xref{a @* new node}.
@end flushright
';


$result_texts{'line_breaks'} = '
AWK As A Major Systems Programming 
 Language--Revisited

a 
 top
******

1 a 
 chapter
************

in center 
 line break

with break 
 after
withx breakx 
 afterx
Text, a 
 new node.

Q
 uotation
T

in 
 example

in 
 flushright

a 
 new node.
';

$result_errors{'line_breaks'} = '';

$result_nodes_list{'line_breaks'} = '1|Top
 associated_section: a @* top
 associated_title_command: a @* top
 node_directions:
  next->a @* new node
2|a @* new node
 associated_section: 1 a @* chapter
 associated_title_command: 1 a @* chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'line_breaks'} = '1|a @* top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->a @* chapter
 section_children:
  1|a @* chapter
2|a @* chapter
 associated_anchor_command: a @* new node
 associated_node: a @* new node
 section_directions:
  up->a @* top
 toplevel_directions:
  prev->a @* top
  up->a @* top
';

$result_sectioning_root{'line_breaks'} = 'level: -1
list:
 1|a @* top
';

$result_headings_list{'line_breaks'} = '';


$result_converted{'plaintext'}->{'line_breaks'} = 'a
top
***

1 a
chapter
*******

                               in center
                              line break

*with break
after*
*withx breakx
afterx*
     Text, a
     something: a
     new node.

     Q
     uotation: T

     in
      example

                                                                     in
                                                             flushright

                                                                  See a
                                                              new node.
';


$result_converted{'html'}->{'line_breaks'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>the manual 
 new version</title>

<meta name="description" content="a document 
 yes!">
<meta name="keywords" content="the manual 
 new version">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
div.center {text-align:center}
div.example {margin-left: 3.2em}
h1.settitle {text-align:center}
p.flushright-paragraph {text-align:right}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<h1 class="settitle">the manual <br> new version</h1>
<hr>

<h1 class="title">AWK As A Major Systems Programming <br> Language&mdash;Revisited</h1>

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#a-new-node" accesskey="n" rel="next">a <br> chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="a-top"><span>a <br> top<a class="copiable-link" href="#a-top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#a-new-node" accesskey="1">a <br> chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="a-new-node">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">a <br> top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">a <br> top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="a-chapter"><span>1 a <br> chapter<a class="copiable-link" href="#a-chapter"> &para;</a></span></h2>

<div class="center">in center <br> line break
</div>
<dl class="table">
<dt><strong class="strong">with break <br> after</strong></dt>
<dt><strong class="strong">withx breakx <br> afterx</strong></dt>
<dd><p>Text, <a class="ref" href="#a-new-node">a <br> something</a>.
</p></dd>
</dl>

<blockquote class="quotation">
<p><b class="b">Q<br> uotation:</b> T
</p></blockquote>

<div class="example">
<pre class="example-preformatted">in 
 example
</pre></div>

<div class="flushright"><p class="flushright-paragraph">in <br> flushright
</p>
<p class="flushright-paragraph">See <a class="xref" href="#a-new-node">a <br> chapter</a>.
</p></div></div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'line_breaks'} = '<documentdescription endspaces=" "> 
<para>a document &linebreak; yes!
</para></documentdescription>

<settitle> the manual &linebreak; new version</settitle>
<title> AWK As A Major Systems Programming &linebreak; Language&textmdash;Revisited</title>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> a &linebreak; new node</nodenext></node>
<top><sectiontitle> a &linebreak; top</sectiontitle>

</top>
<node identifier="a-new-node"><nodename> a &linebreak; new node</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> a &linebreak; chapter</sectiontitle>

<center> in center &linebreak; line break</center>

<table commandarg="strong" endspaces=" ">
<tableentry><tableterm><item><itemformat command="strong"> with break &linebreak; after</itemformat></item>
<itemx><itemformat command="strong"> withx breakx &linebreak; afterx</itemformat></itemx>
</tableterm><tableitem><para>Text, <ref label="a-new-node"><xrefnodename>a &linebreak; new node</xrefnodename><xrefinfoname> a &linebreak; something</xrefinfoname></ref>.
</para></tableitem></tableentry></table>

<quotation endspaces=" "><quotationtype> Q&linebreak; uotation</quotationtype>
<para>T
</para></quotation>

<example endspaces=" ">
<pre xml:space="preserve">in &linebreak; example
</pre></example>

<flushright endspaces=" ">
<para>in &linebreak; flushright
</para>
<para><xref label="a-new-node"><xrefnodename>a &linebreak; new node</xrefnodename></xref>.
</para></flushright>
</chapter>
';


$result_converted{'docbook_doc'}->{'line_breaks'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>AWK As A Major Systems Programming 
 Language&#8212;Revisited</title>
<titleabbrev>the manual 
 new version</titleabbrev>
<bookinfo><title>AWK As A Major Systems Programming 
 Language&#8212;Revisited</title>
<titleabbrev>the manual 
 new version</titleabbrev>
</bookinfo>
<chapter label="1" id="a-new-node">
<title>a 
 chapter</title>

<simpara role="center">in center 
 line break</simpara>

<variablelist><varlistentry><term><emphasis role="bold">with break 
 after</emphasis>
</term><term><emphasis role="bold">withx breakx 
 afterx</emphasis>
</term><listitem><para>Text, <link linkend="a-new-node">a 
 something</link>.
</para></listitem></varlistentry></variablelist>
<blockquote><para><emphasis role="bold">Q
 uotation:</emphasis> T
</para></blockquote>
<screen>in 
 example
</screen>
<para>in 
 flushright
</para>
<para>See <link linkend="a-new-node">a 
 new node</link>.
</para></chapter>
</book>
';


$result_converted{'latex_text'}->{'line_breaks'} = '
\\begin{document}
{\\raggedright {\\huge \\bfseries AWK As A Major Systems Programming \\leavevmode{}\\\\ Language---Revisited}}
\\vskip 4pt \\hrule height 4pt width \\hsize \\vskip 4pt

\\label{anchor:Top}%
\\Texinfochapter{{a \\texorpdfstring{\\ifinner\\unskip\\space\\ignorespaces\\else\\leavevmode{}\\\\\\fi}{ } chapter}}
\\label{anchor:a-new-node}%

\\begin{center}
in center \\leavevmode{}\\\\ line break
\\end{center}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\textbf{with break \\leavevmode{}\\\\ after}\\\\
\\textbf{withx breakx \\leavevmode{}\\\\ afterx}}}]
Text, \\hyperref[anchor:a-new-node]{\\chaptername~\\ref*{anchor:a-new-node} [a \\leavevmode{}\\\\ new node], page~\\pageref*{anchor:a-new-node}}.
\\end{description}

\\begin{quote}
\\textbf{Q\\leavevmode{}\\\\ uotation:} T
\\end{quote}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in \\leavevmode{}\\\\\\ example
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{flushright}
\\begin{Texinfopreformatted}%
in \\leavevmode{}\\\\ flushright

See \\hyperref[anchor:a-new-node]{\\chaptername~\\ref*{anchor:a-new-node} [a \\leavevmode{}\\\\ new node], page~\\pageref*{anchor:a-new-node}}.
\\end{Texinfopreformatted}
\\end{flushright}
';

1;
