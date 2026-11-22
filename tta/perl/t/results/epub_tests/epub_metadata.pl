use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'epub_metadata'} = '*document_root C5
 *before_node_section C1
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
      {normal_text:The Title}
      {spaces_after_argument:\\n}
    *normal_command@html C3 l4
    >SOURCEMARKS
    >expanded_conditional_command<end;1>
     >*normal_command@end C1 l17
     >|text_arg:{ifepub}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifepub}
       >{spaces_after_argument:\\n}
    >ignored_conditional_block<1>
     >*normal_command@ifnotepub C5 l18
      >*arguments_line C1
       >*block_line_arg C1
        >{spaces_before_argument:\\n}
      >{raw:@html\\n}
      >{raw:<meta name="creator" content="Some Body" />\\n}
      >{raw:@end html\\n}
      >*normal_command@end C1 l22
      >|text_arg:{ifnotepub}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:ifnotepub}
        >{spaces_after_argument:\\n}
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C11
      {normal_text:   <dc:creator\\n}
      {normal_text:       id="creator">\\n}
      {normal_text:      Some Body\\n}
      {normal_text:   </dc:creator>\\n}
      {normal_text:   <meta\\n}
      {normal_text:       refines="#creator"\\n}
      {normal_text:       property="role"\\n}
      {normal_text:       scheme="marc:relators"\\n}
      {normal_text:       id="role">\\n}
      {normal_text:      aut\\n}
      {normal_text:   </meta>\\n}
     *normal_command@end C1 l16
     |text_arg:{html}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:html}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l23
    |text_arg:{documentinfo}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentinfo}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l25 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l26 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l28 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C1 l29 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
';


$result_texis{'epub_metadata'} = '@documentinfo
@title The Title
@html
   <dc:creator
       id="creator">
      Some Body
   </dc:creator>
   <meta
       refines="#creator"
       property="role"
       scheme="marc:relators"
       id="role">
      aut
   </meta>
@end html
@end documentinfo

@node Top
@top top

@node chapter
@chapter Chap
';


$result_texts{'epub_metadata'} = '
top
***

1 Chap
******
';

$result_errors{'epub_metadata'} = '';

$result_nodes_list{'epub_metadata'} = '1|Top
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

$result_sections_list{'epub_metadata'} = '1|top
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

$result_sectioning_root{'epub_metadata'} = 'level: -1
list:
 1|top
';

$result_headings_list{'epub_metadata'} = '';

1;
