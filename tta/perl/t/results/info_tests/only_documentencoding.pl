use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'only_documentencoding'} = '*document_root C1
 *before_node_section C1
  *@documentencoding C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{iso-8859-1}
  |text_arg:{ISO-8859-1}
   *line_arg C1
    {ISO-8859-1}
';


$result_texis{'only_documentencoding'} = '@documentencoding ISO-8859-1';


$result_texts{'only_documentencoding'} = '';

$result_errors{'only_documentencoding'} = '';

$result_nodes_list{'only_documentencoding'} = '';

$result_sections_list{'only_documentencoding'} = '';

$result_sectioning_root{'only_documentencoding'} = '';

$result_headings_list{'only_documentencoding'} = '';


$result_converted{'info'}->{'only_documentencoding'} = 'This is , produced from .


Tag Table:

End Tag Table


Local Variables:
coding: iso-8859-1
End:
';

$result_converted_errors{'info'}->{'only_documentencoding'} = [
  {
    'error_line' => 'warning: document without nodes
',
    'text' => 'document without nodes',
    'type' => 'warning'
  }
];


1;
