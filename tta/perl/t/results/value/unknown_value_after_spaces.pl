use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_value_after_spaces'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C1
   {spaces_before_paragraph:  }
  *@value C1
   *brace_container C1
    {normal_text:unknown}
  {normal_text:  }
';


$result_texis{'unknown_value_after_spaces'} = '  @value{unknown}  ';


$result_texts{'unknown_value_after_spaces'} = 'unknown  ';

$result_errors{'unknown_value_after_spaces'} = '* W l1|undefined flag: unknown
 warning: undefined flag: unknown

';

$result_nodes_list{'unknown_value_after_spaces'} = '';

$result_sections_list{'unknown_value_after_spaces'} = '';

$result_sectioning_root{'unknown_value_after_spaces'} = '';

$result_headings_list{'unknown_value_after_spaces'} = '';

1;
