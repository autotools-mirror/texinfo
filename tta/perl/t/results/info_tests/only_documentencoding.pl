use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'only_documentencoding'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@documentencoding C1 l1
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
';


$result_texis{'only_documentencoding'} = '@documentencoding ISO-8859-1';


$result_texts{'only_documentencoding'} = '';

$result_errors{'only_documentencoding'} = '';

$result_nodes_list{'only_documentencoding'} = '';

$result_sections_list{'only_documentencoding'} = '';

$result_sectioning_root{'only_documentencoding'} = '';

$result_headings_list{'only_documentencoding'} = '';


$result_converted{'info'}->{'only_documentencoding'} = Encode::encode('utf-8', 'This is , produced from .


Tag Table:

End Tag Table


Local Variables:
coding: iso-8859-1
End:
');

$result_converted_errors{'info'}->{'only_documentencoding'} = '* W |document without nodes
 warning: document without nodes

';

1;
