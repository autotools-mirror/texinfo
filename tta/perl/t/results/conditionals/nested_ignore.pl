use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_ignore'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@ignore C14 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:@ignore\\n}
    {raw:\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore\\n}
    {raw:@end iftex\\n}
    {raw:@ifinfo\\n}
    {raw:@end ignore\\n}
    {raw:\\n}
    {raw:@ignore \\n}
    {raw:@end ifclear\\n}
    {raw:@ifclear\\n}
    {raw:@end ignore\\n}
';


$result_texis{'nested_ignore'} = '@ignore
@ignore

@end ignore

@ignore
@end iftex
@ifinfo
@end ignore

@ignore 
@end ifclear
@ifclear
@end ignore
';


$result_texts{'nested_ignore'} = '';

$result_errors{'nested_ignore'} = '* E l1|no matching `@end ignore\'
 no matching `@end ignore\'

';

$result_nodes_list{'nested_ignore'} = '';

$result_sections_list{'nested_ignore'} = '';

$result_sectioning_root{'nested_ignore'} = '';

$result_headings_list{'nested_ignore'} = '';

1;
