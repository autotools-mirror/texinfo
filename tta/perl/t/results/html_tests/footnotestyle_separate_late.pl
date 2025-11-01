use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnotestyle_separate_late'} = 'U0 unit{N:Top}{s:top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
NodeNext: [U1]
NodeForward: [U1]
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
U1 unit{N:chap f}{s:1 Chapter f}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastForward: [U2]
FastBack: [U0]
Next: [U2]
Up: [U0]
NodeNext: [U2]
NodePrev: [U0]
NodeUp: [U0]
NodeForward: [U2]
NodeBack: [U0]
 *@node C1 l4 {chap f}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-f}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap f}
 *@chapter C4 l5 {Chapter f}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter f}
  {empty_line:\\n}
  *paragraph C2
   *@footnote C1 l7
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {in fchap 1}
   {\\n}
  {empty_line:\\n}
U2 unit{N:chap s}{s:2 Chapter s}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
Prev: [U1]
Up: [U0]
NodePrev: [U1]
NodeUp: [U0]
NodeBack: [U1]
 *@node C1 l9 {chap s}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{chap-s}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap s}
 *@chapter C5 l10 {Chapter s}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter s}
  {empty_line:\\n}
  *paragraph C2
   *@footnote C1 l12
   |EXTRA
   |global_command_number:{2}
    *brace_command_context C1
     *paragraph C1
      {in fchap 2}
   {\\n}
  {empty_line:\\n}
  *@footnotestyle C1 l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{separate}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {separate}
';


$result_texis{'footnotestyle_separate_late'} = '@node Top
@top top

@node chap f
@chapter Chapter f

@footnote{in fchap 1}

@node chap s
@chapter Chapter s

@footnote{in fchap 2}

@footnotestyle separate
';


$result_texts{'footnotestyle_separate_late'} = 'top
***

1 Chapter f
***********



2 Chapter s
***********



';

$result_errors{'footnotestyle_separate_late'} = '';

$result_nodes_list{'footnotestyle_separate_late'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap f
2|chap f
 associated_section: 1 Chapter f
 associated_title_command: 1 Chapter f
 node_directions:
  next->chap s
  prev->Top
  up->Top
3|chap s
 associated_section: 2 Chapter s
 associated_title_command: 2 Chapter s
 node_directions:
  prev->chap f
  up->Top
';

$result_sections_list{'footnotestyle_separate_late'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter f
 section_children:
  1|Chapter f
  2|Chapter s
2|Chapter f
 associated_anchor_command: chap f
 associated_node: chap f
 section_directions:
  next->Chapter s
  up->top
 toplevel_directions:
  next->Chapter s
  prev->top
  up->top
3|Chapter s
 associated_anchor_command: chap s
 associated_node: chap s
 section_directions:
  prev->Chapter f
  up->top
 toplevel_directions:
  prev->Chapter f
  up->top
';

$result_sectioning_root{'footnotestyle_separate_late'} = 'level: -1
list:
 1|top
';

$result_headings_list{'footnotestyle_separate_late'} = '';

1;
