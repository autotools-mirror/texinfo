use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_in_documentdescription'} = '*document_root C3
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C3 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *@documentdescription C3 l4
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@menu C3 l5
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C4 l6
     {menu_entry_leading_text:* }
     *menu_entry_node C4
     |EXTRA
     |manual_content:{f}
     |node_content:{b}
     |normalized:{b}
      {(}
      {f}
      {)}
      {b}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
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
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{documentdescription}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {documentdescription}
';


$result_texis{'menu_in_documentdescription'} = '@node Top
@top top

@documentdescription
@menu
* (f)b::
@end menu
@end documentdescription
';


$result_texts{'menu_in_documentdescription'} = 'top
***

';

$result_errors{'menu_in_documentdescription'} = '* W l5|@menu in invalid context
 warning: @menu in invalid context

';

$result_nodes_list{'menu_in_documentdescription'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'menu_in_documentdescription'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'menu_in_documentdescription'} = 'level: -1
list:
 1|top
';

$result_headings_list{'menu_in_documentdescription'} = '';


$result_converted{'html'}->{'menu_in_documentdescription'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="&bull; (f)b::">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

</div>



</body>
</html>
';

1;
