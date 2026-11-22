use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_in_nodedescriptionblock'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C6 l2 {test commands in nodedescriptionblock}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:test commands in nodedescriptionblock}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node1}
     {normal_text:node1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node2}
     {normal_text:node2}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@ref C1 l9
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{in-nodescription}
     {normal_text:in nodescription}
   {normal_text:, }
   *@ref C1 l9
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{f1}
     {normal_text:f1}
   {normal_text:.\\n}
  {empty_line:\\n}
 *@node C1 l11 {node1}
 |EXTRA
 |identifier:{node1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node1}
    {spaces_after_argument:\\n}
 *@chapter C4 l12 {chap1}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C10 l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@anchor C1 l15
   |EXTRA
   |identifier:{in-nodescription}
   |is_target:{1}
    *brace_arg C1
     {normal_text:in nodescription}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *paragraph C8
    *@ref C1 l17
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{node2}
      {normal_text:node2}
    {normal_text:. Footnote}
    *@footnote C1 l17
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:in footnote}
    {normal_text:. Some text to see\\n}
    {normal_text:where the max column could be. }
    *@w C1 l18
     *brace_container C1
      {normal_text:in w}
    {normal_text:.\\n}
    *index_entry_command@cindex C1 l19
    |EXTRA
    |element_node:{node1}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:in nodedescriptionblock}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@float C6 l21
   |EXTRA
   |float_number:{1.1}
   |float_type:{tfloat}
   |global_command_number:{1}
   |identifier:{f1}
   |is_target:{1}
    *arguments_line C2
     *block_line_arg C2
      {spaces_before_argument: }
      {normal_text:tfloat}
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:f1}
      {spaces_after_argument:\\n}
    *@image C1 l22
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:float_image}
    {normal_text:\\n}
    *@caption C1 l23
     *brace_command_context C1
      *paragraph C1
       {normal_text:Cap1}
    {spaces_after_close_brace:\\n}
    *@end C1 l24
    |EXTRA
    |text_arg:{float}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:float}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l29 {node2}
 |EXTRA
 |identifier:{node2}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node2}
    {spaces_after_argument:\\n}
 *@chapter C11 l30 {chap2}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@ref C1 l32
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{in-nodescription}
     {normal_text:in nodescription}
   {normal_text:, }
   *@ref C1 l32
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{f1}
     {normal_text:f1}
   {normal_text:.\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:node1 again to test two nodescription expansions}
    {spaces_after_argument:\\n}
  *@menu C3 l35
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l36
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node1}
     {normal_text:node1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l37
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l39
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@listoffloats C1 l41
  |EXTRA
  |float_type:{tfloat}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:tfloat}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'commands_in_nodedescriptionblock'} = '@node Top
@top test commands in nodedescriptionblock

@menu
* node1::
* node2::
@end menu

@ref{in nodescription}, @ref{f1}.

@node node1
@chapter chap1

@nodedescriptionblock
@anchor{in nodescription}

@ref{node2}. Footnote@footnote{in footnote}. Some text to see
where the max column could be. @w{in w}.
@cindex in nodedescriptionblock

@float tfloat, f1
@image{float_image}
@caption{Cap1}
@end float


@end nodedescriptionblock

@node node2
@chapter chap2

@ref{in nodescription}, @ref{f1}.

@c node1 again to test two nodescription expansions
@menu
* node1::
@end menu

@printindex cp

@listoffloats tfloat

';


$result_texts{'commands_in_nodedescriptionblock'} = 'test commands in nodedescriptionblock
*************************************

* node1::
* node2::

in nodescription, f1.

1 chap1
*******


2 chap2
*******

in nodescription, f1.

* node1::



';

$result_errors{'commands_in_nodedescriptionblock'} = '';

$result_floats{'commands_in_nodedescriptionblock'} = 'tfloat: 1
 F1.1: {f1}
  C: Cap1
';

$result_nodes_list{'commands_in_nodedescriptionblock'} = '1|Top
 associated_section: test commands in nodedescriptionblock
 associated_title_command: test commands in nodedescriptionblock
 menus:
  node1
  node2
 node_directions:
  next->node1
