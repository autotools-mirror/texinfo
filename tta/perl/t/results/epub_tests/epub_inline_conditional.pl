use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'epub_inline_conditional'} = '*document_root C5
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l3 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l6 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C6
   {normal_text:Text }
   *normal_command@inlinefmt C2 l8
   |expand_index:{1}
   |format:{epub}
    *brace_arg C1
     {normal_text:epub}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:here if EPUB}
   {normal_text:.\\n}
   {normal_text:Format }
   *normal_command@inlineraw C2 l9
   |expand_index:{1}
   |format:{epub}
    *brace_arg C1
     {normal_text:epub}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:<section>raw EPUB</section>}
   {normal_text:.\\n}
';


$result_texis{'epub_inline_conditional'} = '
@node Top
@top top

@node chapter
@chapter Chap

Text @inlinefmt{epub, here if EPUB}.
Format @inlineraw{epub, <section>raw EPUB</section>}.
';


$result_texts{'epub_inline_conditional'} = 'top
***

1 Chap
******

Text here if EPUB.
Format <section>raw EPUB</section>.
';

$result_errors{'epub_inline_conditional'} = '';

$result_nodes_list{'epub_inline_conditional'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'epub_inline_conditional'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'epub_inline_conditional'} = 'level: -1
list:
 1|top
';

$result_headings_list{'epub_inline_conditional'} = '';

1;
