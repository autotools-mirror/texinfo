use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_lines_at_beginning_no_setfilename'} = '*document_root C4
 *before_node_section C2
  *preamble_before_beginning C3
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 empty_lines_at_beginning_no_setfilename.texi:l6 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 empty_lines_at_beginning_no_setfilename.texi:l7 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'empty_lines_at_beginning_no_setfilename'} = '\\input texinfo


@c comment

@node Top
@top top

@bye
';


$result_texts{'empty_lines_at_beginning_no_setfilename'} = '
top
***

';

$result_errors{'empty_lines_at_beginning_no_setfilename'} = '';

$result_nodes_list{'empty_lines_at_beginning_no_setfilename'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'empty_lines_at_beginning_no_setfilename'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'empty_lines_at_beginning_no_setfilename'} = 'level: -1
list:
 1|top
';

$result_headings_list{'empty_lines_at_beginning_no_setfilename'} = '';


$result_converted{'html'}->{'empty_lines_at_beginning_no_setfilename'} = '<!DOCTYPE html>
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
</style>


</head>

<body>

<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

</div>



</body>
</html>
';

1;
