use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_and_punctuation'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C9
   {normal_text:SomthingA}
   *normal_command@.
   {normal_text:   and now inhibit.}
   *normal_command@:
   {normal_text: Now dots }
   *normal_command@dots C1 l1
    *brace_container
   {normal_text: and enddots }
   *normal_command@enddots C1 l1
    *brace_container
   {normal_text: and}
';


$result_texis{'commands_and_punctuation'} = 'SomthingA@.   and now inhibit.@: Now dots @dots{} and enddots @enddots{} and';


$result_texts{'commands_and_punctuation'} = 'SomthingA.   and now inhibit. Now dots ... and enddots ... and';

$result_errors{'commands_and_punctuation'} = '';

$result_nodes_list{'commands_and_punctuation'} = '';

$result_sections_list{'commands_and_punctuation'} = '';

$result_sectioning_root{'commands_and_punctuation'} = '';

$result_headings_list{'commands_and_punctuation'} = '';


$result_converted{'plaintext'}->{'commands_and_punctuation'} = 'SomthingA.  and now inhibit. Now dots ... and enddots ...  and
';

1;
