use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'delcomment_followed_by_cpp_line'} = '*document_root C2
 *before_node_section C16
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C3
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
  *paragraph C1
   {#line 46 "a_file_after_del_comment"\\n}
   >SOURCEMARKS
   >delcomment<1>{ this is a comment.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:  }
  >SOURCEMARKS
  >delcomment<2><p:2>{ this is a comment.\\n}
  *paragraph C1
   {#line 106 "a_file_after_space_del_comment"\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {a #line 206 "a_file_after_text_space_del_comment"\\n}
   >SOURCEMARKS
   >delcomment<3><p:2>{ this is a comment.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'delcomment_followed_by_cpp_line'} = '\\input texinfo

@c this tests both the del comment and a file without
@c element.

#line 46 "a_file_after_del_comment"



  #line 106 "a_file_after_space_del_comment"



 a #line 206 "a_file_after_text_space_del_comment"



@bye
';


$result_texts{'delcomment_followed_by_cpp_line'} = '
#line 46 "a_file_after_del_comment"



#line 106 "a_file_after_space_del_comment"



a #line 206 "a_file_after_text_space_del_comment"



';

$result_errors{'delcomment_followed_by_cpp_line'} = '* E delcomment_followed_by_cpp_line.texi:l9|unknown command `unknown\'
 unknown command `unknown\'

* E delcomment_followed_by_cpp_line.texi:l14|unknown command `unknown1\'
 unknown command `unknown1\'

* E delcomment_followed_by_cpp_line.texi:l19|unknown command `unknown2\'
 unknown command `unknown2\'

';

$result_nodes_list{'delcomment_followed_by_cpp_line'} = '';

$result_sections_list{'delcomment_followed_by_cpp_line'} = '';

$result_sectioning_root{'delcomment_followed_by_cpp_line'} = '';

$result_headings_list{'delcomment_followed_by_cpp_line'} = '';

1;
