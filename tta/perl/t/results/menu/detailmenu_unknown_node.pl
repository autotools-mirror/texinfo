use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'detailmenu_unknown_node'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {Top}
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
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@detailmenu C3 l4
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C4 l5
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:{unknown}
     |normalized:{unknown}
      {unknown}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1 l6
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {detailmenu}
   *@end C1 l7
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


$result_texis{'detailmenu_unknown_node'} = '@node Top

@menu
@detailmenu
* unknown::
@end detailmenu
@end menu
';


$result_texts{'detailmenu_unknown_node'} = '
* unknown::
';

$result_errors{'detailmenu_unknown_node'} = '* E l5|@detailmenu reference to nonexistent node `unknown\'
 @detailmenu reference to nonexistent node `unknown\'

';

$result_nodes_list{'detailmenu_unknown_node'} = '1|Top
 menus:
';

$result_sections_list{'detailmenu_unknown_node'} = '';

$result_sectioning_root{'detailmenu_unknown_node'} = '';

$result_headings_list{'detailmenu_unknown_node'} = '';


$result_converted{'plaintext'}->{'detailmenu_unknown_node'} = '* Menu:

* unknown::
';


$result_converted{'html'}->{'detailmenu_unknown_node'} = '<!DOCTYPE html>
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
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body lang="">
<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; unknown:</td><td class="menu-entry-description">
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'detailmenu_unknown_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'detailmenu_unknown_node'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename></node>

<menu endspaces=" ">
<detailmenu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>unknown</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
</menu>
';

1;
