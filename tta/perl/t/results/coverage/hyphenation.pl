use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'hyphenation'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *normal_command@hyphenation C1 l2
   |global_command_number:{1}
    *brace_arg C2
     {normal_text:some-where}
     {spaces_after_argument: }
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
';


$result_texis{'hyphenation'} = '
@hyphenation{some-where }

';


$result_texts{'hyphenation'} = '
';

$result_errors{'hyphenation'} = '';

$result_nodes_list{'hyphenation'} = '';

$result_sections_list{'hyphenation'} = '';

$result_sectioning_root{'hyphenation'} = '';

$result_headings_list{'hyphenation'} = '';


$result_converted{'plaintext'}->{'hyphenation'} = '';


$result_converted{'html_text'}->{'hyphenation'} = '
';


$result_converted{'xml'}->{'hyphenation'} = '<preamblebeforebeginning>
</preamblebeforebeginning><hyphenation>some-where </hyphenation>

';


$result_converted{'latex_text'}->{'hyphenation'} = '\\hyphenation{some-where}
\\begin{document}
';


$result_converted{'docbook'}->{'hyphenation'} = '
';

1;
