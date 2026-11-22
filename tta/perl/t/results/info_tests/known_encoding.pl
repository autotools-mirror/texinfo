use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'known_encoding'} = '*document_root C2
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@documentencoding C1 l2
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{latin1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:latin1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C2 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'known_encoding'} = '
@documentencoding latin1

@node Top

';


$result_texts{'known_encoding'} = '

';

$result_errors{'known_encoding'} = '* W l2|encoding `latin1\' is not a canonical texinfo encoding
 warning: encoding `latin1\' is not a canonical texinfo encoding

';

$result_nodes_list{'known_encoding'} = '1|Top
';

$result_sections_list{'known_encoding'} = '';

$result_sectioning_root{'known_encoding'} = '';

$result_headings_list{'known_encoding'} = '';


$result_converted{'info'}->{'known_encoding'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: iso-8859-1
End:
');

1;
