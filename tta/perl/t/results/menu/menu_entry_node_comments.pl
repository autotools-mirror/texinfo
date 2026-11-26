use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_entry_node_comments'} = '*document_root C1
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
    |normalized:{a1c}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:a1c}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:c}
        {spaces_after_argument:\\n}
   *menu_entry C4 l3
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{a2c}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:a2c}
    {menu_entry_separator:::  }
    *menu_entry_description C1
     *preformatted C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:c}
        {spaces_after_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{a3c}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text:a3c}
    {menu_entry_separator:::         }
    *menu_entry_description C1
     *preformatted C2
      {normal_text:d}
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:c}
        {spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C6
    |manual_content:A{1|1}
    |node_content:A{4|5}
    |normalized:{a4}
     {normal_text:(}
     {normal_text:f}
     {normal_text:)}
     {normal_text: }
     {normal_text:a4}
     {space_at_end_menu_node: }
    {menu_entry_separator:::   }
    *menu_entry_description C1
     *preformatted C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:c}
        {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_entry_node_comments'} = '@menu
* (f)a1c::@c c
* (f)a2c::  @c c
* (f)a3c::         d@c c
* (f) a4 ::   @c c
@end menu
';


$result_texts{'menu_entry_node_comments'} = '* (f)a1c::
* (f)a2c::  
* (f)a3c::         d
* (f) a4::   
';

$result_errors{'menu_entry_node_comments'} = '';

$result_nodes_list{'menu_entry_node_comments'} = '';

$result_sections_list{'menu_entry_node_comments'} = '';

$result_sectioning_root{'menu_entry_node_comments'} = '';

$result_headings_list{'menu_entry_node_comments'} = '';


$result_converted{'plaintext'}->{'menu_entry_node_comments'} = '* Menu:

* (f)a1c::
* (f)a2c::
* (f)a3c::         d
* (f) a4 ::
';


$result_converted{'html'}->{'menu_entry_node_comments'} = '<!DOCTYPE html>
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
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a1c" accesskey="1">(f)a1c</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a2c" accesskey="2">(f)a2c</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a3c" accesskey="3">(f)a3c</a>:</td><td class="menu-entry-description">d</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#a4" accesskey="4">(f) a4 </a>:</td><td class="menu-entry-description"></td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_node_comments'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'menu_entry_node_comments'} = '<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)a1c</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)a2c</menunode><menuseparator>::  </menuseparator><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(f)a3c</menunode><menuseparator>::         </menuseparator><menudescription><pre xml:space="preserve">d<!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>(f) a4 </menunode><menuseparator>::   </menuseparator><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry></menu>
';

1;
