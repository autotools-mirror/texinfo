use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'pagesizes'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@pagesizes C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:200mm,150mm}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {section top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l7 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@pagesizes C1 l9
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:11.5in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C5 l11 {other pagesizes}
 |identifier:{other-pagesizes}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:other pagesizes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@pagesizes C1 l13
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:, 130mm}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@pagesizes C1 l15
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:,}
    {spaces_after_argument: \\n}
';


$result_texis{'pagesizes'} = '@pagesizes 200mm,150mm

@node Top
@top section top

@node chapter
@chapter Chapter

@pagesizes 11.5in

@chapter other pagesizes

@pagesizes , 130mm

@pagesizes , 
';


$result_texts{'pagesizes'} = '
section top
***********

1 Chapter
*********


2 other pagesizes
*****************


';

$result_errors{'pagesizes'} = '* W l9|multiple @pagesizes
 warning: multiple @pagesizes

* W l13|multiple @pagesizes
 warning: multiple @pagesizes

* W l15|multiple @pagesizes
 warning: multiple @pagesizes

';

$result_nodes_list{'pagesizes'} = '1|Top
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

$result_sections_list{'pagesizes'} = '1|section top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|other pagesizes
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->other pagesizes
  up->section top
 toplevel_directions:
  next->other pagesizes
  prev->section top
  up->section top
3|other pagesizes
 section_directions:
  prev->Chapter
  up->section top
 toplevel_directions:
  prev->Chapter
  up->section top
';

$result_sectioning_root{'pagesizes'} = 'level: -1
list:
 1|section top
';

$result_headings_list{'pagesizes'} = '';


$result_converted{'latex_text'}->{'pagesizes'} = '\\newgeometry{textheight=200mm,textwidth=150mm}

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chapter}%

\\newgeometry{textheight=11.5in}

\\Texinfochapter{{other pagesizes}}
\\label{anchor:other-pagesizes}%

\\newgeometry{textwidth=130mm}

';

1;
