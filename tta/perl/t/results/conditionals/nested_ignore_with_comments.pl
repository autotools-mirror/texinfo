use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_ignore_with_comments'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@ignore C30 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:@ignore\\n}
    {raw:No space no comment\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore  \\n}
    {raw:Spaces no comment\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore@c no space comment\\n}
    {raw:Comment\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore @c\\n}
    {raw:Comment no argument\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore  @c space comment\\n}
    {raw:Space Comment\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore something @comment comment after text\\n}
    {raw:Text comment\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore some @code{variable} @comment comment after command\\n}
    {raw:Command comment\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    *normal_command@end C1 l30
    |text_arg:{ignore}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:ignore}
      {spaces_after_argument:\\n}
';


$result_texis{'nested_ignore_with_comments'} = '@ignore
@ignore
No space no comment
@end ignore

@ignore  
Spaces no comment
@end ignore

@ignore@c no space comment
Comment
@end ignore

@ignore @c
Comment no argument
@end ignore

@ignore  @c space comment
Space Comment
@end ignore

@ignore something @comment comment after text
Text comment
@end ignore

@ignore some @code{variable} @comment comment after command
Command comment
@end ignore

@end ignore
';


$result_texts{'nested_ignore_with_comments'} = '';

$result_errors{'nested_ignore_with_comments'} = '';

$result_nodes_list{'nested_ignore_with_comments'} = '';

$result_sections_list{'nested_ignore_with_comments'} = '';

$result_sectioning_root{'nested_ignore_with_comments'} = '';

$result_headings_list{'nested_ignore_with_comments'} = '';

1;
