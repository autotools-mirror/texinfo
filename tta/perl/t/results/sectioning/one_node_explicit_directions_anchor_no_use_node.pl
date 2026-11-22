use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'one_node_explicit_directions_anchor_no_use_node'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C6 l1 {one node}
 |identifier:{one-node}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:one node}
   *line_arg
   *line_arg
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Top node\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:anchor ref }
   *normal_command@anchor C1 l4
   |identifier:{ref}
   |is_target:{1}
    *brace_arg C1
     {normal_text:ref}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:ref to ref }
   *normal_command@ref C1 l6
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{ref}
     {normal_text:ref}
   {normal_text:.\\n}
';


$result_texis{'one_node_explicit_directions_anchor_no_use_node'} = '@node one node,,,(dir)
Top node

anchor ref @anchor{ref}.

ref to ref @ref{ref}.
';


$result_texts{'one_node_explicit_directions_anchor_no_use_node'} = 'Top node

anchor ref .

ref to ref ref.
';

$result_errors{'one_node_explicit_directions_anchor_no_use_node'} = '';

$result_nodes_list{'one_node_explicit_directions_anchor_no_use_node'} = '1|one node
 node_directions:
  up->(dir)

';

$result_sections_list{'one_node_explicit_directions_anchor_no_use_node'} = '';

$result_sectioning_root{'one_node_explicit_directions_anchor_no_use_node'} = '';

$result_headings_list{'one_node_explicit_directions_anchor_no_use_node'} = '';


$result_converted{'info'}->{'one_node_explicit_directions_anchor_no_use_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: one node,  Up: (dir)

Top node

   anchor ref .

   ref to ref *note ref::.


Tag Table:
Node: one node27
Ref: ref89

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'one_node_explicit_directions_anchor_no_use_node'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'one_node_explicit_directions_anchor_no_use_node'} = '<!DOCTYPE html>
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
<a class="node" id="one-node"></a><p>Top node
</p>
<p>anchor ref <a class="anchor" id="ref"></a>.
</p>
<p>ref to ref <a class="ref" href="#ref">ref</a>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'one_node_explicit_directions_anchor_no_use_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
