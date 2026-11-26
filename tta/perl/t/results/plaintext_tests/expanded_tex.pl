use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'expanded_tex'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C3
   {normal_text:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\\n}
   *normal_command@tex C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C3
     {normal_text:TTT\\n}
     {normal_text:GGG\\n}
     {normal_text:HHH\\n}
    *normal_command@end C1 l6
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {normal_text:bbbbbbbbb1 bbbbbbbbbbb2 bbbbbbbbbb3 bbbbbbbbbbbbbb4.\\n}
';


$result_texis{'expanded_tex'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
@tex
TTT
GGG
HHH
@end tex
bbbbbbbbb1 bbbbbbbbbbb2 bbbbbbbbbb3 bbbbbbbbbbbbbb4.
';


$result_texts{'expanded_tex'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
TTT
GGG
HHH
bbbbbbbbb1 bbbbbbbbbbb2 bbbbbbbbbb3 bbbbbbbbbbbbbb4.
';

$result_errors{'expanded_tex'} = '';

$result_nodes_list{'expanded_tex'} = '';

$result_sections_list{'expanded_tex'} = '';

$result_sectioning_root{'expanded_tex'} = '';

$result_headings_list{'expanded_tex'} = '';


$result_converted{'plaintext'}->{'expanded_tex'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa TTT
GGG
HHH
bbbbbbbbb1 bbbbbbbbbbb2 bbbbbbbbbb3
bbbbbbbbbbbbbb4.
';

1;
