use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'minimal_empty_with_bye'} = '*document_root C2
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'minimal_empty_with_bye'} = '\\input texinfo.tex

@bye
';


$result_texts{'minimal_empty_with_bye'} = '';

$result_errors{'minimal_empty_with_bye'} = '';

$result_nodes_list{'minimal_empty_with_bye'} = '';

$result_sections_list{'minimal_empty_with_bye'} = '';

$result_sectioning_root{'minimal_empty_with_bye'} = '';

$result_headings_list{'minimal_empty_with_bye'} = '';

$result_converted_errors{'file_html'}->{'minimal_empty_with_bye'} = '* W minimal_empty_with_bye.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

$result_converted_errors{'file_info'}->{'minimal_empty_with_bye'} = '* W minimal_empty_with_bye.texi|document without nodes
 warning: document without nodes

';

1;
