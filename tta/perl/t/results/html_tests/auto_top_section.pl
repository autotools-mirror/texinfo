use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'auto_top_section'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |added:{1}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l1 {Test manual}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test manual}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In top node\\n}
  {empty_line:\\n}
';


$result_texis{'auto_top_section'} = '@node Top
@top Test manual

In top node

';


$result_texts{'auto_top_section'} = 'Test manual
***********

In top node

';

$result_errors{'auto_top_section'} = '';

$result_nodes_list{'auto_top_section'} = '1|Top
 associated_section: Test manual
 associated_title_command: Test manual
';

$result_sections_list{'auto_top_section'} = '1|Test manual
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'auto_top_section'} = 'level: -1
list:
 1|Test manual
';

$result_headings_list{'auto_top_section'} = '';


$result_converted{'html'}->{'auto_top_section'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test manual</title>

<meta name="description" content="Test manual">
<meta name="keywords" content="Test manual">
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
<h1 class="top" id="Test-manual"><span>Test manual<a class="copiable-link" href="#Test-manual"> &para;</a></span></h1>

<p>In top node
</p>
</div>



</body>
</html>
';

1;
