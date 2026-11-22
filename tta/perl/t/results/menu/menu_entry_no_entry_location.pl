use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_entry_no_entry_location'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@menu C5 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:manual}
     {normal_text:)}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      {normal_text:begin description\\n}
      {normal_text:* not an entry ?\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:manual}
     {normal_text:)}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C4
      {normal_text:an entry\\n}
      {normal_text:  in description\\n}
      {normal_text:* and here ?\\n}
      {normal_text:with text.\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:last manual}
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_entry_no_entry_location'} = '@menu
* (manual):: begin description
* not an entry ?
* (manual):: an entry
  in description
* and here ?
with text.
* (last manual)::
@end menu
';


$result_texts{'menu_entry_no_entry_location'} = '* (manual):: begin description
* not an entry ?
* (manual):: an entry
  in description
* and here ?
with text.
* (last manual)::
';

$result_errors{'menu_entry_no_entry_location'} = '';

$result_nodes_list{'menu_entry_no_entry_location'} = '';

$result_sections_list{'menu_entry_no_entry_location'} = '';

$result_sectioning_root{'menu_entry_no_entry_location'} = '';

$result_headings_list{'menu_entry_no_entry_location'} = '';


$result_converted{'plaintext'}->{'menu_entry_no_entry_location'} = '* Menu:

* (manual):: begin description
* not an entry ?
* (manual):: an entry
  in description
* and here ?
with text.
* (last manual)::
';


$result_converted{'html'}->{'menu_entry_no_entry_location'} = '<!DOCTYPE html>
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

<style type="text/css">
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="1">(manual)</a>:</td><td class="menu-entry-description">begin description
* not an entry ?
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="2">(manual)</a>:</td><td class="menu-entry-description">an entry
  in description
* and here ?
with text.
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="last%20manual.html#Top" accesskey="3">(last manual)</a>:</td><td class="menu-entry-description">
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_no_entry_location'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'menu_entry_no_entry_location'} = '<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve">begin description
* not an entry ?
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(manual)</menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve">an entry
  in description
* and here ?
with text.
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(last manual)</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
';

1;
