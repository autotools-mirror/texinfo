use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_empty_line_after_section'} = '*document_root C5
 *before_node_section C2
  *preamble
  *paragraph C1
   {normal_text:Text\\n}
 *normal_command@top C3 l2 {top}
 |identifier:{Top}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Other text\\n}
  {empty_line:\\n}
 *normal_command@chapter C4 l5 {chap}
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:comment}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Para\\n}
   *normal_command@comment C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:c}
     {spaces_after_argument:\\n}
 *normal_command@section C4 l10 {sec}
 |identifier:{sec}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
  *paragraph C2
   *normal_command@uref C1 l11
    *brace_arg C1
     {normal_text:url}
   {normal_text: A.\\n}
  {empty_line:\\n}
  *normal_command@sp C1 l13
  |misc_args:A{3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:3}
    {spaces_after_argument:\\n}
 *normal_command@section C5 l14 {after sp}
 |identifier:{after-sp}
 |is_target:{1}
 |section_heading_number:{1.2}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:after sp}
    {spaces_after_argument:\\n}
  *normal_command@indent l15
  {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |indent:{1}
   {normal_text:Para indented.\\n}
  {empty_line:\\n}
';


$result_texis{'no_empty_line_after_section'} = 'Text
@top top
Other text

@chapter chap
@c comment

Para
@comment c
@section sec
@uref{url} A.

@sp 3
@section after sp
@indent
Para indented.

';


$result_texts{'no_empty_line_after_section'} = 'Text
top
***
Other text

1 chap
******

Para
1.1 sec
=======
url A.




1.2 after sp
============
Para indented.

';

$result_errors{'no_empty_line_after_section'} = '';

$result_nodes_list{'no_empty_line_after_section'} = '';

$result_sections_list{'no_empty_line_after_section'} = '1|top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|sec
  2|after sp
3|sec
 section_directions:
  next->after sp
  up->chap
4|after sp
 section_directions:
  prev->sec
  up->chap
';

$result_sectioning_root{'no_empty_line_after_section'} = 'level: -1
list:
 1|top
';

$result_headings_list{'no_empty_line_after_section'} = '';


$result_converted{'plaintext'}->{'no_empty_line_after_section'} = 'Text

top
***

Other text

1 chap
******

Para

1.1 sec
=======

<url> A.




1.2 after sp
============

   Para indented.

';

1;
