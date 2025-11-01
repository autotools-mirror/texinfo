use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'detailmenu_in_description'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@menu C4 l2
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
   *@detailmenu C3 l4
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C4 l5
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
    *@end C1 l6
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


$result_texis{'detailmenu_in_description'} = '
@menu
* Copying Conditions::          Your rights.
@detailmenu
* detailmenu::
@end detailmenu
@end menu
';


$result_texts{'detailmenu_in_description'} = '
* Copying Conditions::          Your rights.
* detailmenu::
';

$result_errors{'detailmenu_in_description'} = '';

$result_nodes_list{'detailmenu_in_description'} = '';

$result_sections_list{'detailmenu_in_description'} = '';

$result_sectioning_root{'detailmenu_in_description'} = '';

$result_headings_list{'detailmenu_in_description'} = '';


$result_converted{'plaintext'}->{'detailmenu_in_description'} = '* Menu:

* Copying Conditions::          Your rights.
* detailmenu::
';


$result_converted{'html'}->{'detailmenu_in_description'} = '<!DOCTYPE html>
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
<tr><td class="menu-entry-destination">&bull; Copying Conditions:</td><td class="menu-entry-description">Your rights.
</td></tr>
<tr><td class="menu-entry-destination">&bull; detailmenu:</td><td class="menu-entry-description">
</td></tr>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'detailmenu_in_description'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'detailmenu_in_description'} = '
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>Copying Conditions</menunode><menuseparator>::          </menuseparator><menudescription><pre xml:space="preserve">Your rights.
</pre></menudescription></menuentry><detailmenu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>detailmenu</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></detailmenu>
</menu>
';

1;
