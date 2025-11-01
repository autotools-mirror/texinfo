use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_in_menu_description'} = '*document_root C3
 *before_node_section
 *@node C1 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
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
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:{manual}
     {(}
     {manual}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C3
      {\\n}
      *@verb C1 l6
      |INFO
      |delimiter:{:}
       *brace_container C2
        {raw: in verb\\n}
        {raw:\\n}
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 l10
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
';


$result_texis{'verb_in_menu_description'} = '@node first
@top top

@menu
* (manual)::
@verb{: in verb

:}

@end menu
';


$result_texts{'verb_in_menu_description'} = 'top
***

* (manual)::
 in verb



';

$result_errors{'verb_in_menu_description'} = '';

$result_nodes_list{'verb_in_menu_description'} = '1|first
 associated_section: top
 associated_title_command: top
 menus:
  (manual)
';

$result_sections_list{'verb_in_menu_description'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'verb_in_menu_description'} = 'level: -1
list:
 1|top
';

$result_headings_list{'verb_in_menu_description'} = '';


$result_converted{'plaintext'}->{'verb_in_menu_description'} = 'top
***

* Menu:

* (manual)::
 in verb



';


$result_converted{'html'}->{'verb_in_menu_description'} = '<!DOCTYPE html>
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

<link href="#first" rel="start" title="first">
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
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="1">(manual)</a>:</td><td class="menu-entry-description">
<code class="verb">&nbsp;in&nbsp;verb<br><br></code>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'verb_in_menu_description'} = '<node identifier="first" spaces=" "><nodename>first</nodename></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
<verb delimiter=":"> in verb

</verb>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment></menu>
</top>
';

1;
