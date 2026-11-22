use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_lines_at_beginning_no_setfilename_no_element'} = '*document_root C2
 *before_node_section C6
  *preamble_before_beginning C3
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
  *@center C1 empty_lines_at_beginning_no_setfilename_no_element.texi:l4
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:centered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Some text.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'empty_lines_at_beginning_no_setfilename_no_element'} = '\\input texinfo


@center centered

Some text.

@bye
';


$result_texts{'empty_lines_at_beginning_no_setfilename_no_element'} = 'centered

Some text.

';

$result_errors{'empty_lines_at_beginning_no_setfilename_no_element'} = '';

$result_nodes_list{'empty_lines_at_beginning_no_setfilename_no_element'} = '';

$result_sections_list{'empty_lines_at_beginning_no_setfilename_no_element'} = '';

$result_sectioning_root{'empty_lines_at_beginning_no_setfilename_no_element'} = '';

$result_headings_list{'empty_lines_at_beginning_no_setfilename_no_element'} = '';


$result_converted{'html'}->{'empty_lines_at_beginning_no_setfilename_no_element'} = '<!DOCTYPE html>
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
div.center {text-align:center}
</style>


</head>

<body>
<div class="center">centered
</div>
<p>Some text.
</p>



</body>
</html>
';

$result_converted_errors{'html'}->{'empty_lines_at_beginning_no_setfilename_no_element'} = '* W empty_lines_at_beginning_no_setfilename_no_element.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
