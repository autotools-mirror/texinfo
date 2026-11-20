use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodedescription_descriptions'} = '*document_root C17
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
 *@top C4 l2 {test of nodedescription used in menu}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {test of nodedescription used in menu}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C10 l4
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
    {menu_entry_separator:::   }
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
   *menu_entry C6 l9
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {name of last}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{last}
     {last}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {desc of last\\n}
   *menu_entry C4 l10
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
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-very-long-node-without-description-with-very-little-space-left-for}
     {a very long node without description with very little space left for}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{very-very-long-node-extending-past-the-max-columns-and-without-description}
     {very very long node extending past the max columns and without description}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l13
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l15 {toto}
 |EXTRA
 |identifier:{toto}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {toto}
    {spaces_after_argument:\\n}
 *@chapter C4 l16 {Toto}
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
  *@nodedescription C1 l18
   *line_arg C10
    {spaces_before_argument: }
    {toto is there:: and the }
    *@emph C1 l18
     *brace_container C1
      {is a description}
    *@w C1 l18
     *brace_container C1
      {slightly long}
    { and }
    *@verb C1 l18
    |INFO
    |delimiter:{:}
     *brace_container C1
      {raw:vv somewhat}
    { }
    *@ringaccent C2 l18
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {a}
    {nexpected}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l20 {titi}
 |EXTRA
 |identifier:{titi}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {titi}
    {spaces_after_argument:\\n}
 *@chapter C4 l21 {Titi}
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
  *@nodedescription C1 l23
   *line_arg C3
    {spaces_before_argument: }
    {this describes titi}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l25 {other}
 |EXTRA
 |identifier:{other}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {other}
    {spaces_after_argument:\\n}
 *@chapter C4 l26 {Other}
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
  *@nodedescription C1 l28
   *line_arg C3
    {spaces_before_argument: }
    {other comes here}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l30 {last}
 |EXTRA
 |identifier:{last}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {last}
    {spaces_after_argument:\\n}
 *@chapter C4 l31 {Last}
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Last}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l33
   *line_arg C3
    {spaces_before_argument: }
    {we are last}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l35 {a somewhat long node without description nor following space}
 |EXTRA
 |identifier:{a-somewhat-long-node-without-description-nor-following-space}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {a somewhat long node without description nor following space}
    {spaces_after_argument:\\n}
 *@chapter C4 l36 {Somewhat long}
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Somewhat long}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l38
   *line_arg C3
    {spaces_before_argument: }
    {not as long as the node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l40 {a very long node without description with very little space left for}
 |EXTRA
 |identifier:{a-very-long-node-without-description-with-very-little-space-left-for}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {a very long node without description with very little space left for}
    {spaces_after_argument:\\n}
 *@chapter C4 l41 {Very long}
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Very long}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l43
   *line_arg C3
    {spaces_before_argument: }
    {starting the desciption with a somewhat long word}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l45 {very very long node extending past the max columns and without description}
 |EXTRA
 |identifier:{very-very-long-node-extending-past-the-max-columns-and-without-description}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {very very long node extending past the max columns and without description}
    {spaces_after_argument:\\n}
 *@chapter C3 l46 {Past max columns}
 |EXTRA
 |section_heading_number:{7}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Past max columns}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@nodedescription C1 l48
   *line_arg C3
    {spaces_before_argument: }
    {Not long}
    {spaces_after_argument:\\n}
';


$result_texis{'nodedescription_descriptions'} = '@node Top
@top test of nodedescription used in menu

@menu
* toto::   
* titi::  desc of titi
* name of other: other.

* name of last: last. desc of last
* a somewhat long node without description nor following space::
* a very long node without description with very little space left for::
* very very long node extending past the max columns and without description::
@end menu

@node toto
@chapter Toto

@nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected

@node titi
@chapter Titi

@nodedescription this describes titi

@node other
@chapter Other

@nodedescription other comes here

@node last
@chapter Last

@nodedescription we are last

@node a somewhat long node without description nor following space
@chapter Somewhat long

@nodedescription not as long as the node

