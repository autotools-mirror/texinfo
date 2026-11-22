use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_link_prefix'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@image C1 l1
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:image}
';


$result_texis{'image_link_prefix'} = '@image{image}';


$result_texts{'image_link_prefix'} = 'image';

$result_errors{'image_link_prefix'} = '';

$result_nodes_list{'image_link_prefix'} = '';

$result_sections_list{'image_link_prefix'} = '';

$result_sectioning_root{'image_link_prefix'} = '';

$result_headings_list{'image_link_prefix'} = '';


$result_converted{'html'}->{'image_link_prefix'} = '<!DOCTYPE html>
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
<img class="image" src="../imgimage.jpg" alt="image">


</body>
</html>
';

$result_converted_errors{'html'}->{'image_link_prefix'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

* W l1|@image file `image\' (for HTML) not found, using `image.jpg\'
 warning: @image file `image\' (for HTML) not found, using `image.jpg\'

';

1;
