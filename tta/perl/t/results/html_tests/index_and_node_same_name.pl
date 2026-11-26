use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_and_node_same_name'} = '*document_root C3
 *before_node_section C1
  *preamble
 *normal_command@top C1 l1 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@node C5 l2 {index node}
 |identifier:{index-node}
 |is_target:{1}
 |isindex:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l4
  |element_node:{index-node}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 l5
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'index_and_node_same_name'} = '@top top
@node index node

@cindex node
@printindex cp

';


$result_texts{'index_and_node_same_name'} = 'top
***


';

$result_errors{'index_and_node_same_name'} = '';

$result_nodes_list{'index_and_node_same_name'} = '1|index node
';

$result_sections_list{'index_and_node_same_name'} = '1|top
';

$result_sectioning_root{'index_and_node_same_name'} = 'level: -1
list:
 1|top
';

$result_headings_list{'index_and_node_same_name'} = '';

$result_indices_sort_strings{'index_and_node_same_name'} = 'cp:
 node
';


$result_converted{'html'}->{'index_and_node_same_name'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#index-node" rel="start" title="index node">
<link href="#index-node" rel="index" title="index node">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
span:hover a.copiable-link {visibility: visible}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<h1 class="top"><span>top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<h4 class="node" id="index-node"><span>index node<a class="copiable-link" href="#index-node"> &para;</a></span></h4>

<a class="index-entry-id" id="index-node-1"></a>
<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="index-node_cp_letter-N">N</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-node-1">node</a></td><td class="printindex-index-section"><a href="#index-node">index node</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'index_and_node_same_name'} = 'cp:
 node
';

1;
