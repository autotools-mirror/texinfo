use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'undefined_node_filename'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {Top}
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
  {empty_line:\\n}
 *@node C1 l3 {chap Other}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap-Other}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap Other}
';


$result_texis{'undefined_node_filename'} = '@node Top

@node chap Other
';


$result_texts{'undefined_node_filename'} = '
';

$result_errors{'undefined_node_filename'} = '* W l3|node `chap Other\' not in menu
 warning: node `chap Other\' not in menu

';

$result_nodes_list{'undefined_node_filename'} = '1|Top
 node_directions:
  next->chap Other
2|chap Other
 node_directions:
  prev->Top
';

$result_sections_list{'undefined_node_filename'} = '';

$result_sectioning_root{'undefined_node_filename'} = '';

$result_headings_list{'undefined_node_filename'} = '';

$result_converted_errors{'file_html'}->{'undefined_node_filename'} = [
  {
    'error_line' => 'warning: user-defined node file name not set for `chap-Other.html\'
',
    'text' => 'user-defined node file name not set for `chap-Other.html\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'file_name' => 'undefined_node_filename.texi',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
