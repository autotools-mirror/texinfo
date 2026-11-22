use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inter_item_commands_in_itemize'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 l7
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@minus l7
     {spaces_after_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment in itemize}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 l9
    |element_node:{chapter}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:also a cindex in itemize}
      {spaces_after_argument:\\n}
   *normal_command@item C2 l10
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:e--mph item\\n}
   *normal_command@end C1 l11
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C5 l13
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet l13
     {spaces_after_argument:\\n}
   *before_item C1
    *index_entry_command@cindex C1 l14
    |element_node:{chapter}
    |index_entry:I{cp,2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index entry within itemize}
      {spaces_after_argument:\\n}
   *normal_command@item C2 l15
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:i--tem 1\\n}
   *normal_command@item C3 l16
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *index_entry_command@cindex C1 l16
    |element_node:{chapter}
    |index_entry:I{cp,3}
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:index entry right after }
      *normal_command@@
      {normal_text:item}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:i--tem 2\\n}
   *normal_command@end C1 l18
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment in itemize}
      {spaces_after_argument:\\n}
    *paragraph C2
     {normal_text:T--ext before items.\\n}
     *index_entry_command@cindex C1 l23
     |element_node:{chapter}
     |index_entry:I{cp,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:also a cindex in itemize}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l24
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:bullet item\\n}
   *normal_command@end C1 l25
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'inter_item_commands_in_itemize'} = '@node Top
@top top

@node chapter
@chapter chap

@itemize @minus
@c comment in itemize
@cindex also a cindex in itemize
@item e--mph item
@end itemize

@itemize @bullet
@cindex index entry within itemize
@item i--tem 1
@item @cindex index entry right after @@item
i--tem 2
@end itemize

@itemize
@c comment in itemize
T--ext before items.
@cindex also a cindex in itemize
@item bullet item
@end itemize
';


$result_texts{'inter_item_commands_in_itemize'} = 'top
***

1 chap
******

e-mph item

i-tem 1
i-tem 2

T-ext before items.
bullet item
';

$result_errors{'inter_item_commands_in_itemize'} = '* W l16|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

';

$result_nodes_list{'inter_item_commands_in_itemize'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'inter_item_commands_in_itemize'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'inter_item_commands_in_itemize'} = 'level: -1
list:
 1|top
';

$result_headings_list{'inter_item_commands_in_itemize'} = '';

$result_indices_sort_strings{'inter_item_commands_in_itemize'} = 'cp:
 also a cindex in itemize
 also a cindex in itemize
 index entry right after @item
 index entry within itemize
';


$result_converted{'plaintext'}->{'inter_item_commands_in_itemize'} = 'top
***

1 chap
******

   − e-mph item

   • i-tem 1
   • i-tem 2

     T-ext before items.
   • bullet item
';

$result_converted_sort_strings{'plaintext'}->{'inter_item_commands_in_itemize'} = 'cp:
 also a cindex in itemize
 also a cindex in itemize
 index entry right after @item
 index entry within itemize
';


$result_converted{'html_text'}->{'inter_item_commands_in_itemize'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<ul class="itemize mark-minus">
<li><a class="index-entry-id" id="index-also-a-cindex-in-itemize"></a>
</li><li>e&ndash;mph item
</li></ul>

<ul class="itemize mark-bullet">
<li><a class="index-entry-id" id="index-index-entry-within-itemize"></a>
</li><li>i&ndash;tem 1
</li><li><a class="index-entry-id" id="index-index-entry-right-after-_0040item"></a>
i&ndash;tem 2
</li></ul>

<ul class="itemize mark-bullet">
<li>T&ndash;ext before items.
<a class="index-entry-id" id="index-also-a-cindex-in-itemize-1"></a>
</li><li>bullet item
</li></ul>
</div>
</div>
';

1;
