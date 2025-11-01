use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'sc_in_menu'} = '*document_root C3
 *before_node_section C1
  {empty_line:\\n}
 *@node C4 l2 {first}
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
  {empty_line:\\n}
  *@menu C4 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C6 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     *@sc C1 l5
      *brace_container C1
       {value}
    {menu_entry_separator::}
    *menu_entry_node C1
    |EXTRA
    |node_content:{@sc{node}}
    |normalized:{node}
     *@sc C1 l5
      *brace_container C1
       {node}
    {menu_entry_separator:.   }
    *menu_entry_description C1
     *preformatted C2
      *@sc C1 l5
       *brace_container C1
        {descrip tion}
      {\\n}
   *menu_comment C2
    *preformatted C4
     {after_menu_description_line:\\n}
     *@sc C1 l7
      *brace_container C1
       {menu comment}
     {\\n}
     {empty_line:\\n}
    *@example C3 l9
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *preformatted C10
      {* }
      *@sc C1 l10
       *brace_container C1
        {menu-example value}
      {:(dir)}
      *@sc C1 l10
       *brace_container C1
        {menu-example node}
      {.   }
      *@sc C1 l10
       *brace_container C1
        {menu-example descrip tion}
      {\\n}
      {empty_line:\\n}
      *@sc C1 l12
       *brace_container C1
        {menu-example comment}
      {\\n}
     *@end C1 l13
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{example}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
   *@end C1 l14
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
 *@node C4 l16 {@sc{node}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{node}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@sc C1 l16
     *brace_container C1
      {node}
  {empty_line:\\n}
  *@example C3 l18
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@menu C4 l19
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C6 l20
     {menu_entry_leading_text:* }
     *menu_entry_name C1
      *@sc C1 l20
       *brace_container C1
        {example value}
     {menu_entry_separator::}
     *menu_entry_node C4
     |EXTRA
     |manual_content:{dir}
     |node_content:{@sc{example node}}
     |normalized:{example-node}
      {(}
      {dir}
      {)}
      *@sc C1 l20
       *brace_container C1
        {example node}
     {menu_entry_separator:.   }
     *menu_entry_description C1
      *preformatted C2
       *@sc C1 l20
        *brace_container C1
         {example descrip tion}
       {\\n}
    *menu_comment C1
     *preformatted C3
      {after_menu_description_line:\\n}
      *@sc C1 l22
       *brace_container C1
        {example comment}
      {\\n}
    *@end C1 l23
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
   *@end C1 l24
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
  {empty_line:\\n}
';


$result_texis{'sc_in_menu'} = '
@node first

@menu
* @sc{value}:@sc{node}.   @sc{descrip tion}

@sc{menu comment}

@example
* @sc{menu-example value}:(dir)@sc{menu-example node}.   @sc{menu-example descrip tion}

@sc{menu-example comment}
@end example
@end menu

@node @sc{node}

@example
@menu
* @sc{example value}:(dir)@sc{example node}.   @sc{example descrip tion}

@sc{example comment}
@end menu
@end example

';


$result_texts{'sc_in_menu'} = '

* VALUE:NODE.   DESCRIP TION

MENU COMMENT

* MENU-EXAMPLE VALUE:(dir)MENU-EXAMPLE NODE.   MENU-EXAMPLE DESCRIP TION

MENU-EXAMPLE COMMENT


* EXAMPLE VALUE:(dir)EXAMPLE NODE.   EXAMPLE DESCRIP TION

EXAMPLE COMMENT

';

$result_errors{'sc_in_menu'} = '* W l19|@menu in invalid context
 warning: @menu in invalid context

* W l2|node `first\' not in menu
 warning: node `first\' not in menu

';

$result_nodes_list{'sc_in_menu'} = '1|first
 menus:
  @sc{node}
2|@sc{node}
 node_directions:
  up->first
';

$result_sections_list{'sc_in_menu'} = '';

$result_sectioning_root{'sc_in_menu'} = '';

$result_headings_list{'sc_in_menu'} = '';


$result_converted{'plaintext'}->{'sc_in_menu'} = '* Menu:

* VALUE:NODE.   DESCRIP TION

MENU COMMENT

     * MENU-EXAMPLE VALUE:(dir)MENU-EXAMPLE NODE.   MENU-EXAMPLE DESCRIP TION

     MENU-EXAMPLE COMMENT

* Menu:

     * EXAMPLE VALUE:(dir)EXAMPLE NODE.   EXAMPLE DESCRIP TION

     EXAMPLE COMMENT

';


$result_converted{'html'}->{'sc_in_menu'} = '<!DOCTYPE html>
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
div.example {margin-left: 3.2em}
pre.menu-comment-preformatted {font-family: serif}
pre.menu-entry-description-preformatted {font-family: serif; display: inline}
pre.menu-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body lang="">

<h4 class="node" id="first"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#node" accesskey="1"><small class="sc">VALUE</small></a>:</td><td class="menu-entry-description"><small class="sc">DESCRIP TION</small>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

<span class="sc">MENU COMMENT</span>

</pre><div class="example">
<pre class="example-preformatted">* <span class="sc">MENU-EXAMPLE VALUE</span>:(dir)<span class="sc">MENU-EXAMPLE NODE</span>.   <span class="sc">MENU-EXAMPLE DESCRIP TION</span>

<span class="sc">MENU-EXAMPLE COMMENT</span>
</pre></div>
</th></tr></table>

<hr>
<a class="node-id" id="node"></a><div class="nav-panel">
<p>
Up: <a href="#first" accesskey="u" rel="up">first</a> &nbsp; </p>
</div>
<h4 class="node"><span><small class="sc">NODE</small><a class="copiable-link" href="#node"> &para;</a></span></h4>

<div class="example">
<table class="menu"><tr><td>
<pre class="menu-preformatted">&bull; <span class="sc">EXAMPLE VALUE</span>:<a href="dir.html#example-node" accesskey="1">(dir)<span class="sc">EXAMPLE NODE</span></a>.   </pre><pre class="menu-entry-description-preformatted"><span class="sc">EXAMPLE DESCRIP TION</span>
</pre><pre class="menu-comment-preformatted">

<span class="sc">EXAMPLE COMMENT</span>
</pre></td></tr></table>
</div>




</body>
</html>
';

$result_converted_errors{'html'}->{'sc_in_menu'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'sc_in_menu'} = '
<node identifier="first" spaces=" "><nodename>first</nodename></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle><sc>value</sc></menutitle><menuseparator>:</menuseparator><menunode><sc>node</sc></menunode><menuseparator>.   </menuseparator><menudescription><pre xml:space="preserve"><sc>descrip tion</sc>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
<sc>menu comment</sc>

</pre><example endspaces=" ">
<pre xml:space="preserve">* <sc>menu-example value</sc>:(dir)<sc>menu-example node</sc>.   <sc>menu-example descrip tion</sc>

<sc>menu-example comment</sc>
</pre></example>
</menucomment></menu>

<node identifier="node" spaces=" "><nodename><sc>node</sc></nodename><nodeup automatic="on">first</nodeup></node>

<example endspaces=" ">
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle><sc>example value</sc></menutitle><menuseparator>:</menuseparator><menunode>(dir)<sc>example node</sc></menunode><menuseparator>.   </menuseparator><menudescription><pre xml:space="preserve"><sc>example descrip tion</sc>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
<sc>example comment</sc>
</pre></menucomment></menu>
</example>

';

1;
