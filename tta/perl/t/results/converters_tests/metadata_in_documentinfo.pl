use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'metadata_in_documentinfo'} = '*document_root C5
 *before_node_section C1
  *preamble C2
   *normal_command@documentinfo C5 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@title C1 l2
    >SOURCEMARKS
    >ignored_conditional_block<1>
     >*normal_command@ifepub C15 l3
      >*arguments_line C1
       >*block_line_arg C1
        >{spaces_before_argument:\\n}
      >{raw:@html\\n}
      >{raw:   <dc:creator\\n}
      >{raw:       id="creator">\\n}
      >{raw:      Some Body\\n}
      >{raw:   </dc:creator>\\n}
      >{raw:   <meta\\n}
      >{raw:       refines="#creator"\\n}
      >{raw:       property="role"\\n}
      >{raw:       scheme="marc:relators"\\n}
      >{raw:       id="role">\\n}
      >{raw:      aut\\n}
      >{raw:   </meta>\\n}
      >{raw:@end html\\n}
      >*normal_command@end C1 l17
      >|text_arg:{ifepub}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:ifepub}
        >{spaces_after_argument:\\n}
    >expanded_conditional_command<start;1>
     >*normal_command@ifnotepub C1 l18
      >*arguments_line C1
       >*block_line_arg C1
        >{spaces_before_argument:\\n}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:The Title}
      {spaces_after_argument:\\n}
    *normal_command@html C3 l19
    >SOURCEMARKS
    >expanded_conditional_command<end;1>
     >*normal_command@end C1 l22
     >|text_arg:{ifnotepub}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifnotepub}
       >{spaces_after_argument:\\n}
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C1
      {normal_text:<meta name="creator" content="Some Body" />\\n}
     *normal_command@end C1 l21
     |text_arg:{html}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:html}
       {spaces_after_argument:\\n}
    *normal_command@docbook C3 l23
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C25
      {normal_text:<authorgroup>\\n}
      {normal_text:  <author>\\n}
      {normal_text:    <honorific>Dr.</honorific>\\n}
      {normal_text:    <firstname>Lois</firstname>\\n}
      {normal_text:    <surname>Common-Demoninator</surname>\\n}
      {normal_text:    <affiliation>\\n}
      {normal_text:      <shortaffil>Director, M. Behn School of Coop. Eng.</shortaffil>\\n}
      {normal_text:      <jobtitle>Director of Cooperative Efforts</jobtitle>\\n}
      {normal_text:      <orgname>The Marguerite Behn International School of\\n}
      {normal_text:               Cooperative Engineering</orgname>\\n}
      {normal_text:    </affiliation>\\n}
      {normal_text:  </author>\\n}
      {empty_line:\\n}
      {normal_text:  <editor>\\n}
      {normal_text:    <firstname>Peter</firstname>\\n}
      {normal_text:    <surname>Parker</surname>\\n}
      {normal_text:    <lineage>Sr.</lineage>\\n}
      {normal_text:    <othername>Spiderman</othername>\\n}
      {normal_text:    <authorblurb>\\n}
      {normal_text:      <para>\\n}
      {normal_text:      Peter is a super hero in his spare time.\\n}
      {normal_text:      </para>\\n}
      {normal_text:    </authorblurb>\\n}
      {normal_text:  </editor>\\n}
      {normal_text:</authorgroup>\\n}
     *normal_command@end C1 l49
     |text_arg:{docbook}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:docbook}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l50
    |text_arg:{documentinfo}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentinfo}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l52 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l53 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l55 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l56 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
';


$result_texis{'metadata_in_documentinfo'} = '@documentinfo
@title The Title
@html
<meta name="creator" content="Some Body" />
@end html
@docbook
<authorgroup>
  <author>
    <honorific>Dr.</honorific>
    <firstname>Lois</firstname>
    <surname>Common-Demoninator</surname>
    <affiliation>
      <shortaffil>Director, M. Behn School of Coop. Eng.</shortaffil>
      <jobtitle>Director of Cooperative Efforts</jobtitle>
      <orgname>The Marguerite Behn International School of
               Cooperative Engineering</orgname>
    </affiliation>
  </author>

  <editor>
    <firstname>Peter</firstname>
    <surname>Parker</surname>
    <lineage>Sr.</lineage>
    <othername>Spiderman</othername>
    <authorblurb>
      <para>
      Peter is a super hero in his spare time.
      </para>
    </authorblurb>
  </editor>
