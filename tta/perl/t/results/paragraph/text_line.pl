use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_line'} = '*document_root C1
 *before_node_section C4
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *paragraph C1
   {normal_text:text\\n}
  {empty_line:\\n}
';


$result_texis{'text_line'} = '
text

';


$result_texts{'text_line'} = 'text

';

$result_errors{'text_line'} = '';

$result_nodes_list{'text_line'} = '';

$result_sections_list{'text_line'} = '';

$result_sectioning_root{'text_line'} = '';

$result_headings_list{'text_line'} = '';


$result_converted{'plaintext'}->{'text_line'} = 'text

';


$result_converted{'html_text'}->{'text_line'} = '<p>text
</p>
';

1;
