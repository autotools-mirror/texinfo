use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'block_commands_in_menu_description'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {first}
    {spaces_after_argument:\\n}
 *@top C3 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {manual}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C5
     *preformatted C1
      {\\n}
     *@itemize C4 l6
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *before_item C1
       *preformatted C1
        {empty_line:\\n}
      *@item C1 l8
      |EXTRA
      |item_number:{1}
       *preformatted C3
        {ignorable_spaces_after_command: }
        {in item\\n}
        {empty_line:\\n}
      *@end C1 l10
      |EXTRA
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {itemize}
        {spaces_after_argument:\\n}
     *@table C4 l11
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        *@asis l11
        {spaces_after_argument:\\n}
      *before_item C1
       *preformatted C1
        {empty_line:\\n}
      *table_entry C2
       *table_term C1
        *@item C1 l13
         *line_arg C3
          {spaces_before_argument: }
          {table item}
          {spaces_after_argument:\\n}
       *table_definition C1
        *preformatted C3
         {empty_line:\\n}
         {Text.\\n}
         {empty_line:\\n}
      *@end C1 l17
      |EXTRA
      |text_arg:{table}
       *line_arg C3
        {spaces_before_argument: }
        {table}
        {spaces_after_argument:\\n}
     *preformatted C1
      *@html C3 l18
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *rawpreformatted C3
        {empty_line:\\n}
        {<b> in html </b>\\n}
        {empty_line:\\n}
       *@end C1 l22
       |EXTRA
       |text_arg:{html}
        *line_arg C3
         {spaces_before_argument: }
         {html}
         {spaces_after_argument:\\n}
     *@verbatim C3 l23
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      {raw:\\n}
      *@end C1 l25
      |EXTRA
      |text_arg:{verbatim}
       *line_arg C3
        {spaces_before_argument: }
        {verbatim}
        {spaces_after_argument:\\n}
   *@end C1 l26
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
';


$result_texis{'block_commands_in_menu_description'} = '@node first
@top top

@menu
* (manual)::
@itemize

@item in item

@end itemize
@table @asis

@item table item

Text.

@end table
@html

<b> in html </b>

@end html
@verbatim

@end verbatim
@end menu
';


$result_texts{'block_commands_in_menu_description'} = 'top
***

* (manual)::

in item


table item

Text.


<b> in html </b>


';

$result_errors{'block_commands_in_menu_description'} = '';

$result_nodes_list{'block_commands_in_menu_description'} = '1|first
 associated_section: top
 associated_title_command: top
 menus:
  (manual)
';

$result_sections_list{'block_commands_in_menu_description'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'block_commands_in_menu_description'} = 'level: -1
list:
 1|top
';

$result_headings_list{'block_commands_in_menu_description'} = '';


$result_converted{'plaintext'}->{'block_commands_in_menu_description'} = 'top
***

* Menu:

* (manual)::

   • in item


table item

     Text.


';


$result_converted{'html'}->{'block_commands_in_menu_description'} = '<!DOCTYPE html>
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
pre.menu-preformatted {font-family: serif}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
ul.mark-bullet {list-style-type: disc}
</style>


</head>

<body>
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="1">(manual)</a>:</td><td class="menu-entry-description">
<ul class="itemize mark-bullet">
<li><pre class="menu-preformatted">

</pre></li><li><pre class="menu-preformatted">in item

</pre></li></ul>
<dl class="table">
<dd><pre class="menu-preformatted">

</pre></dd>
<dt>table item</dt>
<dd><pre class="menu-preformatted">

Text.

</pre></dd>
</dl>

<b> in html </b>

<pre class="verbatim">
</pre></td></tr>
</table>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'block_commands_in_menu_description'} = '<node identifier="first"><nodename> first</nodename></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre><itemize endspaces=" ">
<beforefirstitem><pre xml:space="preserve">
</pre></beforefirstitem><listitem><prepend>&bullet;</prepend><pre xml:space="preserve"> in item

</pre></listitem></itemize>
<table commandarg="asis" endspaces=" ">
<beforefirstitem><pre xml:space="preserve">
</pre></beforefirstitem><tableentry><tableterm><item><itemformat command="asis"> table item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">
Text.

</pre></tableitem></tableentry></table>
<pre xml:space="preserve"><html endspaces=" ">

&lt;b&gt; in html &lt;/b&gt;

</html>
</pre><verbatim xml:space="preserve" endspaces=" ">

</verbatim>
</menudescription></menuentry></menu>
</top>
';

1;
