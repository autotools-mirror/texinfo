use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'lone_contents'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *@contents C1 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
';


$result_texis{'lone_contents'} = '@contents
';


$result_texts{'lone_contents'} = '';

$result_errors{'lone_contents'} = '';

$result_nodes_list{'lone_contents'} = '';

$result_sections_list{'lone_contents'} = '';

$result_sectioning_root{'lone_contents'} = '';

$result_headings_list{'lone_contents'} = '';


$result_converted{'plaintext'}->{'lone_contents'} = '';


$result_converted{'html'}->{'lone_contents'} = '<!DOCTYPE html>
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

<body lang="">



</body>
</html>
';

$result_converted_errors{'html'}->{'lone_contents'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
