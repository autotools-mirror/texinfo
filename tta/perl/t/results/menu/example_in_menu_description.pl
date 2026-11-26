use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'example_in_menu_description'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
 *normal_command@top C3 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:manual}
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C2
     *preformatted C1
      {normal_text:\\n}
     *normal_command@example C3 l6
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *preformatted C3
       {normal_text:in \\n}
       {empty_line:\\n}
       {normal_text:example\\n}
      *normal_command@end C1 l10
      |text_arg:{example}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:example}
        {spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *normal_command@end C1 l12
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'example_in_menu_description'} = '@node first
@top top

@menu
* (manual)::
@example
in 

example
@end example

@end menu
';


$result_texts{'example_in_menu_description'} = 'top
***

* (manual)::
in 

example

';

$result_errors{'example_in_menu_description'} = '';

$result_nodes_list{'example_in_menu_description'} = '1|first
 associated_section: top
 associated_title_command: top
 menus:
  (manual)
';

$result_sections_list{'example_in_menu_description'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'example_in_menu_description'} = 'level: -1
list:
 1|top
';

$result_headings_list{'example_in_menu_description'} = '';


$result_converted{'plaintext'}->{'example_in_menu_description'} = 'top
***

* Menu:

* (manual)::
     in

     example

';


$result_converted{'html'}->{'example_in_menu_description'} = '<!DOCTYPE html>
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
div.example {margin-left: 3.2em}
pre.menu-comment-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="1">(manual)</a>:</td><td class="menu-entry-description">
<div class="example">
<pre class="example-preformatted">in 

example
</pre></div>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'example_in_menu_description'} = '<node identifier="first"><nodename> first</nodename></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre><example endspaces=" ">
<pre xml:space="preserve">in 

example
</pre></example>
</menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment></menu>
</top>
';

1;
