use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sectioning_test_ref'} = '*document_root C9
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
 *normal_command@top C4 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In T.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l7 {Chap1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In c1.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {sec}
 |identifier:{sec}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
 *normal_command@section C4 l12 {sec1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In s1.1.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {chap2}
 |identifier:{chap2}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l17 {Chap2}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In c2.\\n}
';


$result_texis{'sectioning_test_ref'} = '@node Top
@top top

In T.

@node chap
@chapter Chap1

In c1.

@node sec
@section sec1

In s1.1.

@node chap2
@chapter Chap2

In c2.
';


$result_texts{'sectioning_test_ref'} = 'top
***

In T.

1 Chap1
*******

In c1.

1.1 sec1
========

In s1.1.

2 Chap2
*******

In c2.
';

$result_errors{'sectioning_test_ref'} = '';

$result_nodes_list{'sectioning_test_ref'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap1
 associated_title_command: 1 Chap1
 node_directions:
  next->chap2
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 sec1
 associated_title_command: 1.1 sec1
 node_directions:
  up->chap
4|chap2
 associated_section: 2 Chap2
 associated_title_command: 2 Chap2
 node_directions:
  prev->chap
  up->Top
';

$result_sections_list{'sectioning_test_ref'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap1
 section_children:
  1|Chap1
  2|Chap2
2|Chap1
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->Chap2
  up->top
 toplevel_directions:
  next->Chap2
  prev->top
  up->top
 section_children:
  1|sec1
3|sec1
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chap1
4|Chap2
 associated_anchor_command: chap2
 associated_node: chap2
 section_directions:
  prev->Chap1
  up->top
 toplevel_directions:
  prev->Chap1
  up->top
';

$result_sectioning_root{'sectioning_test_ref'} = 'level: -1
list:
 1|top
';

$result_headings_list{'sectioning_test_ref'} = '';


$result_converted{'xml'}->{'sectioning_test_ref'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<para>In T.
</para>
</top>
<node identifier="chap"><nodename> chap</nodename><nodenext automatic="on"> chap2</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap1</sectiontitle>

<para>In c1.
</para>
<node identifier="sec"><nodename> sec</nodename><nodeup automatic="on"> chap</nodeup></node>
<section><sectiontitle> sec1</sectiontitle>

<para>In s1.1.
</para>
</section>
</chapter>
<node identifier="chap2"><nodename> chap2</nodename><nodeprev automatic="on"> chap</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap2</sectiontitle>

<para>In c2.
</para></chapter>
';

1;