@node a very long node without description with very little space left for
@chapter Very long

@nodedescription starting the desciption with a somewhat long word

@node very very long node extending past the max columns and without description
@chapter Past max columns

@nodedescription Not long
';


$result_texts{'nodedescription_descriptions'} = 'test of nodedescription used in menu
************************************

* toto::   
* titi::  desc of titi
* name of other: other.

* name of last: last. desc of last
* a somewhat long node without description nor following space::
* a very long node without description with very little space left for::
* very very long node extending past the max columns and without description::

1 Toto
******


2 Titi
******


3 Other
*******


4 Last
******


5 Somewhat long
***************


6 Very long
***********


7 Past max columns
******************

';

$result_errors{'nodedescription_descriptions'} = '* W l18|@verb should not appear on @nodedescription line
 warning: @verb should not appear on @nodedescription line

';

$result_nodes_list{'nodedescription_descriptions'} = '1|Top
 associated_section: test of nodedescription used in menu
 associated_title_command: test of nodedescription used in menu
 menus:
  toto
  titi
  other
  last
  a somewhat long node without description nor following space
  a very long node without description with very little space left for
  very very long node extending past the max columns and without description
 node_directions:
  next->toto
2|toto
 associated_section: 1 Toto
 associated_title_command: 1 Toto
 node_descriptions:
  @nodedescription toto is there:: and the @emph{is a description}@w{slightly long} and @verb{:vv somewhat:} @ringaccent anexpected
 node_directions:
  next->titi
  prev->Top
  up->Top
3|titi
 associated_section: 2 Titi
 associated_title_command: 2 Titi
 node_descriptions:
  @nodedescription this describes titi
 node_directions:
  next->other
  prev->toto
  up->Top
4|other
 associated_section: 3 Other
 associated_title_command: 3 Other
 node_descriptions:
  @nodedescription other comes here
 node_directions:
  next->last
  prev->titi
  up->Top
5|last
 associated_section: 4 Last
 associated_title_command: 4 Last
 node_descriptions:
  @nodedescription we are last
 node_directions:
  next->a somewhat long node without description nor following space
  prev->other
  up->Top
6|a somewhat long node without description nor following space
 associated_section: 5 Somewhat long
 associated_title_command: 5 Somewhat long
 node_descriptions:
  @nodedescription not as long as the node
 node_directions:
  next->a very long node without description with very little space left for
  prev->last
  up->Top
7|a very long node without description with very little space left for
 associated_section: 6 Very long
 associated_title_command: 6 Very long
 node_descriptions:
  @nodedescription starting the desciption with a somewhat long word
 node_directions:
  next->very very long node extending past the max columns and without description
  prev->a somewhat long node without description nor following space
  up->Top
8|very very long node extending past the max columns and without description
 associated_section: 7 Past max columns
 associated_title_command: 7 Past max columns
 node_descriptions:
  @nodedescription Not long
 node_directions:
  prev->a very long node without description with very little space left for
  up->Top
';

$result_sections_list{'nodedescription_descriptions'} = '1|test of nodedescription used in menu
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Toto
 section_children:
  1|Toto
  2|Titi
  3|Other
  4|Last
  5|Somewhat long
  6|Very long
  7|Past max columns
2|Toto
 associated_anchor_command: toto
 associated_node: toto
 section_directions:
  next->Titi
  up->test of nodedescription used in menu
 toplevel_directions:
  next->Titi
  prev->test of nodedescription used in menu
  up->test of nodedescription used in menu
3|Titi
 associated_anchor_command: titi
 associated_node: titi
 section_directions:
  next->Other
  prev->Toto
  up->test of nodedescription used in menu
 toplevel_directions:
  next->Other
  prev->Toto
  up->test of nodedescription used in menu
4|Other
 associated_anchor_command: other
 associated_node: other
 section_directions:
  next->Last
  prev->Titi
  up->test of nodedescription used in menu
 toplevel_directions:
  next->Last
  prev->Titi
  up->test of nodedescription used in menu
