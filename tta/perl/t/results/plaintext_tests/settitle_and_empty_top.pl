use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'settitle_and_empty_top'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content C2
   *@settitle C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Title}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@top C2 l3
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'settitle_and_empty_top'} = '@settitle Title

@top

';


$result_texts{'settitle_and_empty_top'} = '

';

$result_errors{'settitle_and_empty_top'} = '';

$result_nodes_list{'settitle_and_empty_top'} = '';

$result_sections_list{'settitle_and_empty_top'} = '1
';

$result_sectioning_root{'settitle_and_empty_top'} = 'level: -1
list:
 1|
';

$result_headings_list{'settitle_and_empty_top'} = '';


$result_converted{'plaintext'}->{'settitle_and_empty_top'} = 'Title
*****

';

1;
