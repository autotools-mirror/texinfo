use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_documentlanguage'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C4
   *normal_command@documentlanguage C1 l1
   |global_command_number:{1}
   |text_arg:{fr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C3 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@defivar C3 l4
     *def_line C1 l4
     |def_command:{defivar}
     |documentlanguage:{fr}
     |element_region:{copying}
     |index_entry:I{vr,1}
     |original_def_cmdname:{defivar}
      *block_line_arg C9
       (i){spaces_before_argument: }
       *def_category C1
       |inserted:{1}
        *untranslated_def_line_arg C1
        |documentlanguage:{fr}
        |translation_context:{category of instance variables in object-oriented programming for @defivar}
         {untranslated:Instance Variable}
       {spaces: }
       *def_class C1
        *def_line_arg C1
         {normal_text:copying}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {normal_text:a}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {normal_text:b}
       {spaces_after_argument:\\n}
     *def_item C1
      *paragraph C2
       *normal_command@error C1 l5
        *brace_container
       {normal_text:\\n}
     *normal_command@end C1 l6
     |text_arg:{defivar}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:defivar}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l7
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l9 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l10 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l12 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C15 l13 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C3 l15
   *def_line C1 l15
   |def_command:{defivar}
   |documentlanguage:{fr}
   |element_node:{chap}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *untranslated_def_line_arg C1
      |documentlanguage:{fr}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:fr}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     *normal_command@error C1 l16
      *brace_container
     {normal_text:\\n}
   *normal_command@end C1 l17
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l19
  |global_command_number:{2}
  |text_arg:{de}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l21
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l23
  |global_command_number:{3}
  |text_arg:{hr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:hr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C3 l25
   *def_line C1 l25
   |def_command:{defivar}
   |documentlanguage:{hr}
   |element_node:{chap}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *untranslated_def_line_arg C1
      |documentlanguage:{hr}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:hr}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     *normal_command@error C1 l26
      *brace_container
     {normal_text:\\n}
   *normal_command@end C1 l27
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l29
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l31
  |global_command_number:{1}
  |misc_args:A{vr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:vr}
    {spaces_after_argument:\\n}
';


$result_texis{'multiple_documentlanguage'} = '@documentlanguage fr

@copying
@defivar copying a b
@error{}
@end defivar
@end copying

@node Top
@top top

@node chap
@chapter Chap

@defivar fr BBB CCC
@error{}
@end defivar

@documentlanguage de

@insertcopying

@documentlanguage hr

@defivar hr BBB CCC
@error{}
@end defivar

@insertcopying

@printindex vr
';


$result_texts{'multiple_documentlanguage'} = '

top
***

1 Chap
******

Variable d\'instance de fr: BBB CCC
error->




Primjerak varijable od hr: BBB CCC
error->


';

$result_errors{'multiple_documentlanguage'} = '';

$result_nodes_list{'multiple_documentlanguage'} = '1|Top
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

$result_sections_list{'multiple_documentlanguage'} = '1|top
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

