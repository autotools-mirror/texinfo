use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'before_accent_punctuation'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C2
   {normal_text:a. }
   *normal_command@^ C1 l1
    *following_arg C1
     {normal_text:a}
';


$result_texis{'before_accent_punctuation'} = 'a. @^a';


$result_texts{'before_accent_punctuation'} = 'a. a^';

$result_errors{'before_accent_punctuation'} = '';

$result_nodes_list{'before_accent_punctuation'} = '';

$result_sections_list{'before_accent_punctuation'} = '';

$result_sectioning_root{'before_accent_punctuation'} = '';

$result_headings_list{'before_accent_punctuation'} = '';


$result_converted{'plaintext'}->{'before_accent_punctuation'} = 'a.  â
';

1;
