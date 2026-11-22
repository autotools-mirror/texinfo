use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_zero'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C6 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l3
  |EXTRA
  |identifier:{0}
  |is_target:{1}
   *brace_arg C1
    {normal_text:0}
  *paragraph C1
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l5
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{0}
     {normal_text:0}
   {normal_text:.\\n}
';


$result_texis{'anchor_zero'} = '@node Top

@anchor{0}.

@xref{0}.
';


$result_texts{'anchor_zero'} = '
.

0.
';

$result_errors{'anchor_zero'} = '';

$result_nodes_list{'anchor_zero'} = '1|Top
';

$result_sections_list{'anchor_zero'} = '';

$result_sectioning_root{'anchor_zero'} = '';

$result_headings_list{'anchor_zero'} = '';


$result_converted{'info'}->{'anchor_zero'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

.

   *Note 0::.


Tag Table:
Node: Top27
Ref: 061

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'anchor_zero'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<a class="anchor" id="g_t0"></a><p>.
</p>
<p>See <a class="xref" href="#g_t0">0</a>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'anchor_zero'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
