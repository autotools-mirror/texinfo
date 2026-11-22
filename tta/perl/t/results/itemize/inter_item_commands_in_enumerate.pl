use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inter_item_commands_in_enumerate'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C14 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    {empty_line:\\n}
    *@comment C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment before first item in enumerate}
      {spaces_after_argument:\\n}
   *@item C2 l10
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:e--numerate\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l13
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C3
    {empty_line:\\n}
    *index_entry_command@cindex C1 l15
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index inter in enumerate between lines}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *@item C2 l17
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enumerate item\\n}
   *@end C1 l18
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    {empty_line:\\n}
    *index_entry_command@cindex C1 l22
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index inter in enumerate after line}
      {spaces_after_argument:\\n}
   *@item C2 l23
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enumerate item\\n}
   *@end C1 l24
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 l27
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,3}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index inter in enumerate before line}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *@item C2 l29
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enumerate item\\n}
   *@end C1 l30
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    *paragraph C2
     {normal_text:Title\\n}
     *index_entry_command@cindex C1 l34
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex}
       {spaces_after_argument:\\n}
   *@item C2 l35
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enum\\n}
   *@end C1 l36
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 l38
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C4
    *index_entry_command@cindex C1 l39
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,5}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:first idx}
      {spaces_after_argument:\\n}
    *@comment C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 l41
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,6}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:sedond idx}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 l42
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,7}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:another}
      {spaces_after_argument:\\n}
   *@item C2 l43
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enum\\n}
   *@end C1 l44
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'inter_item_commands_in_enumerate'} = '@node Top
@top top

@node chapter
@chapter chap

@enumerate

@comment comment before first item in enumerate
@item e--numerate
@end enumerate

@enumerate

@cindex index inter in enumerate between lines

@item enumerate item
@end enumerate

@enumerate

@cindex index inter in enumerate after line
@item enumerate item
@end enumerate

@enumerate
@cindex index inter in enumerate before line

@item enumerate item
@end enumerate

@enumerate
Title
@cindex cindex
@item enum
@end enumerate

@enumerate
@cindex first idx
@comment comment
@cindex sedond idx
@cindex another
@item enum
@end enumerate

';


$result_texts{'inter_item_commands_in_enumerate'} = 'top
***

1 chap
******


1. e-numerate



1. enumerate item


1. enumerate item


1. enumerate item

Title
1. enum

1. enum

';

$result_errors{'inter_item_commands_in_enumerate'} = '';

$result_nodes_list{'inter_item_commands_in_enumerate'} = '1|Top
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

$result_sections_list{'inter_item_commands_in_enumerate'} = '1|top
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

$result_sectioning_root{'inter_item_commands_in_enumerate'} = 'level: -1
list:
 1|top
';

$result_headings_list{'inter_item_commands_in_enumerate'} = '';

$result_indices_sort_strings{'inter_item_commands_in_enumerate'} = 'cp:
 another
 cindex
 first idx
 index inter in enumerate after line
 index inter in enumerate before line
 index inter in enumerate between lines
 sedond idx
';


$result_converted{'plaintext'}->{'inter_item_commands_in_enumerate'} = 'top
***

1 chap
******

  1. e-numerate

  1. enumerate item

  1. enumerate item

  1. enumerate item

     Title
  1. enum

  1. enum

';

$result_converted_sort_strings{'plaintext'}->{'inter_item_commands_in_enumerate'} = 'cp:
 another
 cindex
 first idx
 index inter in enumerate after line
 index inter in enumerate before line
 index inter in enumerate between lines
 sedond idx
';


$result_converted{'html_text'}->{'inter_item_commands_in_enumerate'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<ol class="enumerate">
<li> e&ndash;numerate
</li></ol>

<ol class="enumerate">
<li>
<a class="index-entry-id" id="index-index-inter-in-enumerate-between-lines"></a>

</li><li> enumerate item
</li></ol>

<ol class="enumerate">
<li>
<a class="index-entry-id" id="index-index-inter-in-enumerate-after-line"></a>
</li><li> enumerate item
</li></ol>

<ol class="enumerate">
<li><a class="index-entry-id" id="index-index-inter-in-enumerate-before-line"></a>

</li><li> enumerate item
</li></ol>

<ol class="enumerate">
<li>Title
<a class="index-entry-id" id="index-cindex"></a>
</li><li> enum
</li></ol>

<ol class="enumerate">
<li><a class="index-entry-id" id="index-first-idx"></a>
<a class="index-entry-id" id="index-sedond-idx"></a>
<a class="index-entry-id" id="index-another"></a>
</li><li> enum
</li></ol>

</div>
</div>
';

1;
