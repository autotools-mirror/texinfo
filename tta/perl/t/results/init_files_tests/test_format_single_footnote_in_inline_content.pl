use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_format_single_footnote_in_inline_content'} = '*document_root C5
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
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C9 l5 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:a}
   *normal_command@footnote C1 l7
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:In the footnote}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:b}
   *normal_command@footnote C1 l9
   |global_command_number:{2}
    *brace_command_context C3
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:an example in the footnote}
       {spaces_after_argument:\\n}
     {empty_line:\\n}
     *normal_command@example C3 l11
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *preformatted C1
       {normal_text:in    example\\n}
      *normal_command@end C1 l13
      |text_arg:{example}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:example}
        {spaces_after_argument:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:c}
   *normal_command@footnote C1 l16
   |global_command_number:{3}
    *brace_command_context C3
     {spaces_before_argument:\\n}
     *normal_command@*
     {normal_text:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:d}
   *normal_command@footnote C1 l20
   |global_command_number:{4}
    *brace_command_context C2
     {spaces_before_argument:\\n}
     *normal_command@quotation C4 l21
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        {normal_text:qtitle}
        {spaces_after_argument:\\n}
      *normal_command@author C1 l22
      |global_command_number:{1}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:Me}
        {spaces_after_argument:\\n}
      *paragraph C1
       {normal_text:In quotation\\n}
      *normal_command@end C1 l24
      |text_arg:{quotation}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:quotation}
        {spaces_after_argument:\\n}
   {normal_text:\\n}
';


$result_texis{'test_format_single_footnote_in_inline_content'} = '@node Top
@top top

@node chap
@chapter Chap

a@footnote{In the footnote}.

b@footnote{@c an example in the footnote

@example
in    example
@end example
}

c@footnote{
@*
}

d@footnote{
@quotation qtitle
@author Me
In quotation
@end quotation
}
';


$result_texts{'test_format_single_footnote_in_inline_content'} = 'top
***

1 Chap
******

a.

b

c

d
';

$result_errors{'test_format_single_footnote_in_inline_content'} = '';

$result_nodes_list{'test_format_single_footnote_in_inline_content'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'test_format_single_footnote_in_inline_content'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'test_format_single_footnote_in_inline_content'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_format_single_footnote_in_inline_content'} = '';

1;
