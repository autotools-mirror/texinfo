use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'pagetype'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C4
   *normal_command@afourpaper C1 l1
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *normal_command@afourwide C1 l3
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l6 {section top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 l9 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@smallbook C1 l11
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:In smallbook\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:In smallbook\\n}
   *normal_command@afourpaper C1 l16
    *line_arg C1
     {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:After afourpaper\\n}
  {empty_line:\\n}
 *normal_command@chapter C3 l20 {afourpaper reset}
 |identifier:{afourpaper-reset}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:afourpaper reset}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In afourpaper reset\\n}
';


$result_texis{'pagetype'} = '@afourpaper

@afourwide

@node Top
@top section top

@node chapter
@chapter Chapter

@smallbook

 In smallbook

In smallbook
@afourpaper

After afourpaper

@chapter afourpaper reset

In afourpaper reset
';


$result_texts{'pagetype'} = '

section top
***********

1 Chapter
*********


In smallbook

In smallbook

After afourpaper

2 afourpaper reset
******************

In afourpaper reset
';

$result_errors{'pagetype'} = '* E l13|unknown command `Chapter\'
 unknown command `Chapter\'

* W l16|multiple @afourpaper
 warning: multiple @afourpaper

';

$result_nodes_list{'pagetype'} = '1|Top
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

$result_sections_list{'pagetype'} = '1|section top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|afourpaper reset
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->afourpaper reset
  up->section top
 toplevel_directions:
  next->afourpaper reset
  prev->section top
  up->section top
3|afourpaper reset
 section_directions:
  prev->Chapter
  up->section top
 toplevel_directions:
  prev->Chapter
  up->section top
';

$result_sectioning_root{'pagetype'} = 'level: -1
list:
 1|section top
';

$result_headings_list{'pagetype'} = '';


$result_converted{'latex_text'}->{'pagetype'} = '\\geometry{papername=a4paper}%

\\geometry{papername=a4paper}%

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chapter}%

\\geometry{paperheight=9.25in,paperwidth=7in}%

 In smallbook

In smallbook
\\geometry{papername=a4paper}%

After afourpaper

\\Texinfochapter{{afourpaper reset}}
\\label{anchor:afourpaper-reset}%

In afourpaper reset
';

1;
