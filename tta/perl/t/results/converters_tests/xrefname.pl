use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'xrefname'} = '*document_root C7
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
 *@top C3 l2 {top}
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
  {empty_line:\\n}
 *@node C3 l5 {ntiti}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{ntiti}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ntiti}
  *@xrefname C1 l6
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {titi}
  {empty_line:\\n}
 *@chapter C2 l8 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
 *@node C1 l10 {chip}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{chip}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chip}
 *@appendix C9 l11 {app}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {app}
  {empty_line:\\n}
  *@xrefautomaticsectiontitle C1 l13
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
  *paragraph C2
   *@xref C1 l15
    *brace_arg C1
    |EXTRA
    |node_content:{ntiti}
    |normalized:{ntiti}
     {ntiti}
   {\\n}
  {empty_line:\\n}
  *@xrefautomaticsectiontitle C1 l17
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
  *paragraph C3
   {xrefautomaticsectiontitle on }
   *@ref C1 l19
    *brace_arg C1
    |EXTRA
    |node_content:{ntiti}
    |normalized:{ntiti}
     {ntiti}
   {.\\n}
';


$result_texis{'xrefname'} = '@node Top
@top top


@node ntiti
@xrefname titi

@chapter chap

@node chip
@appendix app

@xrefautomaticsectiontitle off

@xref{ntiti}

@xrefautomaticsectiontitle on

xrefautomaticsectiontitle on @ref{ntiti}.
';


$result_texts{'xrefname'} = 'top
***



1 chap
******

Appendix A app
**************


ntiti


xrefautomaticsectiontitle on ntiti.
';

$result_errors{'xrefname'} = '';

$result_nodes_list{'xrefname'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->ntiti
2|ntiti
 associated_section: 1 chap
 associated_title_command: @xrefname titi
 node_directions:
  next->chip
  prev->Top
  up->Top
3|chip
 associated_section: A app
 associated_title_command: A app
 node_directions:
  prev->ntiti
  up->Top
';

$result_sections_list{'xrefname'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|app
2|chap
 associated_node: ntiti
 section_directions:
  next->app
  up->top
 toplevel_directions:
  next->app
  prev->top
  up->top
3|app
 associated_anchor_command: chip
 associated_node: chip
 section_directions:
  prev->chap
  up->top
 toplevel_directions:
  prev->chap
  up->top
';

$result_sectioning_root{'xrefname'} = 'level: -1
list:
 1|top
';

$result_headings_list{'xrefname'} = '1|titi
 associated_anchor_command: ntiti
';


$result_converted{'plaintext'}->{'xrefname'} = 'top
***

1 chap
******

Appendix A app
**************

See ntiti

   xrefautomaticsectiontitle on ntiti.
';


$result_converted{'html_text'}->{'xrefname'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#ntiti">chap</a></li>
<li><a href="#chip">app</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="ntiti">

<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<hr>
</div>
<div class="appendix-level-extent" id="chip">
<h2 class="appendix" id="app"><span>Appendix A app<a class="copiable-link" href="#app"> &para;</a></span></h2>


<p>See <a class="xref" href="#ntiti">ntiti</a>
</p>

<p>xrefautomaticsectiontitle on <a class="ref" href="#ntiti">titi</a>.
</p></div>
</div>
';


$result_converted{'xml'}->{'xrefname'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">ntiti</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>


</top>
<node identifier="ntiti" spaces=" "><nodename>ntiti</nodename><nodenext automatic="on">chip</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<xrefname spaces=" ">titi</xrefname>

<chapter spaces=" "><sectiontitle>chap</sectiontitle>

</chapter>
<node identifier="chip" spaces=" "><nodename>chip</nodename><nodeprev automatic="on">ntiti</nodeprev><nodeup automatic="on">Top</nodeup></node>
<appendix spaces=" "><sectiontitle>app</sectiontitle>

<xrefautomaticsectiontitle spaces=" " value="off" line="off"></xrefautomaticsectiontitle>

<para><xref label="ntiti"><xrefnodename>ntiti</xrefnodename></xref>
</para>
<xrefautomaticsectiontitle spaces=" " value="on" line="on"></xrefautomaticsectiontitle>

<para>xrefautomaticsectiontitle on <ref label="ntiti"><xrefnodename>ntiti</xrefnodename></ref>.
</para></appendix>
';


$result_converted{'docbook'}->{'xrefname'} = '<chapter label="1" id="ntiti">
<title>chap</title>


</chapter>
<appendix label="A" id="chip">
<title>app</title>


<para>See <link linkend="ntiti">ntiti</link>
</para>

<para>xrefautomaticsectiontitle on <link linkend="ntiti">ntiti</link>.
</para></appendix>
';


$result_converted{'latex_text'}->{'xrefname'} = '\\label{anchor:Top}%

\\chapter{{chap}}
\\label{anchor:ntiti}%

\\appendix
\\chapter{{app}}
\\label{anchor:chip}%


See \\hyperref[anchor:ntiti]{[ntiti], page~\\pageref*{anchor:ntiti}}


xrefautomaticsectiontitle on \\hyperref[anchor:ntiti]{[titi], page~\\pageref*{anchor:ntiti}}.
';

1;
