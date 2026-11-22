use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_self_section_reference'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {sharp}
 |EXTRA
 |identifier:{sharp}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sharp}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l2 {@ref{sharp} tuple}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@ref C1 l2
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{sharp}
      {normal_text:sharp}
    {normal_text: tuple}
    {spaces_after_argument:\\n}
';


$result_texis{'recursive_self_section_reference'} = '@node sharp
@chapter @ref{sharp} tuple
';


$result_texts{'recursive_self_section_reference'} = '1 sharp tuple
*************
';

$result_errors{'recursive_self_section_reference'} = '';

$result_nodes_list{'recursive_self_section_reference'} = '1|sharp
 associated_section: 1 @ref{sharp} tuple
 associated_title_command: 1 @ref{sharp} tuple
';

$result_sections_list{'recursive_self_section_reference'} = '1|@ref{sharp} tuple
 associated_anchor_command: sharp
 associated_node: sharp
';

$result_sectioning_root{'recursive_self_section_reference'} = 'level: 0
list:
 1|@ref{sharp} tuple
';

$result_headings_list{'recursive_self_section_reference'} = '';


$result_converted{'plaintext'}->{'recursive_self_section_reference'} = '1 sharp tuple
*************

';


$result_converted{'html'}->{'recursive_self_section_reference'} = '<!DOCTYPE html>
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

<link href="#sharp" rel="start" title="sharp">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="chapter-level-extent" id="sharp">
<h2 class="chapter" id="sharp-tuple"><span>1 <a class="ref" href="#sharp">sharp</a> tuple<a class="copiable-link" href="#sharp-tuple"> &para;</a></span></h2>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'recursive_self_section_reference'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
