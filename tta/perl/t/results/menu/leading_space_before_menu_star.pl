use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'leading_space_before_menu_star'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {a node}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{a-node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a node}
  {empty_line:\\n}
  *@menu C3 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C1
     { * a node::\\n}
   *@end C1 l5
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


$result_texis{'leading_space_before_menu_star'} = '@node a node

@menu
 * a node::
@end menu
';


$result_texts{'leading_space_before_menu_star'} = '
 * a node::
';

$result_errors{'leading_space_before_menu_star'} = '';

$result_nodes_list{'leading_space_before_menu_star'} = '1|a node
 menus:
';

$result_sections_list{'leading_space_before_menu_star'} = '';

$result_sectioning_root{'leading_space_before_menu_star'} = '';

$result_headings_list{'leading_space_before_menu_star'} = '';


$result_converted{'plaintext'}->{'leading_space_before_menu_star'} = '* Menu:

 * a node::
';


$result_converted{'html'}->{'leading_space_before_menu_star'} = '<!DOCTYPE html>
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

<link href="#a-node" rel="start" title="a node">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
pre.menu-comment-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
th.menu-comment {text-align:left}
</style>


</head>

<body lang="">
<h4 class="node" id="a-node"><span>a node<a class="copiable-link" href="#a-node"> &para;</a></span></h4>

<table class="menu">
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted"> * a node::
</pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'leading_space_before_menu_star'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'leading_space_before_menu_star'} = '<node identifier="a-node" spaces=" "><nodename>a node</nodename></node>

<menu endspaces=" ">
<menucomment><pre xml:space="preserve"> * a node::
</pre></menucomment></menu>
';

1;
