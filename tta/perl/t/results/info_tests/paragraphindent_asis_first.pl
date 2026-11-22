use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraphindent_asis_first'} = '*document_root C1
 *before_node_section C7
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C1
   {spaces_before_paragraph:     }
  *paragraph C1
   {normal_text:bbb\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l4
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{asis}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:asis}
    {spaces_after_argument:\\n}
  {spaces_before_paragraph:     }
  *paragraph C1
   {normal_text:ccc\\n}
';


$result_texis{'paragraphindent_asis_first'} = '
     bbb

@paragraphindent asis
     ccc
';


$result_texts{'paragraphindent_asis_first'} = 'bbb

ccc
';

$result_errors{'paragraphindent_asis_first'} = '';

$result_nodes_list{'paragraphindent_asis_first'} = '';

$result_sections_list{'paragraphindent_asis_first'} = '';

$result_sectioning_root{'paragraphindent_asis_first'} = '';

$result_headings_list{'paragraphindent_asis_first'} = '';


$result_converted{'info'}->{'paragraphindent_asis_first'} = Encode::encode('utf-8', 'This is , produced from .

bbb

     ccc

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'paragraphindent_asis_first'} = '* W |document without nodes
 warning: document without nodes

';

1;
