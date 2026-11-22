use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_menu_description'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C3 l1 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C5 l4
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:a}
    {menu_entry_separator::}
    *menu_entry_node C5
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|4}
    |normalized:{b}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:b}
     {space_at_end_menu_node:\\n}
    *menu_entry_description
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_menu_description'} = '@node first

@menu
* a:(f)b

@end menu
';


$result_texts{'empty_menu_description'} = '
* a:(f)b

';

$result_errors{'empty_menu_description'} = '';

$result_nodes_list{'empty_menu_description'} = '1|first
 menus:
  (f)b

';

$result_sections_list{'empty_menu_description'} = '';

$result_sectioning_root{'empty_menu_description'} = '';

$result_headings_list{'empty_menu_description'} = '';


$result_converted{'plaintext'}->{'empty_menu_description'} = '* Menu:

* a:(f)b

';


$result_converted{'html'}->{'empty_menu_description'} = '<!DOCTYPE html>
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
<h4 class="node" id="first"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b" accesskey="1">a</a>:</td><td class="menu-entry-description"></td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'empty_menu_description'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'empty_menu_description'} = '<node identifier="first"><nodename> first</nodename></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>:</menuseparator><menunode>(f)b
</menunode><menudescription></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment></menu>
';

1;
