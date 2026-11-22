use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'after_punctuation_character_in_command'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C3
   {normal_text:Text.}
   *@asis C1 l1
    *brace_container C2
     {normal_text:)\\n}
     {normal_text:follows}
   {normal_text:.\\n}
';


$result_texis{'after_punctuation_character_in_command'} = 'Text.@asis{)
follows}.
';


$result_texts{'after_punctuation_character_in_command'} = 'Text.)
follows.
';

$result_errors{'after_punctuation_character_in_command'} = '';

$result_nodes_list{'after_punctuation_character_in_command'} = '';

$result_sections_list{'after_punctuation_character_in_command'} = '';

$result_sectioning_root{'after_punctuation_character_in_command'} = '';

$result_headings_list{'after_punctuation_character_in_command'} = '';


$result_converted{'plaintext'}->{'after_punctuation_character_in_command'} = 'Text.)  follows.
';

1;
