use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentscript_variant_reset_in_preamble'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C6
   *normal_command@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:sr}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l2
   |EXTRA
   |global_command_number:{1}
   |text_arg:{Latn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Latn}
     {spaces_after_argument:\\n}
   *normal_command@documentlanguagevariant C1 l3
   |EXTRA
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ekavsk}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentlanguage C1 l5
   |EXTRA
   |global_command_number:{2}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:sr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l7 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l8 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l11 {chap}
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
  *normal_command@defivar C2 l13
   *def_line C1 l13
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{sr}
   |element_node:{chap}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C11
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{sr}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:used}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:by}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:test}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ivar}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@xref C2 l16
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:Top}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:t}
   {normal_text:.\\n}
   *normal_command@abbr C2 l17
    *brace_arg C1
     {normal_text:C}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:Ckl}
   {normal_text:\\n}
  {empty_line:\\n}
';


$result_texis{'documentscript_variant_reset_in_preamble'} = '@documentlanguage sr
@documentscript Latn
@documentlanguagevariant ekavsk

@documentlanguage sr

@node Top
@top top

@node chap
@chapter chap

@defivar used by test  ivar
@end defivar

@xref{Top, t}.
@abbr{C, Ckl}

';


$result_texts{'documentscript_variant_reset_in_preamble'} = '

top
***

1 chap
******

Променљива примерка од used: by test  ivar

Top.
C (Ckl)

';

$result_errors{'documentscript_variant_reset_in_preamble'} = '';

$result_nodes_list{'documentscript_variant_reset_in_preamble'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'documentscript_variant_reset_in_preamble'} = '1|top
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
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'documentscript_variant_reset_in_preamble'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentscript_variant_reset_in_preamble'} = '';

$result_indices_sort_strings{'documentscript_variant_reset_in_preamble'} = 'vr:
 by од used
';


$result_converted{'plaintext'}->{'documentscript_variant_reset_in_preamble'} = 'top
***

1 chap
******

 -- Променљива примерка од used: by test ivar

   Видите „t“: „Top“.  C (Ckl)

';

$result_converted_sort_strings{'plaintext'}->{'documentscript_variant_reset_in_preamble'} = 'vr:
 by од used
';


$result_converted{'info'}->{'documentscript_variant_reset_in_preamble'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 chap
******

 -- Променљива примерка од used: by test ivar

   *Note t: Top.  C (Ckl)


Tag Table:
Node: Top27
Node: chap102

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: sr
End:
');

$result_converted_sort_strings{'info'}->{'documentscript_variant_reset_in_preamble'} = 'vr:
 by од used
';


$result_converted{'html'}->{'documentscript_variant_reset_in_preamble'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
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

<body lang="sr">


<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Следеће: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Претходно: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Горе: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-by-of-used"><span class="category-def">Променљива примерка од <code class="code">used</code>: </span><span><strong class="def-name">by</strong> <var class="def-var-arguments">test  ivar</var><a class="copiable-link" href="#index-by-of-used"> &para;</a></span></dt>
</dl>

<p>Видите „<a class="xref" href="#Top">t</a>“.
<abbr class="abbr" title="Ckl">C</abbr> (Ckl)
</p>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'documentscript_variant_reset_in_preamble'} = 'vr:
 by од used
';


$result_converted{'docbook_doc'}->{'documentscript_variant_reset_in_preamble'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book lang="sr">
<chapter label="1" id="chap">
<title>chap</title>

<synopsis><indexterm role="vr"><primary>by од used</primary></indexterm><phrase role="category"><emphasis role="bold">Instance Variable</emphasis>:</phrase> <ooclass><classname>used</classname></ooclass> <property>by</property> <emphasis role="arg">test</emphasis>  <emphasis role="arg">ivar</emphasis></synopsis>

<para>Видите „<link linkend="Top">t</link>“.
<abbrev>C</abbrev> (Ckl)
</para>
</chapter>
</book>
';

1;
