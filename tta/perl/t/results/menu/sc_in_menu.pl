use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sc_in_menu'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C4 l2 {first}
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
  *normal_command@menu C4 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     *normal_command@sc C1 l5
      *brace_container C1
       {normal_text:value}
    {menu_entry_separator::}
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node}
     *normal_command@sc C1 l5
      *brace_container C1
       {normal_text:node}
    {menu_entry_separator:.   }
    *menu_entry_description C1
     *preformatted C2
      *normal_command@sc C1 l5
       *brace_container C1
        {normal_text:descrip tion}
      {normal_text:\\n}
   *menu_comment C2
    *preformatted C4
     {after_menu_description_line:\\n}
     *normal_command@sc C1 l7
      *brace_container C1
       {normal_text:menu comment}
     {normal_text:\\n}
     {empty_line:\\n}
    *normal_command@example C3 l9
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C10
      {normal_text:* }
      *normal_command@sc C1 l10
       *brace_container C1
        {normal_text:menu-example value}
      {normal_text::(dir)}
      *normal_command@sc C1 l10
       *brace_container C1
        {normal_text:menu-example node}
      {normal_text:.   }
      *normal_command@sc C1 l10
       *brace_container C1
        {normal_text:menu-example descrip tion}
      {normal_text:\\n}
      {empty_line:\\n}
      *normal_command@sc C1 l12
       *brace_container C1
        {normal_text:menu-example comment}
      {normal_text:\\n}
     *normal_command@end C1 l13
     |EXTRA
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C4 l16 {@sc{node}}
 |EXTRA
 |identifier:{node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@sc C1 l16
     *brace_container C1
      {normal_text:node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@menu C4 l19
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C6 l20
     {menu_entry_leading_text:* }
     *menu_entry_name C1
      *normal_command@sc C1 l20
       *brace_container C1
        {normal_text:example value}
     {menu_entry_separator::}
     *menu_entry_node C4
     |EXTRA
     |manual_content:A{1|1}
     |node_content:A{3|3}
     |normalized:{example-node}
      {normal_text:(}
      {normal_text:dir}
      {normal_text:)}
      *normal_command@sc C1 l20
       *brace_container C1
        {normal_text:example node}
     {menu_entry_separator:.   }
     *menu_entry_description C1
      *preformatted C2
       *normal_command@sc C1 l20
        *brace_container C1
         {normal_text:example descrip tion}
       {normal_text:\\n}
    *menu_comment C1
     *preformatted C3
      {after_menu_description_line:\\n}
      *normal_command@sc C1 l22
       *brace_container C1
        {normal_text:example comment}
      {normal_text:\\n}
    *normal_command@end C1 l23
    |EXTRA
    |text_arg:{menu}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:menu}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l24
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
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

<body>
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
<a class="node-id" id="node"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#first" accesskey="u" rel="up">first</a></span></span><span class="nav-button"> &nbsp; </span></p>
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

$result_converted_errors{'html'}->{'sc_in_menu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'sc_in_menu'} = '<preamblebeforebeginning>
</preamblebeforebeginning><node identifier="first"><nodename> first</nodename></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle><sc>value</sc></menutitle><menuseparator>:</menuseparator><menunode><sc>node</sc></menunode><menuseparator>.   </menuseparator><menudescription><pre xml:space="preserve"><sc>descrip tion</sc>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
<sc>menu comment</sc>

</pre><example endspaces=" ">
<pre xml:space="preserve">* <sc>menu-example value</sc>:(dir)<sc>menu-example node</sc>.   <sc>menu-example descrip tion</sc>

<sc>menu-example comment</sc>
</pre></example>
</menucomment></menu>

<node identifier="node"><nodename> <sc>node</sc></nodename><nodeup automatic="on"> first</nodeup></node>

<example endspaces=" ">
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle><sc>example value</sc></menutitle><menuseparator>:</menuseparator><menunode>(dir)<sc>example node</sc></menunode><menuseparator>.   </menuseparator><menudescription><pre xml:space="preserve"><sc>example descrip tion</sc>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
<sc>example comment</sc>
</pre></menucomment></menu>
</example>

';

1;
