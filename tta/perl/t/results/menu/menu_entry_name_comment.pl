use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_entry_name_comment'} = '*document_root C1
 *before_node_section C1
  *@menu C7 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C5 l2
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{b}
    |normalized:{b}
     {(}
     {f}
     {)}
     {b}
    *menu_entry_description C1
     *preformatted C1
      *@c C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {rawline_text:c}
   *menu_entry C5 l3
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C5
    |EXTRA
    |manual_content:{f}
    |node_content:{b }
    |normalized:{b}
     {(}
     {f}
     {)}
     {b}
     {space_at_end_menu_node: }
    *menu_entry_description C1
     *preformatted C1
      *@c C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {rawline_text:c}
   *menu_entry C6 l4
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{b1c.c}
    |normalized:{b1c_002ec}
     {(}
     {f}
     {)}
     {b1c.c}
    {menu_entry_separator:,}
    *menu_entry_description C1
     *preformatted C1
      *@c C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {rawline_text:c}
   *menu_entry C6 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{b2c.c}
    |normalized:{b2c_002ec}
     {(}
     {f}
     {)}
     {b2c.c}
    {menu_entry_separator:,     }
    *menu_entry_description C1
     *preformatted C1
      *@c C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {rawline_text:c}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:{f}
    |node_content:{b3c.c}
    |normalized:{b3c_002ec}
     {(}
     {f}
     {)}
     {b3c.c}
    {menu_entry_separator:,    }
    *menu_entry_description C1
     *preformatted C2
      {d}
      *@c C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {rawline_text:c}
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


$result_texis{'menu_entry_name_comment'} = '@menu
* a: (f)b@c c
* a: (f)b @c c
* a: (f)b1c.c,@c c
* a: (f)b2c.c,     @c c
* a: (f)b3c.c,    d@c c
@end menu
';


$result_texts{'menu_entry_name_comment'} = '* a: (f)b
* a: (f)b
* a: (f)b1c.c,
* a: (f)b2c.c,     
* a: (f)b3c.c,    d
';

$result_errors{'menu_entry_name_comment'} = '';

$result_nodes_list{'menu_entry_name_comment'} = '';

$result_sections_list{'menu_entry_name_comment'} = '';

$result_sectioning_root{'menu_entry_name_comment'} = '';

$result_headings_list{'menu_entry_name_comment'} = '';


$result_converted{'plaintext'}->{'menu_entry_name_comment'} = '* Menu:

* a: (f)b
* a: (f)b 
* a: (f)b1c.c,
* a: (f)b2c.c,
* a: (f)b3c.c,    d
';


$result_converted{'html'}->{'menu_entry_name_comment'} = '<!DOCTYPE html>
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

<body lang="">
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b" accesskey="1">a</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b" accesskey="2">a</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b1c_002ec" accesskey="3">a</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b2c_002ec" accesskey="4">a</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b3c_002ec" accesskey="5">a</a>:</td><td class="menu-entry-description">d</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_name_comment'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'menu_entry_name_comment'} = '<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b</menunode><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b </menunode><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b1c.c</menunode><menuseparator>,</menuseparator><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b2c.c</menunode><menuseparator>,     </menuseparator><menudescription><pre xml:space="preserve"><!-- c c -->
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b3c.c</menunode><menuseparator>,    </menuseparator><menudescription><pre xml:space="preserve">d<!-- c c -->
</pre></menudescription></menuentry></menu>
';

1;
