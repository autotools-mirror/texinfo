use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'example_in_menu_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@menu C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l2
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{entry}
     {normal_text:entry}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_comment C3
    *preformatted C1
     {after_menu_description_line:\\n}
    *normal_command@example C3 l4
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C3
      {normal_text:in \\n}
      {empty_line:\\n}
      {normal_text:example\\n}
     *normal_command@end C1 l8
     |EXTRA
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
    *preformatted C3
     {empty_line:\\n}
     {normal_text:menu comment.\\n}
     {empty_line:\\n}
   *normal_command@end C1 l12
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'example_in_menu_comment'} = '@menu
* entry::

@example
in 

example
@end example

menu comment.

@end menu
';


$result_texts{'example_in_menu_comment'} = '* entry::

in 

example

menu comment.

';

$result_errors{'example_in_menu_comment'} = '';

$result_nodes_list{'example_in_menu_comment'} = '';

$result_sections_list{'example_in_menu_comment'} = '';

$result_sectioning_root{'example_in_menu_comment'} = '';

$result_headings_list{'example_in_menu_comment'} = '';


$result_converted{'plaintext'}->{'example_in_menu_comment'} = '* Menu:

* entry::

     in

     example

menu comment.

';


$result_converted{'html'}->{'example_in_menu_comment'} = '<!DOCTYPE html>
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
div.example {margin-left: 3.2em}
pre.menu-comment-preformatted {font-family: serif}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; entry:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre><div class="example">
<pre class="example-preformatted">in 

example
</pre></div>
<pre class="menu-comment-preformatted">

menu comment.

</pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_in_menu_comment'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'example_in_menu_comment'} = '<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>entry</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre><example endspaces=" ">
<pre xml:space="preserve">in 

example
</pre></example>
<pre xml:space="preserve">
menu comment.

</pre></menucomment></menu>
';

1;
