use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineraw_in_menu_description'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
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
    *menu_entry_description C1
     *preformatted C3
      {normal_text:\\n}
      *normal_command@inlineraw C2 l6
      |expand_index:{1}
      |format:{html}
       *brace_arg C1
        {normal_text:html}
       *brace_arg C4
        {spaces_before_argument: }
        {normal_text:in inline raw\\n}
        {empty_line:\\n}
        {normal_text:end inlineraw}
      {normal_text:\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *normal_command@end C1 l10
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'inlineraw_in_menu_description'} = '@node first
@top top

@menu
* (manual)::
@inlineraw{html, in inline raw

end inlineraw}

@end menu
';


$result_texts{'inlineraw_in_menu_description'} = 'top
***

* (manual)::
in inline raw

end inlineraw

';

$result_errors{'inlineraw_in_menu_description'} = '';

$result_nodes_list{'inlineraw_in_menu_description'} = '1|first
 associated_section: top
 associated_title_command: top
 menus:
  (manual)
';

$result_sections_list{'inlineraw_in_menu_description'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'inlineraw_in_menu_description'} = 'level: -1
list:
 1|top
';

$result_headings_list{'inlineraw_in_menu_description'} = '';


$result_converted{'plaintext'}->{'inlineraw_in_menu_description'} = 'top
***

* Menu:

* (manual)::


';


$result_converted{'html'}->{'inlineraw_in_menu_description'} = '<!DOCTYPE html>
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

<body>
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="1">(manual)</a>:</td><td class="menu-entry-description">
in inline raw

end inlineraw
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'inlineraw_in_menu_description'} = '<node identifier="first"><nodename> first</nodename></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> in inline raw

end inlineraw</inlinerawcontent></inlineraw>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment></menu>
</top>
';

1;
