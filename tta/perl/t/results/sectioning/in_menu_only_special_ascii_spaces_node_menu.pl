use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'in_menu_only_special_ascii_spaces_node_menu'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 in_menu_only_special_ascii_spaces_node.texi:l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 in_menu_only_special_ascii_spaces_node.texi:l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 in_menu_only_special_ascii_spaces_node.texi:l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 in_menu_only_special_ascii_spaces_node.texi:l5
    {menu_entry_leading_text:* '."\r".'}
    *menu_entry_node
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 in_menu_only_special_ascii_spaces_node.texi:l6
    {menu_entry_leading_text:* \\t\\f}
    *menu_entry_node
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 in_menu_only_special_ascii_spaces_node.texi:l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 in_menu_only_special_ascii_spaces_node.texi:l9
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument: '."\r".'\\n}
 *@chapter C2 in_menu_only_special_ascii_spaces_node.texi:l10 {CARRIAGE RETURN|'."\r".'|}
 |EXTRA
 |identifier:{CARRIAGE-RETURN_007c-_007c}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:CARRIAGE RETURN|'."\r".'|}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 in_menu_only_special_ascii_spaces_node.texi:l12
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument: \\t\\f\\n}
 *@chapter C2 in_menu_only_special_ascii_spaces_node.texi:l13 {CHARACTER TABULATION|	| FORM FEED||}
 |EXTRA
 |identifier:{CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:CHARACTER TABULATION|\\t| FORM FEED|\\f|}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'in_menu_only_special_ascii_spaces_node_menu'} = '@node Top
@top top

@menu
* '."\r".'::
* 	::
@end menu

@node '."\r".'
@chapter CARRIAGE RETURN|'."\r".'|

@node 	
@chapter CHARACTER TABULATION|	| FORM FEED||

';


$result_texts{'in_menu_only_special_ascii_spaces_node_menu'} = 'top
***

* '."\r".'::
* 	::

1 CARRIAGE RETURN|'."\r".'|
*******************

2 CHARACTER TABULATION|	| FORM FEED||
************************************

';

$result_errors{'in_menu_only_special_ascii_spaces_node_menu'} = '* E in_menu_only_special_ascii_spaces_node.texi:l5|empty node name in menu entry
 empty node name in menu entry

* E in_menu_only_special_ascii_spaces_node.texi:l6|empty node name in menu entry
 empty node name in menu entry

* E in_menu_only_special_ascii_spaces_node.texi:l9|empty argument in @node
 empty argument in @node

* E in_menu_only_special_ascii_spaces_node.texi:l12|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'in_menu_only_special_ascii_spaces_node_menu'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  
  
';

$result_sections_list{'in_menu_only_special_ascii_spaces_node_menu'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->CARRIAGE RETURN|'."\r".'|
 section_children:
  1|CARRIAGE RETURN|'."\r".'|
  2|CHARACTER TABULATION|	| FORM FEED||
2|CARRIAGE RETURN|'."\r".'|
 section_directions:
  next->CHARACTER TABULATION|	| FORM FEED||
  up->top
 toplevel_directions:
  next->CHARACTER TABULATION|	| FORM FEED||
  prev->top
  up->top
3|CHARACTER TABULATION|	| FORM FEED||
 section_directions:
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
 toplevel_directions:
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
';

$result_sectioning_root{'in_menu_only_special_ascii_spaces_node_menu'} = 'level: -1
list:
 1|top
';

$result_headings_list{'in_menu_only_special_ascii_spaces_node_menu'} = '';


$result_converted{'info'}->{'in_menu_only_special_ascii_spaces_node_menu'} = Encode::encode('utf-8', 'This is , produced from in_menu_only_special_ascii_spaces_node.texi.


File: ,  Node: Top,  Up: (dir)

top
***

* Menu:

* '."\r".'::
* 	::

1 CARRIAGE RETURN| |
********************

2 CHARACTER TABULATION| | FORM FEED| |
**************************************


Tag Table:
Node: Top70
Ref: CARRIAGE RETURN| |136
Ref: CHARACTER TABULATION| | FORM FEED| |179

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'in_menu_only_special_ascii_spaces_node_menu'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<table class="menu">
<tr><td class="menu-entry-destination">&bull; :</td><td class="menu-entry-description">
</td></tr>
<tr><td class="menu-entry-destination">&bull; :</td><td class="menu-entry-description">
</td></tr>
</table>

<div class="chapter-level-extent" id="CARRIAGE-RETURN_007c-_007c">
<h2 class="chapter"><span>1 CARRIAGE RETURN|'."\r".'|<a class="copiable-link" href="#CARRIAGE-RETURN_007c-_007c"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c">
<h2 class="chapter"><span>2 CHARACTER TABULATION|	| FORM FEED|&#12;|<a class="copiable-link" href="#CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c"> &para;</a></span></h2>

</div>
</div>



</body>
</html>
';

1;
