use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_before_and_after_bye'} = '*document_root C3
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   {normal_text:Before bye }
 *@bye C1
  *line_arg C3
   {spaces_before_argument: }
   {rawline_text:on bye line}
   {spaces_after_argument:\\n}
 *postamble_after_end C2
  {text_after_end:\\n}
  {text_after_end:after bye\\n}
';


$result_texis{'text_before_and_after_bye'} = 'Before bye @bye on bye line

after bye
';


$result_texts{'text_before_and_after_bye'} = 'Before bye ';

$result_errors{'text_before_and_after_bye'} = '* W l1|@bye should only appear at the beginning of a line
 warning: @bye should only appear at the beginning of a line

* W l1|remaining argument on @bye line: on bye line
 warning: remaining argument on @bye line: on bye line

';

$result_nodes_list{'text_before_and_after_bye'} = '';

$result_sections_list{'text_before_and_after_bye'} = '';

$result_sectioning_root{'text_before_and_after_bye'} = '';

$result_headings_list{'text_before_and_after_bye'} = '';

1;
