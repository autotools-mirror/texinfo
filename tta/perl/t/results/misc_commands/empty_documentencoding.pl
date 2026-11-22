use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_documentencoding'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@documentencoding C1 l1
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:   \\n}
';


$result_texis{'empty_documentencoding'} = '@documentencoding   
';


$result_texts{'empty_documentencoding'} = '';

$result_errors{'empty_documentencoding'} = '* W l1|@documentencoding missing argument
 warning: @documentencoding missing argument

';

$result_nodes_list{'empty_documentencoding'} = '';

$result_sections_list{'empty_documentencoding'} = '';

$result_sectioning_root{'empty_documentencoding'} = '';

$result_headings_list{'empty_documentencoding'} = '';

1;
