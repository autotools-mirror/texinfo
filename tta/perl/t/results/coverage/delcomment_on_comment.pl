use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'delcomment_on_comment'} = '*document_root C2
 *before_node_section C4
  *before_beginning C2
   {raw:\\input texinfo\\n}
   {empty_line:\\n}
  *preamble_before_content
  *paragraph C2
   {normal_text:some text }
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a comment with del next line}
     >SOURCEMARKS
     >delcomment<1><p:19>{ after del.\\n}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'delcomment_on_comment'} = '\\input texinfo

some text @c a comment with del next line

@bye
';


$result_texts{'delcomment_on_comment'} = 'some text 
';

$result_errors{'delcomment_on_comment'} = '';

$result_nodes_list{'delcomment_on_comment'} = '';

$result_sections_list{'delcomment_on_comment'} = '';

$result_sectioning_root{'delcomment_on_comment'} = '';

$result_headings_list{'delcomment_on_comment'} = '';

1;