2|node1
 associated_section: 1 chap1
 associated_title_command: 1 chap1
 node_long_descriptions:
  @nodedescriptionblock l14
 node_directions:
  next->node2
  prev->Top
  up->Top
3|node2
 associated_section: 2 chap2
 associated_title_command: 2 chap2
 menus:
  node1
 node_directions:
  prev->node1
  up->Top
';

$result_sections_list{'commands_in_nodedescriptionblock'} = '1|test commands in nodedescriptionblock
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap1
 section_children:
  1|chap1
  2|chap2
2|chap1
 associated_anchor_command: node1
 associated_node: node1
 section_directions:
  next->chap2
  up->test commands in nodedescriptionblock
 toplevel_directions:
  next->chap2
  prev->test commands in nodedescriptionblock
  up->test commands in nodedescriptionblock
3|chap2
 associated_anchor_command: node2
 associated_node: node2
 section_directions:
  prev->chap1
  up->test commands in nodedescriptionblock
 toplevel_directions:
  prev->chap1
  up->test commands in nodedescriptionblock
';

$result_sectioning_root{'commands_in_nodedescriptionblock'} = 'level: -1
list:
 1|test commands in nodedescriptionblock
';

$result_headings_list{'commands_in_nodedescriptionblock'} = '';

$result_indices_sort_strings{'commands_in_nodedescriptionblock'} = 'cp:
 in nodedescriptionblock
';


$result_converted{'plaintext'}->{'commands_in_nodedescriptionblock'} = 'test commands in nodedescriptionblock
*************************************

* Menu:

* node1::
               node2.  Footnote(1).  Some text to see where the max column could be.
               in w.

[float_image]

               tfloat 1.1: Cap1


* node2::

in nodescription, tfloat 1.1: f1.

   ---------- Footnotes ----------

   (1) in footnote

1 chap1
*******

2 chap2
*******

in nodescription, tfloat 1.1: f1.

* Menu:

* node1::
               node2.  Footnote(1).  Some text to see where the max column could be.
               in w.

[float_image]

               tfloat 1.1: Cap1


* Menu:

* in nodedescriptionblock:               node2.                (line 34)

* Menu:

* tfloat 1.1: f1.                        Cap1

   ---------- Footnotes ----------

   (1) in footnote

';

$result_converted_sort_strings{'plaintext'}->{'commands_in_nodedescriptionblock'} = 'cp:
 in nodedescriptionblock
';

