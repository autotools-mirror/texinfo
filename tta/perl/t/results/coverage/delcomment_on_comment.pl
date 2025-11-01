use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'delcomment_on_comment'} = '*document_root C2
 *before_node_section C4
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C2
   {some text }
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:a comment with del next line}
     >SOURCEMARKS
     >delcomment<1><p:19>{ after del.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
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
