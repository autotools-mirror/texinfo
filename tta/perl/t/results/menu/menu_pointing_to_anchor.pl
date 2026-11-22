use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_pointing_to_anchor'} = '*document_root C3
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
 *@top C8 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text\\n}
  {empty_line:\\n}
  *@anchor C1 l6
  |EXTRA
  |identifier:{An-anchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:An anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *@menu C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:menu entry pointing to the anchor.\\n}
   *@end C1 l10
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_pointing_to_anchor'} = '@node Top
@top top

Text

@anchor{An anchor}

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu
';


$result_texts{'menu_pointing_to_anchor'} = 'top
***

Text


* An anchor::                menu entry pointing to the anchor.
';

$result_errors{'menu_pointing_to_anchor'} = '';

$result_nodes_list{'menu_pointing_to_anchor'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  An anchor
 node_directions:
  next->An anchor
';

$result_sections_list{'menu_pointing_to_anchor'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'menu_pointing_to_anchor'} = 'level: -1
list:
 1|top
';

$result_headings_list{'menu_pointing_to_anchor'} = '';


$result_converted{'plaintext'}->{'menu_pointing_to_anchor'} = 'top
***

Text

* Menu:

* An anchor::                menu entry pointing to the anchor.
';


$result_converted{'html'}->{'menu_pointing_to_anchor'} = '<!DOCTYPE html>
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
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>Text
</p>
<a class="anchor" id="An-anchor"></a>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#An-anchor" accesskey="1">An anchor</a>:</td><td class="menu-entry-description">menu entry pointing to the anchor.
</td></tr>
</table>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'menu_pointing_to_anchor'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on">An anchor</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<para>Text
</para>
<anchor identifier="An-anchor">An anchor</anchor>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>An anchor</menunode><menuseparator>::                </menuseparator><menudescription><pre xml:space="preserve">menu entry pointing to the anchor.
</pre></menudescription></menuentry></menu>
</top>
';

1;
