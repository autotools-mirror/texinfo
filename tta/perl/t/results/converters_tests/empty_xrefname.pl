use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_xrefname'} = '*document_root C8
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
 *normal_command@node C1 l4 {Chap}
 |identifier:{Chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{entiti}
     {normal_text:entiti}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l9
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C5 l11 {entiti}
 |identifier:{entiti}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entiti}
    {spaces_after_argument:\\n}
  *normal_command@xrefname C1 l12
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@heading C1 l14
  |global_command_number:{1}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:after empty}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {chip}
 |identifier:{chip}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chip}
    {spaces_after_argument:\\n}
 *normal_command@chapter C9 l17 {Chip}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chip}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@xrefautomaticsectiontitle C1 l19
  |global_command_number:{1}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l21
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{entiti}
     {normal_text:entiti}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@xrefautomaticsectiontitle C1 l23
  |global_command_number:{2}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:xrefautomaticsectiontitle on }
   *normal_command@ref C1 l25
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{entiti}
     {normal_text:entiti}
   {normal_text:.\\n}
';


$result_texis{'empty_xrefname'} = '@node Top
@top top

@node Chap
@chapter Chapter

@menu
* entiti::
@end menu

@node entiti
@xrefname

@heading after empty

@node chip
@chapter Chip

@xrefautomaticsectiontitle off

@xref{entiti}

@xrefautomaticsectiontitle on

xrefautomaticsectiontitle on @ref{entiti}.
';


$result_texts{'empty_xrefname'} = 'top
***

1 Chapter
*********

* entiti::


after empty
===========

2 Chip
******


entiti


xrefautomaticsectiontitle on entiti.
';

$result_errors{'empty_xrefname'} = '';

$result_nodes_list{'empty_xrefname'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chap
2|Chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 menus:
  entiti
 node_directions:
  next->chip
  prev->Top
  up->Top
3|entiti
 associated_title_command
 node_directions:
  up->Chap
4|chip
 associated_section: 2 Chip
 associated_title_command: 2 Chip
 node_directions:
  prev->Chap
  up->Top
';

$result_sections_list{'empty_xrefname'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|Chip
2|Chapter
 associated_anchor_command: Chap
 associated_node: Chap
 section_directions:
  next->Chip
  up->top
 toplevel_directions:
  next->Chip
  prev->top
  up->top
3|Chip
 associated_anchor_command: chip
 associated_node: chip
 section_directions:
  prev->Chapter
  up->top
 toplevel_directions:
  prev->Chapter
  up->top
';

$result_sectioning_root{'empty_xrefname'} = 'level: -1
list:
 1|top
';

$result_headings_list{'empty_xrefname'} = '1
 associated_anchor_command: entiti
2|after empty
';


$result_converted{'plaintext'}->{'empty_xrefname'} = 'top
***

1 Chapter
*********

after empty
===========

2 Chip
******

See entiti

   xrefautomaticsectiontitle on entiti.
';


$result_converted{'html_text'}->{'empty_xrefname'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#Chap">Chapter</a></li>
<li><a href="#chip">Chip</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="Chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>


<hr>
<a class="node" id="entiti"></a>
<h3 class="heading" id="after-empty"><span>after empty<a class="copiable-link" href="#after-empty"> &para;</a></span></h3>

<hr>
</div>
<div class="chapter-level-extent" id="chip">
<h2 class="chapter" id="Chip"><span>2 Chip<a class="copiable-link" href="#Chip"> &para;</a></span></h2>


<p>See <a class="xref" href="#entiti">entiti</a>
</p>

<p>xrefautomaticsectiontitle on <a class="ref" href="#entiti"></a>.
</p></div>
</div>
';


$result_converted{'xml'}->{'empty_xrefname'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> Chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="Chap"><nodename> Chap</nodename><nodenext automatic="on"> chip</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>entiti</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</chapter>
<node identifier="entiti"><nodename> entiti</nodename><nodeup automatic="on"> Chap</nodeup></node>
<xrefname></xrefname>

<heading> after empty</heading>

<node identifier="chip"><nodename> chip</nodename><nodeprev automatic="on"> Chap</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chip</sectiontitle>

<xrefautomaticsectiontitle value="off" line=" off"></xrefautomaticsectiontitle>

<para><xref label="entiti"><xrefnodename>entiti</xrefnodename></xref>
</para>
<xrefautomaticsectiontitle value="on" line=" on"></xrefautomaticsectiontitle>

<para>xrefautomaticsectiontitle on <ref label="entiti"><xrefnodename>entiti</xrefnodename></ref>.
</para></chapter>
';


$result_converted{'docbook'}->{'empty_xrefname'} = '<chapter label="1" id="Chap">
<title>Chapter</title>


</chapter>
<anchor id="entiti"/>

<bridgehead renderas="sect1">after empty</bridgehead>

<chapter label="2" id="chip">
<title>Chip</title>


<para>See <link linkend="entiti">entiti</link>
</para>

<para>xrefautomaticsectiontitle on <link linkend="entiti">entiti</link>.
</para></chapter>
';


$result_converted{'latex_text'}->{'empty_xrefname'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:Chap}%


\\label{anchor:entiti}%

\\section*{{after empty}}

\\Texinfochapter{{Chip}}
\\label{anchor:chip}%


See \\hyperref[anchor:entiti]{[entiti], page~\\pageref*{anchor:entiti}}


xrefautomaticsectiontitle on \\hyperref[anchor:entiti]{[entiti], page~\\pageref*{anchor:entiti}}.
';

1;
