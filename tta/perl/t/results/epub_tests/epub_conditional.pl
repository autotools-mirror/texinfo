use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'epub_conditional'} = '*document_root C5
 *before_node_section C3
  *preamble_before_content C2
   *normal_command@documentinfo C4 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@title C1 l2
    >SOURCEMARKS
    >expanded_conditional_command<start;1>
     >*normal_command@ifepub C1 l3
      >*arguments_line C1
       >*block_line_arg C1
        >{spaces_before_argument:\\n}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:title}
      {spaces_after_argument:\\n}
    *normal_command@subtitle C1 l4
    |EXTRA
    |global_command_number:{1}
    >SOURCEMARKS
    >expanded_conditional_command<end;1>
     >*normal_command@end C1 l5
     >|EXTRA
     >|text_arg:{ifepub}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifepub}
       >{spaces_after_argument:\\n}
    >ignored_conditional_block<1>
     >*normal_command@ifnotepub C3 l6
      >*arguments_line C1
       >*block_line_arg C1
        >{spaces_before_argument:\\n}
      >{raw:@subtitle Online\\n}
      >*normal_command@end C1 l8
      >|EXTRA
      >|text_arg:{ifnotepub}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:ifnotepub}
        >{spaces_after_argument:\\n}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:A book}
      {spaces_after_argument:\\n}
    *normal_command@end C1 l9
    |EXTRA
    |text_arg:{documentinfo}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentinfo}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@maketitle C1 l11
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l14 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 l17 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*normal_command@ifepub C1 l19
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *normal_command@html C3 l20
  >SOURCEMARKS
  >expanded_conditional_command<end;2>
   >*normal_command@end C1 l23
   >|EXTRA
   >|text_arg:{ifepub}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifepub}
     >{spaces_after_argument:\\n}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *rawpreformatted C1
    {normal_text:<section role="doc-part" aria-labelledby="p1">\\n}
   *normal_command@end C1 l22
   |EXTRA
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Some content\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;3><p:1>
   >*normal_command@ifepub C1 l27
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *normal_command@html C3 l28
  >SOURCEMARKS
  >expanded_conditional_command<end;3>
   >*normal_command@end C1 l31
   >|EXTRA
   >|text_arg:{ifepub}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:ifepub}
     >{spaces_after_argument:\\n}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *rawpreformatted C1
    {normal_text:</section>\\n}
   *normal_command@end C1 l30
   |EXTRA
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument:\\n}
';


$result_texis{'epub_conditional'} = '@documentinfo
@title title
@subtitle A book
@end documentinfo

@maketitle

@node Top
@top top

@node chapter
@chapter Chap

@html
<section role="doc-part" aria-labelledby="p1">
@end html

Some content

@html
</section>
@end html
';


$result_texts{'epub_conditional'} = '

top
***

1 Chap
******

<section role="doc-part" aria-labelledby="p1">

Some content

</section>
';

$result_errors{'epub_conditional'} = '';

$result_nodes_list{'epub_conditional'} = '1|Top
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

$result_sections_list{'epub_conditional'} = '1|top
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

$result_sectioning_root{'epub_conditional'} = 'level: -1
list:
 1|top
';

$result_headings_list{'epub_conditional'} = '';

1;
