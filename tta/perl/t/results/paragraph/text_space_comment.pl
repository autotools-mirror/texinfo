use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'text_space_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C1
   {spaces_before_paragraph: }
  *paragraph C2
   {normal_text:text  }
   *normal_command@c C1
    *line_arg C2
     {spaces_before_argument: }
     {rawline_text:space comment}
';


$result_texis{'text_space_comment'} = ' text  @c space comment';


$result_texts{'text_space_comment'} = 'text  ';

$result_errors{'text_space_comment'} = '';

$result_nodes_list{'text_space_comment'} = '';

$result_sections_list{'text_space_comment'} = '';

$result_sectioning_root{'text_space_comment'} = '';

$result_headings_list{'text_space_comment'} = '';


$result_converted{'plaintext'}->{'text_space_comment'} = 'text
';


$result_converted{'html_text'}->{'text_space_comment'} = '<p>text  </p>';

1;
