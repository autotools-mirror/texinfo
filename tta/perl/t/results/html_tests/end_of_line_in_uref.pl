use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_of_line_in_uref'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C3
   {normal_text:See the }
   *normal_command@uref C2 l1
    *brace_arg C2
     {normal_text:https://gcc.gnu.org/codingconventions.html#Spelling\\n}
     {normal_text:Spelling}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:terminology and markup}
   {normal_text: section.}
';


$result_texis{'end_of_line_in_uref'} = 'See the @uref{https://gcc.gnu.org/codingconventions.html#Spelling
Spelling, terminology and markup} section.';


$result_texts{'end_of_line_in_uref'} = 'See the https://gcc.gnu.org/codingconventions.html#Spelling
Spelling (terminology and markup) section.';

$result_errors{'end_of_line_in_uref'} = '';

$result_nodes_list{'end_of_line_in_uref'} = '';

$result_sections_list{'end_of_line_in_uref'} = '';

$result_sectioning_root{'end_of_line_in_uref'} = '';

$result_headings_list{'end_of_line_in_uref'} = '';


$result_converted{'html'}->{'end_of_line_in_uref'} = '<!DOCTYPE html>
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
<p>See the <a class="uref" href="https://gcc.gnu.org/codingconventions.html#Spelling%20Spelling">terminology and markup</a> section.</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'end_of_line_in_uref'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
