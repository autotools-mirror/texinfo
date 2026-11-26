use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_with_only_top_node'} = '*document_root C2
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C3 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l4
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'contents_with_only_top_node'} = '
@node Top

@contents
';


$result_texts{'contents_with_only_top_node'} = '
';

$result_errors{'contents_with_only_top_node'} = '';

$result_nodes_list{'contents_with_only_top_node'} = '1|Top
';

$result_sections_list{'contents_with_only_top_node'} = '';

$result_sectioning_root{'contents_with_only_top_node'} = '';

$result_headings_list{'contents_with_only_top_node'} = '';


$result_converted{'plaintext'}->{'contents_with_only_top_node'} = '';


$result_converted{'html'}->{'contents_with_only_top_node'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>




</body>
</html>
';

$result_converted_errors{'html'}->{'contents_with_only_top_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
