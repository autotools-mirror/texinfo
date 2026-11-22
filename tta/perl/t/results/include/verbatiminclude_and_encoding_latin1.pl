use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verbatiminclude_and_encoding_latin1'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@documentencoding C1 l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{iso-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:iso-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@verbatiminclude C1 l3
  |EXTRA
  |input_encoding_name:{iso-8859-1}
  |text_arg:{verbatim_encoded_latin1.texi}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:verbatim_encoded_latin1.texi}
    {spaces_after_argument:\\n}
';


$result_texis{'verbatiminclude_and_encoding_latin1'} = '@documentencoding iso-8859-1

@verbatiminclude verbatim_encoded_latin1.texi
';


$result_texts{'verbatiminclude_and_encoding_latin1'} = '
';

$result_errors{'verbatiminclude_and_encoding_latin1'} = '';

$result_nodes_list{'verbatiminclude_and_encoding_latin1'} = '';

$result_sections_list{'verbatiminclude_and_encoding_latin1'} = '';

$result_sectioning_root{'verbatiminclude_and_encoding_latin1'} = '';

$result_headings_list{'verbatiminclude_and_encoding_latin1'} = '';


$result_converted{'plaintext'}->{'verbatiminclude_and_encoding_latin1'} = 'é
';

1;
