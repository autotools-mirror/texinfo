use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'top_no_argument_and_node'} = '*document_root C3
 *before_node_section
 *@node C1 l1 {start}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{start}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {start}
 *@top C1 l2
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'top_no_argument_and_node'} = '@node start
@top
';


$result_texts{'top_no_argument_and_node'} = '';

$result_errors{'top_no_argument_and_node'} = '';

$result_nodes_list{'top_no_argument_and_node'} = '1|start
 associated_section
 associated_title_command
';

$result_sections_list{'top_no_argument_and_node'} = '1
 associated_anchor_command: start
 associated_node: start
';

$result_sectioning_root{'top_no_argument_and_node'} = 'level: -1
list:
 1|
';

$result_headings_list{'top_no_argument_and_node'} = '';


$result_converted{'info'}->{'top_no_argument_and_node'} = 'This is , produced from .


File: ,  Node: start


Tag Table:
Node: start27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'top_no_argument_and_node'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'top_no_argument_and_node'} = '<!DOCTYPE html>
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

<link href="#start" rel="start" title="start">


</head>

<body lang="">
<div class="top-level-extent" id="start">
<a class="top" id="SEC_Top"></a></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'top_no_argument_and_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
