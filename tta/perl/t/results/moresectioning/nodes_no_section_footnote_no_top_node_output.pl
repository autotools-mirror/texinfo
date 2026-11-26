use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nodes_no_section_footnote_no_top_node_output'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C3 l2 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:a}
   *normal_command@footnote C1 l4
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:my feet}
   {normal_text:\\n}
';


$result_texis{'nodes_no_section_footnote_no_top_node_output'} = '@node Top
@node chap

a@footnote{my feet}
';


$result_texts{'nodes_no_section_footnote_no_top_node_output'} = '
a
';

$result_errors{'nodes_no_section_footnote_no_top_node_output'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'nodes_no_section_footnote_no_top_node_output'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'nodes_no_section_footnote_no_top_node_output'} = '';

$result_sectioning_root{'nodes_no_section_footnote_no_top_node_output'} = '';

$result_headings_list{'nodes_no_section_footnote_no_top_node_output'} = '';


$result_converted{'plaintext'}->{'nodes_no_section_footnote_no_top_node_output'} = 'a(1)

   ---------- Footnotes ----------

   (1) my feet

';


$result_converted{'html'}->{'nodes_no_section_footnote_no_top_node_output'} = '<!DOCTYPE html>
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
<a class="node" id="Top"></a><a class="node" id="chap"></a>
<p>a<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>my feet</p>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'nodes_no_section_footnote_no_top_node_output'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
