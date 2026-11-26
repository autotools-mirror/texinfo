use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_no_argument_and_content'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@top C3 l1
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:A.\\n}
';


$result_texis{'top_no_argument_and_content'} = '@top

A.
';


$result_texts{'top_no_argument_and_content'} = '
A.
';

$result_errors{'top_no_argument_and_content'} = '';

$result_nodes_list{'top_no_argument_and_content'} = '';

$result_sections_list{'top_no_argument_and_content'} = '1
';

$result_sectioning_root{'top_no_argument_and_content'} = 'level: -1
list:
 1|
';

$result_headings_list{'top_no_argument_and_content'} = '';


$result_converted{'plaintext'}->{'top_no_argument_and_content'} = 'A.
';


$result_converted{'html'}->{'top_no_argument_and_content'} = '<!DOCTYPE html>
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



</head>

<body>
<div class="top-level-extent" id="SEC_Top">

<p>A.
</p></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'top_no_argument_and_content'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