5|Last
 associated_anchor_command: last
 associated_node: last
 section_directions:
  next->Somewhat long
  prev->Other
  up->test of nodedescription used in menu
 toplevel_directions:
  next->Somewhat long
  prev->Other
  up->test of nodedescription used in menu
6|Somewhat long
 associated_anchor_command: a somewhat long node without description nor following space
 associated_node: a somewhat long node without description nor following space
 section_directions:
  next->Very long
  prev->Last
  up->test of nodedescription used in menu
 toplevel_directions:
  next->Very long
  prev->Last
  up->test of nodedescription used in menu
7|Very long
 associated_anchor_command: a very long node without description with very little space left for
 associated_node: a very long node without description with very little space left for
 section_directions:
  next->Past max columns
  prev->Somewhat long
  up->test of nodedescription used in menu
 toplevel_directions:
  next->Past max columns
  prev->Somewhat long
  up->test of nodedescription used in menu
8|Past max columns
 associated_anchor_command: very very long node extending past the max columns and without description
 associated_node: very very long node extending past the max columns and without description
 section_directions:
  prev->Very long
  up->test of nodedescription used in menu
 toplevel_directions:
  prev->Very long
  up->test of nodedescription used in menu
';

$result_sectioning_root{'nodedescription_descriptions'} = 'level: -1
list:
 1|test of nodedescription used in menu
';

$result_headings_list{'nodedescription_descriptions'} = '';


$result_converted{'plaintext'}->{'nodedescription_descriptions'} = 'test of nodedescription used in menu
************************************

* Menu:

* toto::                       toto is there:: and the _is a
                               description_slightly long and vv somewhat
                               ånexpected
* titi::  desc of titi
* name of other: other.        other comes here

* name of last: last. desc of last
* a somewhat long node without description nor following space::  not as long
                               as the node
* a very long node without description with very little space left for::  
                               starting the desciption with a somewhat long
                               word
* very very long node extending past the max columns and without description::  
                               Not long

1 Toto
******

2 Titi
******

3 Other
*******

4 Last
******

5 Somewhat long
***************

6 Very long
***********

7 Past max columns
******************

';


