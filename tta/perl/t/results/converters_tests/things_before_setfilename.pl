use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'things_before_setfilename'} = '*document_root C5
 *before_node_section C2
  *preamble_before_setfilename C26
   *preamble_before_beginning C2
    {text_before_beginning:\\input texinfo\\n}
    {text_before_beginning:\\n}
   *@anchor C1 things_before_setfilename.texi:l3
   |EXTRA
   |identifier:{An-anchor}
   |is_target:{1}
    *brace_arg C1
     {An anchor}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *paragraph C3
    {Ref to the anchor:\\n}
    *@ref C1 things_before_setfilename.texi:l6
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{An-anchor}
      {An anchor}
    {\\n}
   {empty_line:\\n}
   *paragraph C3
    {Ref to the anchor in footnote:\\n}
    *@ref C1 things_before_setfilename.texi:l9
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{Anchor-in-footnote}
      {Anchor in footnote}
    {.\\n}
   {empty_line:\\n}
   *paragraph C2
    *@footnote C1 things_before_setfilename.texi:l11
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C6
      *paragraph C1
       {In footnote.\\n}
      {empty_line:\\n}
      *@anchor C1 things_before_setfilename.texi:l13
      |EXTRA
      |identifier:{Anchor-in-footnote}
      |is_target:{1}
       *brace_arg C1
        {Anchor in footnote}
      {spaces_after_close_brace:\\n}
      {empty_line:\\n}
      *paragraph C3
       {Ref to main text anchor\\n}
       *@ref C1 things_before_setfilename.texi:l16
        *brace_arg C1
        |EXTRA
        |node_content:A{0|0}
        |normalized:{An-anchor}
         {An anchor}
       {\\n}
    {\\n}
   {empty_line:\\n}
   *@float C3 things_before_setfilename.texi:l19
   |EXTRA
   |float_number:{1}
   |float_type:{}
   |global_command_number:{1}
   |identifier:{float-anchor}
   |is_target:{1}
    *arguments_line C2
     *block_line_arg C1
      {spaces_before_argument: }
     *block_line_arg C3
      {spaces_before_argument: }
      {float anchor}
      {spaces_after_argument:\\n}
    *paragraph C1
     {In float\\n}
    *@end C1 things_before_setfilename.texi:l21
    |EXTRA
    |text_arg:{float}
     *line_arg C3
      {spaces_before_argument: }
      {float}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C3
    {Ref to float\\n}
    *@ref C1 things_before_setfilename.texi:l24
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{float-anchor}
      {float anchor}
    {.\\n}
   {empty_line:\\n}
   *@float C6 things_before_setfilename.texi:l26
   |EXTRA
   |float_number:{1}
   |float_type:{Text}
   |global_command_number:{2}
   |identifier:{ta}
   |is_target:{1}
    *arguments_line C2
     *block_line_arg C2
      {spaces_before_argument: }
      {Text}
     *block_line_arg C3
      {spaces_before_argument: }
      {ta}
      {spaces_after_argument:\\n}
    *paragraph C1
     {In float\\n}
    {empty_line:\\n}
    *@caption C1 things_before_setfilename.texi:l29
     *brace_command_context C1
      *paragraph C1
       {ta caption}
    {spaces_after_close_brace:\\n}
    *@end C1 things_before_setfilename.texi:l30
    |EXTRA
    |text_arg:{float}
     *line_arg C3
      {spaces_before_argument: }
      {float}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@contents C1 things_before_setfilename.texi:l32
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *@menu C3 things_before_setfilename.texi:l34
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 things_before_setfilename.texi:l35
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{An-anchor}
      {An anchor}
     {menu_entry_separator:::                }
     *menu_entry_description C1
      *preformatted C1
       {menu entry pointing to the anchor.\\n}
    *@end C1 things_before_setfilename.texi:l36
    |EXTRA
    |text_arg:{menu}
     *line_arg C3
      {spaces_before_argument: }
      {menu}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *index_entry_command@cindex C1 things_before_setfilename.texi:l38
   |EXTRA
   |index_entry:I{cp,1}
    *line_arg C3
     {spaces_before_argument: }
     {index entry}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@printindex C1 things_before_setfilename.texi:l40
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{cp}
    *line_arg C3
     {spaces_before_argument: }
     {cp}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@listoffloats C1 things_before_setfilename.texi:l42
   |EXTRA
   |float_type:{Text}
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {Text}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble_before_content C2
   *@setfilename C1 things_before_setfilename.texi:l44
   |EXTRA
   |text_arg:{things_before_setfilename.info}
    *line_arg C3
     {spaces_before_argument: }
     {things_before_setfilename.info}
     {spaces_after_argument: \\n}
   {empty_line:\\n}
 *@node C1 things_before_setfilename.texi:l46 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 things_before_setfilename.texi:l47 {top section}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 things_before_setfilename.texi:l49 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C6 things_before_setfilename.texi:l50 {Chapter}
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
  *paragraph C3
   {Ref to anchor\\n}
   *@ref C1 things_before_setfilename.texi:l53
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {An anchor}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to footnote anchor\\n}
   *@ref C1 things_before_setfilename.texi:l56
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {Anchor in footnote}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'things_before_setfilename'} = '\\input texinfo

@anchor{An anchor}

