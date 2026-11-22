use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'fonttextsize'} = '*document_root C10
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@fonttextsize C1 l1
   |EXTRA
   |misc_args:A{10}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:10}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {section top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l7 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C2 l9 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@subsection C4 l11 {Subsection 10pts}
 |EXTRA
 |identifier:{Subsection-10pts}
 |is_target:{1}
 |section_heading_number:{1.1.1}
 |section_level:{3}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection 10pts}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:In 10pts\\n}
  {empty_line:\\n}
  *normal_command@fonttextsize C1 l14
  |EXTRA
  |misc_args:A{11}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:11}
    {spaces_after_argument:\\n}
 *normal_command@subsection C5 l15 {Subsection 11pts}
 |EXTRA
 |identifier:{Subsection-11pts}
 |is_target:{1}
 |section_heading_number:{1.1.2}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection 11pts}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In 11pts\\n}
  {empty_line:\\n}
  *normal_command@fonttextsize C1 l19
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:8}
    {spaces_after_argument:\\n}
 *normal_command@subsection C5 l20 {Subsection 8pts}
 |EXTRA
 |identifier:{Subsection-8pts}
 |is_target:{1}
 |section_heading_number:{1.1.3}
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection 8pts}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In 8pts\\n}
  {empty_line:\\n}
  *normal_command@fonttextsize C1 l24
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:15}
    {spaces_after_argument:\\n}
 *normal_command@subsection C3 l25 {Subsection 15pts}
 |EXTRA
 |identifier:{Subsection-15pts}
 |is_target:{1}
 |section_heading_number:{1.1.4}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Subsection 15pts}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In 15pts\\n}
';


$result_texis{'fonttextsize'} = '@fonttextsize 10

@node Top
@top section top

@node chapter
@chapter Chapter

@section section

@subsection Subsection 10pts
In 10pts

@fonttextsize 11
@subsection Subsection 11pts

In 11pts

@fonttextsize 8
@subsection Subsection 8pts

In 8pts

@fonttextsize 15
@subsection Subsection 15pts

In 15pts
';


$result_texts{'fonttextsize'} = '
section top
***********

1 Chapter
*********

1.1 section
===========

1.1.1 Subsection 10pts
----------------------
In 10pts

1.1.2 Subsection 11pts
----------------------

In 11pts

1.1.3 Subsection 8pts
---------------------

In 8pts

1.1.4 Subsection 15pts
----------------------

In 15pts
';

$result_errors{'fonttextsize'} = '* W l14|multiple @fonttextsize
 warning: multiple @fonttextsize

* W l19|multiple @fonttextsize
 warning: multiple @fonttextsize

* E l19|Only @fonttextsize 10 or 11 is supported, not `8\'
 Only @fonttextsize 10 or 11 is supported, not `8\'

* W l24|multiple @fonttextsize
 warning: multiple @fonttextsize

* E l24|Only @fonttextsize 10 or 11 is supported, not `15\'
 Only @fonttextsize 10 or 11 is supported, not `15\'

';

$result_nodes_list{'fonttextsize'} = '1|Top
 associated_section: section top
 associated_title_command: section top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'fonttextsize'} = '1|section top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->section top
 toplevel_directions:
  prev->section top
  up->section top
 section_children:
  1|section
3|section
 section_directions:
  up->Chapter
 section_children:
  1|Subsection 10pts
  2|Subsection 11pts
  3|Subsection 8pts
  4|Subsection 15pts
4|Subsection 10pts
 section_directions:
  next->Subsection 11pts
  up->section
5|Subsection 11pts
 section_directions:
  next->Subsection 8pts
  prev->Subsection 10pts
  up->section
6|Subsection 8pts
 section_directions:
  next->Subsection 15pts
  prev->Subsection 11pts
  up->section
7|Subsection 15pts
 section_directions:
  prev->Subsection 8pts
  up->section
';

$result_sectioning_root{'fonttextsize'} = 'level: -1
list:
 1|section top
';

$result_headings_list{'fonttextsize'} = '';


$result_converted{'latex_text'}->{'fonttextsize'} = '\\changefontsize{10}

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chapter}%

\\section{{section}}
\\label{anchor:section}%

\\subsection{{Subsection 10pts}}
\\label{anchor:Subsection-10pts}%
In 10pts

\\changefontsize{11}
\\subsection{{Subsection 11pts}}
\\label{anchor:Subsection-11pts}%

In 11pts

\\subsection{{Subsection 8pts}}
\\label{anchor:Subsection-8pts}%

In 8pts

\\subsection{{Subsection 15pts}}
\\label{anchor:Subsection-15pts}%

In 15pts
';

1;