$result_converted{'html'}->{'nodedescription_descriptions'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>test of nodedescription used in menu</title>

<meta name="description" content="test of nodedescription used in menu">
<meta name="keywords" content="test of nodedescription used in menu">
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
<h1 class="top" id="test-of-nodedescription-used-in-menu"><span>test of nodedescription used in menu<a class="copiable-link" href="#test-of-nodedescription-used-in-menu"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#toto" accesskey="1">toto</a>:</td><td class="menu-entry-description">toto is there:: and the <em class="emph">is a description</em>slightly&nbsp;long<!-- /@w --> and <code class="verb">vv&nbsp;somewhat</code> &aring;nexpected</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#titi" accesskey="2">titi</a>:</td><td class="menu-entry-description">desc of titi
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#other" accesskey="3">name of other</a>:</td><td class="menu-entry-description">other comes here</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#last" accesskey="4">name of last</a>:</td><td class="menu-entry-description">desc of last
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="5">a somewhat long node without description nor following space</a>:</td><td class="menu-entry-description">not as long as the node</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#a-very-long-node-without-description-with-very-little-space-left-for" accesskey="6">a very long node without description with very little space left for</a>:</td><td class="menu-entry-description">starting the desciption with a somewhat long word</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#very-very-long-node-extending-past-the-max-columns-and-without-description" accesskey="7">very very long node extending past the max columns and without description</a>:</td><td class="menu-entry-description">Not long</td></tr>
</table>

<hr>
<div class="chapter-level-extent" id="toto">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#titi" accesskey="n" rel="next">Titi</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">test of nodedescription used in menu</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Toto"><span>1 Toto<a class="copiable-link" href="#Toto"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="titi">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#other" accesskey="n" rel="next">Other</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#toto" accesskey="p" rel="prev">Toto</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Titi"><span>2 Titi<a class="copiable-link" href="#Titi"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="other">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#last" accesskey="n" rel="next">Last</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#titi" accesskey="p" rel="prev">Titi</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Other"><span>3 Other<a class="copiable-link" href="#Other"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="last">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="n" rel="next">Somewhat long</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#other" accesskey="p" rel="prev">Other</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Last"><span>4 Last<a class="copiable-link" href="#Last"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="a-somewhat-long-node-without-description-nor-following-space">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#a-very-long-node-without-description-with-very-little-space-left-for" accesskey="n" rel="next">Very long</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#last" accesskey="p" rel="prev">Last</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Somewhat-long"><span>5 Somewhat long<a class="copiable-link" href="#Somewhat-long"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="a-very-long-node-without-description-with-very-little-space-left-for">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#very-very-long-node-extending-past-the-max-columns-and-without-description" accesskey="n" rel="next">Past max columns</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#a-somewhat-long-node-without-description-nor-following-space" accesskey="p" rel="prev">Somewhat long</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Very-long"><span>6 Very long<a class="copiable-link" href="#Very-long"> &para;</a></span></h2>


<hr>
</div>
<div class="chapter-level-extent" id="very-very-long-node-extending-past-the-max-columns-and-without-description">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#a-very-long-node-without-description-with-very-little-space-left-for" accesskey="p" rel="prev">Very long</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">test of nodedescription used in menu</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Past-max-columns"><span>7 Past max columns<a class="copiable-link" href="#Past-max-columns"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'nodedescription_descriptions'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> toto</nodenext></node>
<top><sectiontitle> test of nodedescription used in menu</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>toto</menunode><menuseparator>::   </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>titi</menunode><menuseparator>::  </menuseparator><menudescription><pre xml:space="preserve">desc of titi
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name of other</menutitle><menuseparator>: </menuseparator><menunode>other</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menutitle>name of last</menutitle><menuseparator>: </menuseparator><menunode>last</menunode><menuseparator>. </menuseparator><menudescription><pre xml:space="preserve">desc of last
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>a somewhat long node without description nor following space</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>a very long node without description with very little space left for</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>very very long node extending past the max columns and without description</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="toto"><nodename> toto</nodename><nodenext automatic="on"> titi</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Toto</sectiontitle>

<nodedescription> toto is there:: and the <emph>is a description</emph><w>slightly long</w> and <verb delimiter=":">vv somewhat</verb> <accent type="ring" bracketed="off"> </accent>nexpected</nodedescription>

</chapter>
<node identifier="titi"><nodename> titi</nodename><nodenext automatic="on"> other</nodenext><nodeprev automatic="on"> toto</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Titi</sectiontitle>

<nodedescription> this describes titi</nodedescription>

</chapter>
<node identifier="other"><nodename> other</nodename><nodenext automatic="on"> last</nodenext><nodeprev automatic="on"> titi</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Other</sectiontitle>

<nodedescription> other comes here</nodedescription>

</chapter>
<node identifier="last"><nodename> last</nodename><nodenext automatic="on"> a somewhat long node without description nor following space</nodenext><nodeprev automatic="on"> other</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Last</sectiontitle>

<nodedescription> we are last</nodedescription>

</chapter>
<node identifier="a-somewhat-long-node-without-description-nor-following-space"><nodename> a somewhat long node without description nor following space</nodename><nodenext automatic="on"> a very long node without description with very little space left for</nodenext><nodeprev automatic="on"> last</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Somewhat long</sectiontitle>

<nodedescription> not as long as the node</nodedescription>

</chapter>
<node identifier="a-very-long-node-without-description-with-very-little-space-left-for"><nodename> a very long node without description with very little space left for</nodename><nodenext automatic="on"> very very long node extending past the max columns and without description</nodenext><nodeprev automatic="on"> a somewhat long node without description nor following space</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Very long</sectiontitle>

<nodedescription> starting the desciption with a somewhat long word</nodedescription>

</chapter>
<node identifier="very-very-long-node-extending-past-the-max-columns-and-without-description"><nodename> very very long node extending past the max columns and without description</nodename><nodeprev automatic="on"> a very long node without description with very little space left for</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Past max columns</sectiontitle>

<nodedescription> Not long</nodedescription>
</chapter>
';

1;
