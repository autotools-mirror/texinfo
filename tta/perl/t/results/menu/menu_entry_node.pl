use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_entry_node'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@menu C6 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{a1}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:a1}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l3
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{a2}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:a2}
    {menu_entry_separator:::  }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{a3}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:a3}
    {menu_entry_separator:::         }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:d\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C6
    |manual_content:A{1|1}
    |node_content:A{3|5}
    |normalized:{_0040a}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     *normal_command@@
     {normal_text:a}
     *normal_command@:
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l6
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_entry_node'} = '@menu
* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@@a@::: 
@end menu
';


$result_texts{'menu_entry_node'} = '* (f)a1::
* (f)a2::  
* (f)a3::         d
* (f)@a:: 
';

$result_errors{'menu_entry_node'} = '';

$result_nodes_list{'menu_entry_node'} = '';

$result_sections_list{'menu_entry_node'} = '';

$result_sectioning_root{'menu_entry_node'} = '';

$result_headings_list{'menu_entry_node'} = '';


$result_converted{'plaintext'}->{'menu_entry_node'} = '* Menu:

* (f)a1::
* (f)a2::
* (f)a3::         d
* (f)@a::
';


$result_converted{'html'}->{'menu_entry_node'} = '<!DOCTYPE html>
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
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a1" accesskey="1">(f)a1</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a2" accesskey="2">(f)a2</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a3" accesskey="3">(f)a3</a>:</td><td class="menu-entry-description">d
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#g_t_0040a" accesskey="4">(f)@a</a>:</td><td class="menu-entry-description">
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'menu_entry_node'} = '<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)a1</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)a2</menunode><menuseparator>::  </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)a3</menunode><menuseparator>::         </menuseparator><menudescription><pre xml:space="preserve">d
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)&arobase;a&noeos;</menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
';

1;
