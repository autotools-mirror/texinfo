use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'split_punctuation_detection_in_commands'} = '*document_root C1
 *before_node_section C1
  *paragraph C8
   {Before }
   *@asis C1 l1
    *brace_container C1
     {B}
   *@asis C1 l1
    *brace_container C1
     {)}
   *@asis C1 l1
    *brace_container C1
     {.}
   {]]? Afte}
   *@strong C1 l1
    *brace_container C1
     {R}
   *@emph C1 l1
    *brace_container C1
     {"!}
   {\'? Last}
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
