use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inline_in_node'} = '*document_root C5
 *before_node_section C1
  *preamble C2
   *normal_command@settitle C1 l1
    *line_arg C5
     {spaces_before_argument: }
     *normal_command@inlineraw C2 l1
     |expand_index:{1}
     |format:{html}
      *brace_arg C1
       {normal_text:html}
      *brace_arg C1
       {normal_text:<strong class="ttitle">}
     {normal_text:Title}
     *normal_command@inlineraw C2 l1
     |expand_index:{1}
     |format:{html}
      *brace_arg C1
       {normal_text:html}
      *brace_arg C1
       {normal_text:</strong>}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {@inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}}
 |identifier:{htmlOnehtml}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@inlineraw C2 l6
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {normal_text:html}
     *brace_arg C1
      {normal_text:<code class="tnode">}
    {normal_text:One}
    *normal_command@inlineraw C2 l6
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {normal_text:html}
     *brace_arg C1
      {normal_text:</code>}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l7 {@inlineraw{html,<span class="test">}One@inlineraw{html,</span>}}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@inlineraw C2 l7
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {normal_text:html}
     *brace_arg C1
      {normal_text:<span class="test">}
    {normal_text:One}
    *normal_command@inlineraw C2 l7
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {normal_text:html}
     *brace_arg C1
      {normal_text:</span>}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'inline_in_node'} = '@settitle @inlineraw{html,<strong class="ttitle">}Title@inlineraw{html,</strong>}

@node Top
@top

@node @inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}
@chapter @inlineraw{html,<span class="test">}One@inlineraw{html,</span>}

';


$result_texts{'inline_in_node'} = '

1 <span class="test">One</span>
*******************************

';

$result_errors{'inline_in_node'} = '';

$result_nodes_list{'inline_in_node'} = '1|Top
 associated_section
 associated_title_command
 node_directions:
  next->@inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}
2|@inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}
 associated_section: 1 @inlineraw{html,<span class="test">}One@inlineraw{html,</span>}
 associated_title_command: 1 @inlineraw{html,<span class="test">}One@inlineraw{html,</span>}
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'inline_in_node'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@inlineraw{html,<span class="test">}One@inlineraw{html,</span>}
 section_children:
  1|@inlineraw{html,<span class="test">}One@inlineraw{html,</span>}
2|@inlineraw{html,<span class="test">}One@inlineraw{html,</span>}
 associated_anchor_command: @inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}
 associated_node: @inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}
 section_directions:
  up->
 toplevel_directions:
  prev->
  up->
';

$result_sectioning_root{'inline_in_node'} = 'level: -1
list:
 1|
';

$result_headings_list{'inline_in_node'} = '';

1;
