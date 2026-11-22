use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_in_preamble'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C6
   *normal_command@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{hr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:hr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C3 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@defivar C3 l4
     *def_line C1 l4
     |EXTRA
     |def_command:{defivar}
     |documentlanguage:{hr}
     |element_region:{copying}
     |index_entry:I{vr,1}
     |original_def_cmdname:{defivar}
      *block_line_arg C9
       (i){spaces_before_argument: }
       *def_category C1
       |EXTRA
       |inserted:{1}
        *untranslated_def_line_arg C1
        |EXTRA
        |documentlanguage:{hr}
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
     |EXTRA
     |text_arg:{defivar}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:defivar}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l7
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentlanguage C1 l9
   |EXTRA
   |global_command_number:{2}
   |text_arg:{fr_BE}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr_BE}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l11 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l12 {top section}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l14 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l15 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C3 l17
   *def_line C1 l17
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{fr_BE}
   |element_node:{chapter}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{fr_BE}
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
     *normal_command@error C1 l18
      *brace_container
     {normal_text:\\n}
   *normal_command@end C1 l19
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l21
  |EXTRA
  |global_command_number:{3}
  |text_arg:{de}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:de}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C2 l23
   *def_line C1 l23
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{de}
   |element_node:{chapter}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{de}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:de}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:FFF}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:GGG}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l24
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
';


$result_texis{'multiple_in_preamble'} = '@documentlanguage hr

@copying
@defivar copying a b
@error{}
@end defivar
@end copying

@documentlanguage fr_BE

@node Top
@top top section

@node chapter
@chapter chap

@defivar hr BBB CCC
@error{}
@end defivar

@documentlanguage de

@defivar de FFF GGG
@end defivar
';


$result_texts{'multiple_in_preamble'} = '


top section
***********

1 chap
******

Variable d\'instance de hr: BBB CCC
error->


Instanzvariable of de: FFF GGG
';

$result_errors{'multiple_in_preamble'} = '';

$result_nodes_list{'multiple_in_preamble'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'multiple_in_preamble'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'multiple_in_preamble'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'multiple_in_preamble'} = '';

$result_indices_sort_strings{'multiple_in_preamble'} = 'vr:
 a od copying
 BBB de hr
 FFF von de
';


$result_converted{'plaintext'}->{'multiple_in_preamble'} = 'top section
***********

1 chap
******

 -- Variable d\'instance de hr : BBB CCC
     erreur→

 -- Instanzvariable of de: FFF GGG
';

$result_converted_sort_strings{'plaintext'}->{'multiple_in_preamble'} = 'vr:
 a od copying
 BBB de hr
 FFF von de
';


$result_converted{'info'}->{'multiple_in_preamble'} = Encode::encode('utf-8', 'This is , produced from .

 -- Variable d\'instance de copying : a b
     erreur→


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top section
***********

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 chap
******

 -- Variable d\'instance de hr : BBB CCC
     erreur→

 -- Instanzvariable of de: FFF GGG


Tag Table:
Node: Top84
Node: chapter181

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: fr_BE
End:
');

$result_converted_sort_strings{'info'}->{'multiple_in_preamble'} = 'vr:
 a od copying
 BBB de hr
 FFF von de
';


$result_converted{'html'}->{'multiple_in_preamble'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Variable d\'instance de copying: a b
erreur→ -->
<title>top section</title>

<meta name="description" content="top section">
<meta name="keywords" content="top section">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body lang="fr-BE">



<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Suivant: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Pr&eacute;c&eacute;dent: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top section</a></span></span>, <span class="nav-button"><span class="nav-label">Monter: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top section</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-BBB-of-hr"><span class="category-def">Variable d&rsquo;instance de <code class="code">hr</code>&nbsp;: </span><span><strong class="def-name">BBB</strong> <var class="def-var-arguments">CCC</var><a class="copiable-link" href="#index-BBB-of-hr"> &para;</a></span></dt>
<dd><p>erreur<span class="arrow">&rarr;</span>
</p></dd></dl>


<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-FFF-of-de"><span class="category-def">Instanzvariable of <code class="code">de</code>: </span><span><strong class="def-name">FFF</strong> <var class="def-var-arguments">GGG</var><a class="copiable-link" href="#index-FFF-of-de"> &para;</a></span></dt>
</dl>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'multiple_in_preamble'} = 'vr:
 a od copying
 BBB de hr
 FFF von de
';


$result_converted{'xml'}->{'multiple_in_preamble'} = '<documentlanguage xml:lang="hr"> hr</documentlanguage>

<copying endspaces=" ">
<defivar endspaces=" "><definitionterm><indexterm index="vr" number="1">a od copying</indexterm> <defcategory automatic="on">Instance Variable</defcategory> <defclass>copying</defclass> <defclassvar>a</defclassvar> <defparam>b</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>
</copying>

<documentlanguage xml:lang="fr_BE"> fr_BE</documentlanguage>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top section</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<defivar endspaces=" "><definitionterm><indexterm index="vr" number="2">BBB de hr</indexterm> <defcategory automatic="on">Instance Variable</defcategory> <defclass>hr</defclass> <defclassvar>BBB</defclassvar> <defparam>CCC</defparam></definitionterm>
<definitionitem><para>&errorglyph;
</para></definitionitem></defivar>

<documentlanguage xml:lang="de"> de</documentlanguage>

<defivar endspaces=" "><definitionterm><indexterm index="vr" number="3">FFF von de</indexterm> <defcategory automatic="on">Instance Variable</defcategory> <defclass>de</defclass> <defclassvar>FFF</defclassvar> <defparam>GGG</defparam></definitionterm>
</defivar>
</chapter>
';


$result_converted{'docbook_doc'}->{'multiple_in_preamble'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book lang="fr-BE">
<title>top section</title>
<bookinfo><title>top section</title>
<legalnotice><synopsis><indexterm role="vr"><primary>a od copying</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>copying</classname></ooclass> <property>a</property> <emphasis role="arg">b</emphasis></synopsis>
<blockquote><para>erreur&#8594;
</para></blockquote></legalnotice></bookinfo>
<chapter label="1" id="chapter">
<title>chap</title>

<synopsis><indexterm role="vr"><primary>BBB de hr</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>hr</classname></ooclass> <property>BBB</property> <emphasis role="arg">CCC</emphasis></synopsis>
<blockquote><para>erreur&#8594;
</para></blockquote>

<synopsis><indexterm role="vr"><primary>FFF von de</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>de</classname></ooclass> <property>FFF</property> <emphasis role="arg">GGG</emphasis></synopsis>
</chapter>
</book>
';

1;
