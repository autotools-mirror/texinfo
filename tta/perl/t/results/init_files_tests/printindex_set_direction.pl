use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'printindex_set_direction'} = '*document_root C11
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
 *normal_command@node C1 l4 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l7
  |element_node:{Chapter}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:CC}
    {spaces_after_argument:\\n}
  *index_entry_command@vindex C1 l8
  |element_node:{Chapter}
  |index_entry:I{vr,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:VV}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l9
  |element_node:{Chapter}
  |index_entry:I{fn,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:FF}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {Vindex}
 |identifier:{Vindex}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Vindex}
    {spaces_after_argument:\\n}
 *normal_command@appendix C4 l12 {Vindex}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Vindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l14
  |global_command_number:{1}
  |misc_args:A{vr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:vr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {Cindex}
 |identifier:{Cindex}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cindex}
    {spaces_after_argument:\\n}
 *normal_command@appendix C4 l17 {Cindex}
 |section_heading_number:{B}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Cindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l19
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l21 {Findex}
 |identifier:{Findex}
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Findex}
    {spaces_after_argument:\\n}
 *normal_command@appendix C3 l22 {Findex}
 |section_heading_number:{C}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Findex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l24
  |global_command_number:{3}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'printindex_set_direction'} = '@node Top
@top top

@node Chapter
@chapter chap

@cindex CC
@vindex VV
@findex FF

@node Vindex
@appendix Vindex

@printindex vr

@node Cindex
@appendix Cindex

@printindex cp

@node Findex
@appendix Findex

@printindex fn
';


$result_texts{'printindex_set_direction'} = 'top
***

1 chap
******


Appendix A Vindex
*****************


Appendix B Cindex
*****************


Appendix C Findex
*****************

';

$result_errors{'printindex_set_direction'} = '';

$result_nodes_list{'printindex_set_direction'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->Chapter
2|Chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->Vindex
  prev->Top
  up->Top
3|Vindex
 associated_section: A Vindex
 associated_title_command: A Vindex
 node_directions:
  next->Cindex
  prev->Chapter
  up->Top
4|Cindex
 associated_section: B Cindex
 associated_title_command: B Cindex
 node_directions:
  next->Findex
  prev->Vindex
  up->Top
5|Findex
 associated_section: C Findex
 associated_title_command: C Findex
 node_directions:
  prev->Cindex
  up->Top
';

$result_sections_list{'printindex_set_direction'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|Vindex
  3|Cindex
  4|Findex
2|chap
 associated_anchor_command: Chapter
 associated_node: Chapter
 section_directions:
  next->Vindex
  up->top
 toplevel_directions:
  next->Vindex
  prev->top
  up->top
3|Vindex
 associated_anchor_command: Vindex
 associated_node: Vindex
 section_directions:
  next->Cindex
  prev->chap
  up->top
 toplevel_directions:
  next->Cindex
  prev->chap
  up->top
4|Cindex
 associated_anchor_command: Cindex
 associated_node: Cindex
 section_directions:
  next->Findex
  prev->Vindex
  up->top
 toplevel_directions:
  next->Findex
  prev->Vindex
  up->top
5|Findex
 associated_anchor_command: Findex
 associated_node: Findex
 section_directions:
  prev->Cindex
  up->top
 toplevel_directions:
  prev->Cindex
  up->top
';

$result_sectioning_root{'printindex_set_direction'} = 'level: -1
list:
 1|top
';

$result_headings_list{'printindex_set_direction'} = '';

$result_indices_sort_strings{'printindex_set_direction'} = 'cp:
 CC
fn:
 FF
vr:
 VV
';

$result_converted_sort_strings{'file_html'}->{'printindex_set_direction'} = 'cp:
 CC
fn:
 FF
vr:
 VV
';

$result_converted_errors{'file_html'}->{'printindex_set_direction'} = '* W |not setting an unknown direction: NewDirection
 warning: not setting an unknown direction: NewDirection

';

1;
