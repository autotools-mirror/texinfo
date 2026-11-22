use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ignore_spaces_and_comments'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C9
   *@ignore C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:No space no comment\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@ignore C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:  \\n}
    {raw:Spaces no comment\\n}
    *@end C1 l7
    |EXTRA
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@ignore C3 l9
    *arguments_line C1
     *block_line_arg C1
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:no space comment}
        {spaces_after_argument:\\n}
    {raw:Comment\\n}
    *@end C1 l11
    |EXTRA
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@ignore C3 l13
    *arguments_line C1
     *block_line_arg C2
      {spaces_before_argument:  }
      *@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:space comment}
        {spaces_after_argument:\\n}
    {raw:Space Comment\\n}
    *@end C1 l15
    |EXTRA
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@ignore C3 l17
    *arguments_line C1
     *block_line_arg C2
      {spaces_before_argument: }
      *@c C1
       *line_arg C2
        {rawline_text:}
        {spaces_after_argument:\\n}
    {raw:Space Comment no argument\\n}
    *@end C1 l19
    |EXTRA
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
';


$result_texis{'ignore_spaces_and_comments'} = '@ignore
No space no comment
@end ignore

@ignore  
Spaces no comment
@end ignore

@ignore@c no space comment
Comment
@end ignore

@ignore  @comment space comment
Space Comment
@end ignore

@ignore @c
Space Comment no argument
@end ignore
';


$result_texts{'ignore_spaces_and_comments'} = '



';

$result_errors{'ignore_spaces_and_comments'} = '';

$result_nodes_list{'ignore_spaces_and_comments'} = '';

$result_sections_list{'ignore_spaces_and_comments'} = '';

$result_sectioning_root{'ignore_spaces_and_comments'} = '';

$result_headings_list{'ignore_spaces_and_comments'} = '';

1;
