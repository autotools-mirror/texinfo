use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentencoding_zero'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@documentencoding C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{0}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:0}
     {spaces_after_argument:\\n}
';


$result_texis{'documentencoding_zero'} = '@documentencoding 0
';


$result_texts{'documentencoding_zero'} = '';

$result_errors{'documentencoding_zero'} = '* W l1|encoding `0\' is not a canonical texinfo encoding
 warning: encoding `0\' is not a canonical texinfo encoding

* W l1|unhandled encoding name `0\'
 warning: unhandled encoding name `0\'

';

$result_nodes_list{'documentencoding_zero'} = '';

$result_sections_list{'documentencoding_zero'} = '';

$result_sectioning_root{'documentencoding_zero'} = '';

$result_headings_list{'documentencoding_zero'} = '';

1;
