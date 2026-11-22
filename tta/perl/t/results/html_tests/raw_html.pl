use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_html'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@html C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:<i>\\n}
    *normal_command@end C1 l3
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
';


$result_texis{'raw_html'} = '@html
<i>
@end html
';


$result_texts{'raw_html'} = '<i>
';

$result_errors{'raw_html'} = '';

$result_nodes_list{'raw_html'} = '';

$result_sections_list{'raw_html'} = '';

$result_sectioning_root{'raw_html'} = '';

$result_headings_list{'raw_html'} = '';


$result_converted{'html'}->{'raw_html'} = '<!DOCTYPE html>
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
<i>



</body>
</html>
';

$result_converted_errors{'html'}->{'raw_html'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
