use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'delcomment'} = '*document_root C2
 *before_node_section C4
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:this tests both the del comment and a file without}
   *@c C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {rawline_text:element.}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >delcomment<1>{ this is a comment.\\n}
  *paragraph C1
   {This line is the only output.\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'delcomment'} = '\\input texinfo

@c this tests both the del comment and a file without
@c element.


This line is the only output.

@bye
';


$result_texts{'delcomment'} = '

This line is the only output.

';

$result_errors{'delcomment'} = '';

$result_nodes_list{'delcomment'} = '';

$result_sections_list{'delcomment'} = '';

$result_sectioning_root{'delcomment'} = '';

$result_headings_list{'delcomment'} = '';

1;
