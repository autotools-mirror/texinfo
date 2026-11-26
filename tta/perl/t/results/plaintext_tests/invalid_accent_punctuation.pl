use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'invalid_accent_punctuation'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C3
   {normal_text:a. }
   *normal_command@^ l1
   *normal_command@@
';


$result_texis{'invalid_accent_punctuation'} = 'a. @^@@';


$result_texts{'invalid_accent_punctuation'} = 'a. ^@';

$result_errors{'invalid_accent_punctuation'} = '* E l1|@^ expected braces
 @^ expected braces

';

$result_nodes_list{'invalid_accent_punctuation'} = '';

$result_sections_list{'invalid_accent_punctuation'} = '';

$result_sectioning_root{'invalid_accent_punctuation'} = '';

$result_headings_list{'invalid_accent_punctuation'} = '';


$result_converted{'plaintext'}->{'invalid_accent_punctuation'} = 'a.  ̂@
';

1;
