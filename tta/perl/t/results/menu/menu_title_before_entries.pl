use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_title_before_entries'} = '*document_root C3
 *before_node_section
 *@node C4 l1 {Top}
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
  {empty_line:\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {Horizontal space\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{chap subnode}
    |normalized:{chap-subnode}
     {chap subnode}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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
 *@node C1 l8 {chap subnode}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-subnode}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap subnode}
';


$result_texis{'menu_title_before_entries'} = '@node Top

@menu
Horizontal space
* chap subnode::
@end menu

@node chap subnode
';


$result_texts{'menu_title_before_entries'} = '
Horizontal space
* chap subnode::

';

$result_errors{'menu_title_before_entries'} = '';

$result_nodes_list{'menu_title_before_entries'} = '1|Top
 menus:
  chap subnode
 node_directions:
  next->chap subnode
2|chap subnode
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'menu_title_before_entries'} = '';

$result_sectioning_root{'menu_title_before_entries'} = '';

$result_headings_list{'menu_title_before_entries'} = '';


$result_converted{'plaintext'}->{'menu_title_before_entries'} = '* Menu:

Horizontal space
* chap subnode::

';


$result_converted{'html'}->{'menu_title_before_entries'} = '<!DOCTYPE html>
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

<body lang="">
<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
Next: <a href="#chap-subnode" accesskey="n" rel="next">chap subnode</a> &nbsp; </p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<table class="menu">
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">Horizontal space
</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="#chap-subnode" accesskey="1">chap subnode</a>:</td><td class="menu-entry-description">
</td></tr>
</table>

<hr>
<a class="node-id" id="chap-subnode"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; </p>
</div>
<h4 class="node"><span>chap subnode<a class="copiable-link" href="#chap-subnode"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_title_before_entries'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'menu_title_before_entries'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap subnode</nodenext></node>

<menu endspaces=" ">
<menucomment><pre xml:space="preserve">Horizontal space
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>chap subnode</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-subnode" spaces=" "><nodename>chap subnode</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
';

1;