$result_converted_errors{'plaintext'}->{'commands_in_nodedescriptionblock'} = '* W l22|could not find @image file `float_image.txt\' nor alternate text
 warning: could not find @image file `float_image.txt\' nor alternate text

';


$result_converted{'html'}->{'commands_in_nodedescriptionblock'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test commands in nodedescriptionblock</title>

<meta name="description" content="test commands in nodedescriptionblock">
<meta name="keywords" content="test commands in nodedescriptionblock">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="#node2" rel="index" title="node2">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node1" accesskey="n" rel="next">chap1</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#node2" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="test-commands-in-nodedescriptionblock"><span>test commands in nodedescriptionblock<a class="copiable-link" href="#test-commands-in-nodedescriptionblock"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#node1" accesskey="1">node1</a>:</td><td class="menu-entry-description"><a class="anchor" id="in-nodescription"></a>
<a class="ref" href="#node2">chap2</a>. Footnote<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>. Some text to see
where the max column could be. in&nbsp;w<!-- /@w -->.
<a class="index-entry-id" id="index-in-nodedescriptionblock"></a>

<div class="float" id="f1">
<img class="image" src="float_image.jpg" alt="float_image">
<div class="caption"><p><strong class="strong">tfloat 1.1: </strong>Cap1</p></div></div>

</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#node2" rel="index" accesskey="2">node2</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<p><a class="ref" href="#in-nodescription">in nodescription</a>, <a class="ref" href="#f1">tfloat 1.1</a>.
</p>
<hr>
<div class="chapter-level-extent" id="node1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node2" accesskey="n" rel="next">chap2</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">test commands in nodedescriptionblock</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test commands in nodedescriptionblock</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#node2" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="chap1"><span>1 chap1<a class="copiable-link" href="#chap1"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="node2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#node1" accesskey="p" rel="prev">chap1</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test commands in nodedescriptionblock</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#node2" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="chap2"><span>2 chap2<a class="copiable-link" href="#chap2"> &para;</a></span></h2>

<p><a class="ref" href="#in-nodescription">in nodescription</a>, <a class="ref" href="#f1">tfloat 1.1</a>.
</p>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#node1" accesskey="1">node1</a>:</td><td class="menu-entry-description">
<a class="ref" href="#node2">chap2</a>. Footnote<a class="footnote" id="t_fnode-description-2_DOCF1_2" href="#t_fnode-description-2_FOOT1_2"><sup>2</sup></a>. Some text to see
where the max column could be. in&nbsp;w<!-- /@w -->.

<div class="float" id="f1">
<img class="image" src="float_image.jpg" alt="float_image">
<div class="caption"><p><strong class="strong">tfloat 1.1: </strong>Cap1</p></div></div>

</td></tr>
</table>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="node2_cp_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-in-nodedescriptionblock">in nodedescriptionblock</a></td><td class="printindex-index-section"><a href="#node1">node1</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<dl class="listoffloats">
<dt><a href="#f1">tfloat 1.1</a></dt><dd class="caption-in-listoffloats"><p>Cap1</p></dd>
</dl>

</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>in footnote</p>
<h5 class="footnote-body-heading"><a id="t_fnode-description-2_FOOT1_2" href="#t_fnode-description-2_DOCF1_2">(2)</a></h5>
<p>in footnote</p>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'commands_in_nodedescriptionblock'} = 'cp:
 in nodedescriptionblock
';

$result_converted_errors{'html'}->{'commands_in_nodedescriptionblock'} = '* W l22|@image file `float_image\' (for HTML) not found, using `float_image.jpg\'
 warning: @image file `float_image\' (for HTML) not found, using `float_image.jpg\'

* W l22|@image file `float_image\' (for HTML) not found, using `float_image.jpg\'
 warning: @image file `float_image\' (for HTML) not found, using `float_image.jpg\'

';


$result_converted{'xml'}->{'commands_in_nodedescriptionblock'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> node1</nodenext></node>
<top><sectiontitle> test commands in nodedescriptionblock</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>node1</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>node2</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<para><ref label="in-nodescription"><xrefnodename>in nodescription</xrefnodename></ref>, <ref label="f1"><xrefnodename>f1</xrefnodename></ref>.
</para>
</top>
<node identifier="node1"><nodename> node1</nodename><nodenext automatic="on"> node2</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap1</sectiontitle>

<nodedescriptionblock endspaces=" ">
<anchor identifier="in-nodescription">in nodescription</anchor>

<para><ref label="node2"><xrefnodename>node2</xrefnodename></ref>. Footnote<footnote><para>in footnote</para></footnote>. Some text to see
where the max column could be. <w>in w</w>.
<cindex index="cp"> <indexterm index="cp" number="1">in nodedescriptionblock</indexterm></cindex>
</para>
<float identifier="f1" type="tfloat" number="1.1" endspaces=" "><floattype> tfloat</floattype><floatname> f1</floatname>
<image><imagefile>float_image</imagefile></image>
<caption><para>Cap1</para></caption>
</float>


</nodedescriptionblock>

</chapter>
<node identifier="node2"><nodename> node2</nodename><nodeprev automatic="on"> node1</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap2</sectiontitle>

<para><ref label="in-nodescription"><xrefnodename>in nodescription</xrefnodename></ref>, <ref label="f1"><xrefnodename>f1</xrefnodename></ref>.
</para>
<!-- c node1 again to test two nodescription expansions -->
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>node1</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<printindex value="cp" line=" cp"></printindex>

<listoffloats type="tfloat"> tfloat</listoffloats>

</chapter>
';

1;
