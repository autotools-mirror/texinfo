use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'entry_after_detailmenu'} = '*document_root C4
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C8 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@detailmenu C3 l4
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 l5
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{second}
      {second}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1 l6
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {detailmenu}
      {spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C3
     {empty_line:\\n}
     {Menu comment\\n}
     {empty_line:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chap-first}
     {chap first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@detailmenu C3 l12
   |EXTRA
   |global_command_number:{2}
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 l13
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{second}
      {second}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1 l14
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {detailmenu}
      {spaces_after_argument:\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{second}
     {second}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l18 {chap first}
 |EXTRA
 |identifier:{chap-first}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap first}
    {spaces_after_argument:\\n}
 *@node C1 l19 {second}
 |EXTRA
 |identifier:{second}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {second}
    {spaces_after_argument:\\n}
';


$result_texis{'entry_after_detailmenu'} = '@node Top

@menu
@detailmenu
* second::
@end detailmenu

Menu comment

* chap first::

@detailmenu
* second::
@end detailmenu
* second::
@end menu

@node chap first
@node second
';


$result_texts{'entry_after_detailmenu'} = '
* second::

Menu comment

* chap first::

* second::
* second::

';

$result_errors{'entry_after_detailmenu'} = '';

$result_nodes_list{'entry_after_detailmenu'} = '1|Top
 menus:
  chap first
  second
 node_directions:
  next->chap first
2|chap first
 node_directions:
  next->second
  prev->Top
  up->Top
3|second
 node_directions:
  prev->chap first
  up->Top
';

$result_sections_list{'entry_after_detailmenu'} = '';

$result_sectioning_root{'entry_after_detailmenu'} = '';

$result_headings_list{'entry_after_detailmenu'} = '';


$result_converted{'plaintext'}->{'entry_after_detailmenu'} = '* Menu:

* second::

Menu comment

* chap first::

* second::
* second::

';


$result_converted{'html'}->{'entry_after_detailmenu'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
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
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap-first" accesskey="n" rel="next">chap first</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#second" accesskey="1">second</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

Menu comment

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#chap-first" accesskey="2">chap first</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#second" accesskey="3">second</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="#second" accesskey="4">second</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<a class="node-id" id="chap-first"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#second" accesskey="n" rel="next">second</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap first<a class="copiable-link" href="#chap-first"> &para;</a></span></h4>
<hr>
<a class="node-id" id="second"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chap-first" accesskey="p" rel="prev">chap first</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>second<a class="copiable-link" href="#second"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'entry_after_detailmenu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'entry_after_detailmenu'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap first</nodenext></node>

<menu endspaces=" ">
<detailmenu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>second</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
<menucomment><pre xml:space="preserve">
Menu comment

</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap first</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><detailmenu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>second</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
<menuentry><menuleadingtext>* </menuleadingtext><menunode>second</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-first"><nodename> chap first</nodename><nodenext automatic="on"> second</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<node identifier="second"><nodename> second</nodename><nodeprev automatic="on"> chap first</nodeprev><nodeup automatic="on"> Top</nodeup></node>
';

1;
