use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accent_command_punctuation'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *@dotaccent C1 l1
    *brace_container C1
     {normal_text:e}
   {normal_text: after}
';


$result_texis{'accent_command_punctuation'} = '@dotaccent{e} after';


$result_texts{'accent_command_punctuation'} = 'e. after';

$result_errors{'accent_command_punctuation'} = '';

$result_nodes_list{'accent_command_punctuation'} = '';

$result_sections_list{'accent_command_punctuation'} = '';

$result_sectioning_root{'accent_command_punctuation'} = '';

$result_headings_list{'accent_command_punctuation'} = '';


$result_converted{'plaintext'}->{'accent_command_punctuation'} = 'ė after
';

1;