</authorgroup>
@end docbook
@end documentinfo

@node Top
@top top

@node chapter
@chapter Chap
';


$result_texts{'metadata_in_documentinfo'} = '
top
***

1 Chap
******
';

$result_errors{'metadata_in_documentinfo'} = '';

$result_nodes_list{'metadata_in_documentinfo'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'metadata_in_documentinfo'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'metadata_in_documentinfo'} = 'level: -1
list:
 1|top
';

$result_headings_list{'metadata_in_documentinfo'} = '';


$result_converted{'plaintext'}->{'metadata_in_documentinfo'} = 'top
***

1 Chap
******

';


$result_converted{'html'}->{'metadata_in_documentinfo'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>The Title</title>

<meta name="description" content="The Title">
<meta name="keywords" content="The Title">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="creator" content="Some Body" />

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>

<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">Chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>
</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'metadata_in_documentinfo'} = '<documentinfo endspaces=" ">
<title> The Title</title>
<html endspaces=" ">
&lt;meta name=&quot;creator&quot; content=&quot;Some Body&quot; /&gt;
</html>
<docbook endspaces=" ">
&lt;authorgroup&gt;
  &lt;author&gt;
    &lt;honorific&gt;Dr.&lt;/honorific&gt;
    &lt;firstname&gt;Lois&lt;/firstname&gt;
    &lt;surname&gt;Common-Demoninator&lt;/surname&gt;
    &lt;affiliation&gt;
      &lt;shortaffil&gt;Director, M. Behn School of Coop. Eng.&lt;/shortaffil&gt;
      &lt;jobtitle&gt;Director of Cooperative Efforts&lt;/jobtitle&gt;
      &lt;orgname&gt;The Marguerite Behn International School of
               Cooperative Engineering&lt;/orgname&gt;
    &lt;/affiliation&gt;
  &lt;/author&gt;

  &lt;editor&gt;
    &lt;firstname&gt;Peter&lt;/firstname&gt;
    &lt;surname&gt;Parker&lt;/surname&gt;
    &lt;lineage&gt;Sr.&lt;/lineage&gt;
    &lt;othername&gt;Spiderman&lt;/othername&gt;
    &lt;authorblurb&gt;
      &lt;para&gt;
      Peter is a super hero in his spare time.
      &lt;/para&gt;
    &lt;/authorblurb&gt;
  &lt;/editor&gt;
&lt;/authorgroup&gt;
</docbook>
</documentinfo>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>
</chapter>
';


$result_converted{'docbook_doc'}->{'metadata_in_documentinfo'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>The Title</title>
<bookinfo><title>The Title</title>
<authorgroup>
  <author>
    <honorific>Dr.</honorific>
    <firstname>Lois</firstname>
    <surname>Common-Demoninator</surname>
    <affiliation>
      <shortaffil>Director, M. Behn School of Coop. Eng.</shortaffil>
      <jobtitle>Director of Cooperative Efforts</jobtitle>
      <orgname>The Marguerite Behn International School of
               Cooperative Engineering</orgname>
    </affiliation>
  </author>

  <editor>
    <firstname>Peter</firstname>
    <surname>Parker</surname>
    <lineage>Sr.</lineage>
    <othername>Spiderman</othername>
    <authorblurb>
      <para>
      Peter is a super hero in his spare time.
      </para>
    </authorblurb>
  </editor>
</authorgroup>
</bookinfo>
<chapter label="1" id="chapter">
<title>Chap</title>
</chapter>
</book>
';


$result_converted{'latex_text'}->{'metadata_in_documentinfo'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chapter}%
';

1;
