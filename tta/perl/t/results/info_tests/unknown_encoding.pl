use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_encoding'} = '*document_root C2
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@documentencoding C1 l2
   |global_command_number:{1}
   |text_arg:{ggg}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ggg}
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


$result_texis{'unknown_encoding'} = '
@documentencoding ggg

@node Top

';


$result_texts{'unknown_encoding'} = '

';

$result_errors{'unknown_encoding'} = '* W l2|encoding `ggg\' is not a canonical texinfo encoding
 warning: encoding `ggg\' is not a canonical texinfo encoding

* W l2|unhandled encoding name `ggg\'
 warning: unhandled encoding name `ggg\'

';

$result_nodes_list{'unknown_encoding'} = '1|Top
';

$result_sections_list{'unknown_encoding'} = '';

$result_sectioning_root{'unknown_encoding'} = '';

$result_headings_list{'unknown_encoding'} = '';


$result_converted{'info'}->{'unknown_encoding'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
