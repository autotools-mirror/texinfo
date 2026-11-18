use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_entry_name'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@menu C12 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C5
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|4}
    |normalized:{b}
     {(}
     {f}
     {)}
     {b}
     {space_at_end_menu_node:\\n}
   *menu_entry C6 l3
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b1_002ec}
     {(}
     {f}
     {)}
     {b1.c}
    {menu_entry_separator:,}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l4
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b2_002ec}
     {(}
     {f}
     {)}
     {b2.c}
    {menu_entry_separator:,     }
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l5
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b3_002ec}
     {(}
     {f}
     {)}
     {b3.c}
    {menu_entry_separator:,    }
    *menu_entry_description C1
     *preformatted C1
      {d\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b1_002e}
     {(}
     {f}
     {)}
     {b1.}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l7
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a }
    {menu_entry_separator:: }
    *menu_entry_node C5
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{4|4}
    |normalized:{b2-_002e}
     {(}
     {f}
     {)}
     { }
     {b2 .}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l8
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a.n}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b3_002e}
     {(}
     {f}
     {)}
     {b3.}
    {menu_entry_separator:.         }
    *menu_entry_description C1
     *preformatted C1
      {d\\n}
   *menu_entry C6 l9
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b1_002ec}
     {(}
     {f}
     {)}
     {b1.c}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l10
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b2_002ec}
     {(}
     {f}
     {)}
     {b2.c}
    {menu_entry_separator:.  }
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C6 l11
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {a}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{b3_002ec}
     {(}
     {f}
     {)}
     {b3.c}
    {menu_entry_separator:. }
    *menu_entry_description C1
     *preformatted C1
      {d\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_entry_name'} = '@menu
* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
@end menu
';


$result_texts{'menu_entry_name'} = '* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,     
* a: (f)b3.c,    d
* a: (f)b1.. 
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.  
* a: (f)b3.c. d
';

$result_errors{'menu_entry_name'} = '';

$result_nodes_list{'menu_entry_name'} = '';

$result_sections_list{'menu_entry_name'} = '';

$result_sectioning_root{'menu_entry_name'} = '';

$result_headings_list{'menu_entry_name'} = '';


$result_converted{'plaintext'}->{'menu_entry_name'} = '* Menu:

* a: (f)b
* a: (f)b1.c,
* a: (f)b2.c,
* a: (f)b3.c,    d
* a: (f)b1..
* a : (f) b2 ..
* a.n: (f)b3..         d
* a: (f)b1.c.
* a: (f)b2.c.
* a: (f)b3.c. d
';


$result_converted{'html'}->{'menu_entry_name'} = '<!DOCTYPE html>
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
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b" accesskey="1">a</a>:</td><td class="menu-entry-description"></td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b1_002ec" accesskey="2">a</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b2_002ec" accesskey="3">a</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b3_002ec" accesskey="4">a</a>:</td><td class="menu-entry-description">d
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b1_002e" accesskey="5">a</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b2-_002e" accesskey="6">a </a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b3_002e" accesskey="7">a.n</a>:</td><td class="menu-entry-description">d
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b1_002ec" accesskey="8">a</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b2_002ec" accesskey="9">a</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="f.html#b3_002ec">a</a>:</td><td class="menu-entry-description">d
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_name'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'menu_entry_name'} = '<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b
</menunode></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b1.c</menunode><menuseparator>,</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b2.c</menunode><menuseparator>,     </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b3.c</menunode><menuseparator>,    </menuseparator><menudescription><pre xml:space="preserve">d
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b1.</menunode><menuseparator>. </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a </menutitle><menuseparator>: </menuseparator><menunode>(f) b2 .</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a.n</menutitle><menuseparator>: </menuseparator><menunode>(f)b3.</menunode><menuseparator>.         </menuseparator><menudescription><pre xml:space="preserve">d
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b1.c</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b2.c</menunode><menuseparator>.  </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>a</menutitle><menuseparator>: </menuseparator><menunode>(f)b3.c</menunode><menuseparator>. </menuseparator><menudescription><pre xml:space="preserve">d
</pre></menudescription></menuentry></menu>
';

1;
