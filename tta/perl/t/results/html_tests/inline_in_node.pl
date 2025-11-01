use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inline_in_node'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@settitle C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@inlineraw C2 l1
     |EXTRA
     |expand_index:{1}
     |format:{html}
      *brace_arg C1
       {html}
      *brace_arg C1
       {<strong class="ttitle">}
     {Title}
     *@inlineraw C2 l1
     |EXTRA
     |expand_index:{1}
     |format:{html}
      *brace_arg C1
       {html}
      *brace_arg C1
       {</strong>}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l4
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l6 {@inlineraw{html,<code class="tnode">}One@inlineraw{html,</code>}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{htmlOnehtml}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@inlineraw C2 l6
    |EXTRA
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {html}
     *brace_arg C1
      {<code class="tnode">}
    {One}
    *@inlineraw C2 l6
    |EXTRA
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {html}
     *brace_arg C1
      {</code>}
 *@chapter C2 l7 {@inlineraw{html,<span class="test">}One@inlineraw{html,</span>}}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@inlineraw C2 l7
    |EXTRA
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {html}
     *brace_arg C1
      {<span class="test">}
    {One}
    *@inlineraw C2 l7
    |EXTRA
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {html}
     *brace_arg C1
      {</span>}
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