$result_sectioning_root{'multiple_documentlanguage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'multiple_documentlanguage'} = '';

$result_indices_sort_strings{'multiple_documentlanguage'} = 'vr:
 a de copying
 BBB de fr
 BBB od hr
';


$result_converted{'plaintext'}->{'multiple_documentlanguage'} = 'top
***

1 Chap
******

 -- Variable d\'instance de fr : BBB CCC
     erreur→

 -- Instanzvariable of copying: a b
     error→

 -- Primjerak varijable od hr: BBB CCC
     greška→

 -- Primjerak varijable od copying: a b
     greška→

* Menu:

* a de copying:                          chap.                 (line 15)
* BBB de fr:                             chap.                 (line  6)
* BBB od hr:                             chap.                 (line 12)

';

$result_converted_sort_strings{'plaintext'}->{'multiple_documentlanguage'} = 'vr:
 a de copying
 BBB de fr
 BBB od hr
';


$result_converted{'info'}->{'multiple_documentlanguage'} = Encode::encode('utf-8', 'This is , produced from .

 -- Variable d\'instance de copying : a b
     erreur→


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chap
******

 -- Variable d\'instance de fr : BBB CCC
     erreur→

 -- Instanzvariable of copying: a b
     error→

 -- Primjerak varijable od hr: BBB CCC
     greška→

 -- Primjerak varijable od copying: a b
     greška→

 [index ]
* Menu:

* a de copying:                          chap.                 (line 15)
* BBB de fr:                             chap.                 (line  6)
* BBB od hr:                             chap.                 (line 12)


Tag Table:
Node: Top84
Node: chap159
Ref: Index: vr439

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: fr
End:
');

$result_converted_sort_strings{'info'}->{'multiple_documentlanguage'} = 'vr:
 a de copying
 BBB de fr
 BBB od hr
';


$result_converted{'html'}->{'multiple_documentlanguage'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Variable d\'instance de copying: a b
erreur→ -->
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="#chap" rel="index" title="chap">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body lang="fr">


<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Suivant: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Pr&eacute;c&eacute;dent: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Monter: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-BBB-of-fr"><span class="category-def">Variable d&rsquo;instance de <code class="code">fr</code>&nbsp;: </span><span><strong class="def-name">BBB</strong> <var class="def-var-arguments">CCC</var><a class="copiable-link" href="#index-BBB-of-fr"> &para;</a></span></dt>
<dd><p>erreur<span class="arrow">&rarr;</span>
</p></dd></dl>


<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-copying-a-of-copying"><span class="category-def">Instanzvariable of <code class="code">copying</code>: </span><span><strong class="def-name">a</strong> <var class="def-var-arguments">b</var><a class="copiable-link" href="#index-copying-a-of-copying"> &para;</a></span></dt>
<dd><p>error<span class="arrow">&rarr;</span>
</p></dd></dl>


<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-BBB-of-hr"><span class="category-def">Primjerak varijable od <code class="code">hr</code>: </span><span><strong class="def-name">BBB</strong> <var class="def-var-arguments">CCC</var><a class="copiable-link" href="#index-BBB-of-hr"> &para;</a></span></dt>
<dd><p>greška<span class="arrow">&rarr;</span>
</p></dd></dl>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-copying-a-of-copying"><span class="category-def">Primjerak varijable od <code class="code">copying</code>: </span><span><strong class="def-name">a</strong> <var class="def-var-arguments">b</var><a class="copiable-link" href="#index-copying-a-of-copying"> &para;</a></span></dt>
<dd><p>greška<span class="arrow">&rarr;</span>
</p></dd></dl>

<div class="printindex vr-printindex">
<table class="index-letters-header-printindex vr-letters-header-printindex"><tr><th>Preskoči na: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_vr_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-B"><b>B</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-copying-a-of-copying"><code>a de copying</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-B">B</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-BBB-of-fr"><code>BBB de fr</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-BBB-of-hr"><code>BBB od hr</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex vr-letters-footer-printindex"><tr><th>Preskoči na: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_vr_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-B"><b>B</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'multiple_documentlanguage'} = 'vr:
 a de copying
 BBB de fr
 BBB od hr
';


$result_converted{'xml'}->{'multiple_documentlanguage'} = '<documentlanguage xml:lang="fr"> fr</documentlanguage>

<copying endspaces=" ">
<defivar endspaces=" "><definitionterm><indexterm index="vr" number="1">a de copying</indexterm> <defcategory automatic="on">Instance Variable</defcategory> <defclass>copying</defclass> <defclassvar>a</defclassvar> <defparam>b</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>
</copying>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>

<defivar endspaces=" "><definitionterm><indexterm index="vr" number="2">BBB de fr</indexterm> <defcategory automatic="on">Instance Variable</defcategory> <defclass>fr</defclass> <defclassvar>BBB</defclassvar> <defparam>CCC</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>

<documentlanguage xml:lang="de"> de</documentlanguage>

<insertcopying></insertcopying>

<documentlanguage xml:lang="hr"> hr</documentlanguage>

<defivar endspaces=" "><definitionterm><indexterm index="vr" number="3">BBB od hr</indexterm> <defcategory automatic="on">Instance Variable</defcategory> <defclass>hr</defclass> <defclassvar>BBB</defclassvar> <defparam>CCC</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>

<insertcopying></insertcopying>

<printindex value="vr" line=" vr"></printindex>
</chapter>
';


$result_converted{'docbook_doc'}->{'multiple_documentlanguage'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book lang="fr">
<title>top</title>
<bookinfo><title>top</title>
<legalnotice><synopsis><indexterm role="vr"><primary>a de copying</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>copying</classname></ooclass> <property>a</property> <emphasis role="arg">b</emphasis></synopsis>
<blockquote><para>erreur&#8594;
</para></blockquote></legalnotice></bookinfo>
<chapter label="1" id="chap">
<title>Chap</title>

<synopsis><indexterm role="vr"><primary>BBB de fr</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>fr</classname></ooclass> <property>BBB</property> <emphasis role="arg">CCC</emphasis></synopsis>
<blockquote><para>erreur&#8594;
</para></blockquote>

<synopsis><indexterm role="vr"><primary>a de copying</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>copying</classname></ooclass> <property>a</property> <emphasis role="arg">b</emphasis></synopsis>
<blockquote><para>error&#8594;
</para></blockquote>

<synopsis><indexterm role="vr"><primary>BBB od hr</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>hr</classname></ooclass> <property>BBB</property> <emphasis role="arg">CCC</emphasis></synopsis>
<blockquote><para>greška&#8594;
</para></blockquote>
<synopsis><indexterm role="vr"><primary>a de copying</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>copying</classname></ooclass> <property>a</property> <emphasis role="arg">b</emphasis></synopsis>
<blockquote><para>greška&#8594;
</para></blockquote>
<index role="vr"></index>
</chapter>
</book>
';

1;
