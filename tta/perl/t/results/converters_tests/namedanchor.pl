use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'namedanchor'} = '*document_root C11
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C5 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@namedanchor C2 l4
  |EXTRA
  |is_target:{1}
  |normalized:{in-Top}
   *brace_arg C1
    {in Top}
   *brace_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *@emph C1 l4
     *brace_container C1
      {n in Top}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 l6 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C12 l7 {chapter @namedanchor{Not here!, There} after}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter }
    *@namedanchor C2 l7
    |EXTRA
    |is_target:{1}
    |normalized:{Not-here_0021}
     *brace_arg C1
      {Not here!}
     *brace_arg C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      {There}
    {spaces_after_close_brace: }
    {after}
  {empty_line:\\n}
  *@namedanchor C1 l9
  |EXTRA
  |is_target:{1}
  |normalized:{in-chap-no-name}
   *brace_arg C1
    {in chap no name}
  {spaces_after_close_brace:\\n}
  *@namedanchor C2 l10
  |EXTRA
  |is_target:{1}
  |normalized:{in-chap-empty-name}
   *brace_arg C1
    {in chap empty name}
   *brace_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Empty namedanchor\\n}
   *@namedanchor C1 l13
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
   {.\\n}
  {empty_line:\\n}
  *@namedanchor C2 l15
  |EXTRA
  |is_target:{1}
  |normalized:{normal}
   *brace_arg C1
    {normal}
   *brace_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    {here we are}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 l17 {secc1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{secc1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {secc1}
 *@section C16 l18 {secc1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {secc1}
  {empty_line:\\n}
  *@xrefautomaticsectiontitle C1 l20
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{off}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {off}
  {empty_line:\\n}
  *paragraph C6
   *@xref C1 l22
    *brace_arg C1
    |EXTRA
    |node_content:{in chap no name}
    |normalized:{in-chap-no-name}
     {in chap no name}
   {\\n}
   *@xref C2 l23
    *brace_arg C1
    |EXTRA
    |node_content:{in chap no name}
    |normalized:{in-chap-no-name}
     {in chap no name}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {t}
   {\\n}
   *@xref C3 l24
    *brace_arg C1
    |EXTRA
    |node_content:{in chap no name}
    |normalized:{in-chap-no-name}
     {in chap no name}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {t}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {o}
   {\\n}
  {empty_line:\\n}
  *paragraph C6
   *@xref C1 l26
    *brace_arg C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
   {\\n}
   *@xref C2 l27
    *brace_arg C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {nt}
   {\\n}
   *@xref C3 l28
    *brace_arg C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {nt}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {no}
   {\\n}
  {empty_line:\\n}
  *@xrefautomaticsectiontitle C1 l30
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{on}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {on}
  {empty_line:\\n}
  *paragraph C6
   *@xref C1 l32
    *brace_arg C1
    |EXTRA
    |node_content:{in chap empty name}
    |normalized:{in-chap-empty-name}
     {in chap empty name}
   {\\n}
   *@xref C2 l33
    *brace_arg C1
    |EXTRA
    |node_content:{in chap empty name}
    |normalized:{in-chap-empty-name}
     {in chap empty name}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xat on t}
   {\\n}
   *@xref C3 l34
    *brace_arg C1
    |EXTRA
    |node_content:{in chap empty name}
    |normalized:{in-chap-empty-name}
     {in chap empty name}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xat on t}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xat on o}
   {\\n}
  {empty_line:\\n}
  *paragraph C6
   *@xref C1 l36
    *brace_arg C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
   {\\n}
   *@xref C2 l37
    *brace_arg C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xat on nt}
   {\\n}
   *@xref C3 l38
    *brace_arg C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xat on nt}
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xat on no}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C1 l40
    *brace_arg C1
    |EXTRA
    |node_content:{in Top}
    |normalized:{in-Top}
     {in Top}
   {\\n}
   *@xref C1 l41
    *brace_arg C1
    |EXTRA
    |node_content:{Not here!}
    |normalized:{Not-here_0021}
     {Not here!}
   {\\n}
  {empty_line:\\n}
 *@node C1 l43 {chap1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{chap1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap1}
 *@chapter C4 l44 {chap1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap1}
  {empty_line:\\n}
  *@menu C8 l46
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l47
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{secc2}
    |normalized:{secc2}
     {secc2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l48
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{in Top}
    |normalized:{in-Top}
     {in Top}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l49
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Not here!}
    |normalized:{Not-here_0021}
     {Not here!}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l50
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{in chap no name}
    |normalized:{in-chap-no-name}
     {in chap no name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l51
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{normal}
    |normalized:{normal}
     {normal}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l52
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{in chap empty name}
    |normalized:{in-chap-empty-name}
     {in chap empty name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l53
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l55 {secc2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{secc2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {secc2}
 *@section C1 l56 {Secc2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Secc2}
';


$result_texis{'namedanchor'} = '@node Top
@top top

@namedanchor{in Top, @emph{n in Top}}

@node chap
@chapter chapter @namedanchor{Not here!, There} after

@namedanchor{in chap no name}
@namedanchor{in chap empty name, }

Empty namedanchor
@namedanchor{ }.

@namedanchor{normal, here we are}

@node secc1
@section secc1

@xrefautomaticsectiontitle off

@xref{in chap no name}
@xref{in chap no name, t}
@xref{in chap no name, t, o}

@xref{normal}
@xref{normal, nt}
@xref{normal, nt, no}

@xrefautomaticsectiontitle on

@xref{in chap empty name}
@xref{in chap empty name, xat on t}
@xref{in chap empty name, xat on t, xat on o}

@xref{normal}
@xref{normal, xat on nt}
@xref{normal, xat on nt, xat on no}

@xref{in Top}
@xref{Not here!}

@node chap1
@chapter chap1

@menu
* secc2::
* in Top::
* Not here!::
* in chap no name::
* normal::
* in chap empty name::
@end menu

@node secc2
@section Secc2
';


$result_texts{'namedanchor'} = 'top
***


1 chapter after
***************


Empty namedanchor
.


1.1 secc1
=========


in chap no name
in chap no name
in chap no name

normal
normal
normal


in chap empty name
in chap empty name
in chap empty name

normal
normal
normal

in Top
Not here!

2 chap1
*******

* secc2::
* in Top::
* Not here!::
* in chap no name::
* normal::
* in chap empty name::

2.1 Secc2
=========
';

$result_errors{'namedanchor'} = '* W l7|@namedanchor should not appear on @chapter line
 warning: @namedanchor should not appear on @chapter line

* E l13|empty argument in @namedanchor
 empty argument in @namedanchor

';

$result_nodes_list{'namedanchor'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chapter @namedanchor{Not here!, There} after
 associated_title_command: 1 chapter @namedanchor{Not here!, There} after
 node_directions:
  next->chap1
  prev->Top
  up->Top
3|secc1
 associated_section: 1.1 secc1
 associated_title_command: 1.1 secc1
 node_directions:
  up->chap
4|chap1
 associated_section: 2 chap1
 associated_title_command: 2 chap1
 menus:
  secc2
  in Top
  Not here!
  in chap no name
  normal
  in chap empty name
 node_directions:
  prev->chap
  up->Top
5|secc2
 associated_section: 2.1 Secc2
 associated_title_command: 2.1 Secc2
 node_directions:
  next->in Top
  up->chap1
';

$result_sections_list{'namedanchor'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter @namedanchor{Not here!, There} after
 section_children:
  1|chapter @namedanchor{Not here!, There} after
  2|chap1
2|chapter @namedanchor{Not here!, There} after
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->chap1
  up->top
 toplevel_directions:
  next->chap1
  prev->top
  up->top
 section_children:
  1|secc1
3|secc1
 associated_anchor_command: secc1
 associated_node: secc1
 section_directions:
  up->chapter @namedanchor{Not here!, There} after
4|chap1
 associated_anchor_command: chap1
 associated_node: chap1
 section_directions:
  prev->chapter @namedanchor{Not here!, There} after
  up->top
 toplevel_directions:
  prev->chapter @namedanchor{Not here!, There} after
  up->top
 section_children:
  1|Secc2
5|Secc2
 associated_anchor_command: secc2
 associated_node: secc2
 section_directions:
  up->chap1
';

$result_sectioning_root{'namedanchor'} = 'level: -1
list:
 1|top
';

$result_headings_list{'namedanchor'} = '';


$result_converted{'plaintext'}->{'namedanchor'} = 'top
***

1 chapter after
***************

Empty namedanchor .

1.1 secc1
=========

See in chap no name See t: in chap no name See t: in chap no name

   See normal See nt: normal See nt: normal

   See in chap empty name See xat on t: in chap empty name See xat on t:
in chap empty name

   See normal See xat on nt: normal See xat on nt: normal

   See in Top See Not here!

2 chap1
*******

2.1 Secc2
=========

';


$result_converted{'html_text'}->{'namedanchor'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<a class="namedanchor" id="in-Top"></a>
<ul class="mini-toc">
<li><a href="#chap">chapter <a class="namedanchor" id="Not-here_0021"></a>after</a></li>
<li><a href="#chap1">chap1</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="chapter-after"><span>1 chapter after<a class="copiable-link" href="#chapter-after"> &para;</a></span></h2>

<a class="namedanchor" id="in-chap-no-name"></a><a class="namedanchor" id="in-chap-empty-name"></a>
<p>Empty namedanchor
.
</p>
<a class="namedanchor" id="normal"></a>
<ul class="mini-toc">
<li><a href="#secc1">secc1</a></li>
</ul>
<hr>
<div class="section-level-extent" id="secc1">
<h3 class="section" id="secc1-1"><span>1.1 secc1<a class="copiable-link" href="#secc1-1"> &para;</a></span></h3>


<p>See <a class="xref" href="#in-chap-no-name">in chap no name</a>
See <a class="xref" href="#in-chap-no-name">t</a>
See <a class="xref" href="#in-chap-no-name">o</a>
</p>
<p>See <a class="xref" href="#normal">normal</a>
See <a class="xref" href="#normal">nt</a>
See <a class="xref" href="#normal">no</a>
</p>

<p>See <a class="xref" href="#in-chap-empty-name">in chap empty name</a>
See <a class="xref" href="#in-chap-empty-name">xat on t</a>
See <a class="xref" href="#in-chap-empty-name">xat on o</a>
</p>
<p>See <a class="xref" href="#normal">here we are</a>
See <a class="xref" href="#normal">xat on nt</a>
See <a class="xref" href="#normal">xat on no</a>
</p>
<p>See <a class="xref" href="#in-Top"><em class="emph">n in Top</em></a>
See <a class="xref" href="#Not-here_0021">There</a>
</p>
<hr>
</div>
</div>
<div class="chapter-level-extent" id="chap1">
<h2 class="chapter" id="chap1-1"><span>2 chap1<a class="copiable-link" href="#chap1-1"> &para;</a></span></h2>


<ul class="mini-toc">
<li><a href="#secc2">Secc2</a></li>
</ul>
<hr>
<div class="section-level-extent" id="secc2">
<h3 class="section" id="Secc2"><span>2.1 Secc2<a class="copiable-link" href="#Secc2"> &para;</a></span></h3>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'namedanchor'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<namedanchor><anchoridentifier identifier="in-Top">in Top</anchoridentifier><anchorname spaces=" "><emph>n in Top</emph></anchorname></namedanchor>

</top>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodenext automatic="on">chap1</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chapter <namedanchor><anchoridentifier identifier="Not-here_0021">Not here!</anchoridentifier><anchorname spaces=" ">There</anchorname></namedanchor> after</sectiontitle>

<namedanchor><anchoridentifier identifier="in-chap-no-name">in chap no name</anchoridentifier></namedanchor>
<namedanchor><anchoridentifier identifier="in-chap-empty-name">in chap empty name</anchoridentifier><anchorname spaces=" "></anchorname></namedanchor>

<para>Empty namedanchor
<namedanchor><anchoridentifier identifier="" spaces=" "></anchoridentifier></namedanchor>.
</para>
<namedanchor><anchoridentifier identifier="normal">normal</anchoridentifier><anchorname spaces=" ">here we are</anchorname></namedanchor>

<node identifier="secc1" spaces=" "><nodename>secc1</nodename><nodeup automatic="on">chap</nodeup></node>
<section spaces=" "><sectiontitle>secc1</sectiontitle>

<xrefautomaticsectiontitle spaces=" " value="off" line="off"></xrefautomaticsectiontitle>

<para><xref label="in-chap-no-name"><xrefnodename>in chap no name</xrefnodename></xref>
<xref label="in-chap-no-name"><xrefnodename>in chap no name</xrefnodename><xrefinfoname spaces=" ">t</xrefinfoname></xref>
<xref label="in-chap-no-name"><xrefnodename>in chap no name</xrefnodename><xrefinfoname spaces=" ">t</xrefinfoname><xrefprinteddesc spaces=" ">o</xrefprinteddesc></xref>
</para>
<para><xref label="normal"><xrefnodename>normal</xrefnodename></xref>
<xref label="normal"><xrefnodename>normal</xrefnodename><xrefinfoname spaces=" ">nt</xrefinfoname></xref>
<xref label="normal"><xrefnodename>normal</xrefnodename><xrefinfoname spaces=" ">nt</xrefinfoname><xrefprinteddesc spaces=" ">no</xrefprinteddesc></xref>
</para>
<xrefautomaticsectiontitle spaces=" " value="on" line="on"></xrefautomaticsectiontitle>

<para><xref label="in-chap-empty-name"><xrefnodename>in chap empty name</xrefnodename></xref>
<xref label="in-chap-empty-name"><xrefnodename>in chap empty name</xrefnodename><xrefinfoname spaces=" ">xat on t</xrefinfoname></xref>
<xref label="in-chap-empty-name"><xrefnodename>in chap empty name</xrefnodename><xrefinfoname spaces=" ">xat on t</xrefinfoname><xrefprinteddesc spaces=" ">xat on o</xrefprinteddesc></xref>
</para>
<para><xref label="normal"><xrefnodename>normal</xrefnodename></xref>
<xref label="normal"><xrefnodename>normal</xrefnodename><xrefinfoname spaces=" ">xat on nt</xrefinfoname></xref>
<xref label="normal"><xrefnodename>normal</xrefnodename><xrefinfoname spaces=" ">xat on nt</xrefinfoname><xrefprinteddesc spaces=" ">xat on no</xrefprinteddesc></xref>
</para>
<para><xref label="in-Top"><xrefnodename>in Top</xrefnodename></xref>
<xref label="Not-here_0021"><xrefnodename>Not here!</xrefnodename></xref>
</para>
</section>
</chapter>
<node identifier="chap1" spaces=" "><nodename>chap1</nodename><nodeprev automatic="on">chap</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>chap1</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>secc2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>in Top</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Not here!</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>in chap no name</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>normal</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>in chap empty name</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="secc2" spaces=" "><nodename>secc2</nodename><nodenext automatic="on">in Top</nodenext><nodeup automatic="on">chap1</nodeup></node>
<section spaces=" "><sectiontitle>Secc2</sectiontitle>
</section>
</chapter>
';


$result_converted{'docbook'}->{'namedanchor'} = '<chapter label="1" id="chap">
<title>chapter <anchor id="Not-here_0021"/>after</title>

<anchor id="in-chap-no-name"/><anchor id="in-chap-empty-name"/>
<para>Empty namedanchor
.
</para>
<anchor id="normal"/>
<sect1 label="1.1" id="secc1">
<title>secc1</title>


<para>See <link linkend="in-chap-no-name">in chap no name</link>
See <link linkend="in-chap-no-name">t</link>
See <link linkend="in-chap-no-name">o</link>
</para>
<para>See <link linkend="normal">normal</link>
See <link linkend="normal">nt</link>
See <link linkend="normal">no</link>
</para>

<para>See <link linkend="in-chap-empty-name">in chap empty name</link>
See <link linkend="in-chap-empty-name">xat on t</link>
See <link linkend="in-chap-empty-name">xat on o</link>
</para>
<para>See <link linkend="normal">normal</link>
See <link linkend="normal">xat on nt</link>
See <link linkend="normal">xat on no</link>
</para>
<para>See <link linkend="in-Top">in Top</link>
See <link linkend="Not-here_0021">Not here!</link>
</para>
</sect1>
</chapter>
<chapter label="2" id="chap1">
<title>chap1</title>


<sect1 label="2.1" id="secc2">
<title>Secc2</title>
</sect1>
</chapter>
';


$result_converted{'latex_text'}->{'namedanchor'} = '\\label{anchor:Top}%
\\label{anchor:in-Top}%
\\chapter{{chapter \\label{anchor:Not-here_0021}%
after}}
\\label{anchor:chap}%

\\label{anchor:in-chap-no-name}%
\\label{anchor:in-chap-empty-name}%

Empty namedanchor
\\label{anchor:}%
.

\\label{anchor:normal}%

\\section{{secc1}}
\\label{anchor:secc1}%


See \\hyperref[anchor:in-chap-no-name]{[in chap no name], page~\\pageref*{anchor:in-chap-no-name}}
See \\hyperref[anchor:in-chap-no-name]{[in chap no name], page~\\pageref*{anchor:in-chap-no-name}}
See \\hyperref[anchor:in-chap-no-name]{[o], page~\\pageref*{anchor:in-chap-no-name}}

See \\hyperref[anchor:normal]{[normal], page~\\pageref*{anchor:normal}}
See \\hyperref[anchor:normal]{[normal], page~\\pageref*{anchor:normal}}
See \\hyperref[anchor:normal]{[no], page~\\pageref*{anchor:normal}}


See \\hyperref[anchor:in-chap-empty-name]{[chapter \\label{anchor:Not-here_0021}%
after], page~\\pageref*{anchor:in-chap-empty-name}}
See \\hyperref[anchor:in-chap-empty-name]{[chapter \\label{anchor:Not-here_0021}%
after], page~\\pageref*{anchor:in-chap-empty-name}}
See \\hyperref[anchor:in-chap-empty-name]{[xat on o], page~\\pageref*{anchor:in-chap-empty-name}}

See \\hyperref[anchor:normal]{[here we are], page~\\pageref*{anchor:normal}}
See \\hyperref[anchor:normal]{[here we are], page~\\pageref*{anchor:normal}}
See \\hyperref[anchor:normal]{[xat on no], page~\\pageref*{anchor:normal}}

See \\hyperref[anchor:in-Top]{[\\emph{n in Top}], page~\\pageref*{anchor:in-Top}}
See \\hyperref[anchor:Not-here_0021]{[There], page~\\pageref*{anchor:Not-here_0021}}

\\chapter{{chap1}}
\\label{anchor:chap1}%


\\section{{Secc2}}
\\label{anchor:secc2}%
';

1;
