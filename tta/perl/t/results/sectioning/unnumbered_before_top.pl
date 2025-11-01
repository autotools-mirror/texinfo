use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unnumbered_before_top'} = '*document_root C3
 *before_node_section
 *@unnumbered C2 l1 {before top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {before top}
  {empty_line:\\n}
 *@top C1 l3 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
';


$result_texis{'unnumbered_before_top'} = '@unnumbered before top

@top top
';


$result_texts{'unnumbered_before_top'} = 'before top
**********

top
***
';

$result_errors{'unnumbered_before_top'} = '* W l3|lowering the section level of @top appearing after a lower element
 warning: lowering the section level of @top appearing after a lower element

';

$result_nodes_list{'unnumbered_before_top'} = '';

$result_sections_list{'unnumbered_before_top'} = '1|before top
 section_directions:
  next->top
 toplevel_directions:
  next->top
2|top
 section_directions:
  prev->before top
 toplevel_directions:
  prev->before top
';

$result_sectioning_root{'unnumbered_before_top'} = 'level: 0
list:
 1|before top
 2|top
';

$result_headings_list{'unnumbered_before_top'} = '';

1;
