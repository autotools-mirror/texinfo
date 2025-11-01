use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'detailmenu'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@menu C5 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l3
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Copying Conditions}
    |normalized:{Copying-Conditions}
     {Copying Conditions}
    {menu_entry_separator:::          }
    *menu_entry_description C1
     *preformatted C1
      {Your rights.\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@detailmenu C3 l5
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C4 l6
     {menu_entry_leading_text:* }
     *menu_entry_node C1
     |EXTRA
     |node_content:{detailmenu}
     |normalized:{detailmenu}
      {detailmenu}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *@end C1 l7
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {detailmenu}
   *@end C1 l8
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


$result_texis{'detailmenu'} = '
@menu
* Copying Conditions::          Your rights.

@detailmenu
* detailmenu::
@end detailmenu
@end menu
';


$result_texts{'detailmenu'} = '
* Copying Conditions::          Your rights.

* detailmenu::
';

$result_errors{'detailmenu'} = '';

$result_nodes_list{'detailmenu'} = '';

$result_sections_list{'detailmenu'} = '';

$result_sectioning_root{'detailmenu'} = '';

$result_headings_list{'detailmenu'} = '';


$result_converted{'plaintext'}->{'detailmenu'} = '* Menu:

* Copying Conditions::          Your rights.

* detailmenu::
';


$result_converted{'html'}->{'detailmenu'} = '<!DOCTYPE html>
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

<body lang="">

<table class="menu">
<tr><td class="menu-entry-destination">&bull; Copying Conditions:</td><td class="menu-entry-description">Your rights.
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; detailmenu:</td><td class="menu-entry-description">
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'detailmenu'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'detailmenu'} = '
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>Copying Conditions</menunode><menuseparator>::          </menuseparator><menudescription><pre xml:space="preserve">Your rights.
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
</pre></menucomment><detailmenu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>detailmenu</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
</menu>
';

1;
