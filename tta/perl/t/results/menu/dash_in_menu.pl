use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'dash_in_menu'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@menu C4 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C6 l3
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:entry---in}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{n_002d_002d_002dode}
     {normal_text:(}
     {normal_text:manual}
     {normal_text:)}
     {normal_text:n---ode}
    {menu_entry_separator:.         }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:description --- in.\\n}
   *menu_comment C1
    *preformatted C2
     {after_menu_description_line:\\n}
     {normal_text:comment --- in.\\n}
   *normal_command@end C1 l6
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'dash_in_menu'} = '
@menu
* entry---in: (manual)n---ode.         description --- in.

comment --- in.
@end menu
';


$result_texts{'dash_in_menu'} = '* entry--in: (manual)n---ode.         description -- in.

comment -- in.
';

$result_errors{'dash_in_menu'} = '';

$result_nodes_list{'dash_in_menu'} = '';

$result_sections_list{'dash_in_menu'} = '';

$result_sectioning_root{'dash_in_menu'} = '';

$result_headings_list{'dash_in_menu'} = '';


$result_converted{'plaintext'}->{'dash_in_menu'} = '* Menu:

* entry--in: (manual)n---ode.         description -- in.

comment -- in.
';


$result_converted{'html'}->{'dash_in_menu'} = '<!DOCTYPE html>
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
pre.menu-comment-preformatted {font-family: serif}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="manual.html#n_002d_002d_002dode" accesskey="1">entry&mdash;in</a>:</td><td class="menu-entry-description">description &mdash; in.
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

comment &mdash; in.
</pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'dash_in_menu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'dash_in_menu'} = '<preamblebeforebeginning>
</preamblebeforebeginning><menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menutitle>entry&textmdash;in</menutitle><menuseparator>: </menuseparator><menunode>(manual)n---ode</menunode><menuseparator>.         </menuseparator><menudescription><pre xml:space="preserve">description &textmdash; in.
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
comment &textmdash; in.
</pre></menucomment></menu>
';

1;
