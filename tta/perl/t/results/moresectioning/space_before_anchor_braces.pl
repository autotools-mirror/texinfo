use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_before_anchor_braces'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content
  *normal_command@anchor C2 l1
  |identifier:{point}
  |is_target:{1}
   {spaces_after_cmd_before_arg: }
   *brace_arg C1
    {normal_text:point}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l3
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{point}
     {normal_text:point}
   {normal_text:\\n}
';


$result_texis{'space_before_anchor_braces'} = '@anchor {point}

@ref{point}
';


$result_texts{'space_before_anchor_braces'} = '
point
';

$result_errors{'space_before_anchor_braces'} = '';

$result_nodes_list{'space_before_anchor_braces'} = '';

$result_sections_list{'space_before_anchor_braces'} = '';

$result_sectioning_root{'space_before_anchor_braces'} = '';

$result_headings_list{'space_before_anchor_braces'} = '';


$result_converted{'info'}->{'space_before_anchor_braces'} = Encode::encode('utf-8', 'This is , produced from .

*note point::

Tag Table:
Ref: point27

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'space_before_anchor_braces'} = '* W |document without nodes
 warning: document without nodes

* W l1|@anchor outside of any node
 warning: @anchor outside of any node

';


$result_converted{'html'}->{'space_before_anchor_braces'} = '<!DOCTYPE html>
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
<a class="anchor" id="point"></a>
<p><a class="ref" href="#point"> </a>
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'space_before_anchor_braces'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
