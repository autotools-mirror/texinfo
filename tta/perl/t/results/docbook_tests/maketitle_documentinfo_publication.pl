use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'maketitle_documentinfo_publication'} = '*document_root C8
 *before_node_section C4
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C8
   *normal_command@publication C3 maketitle_documentinfo_publication.texi:l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:C\'est toto\\n}
    *normal_command@end C1 maketitle_documentinfo_publication.texi:l4
    |text_arg:{publication}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:publication}
      {spaces_after_argument:\\n}
   {empty_line: \\n}
   *normal_command@documentinfo C8 maketitle_documentinfo_publication.texi:l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@author C1 maketitle_documentinfo_publication.texi:l7
    |global_command_number:{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:SOme ONe}
      {spaces_after_argument:\\n}
    *normal_command@title C1 maketitle_documentinfo_publication.texi:l8
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:TTT}
      {spaces_after_argument:\\n}
    *normal_command@author C1 maketitle_documentinfo_publication.texi:l9
    |global_command_number:{2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:Gàther Person}
      {spaces_after_argument:\\n}
    *normal_command@subtitle C1 maketitle_documentinfo_publication.texi:l10
    |global_command_number:{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ST1}
      {spaces_after_argument:\\n}
    *normal_command@subtitle C1 maketitle_documentinfo_publication.texi:l11
    |global_command_number:{2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ST2}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:Toto\\n}
    *normal_command@end C1 maketitle_documentinfo_publication.texi:l13
    |text_arg:{documentinfo}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentinfo}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C3 maketitle_documentinfo_publication.texi:l15
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:You shoukd\\n}
    *normal_command@end C1 maketitle_documentinfo_publication.texi:l17
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@contents C1 maketitle_documentinfo_publication.texi:l19
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line: \\n}
  *normal_command@maketitle C1 maketitle_documentinfo_publication.texi:l21
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 maketitle_documentinfo_publication.texi:l23 {top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 maketitle_documentinfo_publication.texi:l24 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line: \\n}
  *paragraph C1
   {normal_text:aaa\\n}
  {empty_line: \\n}
 *normal_command@node C1 maketitle_documentinfo_publication.texi:l28 {chùpter}
 |identifier:{ch_00f9pter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chùpter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 maketitle_documentinfo_publication.texi:l29 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line: \\n}
 *normal_command@node C1 maketitle_documentinfo_publication.texi:l31 {section}
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *normal_command@section C2 maketitle_documentinfo_publication.texi:l32 {Sec}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'maketitle_documentinfo_publication'} = '
@publication
C\'est toto
@end publication
 
@documentinfo
@author SOme ONe
@title TTT
@author Gàther Person
@subtitle ST1
@subtitle ST2
Toto
@end documentinfo

@copying
You shoukd
@end copying

@contents
 
@maketitle

@node top
@top top
 
aaa
 
@node chùpter
@chapter chap
 
@node section
@section Sec

@bye
';


$result_texts{'maketitle_documentinfo_publication'} = ' 


 

top
***
 
aaa
 
1 chap
******
 
1.1 Sec
=======

';

$result_errors{'maketitle_documentinfo_publication'} = '';

$result_nodes_list{'maketitle_documentinfo_publication'} = '1|top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chùpter
2|chùpter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->top
  up->top
3|section
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->chùpter
';

$result_sections_list{'maketitle_documentinfo_publication'} = '1|top
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chùpter
 associated_node: chùpter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->chap
';

$result_sectioning_root{'maketitle_documentinfo_publication'} = 'level: -1
list:
 1|top
';

$result_headings_list{'maketitle_documentinfo_publication'} = '';


$result_converted{'docbook_doc'}->{'maketitle_documentinfo_publication'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>TTT</title>
<subtitle>ST1
ST2</subtitle>
<bookinfo><title>TTT</title>
<subtitle>ST1
ST2</subtitle>
<authorgroup>
<collab><collabname>SOme ONe</collabname></collab>
<collab><collabname>Gàther Person</collabname></collab>
</authorgroup>
<legalnotice><para>You shoukd
</para></legalnotice><para>Toto
</para></bookinfo>
<chapter label="1" id="ch_00f9pter">
<title>chap</title>
 
<sect1 label="1.1" id="section">
<title>Sec</title>

</sect1>
</chapter>
</book>
';

1;
