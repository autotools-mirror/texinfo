use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'delcomment'} = '*document_root C2
 *before_node_section C4
  *before_beginning C2
   {raw:\\input texinfo\\n}
   {empty_line:\\n}
  *preamble C4
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:this tests both the del comment and a file without}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:element.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >delcomment<1>{ this is a comment.\\n}
  *paragraph C1
   {normal_text:This line is the only output.\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
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
