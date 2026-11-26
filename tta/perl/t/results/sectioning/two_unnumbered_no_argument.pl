use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_unnumbered_no_argument'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@unnumbered C1 l1
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@unnumbered C1 l2
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'two_unnumbered_no_argument'} = '@unnumbered
@unnumbered
';


$result_texts{'two_unnumbered_no_argument'} = '';

$result_errors{'two_unnumbered_no_argument'} = '* W l1|@unnumbered missing argument
 warning: @unnumbered missing argument

* W l2|@unnumbered missing argument
 warning: @unnumbered missing argument

';

$result_nodes_list{'two_unnumbered_no_argument'} = '';

$result_sections_list{'two_unnumbered_no_argument'} = '1
 section_directions:
  next->
 toplevel_directions:
  next->
2
 section_directions:
  prev->
 toplevel_directions:
  prev->
';

$result_sectioning_root{'two_unnumbered_no_argument'} = 'level: 0
list:
 1|
 2|
';

$result_headings_list{'two_unnumbered_no_argument'} = '';


$result_converted{'plaintext'}->{'two_unnumbered_no_argument'} = '';


$result_converted{'html'}->{'two_unnumbered_no_argument'} = '<!DOCTYPE html>
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
<div class="unnumbered-level-extent">
</div>
<div class="unnumbered-level-extent">
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'two_unnumbered_no_argument'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'two_unnumbered_no_argument'} = '<unnumbered><sectiontitle></sectiontitle>
</unnumbered>
<unnumbered><sectiontitle></sectiontitle>
</unnumbered>
';

1;
