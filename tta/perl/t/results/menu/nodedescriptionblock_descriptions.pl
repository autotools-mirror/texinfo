use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodedescriptionblock_descriptions'} = '*document_root C13
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l2 {test of nodedescriptionblock used in menu}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {test of nodedescriptionblock used in menu}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C8 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{toto}
     {toto}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{titi}
     {titi}
    {menu_entry_separator:::  }
    *menu_entry_description C1
     *preformatted C1
      {desc of titi\\n}
   *menu_entry C6 l7
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {name of other}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{other}
     {other}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-somewhat-long-node-without-description-nor-following-space}
     {a somewhat long node without description nor following space}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-double-nodedescriptionblock}
     {node double nodedescriptionblock}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {toto}
 |EXTRA
 |identifier:{toto}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {toto}
    {spaces_after_argument:\\n}
 *@chapter C6 l14 {Toto}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Toto}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l16
   *line_arg C10
    {spaces_before_argument: }
    {toto is there:: and the }
    *@emph C1 l16
     *brace_container C1
      {is a description}
    *@w C1 l16
     *brace_container C1
      {slightly long}
    { and }
    *@verb C1 l16
    |INFO
    |delimiter:{:}
     *brace_container C1
      {raw:vv somewhat}
    { }
    *@ringaccent C2 l16
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {a}
    {nexpected}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {Block along line node description for toto\\n}
   *@end C1 l20
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l22 {titi}
 |EXTRA
 |identifier:{titi}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {titi}
    {spaces_after_argument:\\n}
 *@chapter C4 l23 {Titi}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Titi}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {description of titi in block\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l29 {other}
 |EXTRA
 |identifier:{other}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {other}
    {spaces_after_argument:\\n}
 *@chapter C4 l30 {Other}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Other}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C7 l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {Long description of other\\n}
   {empty_line:\\n}
   *paragraph C1
    {Para2\\n}
   {empty_line:\\n}
   *@quotation C3 l37
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {a quotation in description\\n}
    *@end C1 l39
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   *@end C1 l40
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l42 {a somewhat long node without description nor following space}
 |EXTRA
 |identifier:{a-somewhat-long-node-without-description-nor-following-space}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {a somewhat long node without description nor following space}
    {spaces_after_argument:\\n}
 *@chapter C6 l43 {Somewhat long}
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Somewhat long}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l45
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {Block description before, not as long as the node\\n}
   *@end C1 l47
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l49
   *line_arg C3
    {spaces_before_argument: }
    {not as long as the node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l51 {node double nodedescriptionblock}
 |EXTRA
 |identifier:{node-double-nodedescriptionblock}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {node double nodedescriptionblock}
    {spaces_after_argument:\\n}
 *@chapter C6 l52 {test double}
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {test double}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l54
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {block desc 1\\n}
   *@end C1 l56
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescriptionblock C3 l58
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {block desc 2\\n}
   *@end C1 l60
   |EXTRA
   |text_arg:{nodedescriptionblock}
    *line_arg C3
     {spaces_before_argument: }
     {nodedescriptionblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'nodedescriptionblock_descriptions'} = '@node Top
@top test of nodedescriptionblock used in menu

@menu
* toto::
* titi::  desc of titi
* name of other: other.

* a somewhat long node without description nor following space::
* node double nodedescriptionblock::
@end menu

@node toto
@chapter Toto

@nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected

@nodedescriptionblock
Block along line node description for toto
@end nodedescriptionblock

@node titi
@chapter Titi

@nodedescriptionblock
description of titi in block
@end nodedescriptionblock

@node other
@chapter Other

@nodedescriptionblock
Long description of other

Para2

@quotation
a quotation in description
@end quotation
@end nodedescriptionblock

@node a somewhat long node without description nor following space
@chapter Somewhat long

@nodedescriptionblock
Block description before, not as long as the node
@end nodedescriptionblock

@nodedescription not as long as the node

@node node double nodedescriptionblock
@chapter test double

@nodedescriptionblock
block desc 1
@end nodedescriptionblock

@nodedescriptionblock
block desc 2
@end nodedescriptionblock

';


$result_texts{'nodedescriptionblock_descriptions'} = 'test of nodedescriptionblock used in menu
*****************************************

* toto::
* titi::  desc of titi
* name of other: other.

* a somewhat long node without description nor following space::
* node double nodedescriptionblock::

1 Toto
******



2 Titi
******


3 Other
*******


4 Somewhat long
***************



5 test double
*************



';

$result_errors{'nodedescriptionblock_descriptions'} = '* W l16|@verb should not appear on @nodedescription line
 warning: @verb should not appear on @nodedescription line

* W l58|multiple node @nodedescriptionblock
 warning: multiple node @nodedescriptionblock

';

$result_nodes_list{'nodedescriptionblock_descriptions'} = '1|Top
 associated_section: test of nodedescriptionblock used in menu
 associated_title_command: test of nodedescriptionblock used in menu
 menus:
  toto
  titi
  other
  a somewhat long node without description nor following space
  node double nodedescriptionblock
 node_directions:
  next->toto
2|toto
 associated_section: 1 Toto
 associated_title_command: 1 Toto
 node_descriptions:
  @nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected
 node_long_descriptions:
  @nodedescriptionblock l18
 node_directions:
  next->titi
  prev->Top
  up->Top
3|titi
 associated_section: 2 Titi
 associated_title_command: 2 Titi
 node_long_descriptions:
  @nodedescriptionblock l25
 node_directions:
  next->other
  prev->toto
  up->Top
4|other
 associated_section: 3 Other
 associated_title_command: 3 Other
 node_long_descriptions:
  @nodedescriptionblock l32
 node_directions:
  next->a somewhat long node without description nor following space
  prev->titi
  up->Top
5|a somewhat long node without description nor following space
 associated_section: 4 Somewhat long
 associated_title_command: 4 Somewhat long
 node_descriptions:
  @nodedescription not as long as the node
 node_long_descriptions:
  @nodedescriptionblock l45
 node_directions:
  next->node double nodedescriptionblock
  prev->other
  up->Top
6|node double nodedescriptionblock
 associated_section: 5 test double
 associated_title_command: 5 test double
 node_long_descriptions:
  @nodedescriptionblock l54
  @nodedescriptionblock l58
 node_directions:
  prev->a somewhat long node without description nor following space
  up->Top
';

$result_sections_list{'nodedescriptionblock_descriptions'} = '1|test of nodedescriptionblock used in menu
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Toto
 section_children:
  1|Toto
  2|Titi
  3|Other
  4|Somewhat long
  5|test double
2|Toto
 associated_anchor_command: toto
 associated_node: toto
 section_directions:
  next->Titi
  up->test of nodedescriptionblock used in menu
 toplevel_directions:
  next->Titi
  prev->test of nodedescriptionblock used in menu
  up->test of nodedescriptionblock used in menu
3|Titi
 associated_anchor_command: titi
 associated_node: titi
 section_directions:
  next->Other
  prev->Toto
  up->test of nodedescriptionblock used in menu
 toplevel_directions:
  next->Other
  prev->Toto
  up->test of nodedescriptionblock used in menu
4|Other
 associated_anchor_command: other
 associated_node: other
 section_directions:
  next->Somewhat long
  prev->Titi
  up->test of nodedescriptionblock used in menu
 toplevel_directions:
  next->Somewhat long
  prev->Titi
  up->test of nodedescriptionblock used in menu
5|Somewhat long
 associated_anchor_command: a somewhat long node without description nor following space
 associated_node: a somewhat long node without description nor following space
 section_directions:
  next->test double
  prev->Other
  up->test of nodedescriptionblock used in menu
 toplevel_directions:
  next->test double
  prev->Other
  up->test of nodedescriptionblock used in menu
6|test double
 associated_anchor_command: node double nodedescriptionblock
 associated_node: node double nodedescriptionblock
 section_directions:
  prev->Somewhat long
  up->test of nodedescriptionblock used in menu
 toplevel_directions:
  prev->Somewhat long
  up->test of nodedescriptionblock used in menu
';

$result_sectioning_root{'nodedescriptionblock_descriptions'} = 'level: -1
list:
 1|test of nodedescriptionblock used in menu
';

$result_headings_list{'nodedescriptionblock_descriptions'} = '';


$result_converted{'plaintext'}->{'nodedescriptionblock_descriptions'} = 'test of nodedescriptionblock used in menu
*****************************************

* Menu:

* toto::                       toto is there:: and the _is a
                               description_slightly long and vv somewhat
                               ånexpected
* titi::  desc of titi
* name of other: other.        Long description of other

                               Para2

                                    a quotation in description

* a somewhat long node without description nor following space::  not as long
                               as the node
* node double nodedescriptionblock::  block desc 1

1 Toto
******

2 Titi
******

3 Other
*******

4 Somewhat long
***************

5 test double
*************

';


$result_converted{'html'}->{'nodedescriptionblock_descriptions'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test of nodedescriptionblock used in menu</title>

<meta name="description" content="test of nodedescriptionblock used in menu">
<meta name="keywords" content="test of nodedescriptionblock used in menu">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
pre.menu-comment-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#toto" accesskey="n" rel="next">Toto</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="test-of-nodedescriptionblock-used-in-menu"><span>test of nodedescriptionblock used in menu<a class="copiable-link" href="#test-of-nodedescriptionblock-used-in-menu"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#toto" accesskey="1">toto</a>:</td><td class="menu-entry-description">toto is there:: and the <em class="emph">is a description</em>slightly&nbsp;long<!-- /@w --> and <code class="verb">vv&nbsp;somewhat</code> &aring;nexpected</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#titi" accesskey="2">titi</a>:</td><td class="menu-entry-description">desc of titi
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#other" accesskey="3">name of other</a>:</td><td class="menu-entry-description">Long description of other

<p>Para2
</p>
<blockquote class="quotation">
<p>a quotation in description
</p></blockquote>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="4">a somewhat long node without description nor following space</a>:</td><td class="menu-entry-description">not as long as the node</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#node-double-nodedescriptionblock" accesskey="5">node double nodedescriptionblock</a>:</td><td class="menu-entry-description">block desc 1
</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="toto">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#titi" accesskey="n" rel="next">Titi</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">test of nodedescriptionblock used in menu</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Toto"><span>1 Toto<a class="copiable-link" href="#Toto"> &para;</a></span></h2>



<hr>
</div>
<div class="chapter-level-extent" id="titi">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#other" accesskey="n" rel="next">Other</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#toto" accesskey="p" rel="prev">Toto</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Titi"><span>2 Titi<a class="copiable-link" href="#Titi"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="other">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="n" rel="next">Somewhat long</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#titi" accesskey="p" rel="prev">Titi</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Other"><span>3 Other<a class="copiable-link" href="#Other"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="a-somewhat-long-node-without-description-nor-following-space">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#node-double-nodedescriptionblock" accesskey="n" rel="next">test double</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#other" accesskey="p" rel="prev">Other</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Somewhat-long"><span>4 Somewhat long<a class="copiable-link" href="#Somewhat-long"> &para;</a></span></h2>



<hr>
</div>
<div class="chapter-level-extent" id="node-double-nodedescriptionblock">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="p" rel="prev">Somewhat long</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescriptionblock used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="test-double"><span>5 test double<a class="copiable-link" href="#test-double"> &para;</a></span></h2>



</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'nodedescriptionblock_descriptions'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> toto</nodenext></node>
<top><sectiontitle> test of nodedescriptionblock used in menu</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>toto</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>titi</menunode><menuseparator>::  </menuseparator><menudescription><pre xml:space="preserve">desc of titi
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name of other</menutitle><menuseparator>: </menuseparator><menunode>other</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>a somewhat long node without description nor following space</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>node double nodedescriptionblock</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="toto"><nodename> toto</nodename><nodenext automatic="on"> titi</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Toto</sectiontitle>

<nodedescription> toto is there:: and the <emph>is a description</emph><w>slightly long</w> and <verb delimiter=":">vv somewhat</verb> <accent type="ring" bracketed="off"> </accent>nexpected</nodedescription>

<nodedescriptionblock endspaces=" ">
<para>Block along line node description for toto
</para></nodedescriptionblock>

</chapter>
<node identifier="titi"><nodename> titi</nodename><nodenext automatic="on"> other</nodenext><nodeprev automatic="on"> toto</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Titi</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>description of titi in block
</para></nodedescriptionblock>

</chapter>
<node identifier="other"><nodename> other</nodename><nodenext automatic="on"> a somewhat long node without description nor following space</nodenext><nodeprev automatic="on"> titi</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Other</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>Long description of other
</para>
<para>Para2
</para>
<quotation endspaces=" ">
<para>a quotation in description
</para></quotation>
</nodedescriptionblock>

</chapter>
<node identifier="a-somewhat-long-node-without-description-nor-following-space"><nodename> a somewhat long node without description nor following space</nodename><nodenext automatic="on"> node double nodedescriptionblock</nodenext><nodeprev automatic="on"> other</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Somewhat long</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>Block description before, not as long as the node
</para></nodedescriptionblock>

<nodedescription> not as long as the node</nodedescription>

</chapter>
<node identifier="node-double-nodedescriptionblock"><nodename> node double nodedescriptionblock</nodename><nodeprev automatic="on"> a somewhat long node without description nor following space</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> test double</sectiontitle>

<nodedescriptionblock endspaces=" ">
<para>block desc 1
</para></nodedescriptionblock>

<nodedescriptionblock endspaces=" ">
<para>block desc 2
</para></nodedescriptionblock>

</chapter>
';

1;
