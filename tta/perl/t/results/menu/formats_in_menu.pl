use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'formats_in_menu'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C3 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C8 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:gcc}
     {normal_text:)}
    {menu_entry_separator::: }
    *menu_entry_description C2
     *preformatted C1
      {normal_text:text\\n}
     *normal_command@table C3 l5
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        *normal_command@asis l5
        {spaces_after_argument:\\n}
      *table_entry C2
       *table_term C1
        *normal_command@item C1 l6
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:item}
          {spaces_after_argument:\\n}
       *table_definition C1
        *preformatted C1
         {normal_text:* table line::\\n}
      *normal_command@end C1 l8
      |text_arg:{table}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:table}
        {spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:info}
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C2
     *preformatted C1
      {normal_text:\\n}
     *normal_command@verbatim C4 l11
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      {raw:some @ verb{x atim\\n}
      {raw:* texinfo:: in @ verbatim\\n}
      *normal_command@end C1 l14
      |text_arg:{verbatim}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:verbatim}
        {spaces_after_argument:\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:manual2}
     {normal_text:)}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C3
      {normal_text:%\\n}
      *normal_command@html C3 l16
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *rawpreformatted C2
        {empty_line:\\n}
        {normal_text:<i></i>\\n}
       *normal_command@end C1 l19
       |text_arg:{html}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:html}
         {spaces_after_argument:\\n}
      {normal_text:Log$\\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:truc}
     {normal_text:)}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      *normal_command@acronym C1 l21
       *brace_arg C2
        {normal_text:description\\n}
        {normal_text:* acronym::}
      {normal_text:\\n}
   *menu_comment C3
    *preformatted C1
     {after_menu_description_line:\\n}
    *normal_command@example C3 l24
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C2
      {normal_text:* subsubsection::\\n}
      {normal_text:Menu comment\\n}
     *normal_command@end C1 l27
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
    *preformatted C1
     {empty_line:\\n}
   *normal_command@end C1 l29
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'formats_in_menu'} = '@node first

@menu
* (gcc):: text
@table @asis
@item item
* table line::
@end table

* (info)::
@verbatim
some @ verb{x atim
* texinfo:: in @ verbatim
@end verbatim
* (manual2):: %
@html

<i></i>
@end html
Log$
* (truc):: @acronym{description
* acronym::}

@example
* subsubsection::
Menu comment
@end example

@end menu
';


$result_texts{'formats_in_menu'} = '
* (gcc):: text
item
* table line::

* (info)::
some @ verb{x atim
* texinfo:: in @ verbatim
* (manual2):: %

<i></i>
Log$
* (truc):: description
* acronym::

* subsubsection::
Menu comment

';

$result_errors{'formats_in_menu'} = '';

$result_nodes_list{'formats_in_menu'} = '1|first
 menus:
  (gcc)
  (info)
  (manual2)
  (truc)
';

$result_sections_list{'formats_in_menu'} = '';

$result_sectioning_root{'formats_in_menu'} = '';

$result_headings_list{'formats_in_menu'} = '';


$result_converted{'plaintext'}->{'formats_in_menu'} = '* Menu:

* (gcc):: text
item
     * table line::

* (info)::
some @ verb{x atim
* texinfo:: in @ verbatim
* (manual2):: %
Log$
* (truc):: description
* acronym::

     * subsubsection::
     Menu comment

';


$result_converted{'html'}->{'formats_in_menu'} = '<!DOCTYPE html>
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
<tr><td class="menu-entry-destination">&bull; <a href="gcc.html#Top" accesskey="1">(gcc)</a>:</td><td class="menu-entry-description">text
<dl class="table">
<dt>item</dt>
<dd><pre class="menu-preformatted">* table line::
</pre></dd>
</dl>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="info.html#Top" accesskey="2">(info)</a>:</td><td class="menu-entry-description">
<pre class="verbatim">some @ verb{x atim
* texinfo:: in @ verbatim
</pre></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="manual2.html#Top" accesskey="3">(manual2)</a>:</td><td class="menu-entry-description">%

<i></i>
Log$
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="truc.html#Top" accesskey="4">(truc)</a>:</td><td class="menu-entry-description"><abbr class="acronym">description
* acronym::</abbr>
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre><div class="example">
<pre class="example-preformatted">* subsubsection::
Menu comment
</pre></div>
<pre class="menu-comment-preformatted">

</pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'formats_in_menu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'formats_in_menu'} = '<node identifier="first"><nodename> first</nodename></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(gcc)</menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve">text
</pre><table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">* table line::
</pre></tableitem></tableentry></table>
</menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>(info)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre><verbatim xml:space="preserve" endspaces=" ">
some @ verb{x atim
* texinfo:: in @ verbatim
</verbatim>
</menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual2)</menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve">%
<html endspaces=" ">

&lt;i&gt;&lt;/i&gt;
</html>
Log$
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(truc)</menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve"><acronym><acronymword>description
* acronym::</acronymword></acronym>
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre><example endspaces=" ">
<pre xml:space="preserve">* subsubsection::
Menu comment
</pre></example>
<pre xml:space="preserve">
</pre></menucomment></menu>
';

1;