Ref to the anchor:
@ref{An anchor}

Ref to the anchor in footnote:
@ref{Anchor in footnote}.

@footnote{In footnote.

@anchor{Anchor in footnote}

Ref to main text anchor
@ref{An anchor}
}

@float , float anchor
In float
@end float

Ref to float
@ref{float anchor}.

@float Text, ta
In float

@caption{ta caption}
@end float

@contents

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@printindex cp

@listoffloats Text

@setfilename things_before_setfilename.info 

@node Top
@top top section

@node chap
@chapter Chapter

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}

';


$result_texts{'things_before_setfilename'} = '
top section
***********

1 Chapter
*********

Ref to anchor
An anchor

Ref to footnote anchor
Anchor in footnote

';

$result_errors{'things_before_setfilename'} = '* W things_before_setfilename.texi:l38|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W things_before_setfilename.texi:l40|printindex before document beginning: @printindex cp
 warning: printindex before document beginning: @printindex cp

';

$result_floats{'things_before_setfilename'} = ': 1
 F1: {float-anchor}
Text: 1
 F1: {ta}
  C: ta caption
';

$result_nodes_list{'things_before_setfilename'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'things_before_setfilename'} = '1|top section
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
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'things_before_setfilename'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'things_before_setfilename'} = '';

$result_indices_sort_strings{'things_before_setfilename'} = 'cp:
 index entry
';


$result_converted{'plaintext'}->{'things_before_setfilename'} = 'top section
***********

1 Chapter
*********

Ref to anchor An anchor

   Ref to footnote anchor Anchor in footnote

';

$result_converted_sort_strings{'plaintext'}->{'things_before_setfilename'} = 'cp:
 index entry
';


$result_converted{'html'}->{'things_before_setfilename'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="#Top" rel="index" title="Top">
<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">Chapter</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span><span class="nav-button">[<a href="#Top" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li><a id="toc-Chapter" href="#chap">1 Chapter</a></li>
</ul>
</div>
</div>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top section</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top section</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>]</span><span class="nav-button">[<a href="#Top" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>Ref to anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to footnote anchor
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>
</p>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'things_before_setfilename'} = 'cp:
 index entry
';


$result_converted{'xml'}->{'things_before_setfilename'} = '<preamblebeforebeginning>\\input texinfo

</preamblebeforebeginning><anchor identifier="An-anchor">An anchor</anchor>

<para>Ref to the anchor:
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para>
<para>Ref to the anchor in footnote:
<ref label="Anchor-in-footnote"><xrefnodename>Anchor in footnote</xrefnodename></ref>.
</para>
<para><footnote><para>In footnote.
</para>
<anchor identifier="Anchor-in-footnote">Anchor in footnote</anchor>

<para>Ref to main text anchor
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para></footnote>
</para>
<float identifier="float-anchor" type="" number="1" endspaces=" "><floattype> </floattype><floatname> float anchor</floatname>
<para>In float
</para></float>

<para>Ref to float
<ref label="float-anchor"><xrefnodename>float anchor</xrefnodename></ref>.
</para>
<float identifier="ta" type="Text" number="1" endspaces=" "><floattype> Text</floattype><floatname> ta</floatname>
<para>In float
</para>
<caption><para>ta caption</para></caption>
</float>

<contents></contents>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>An anchor</menunode><menuseparator>::                </menuseparator><menudescription><pre xml:space="preserve">menu entry pointing to the anchor.
</pre></menudescription></menuentry></menu>

<cindex index="cp"> <indexterm index="cp" number="1">index entry</indexterm></cindex>

<printindex value="cp" line=" cp"></printindex>

<listoffloats type="Text"> Text</listoffloats>

<setfilename file="things_before_setfilename.info"> things_before_setfilename.info </setfilename>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top section</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<para>Ref to anchor
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para>
<para>Ref to footnote anchor
<ref label="Anchor-in-footnote"><xrefnodename>Anchor in footnote</xrefnodename></ref>
</para>
</chapter>
';


$result_converted{'docbook'}->{'things_before_setfilename'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<para>Ref to anchor
<link linkend="An-anchor">An anchor</link>
</para>
<para>Ref to footnote anchor
<link linkend="Anchor-in-footnote">Anchor in footnote</link>
</para>
</chapter>
';


$result_converted{'latex_text'}->{'things_before_setfilename'} = '
\\begin{document}
\\tableofcontents\\newpage
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

Ref to anchor
\\hyperref[anchor:An-anchor]{[An anchor], page~\\pageref*{anchor:An-anchor}}

Ref to footnote anchor
\\hyperref[anchor:Anchor-in-footnote]{[Anchor in footnote], page~\\pageref*{anchor:Anchor-in-footnote}}

';


$result_converted{'info'}->{'things_before_setfilename'} = Encode::encode('utf-8', 'This is things_before_setfilename.info, produced from
things_before_setfilename.texi.


File: things_before_setfilename.info,  Node: Top,  Next: chap,  Up: (dir)

top section
***********

* Menu:

* chap::


File: things_before_setfilename.info,  Node: chap,  Prev: Top,  Up: Top

1 Chapter
*********

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::


Tag Table:
Node: Top87
Node: chap208

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'things_before_setfilename'} = 'cp:
 index entry
';

1;
