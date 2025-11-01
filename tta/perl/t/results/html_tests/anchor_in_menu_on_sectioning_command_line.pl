use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'anchor_in_menu_on_sectioning_command_line'} = '*document_root C3
 *before_node_section
 *@node C1 l1 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C3 l2 {chapter @anchor{ggg} after}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chapter }
    *@anchor C1 l2
    |EXTRA
    |is_target:{1}
    |normalized:{ggg}
     *brace_arg C1
      {ggg}
    {spaces_after_close_brace: }
    {after}
  {empty_line:\\n}
  *@menu C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{ggg}
    |normalized:{ggg}
     {ggg}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l6
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


$result_texis{'anchor_in_menu_on_sectioning_command_line'} = '@node chap
@chapter chapter @anchor{ggg} after

@menu
* ggg::
@end menu
';


$result_texts{'anchor_in_menu_on_sectioning_command_line'} = '1 chapter after
***************

* ggg::
';

$result_errors{'anchor_in_menu_on_sectioning_command_line'} = '* W l2|@anchor should not appear on @chapter line
 warning: @anchor should not appear on @chapter line

';

$result_nodes_list{'anchor_in_menu_on_sectioning_command_line'} = '1|chap
 associated_section: 1 chapter @anchor{ggg} after
 associated_title_command: 1 chapter @anchor{ggg} after
 menus:
  ggg
';

$result_sections_list{'anchor_in_menu_on_sectioning_command_line'} = '1|chapter @anchor{ggg} after
 associated_anchor_command: chap
 associated_node: chap
';

$result_sectioning_root{'anchor_in_menu_on_sectioning_command_line'} = 'level: 0
list:
 1|chapter @anchor{ggg} after
';

$result_headings_list{'anchor_in_menu_on_sectioning_command_line'} = '';


$result_converted{'html'}->{'anchor_in_menu_on_sectioning_command_line'} = '<!DOCTYPE html>
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

<link href="#chap" rel="start" title="chap">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="chapter-after"><span>1 chapter after<a class="copiable-link" href="#chapter-after"> &para;</a></span></h2>

</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_in_menu_on_sectioning_command_line'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
