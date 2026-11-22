use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'cpp_line_latin1'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentencoding C1 cpp_line_latin1.texi:l3
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 cpp_line_latin1.texi:l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 cpp_line_latin1.texi:l6
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *@node C7 cpp_line_latin1.texi:l8 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >line_directive<1><p:1>{#line 100 "foo.ptèxi"\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:aaa\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'cpp_line_latin1'} = '\\input texinfo

@documentencoding ISO-8859-1

@node Top
@top

@node chap




aaa

@bye
';


$result_texts{'cpp_line_latin1'} = '





aaa

';

$result_errors{'cpp_line_latin1'} = '* E foo.ptèxi:l102|unknown command `gggg\'
 unknown command `gggg\'

* W cpp_line_latin1.texi:l8|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'cpp_line_latin1'} = '1|Top
 associated_section
 associated_title_command
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'cpp_line_latin1'} = '1
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'cpp_line_latin1'} = 'level: -1
list:
 1|
';

$result_headings_list{'cpp_line_latin1'} = '';

1;
