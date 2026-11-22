use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'split_punctuation_detection_in_commands'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C8
   {normal_text:Before }
   *normal_command@asis C1 l1
    *brace_container C1
     {normal_text:B}
   *normal_command@asis C1 l1
    *brace_container C1
     {normal_text:)}
   *normal_command@asis C1 l1
    *brace_container C1
     {normal_text:.}
   {normal_text:]]? Afte}
   *normal_command@strong C1 l1
    *brace_container C1
     {normal_text:R}
   *normal_command@emph C1 l1
    *brace_container C1
     {normal_text:"!}
   {normal_text:\'? Last}
';


$result_texis{'split_punctuation_detection_in_commands'} = 'Before @asis{B}@asis{)}@asis{.}]]? Afte@strong{R}@emph{"!}\'? Last';


$result_texts{'split_punctuation_detection_in_commands'} = 'Before B).]]? AfteR"!\'? Last';

$result_errors{'split_punctuation_detection_in_commands'} = '';

$result_nodes_list{'split_punctuation_detection_in_commands'} = '';

$result_sections_list{'split_punctuation_detection_in_commands'} = '';

$result_sectioning_root{'split_punctuation_detection_in_commands'} = '';

$result_headings_list{'split_punctuation_detection_in_commands'} = '';


$result_converted{'plaintext'}->{'split_punctuation_detection_in_commands'} = 'Before B).]]? Afte*R*_"!_\'? Last
';

1;
