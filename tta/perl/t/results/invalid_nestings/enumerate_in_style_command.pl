use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'enumerate_in_style_command'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *paragraph C1
   *@code C1 l1
    *brace_container C1
     {normal_text:\\n}
  *@enumerate C3 l2
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:1}
     {spaces_after_argument:\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'enumerate_in_style_command'} = '@code{
}@enumerate 1
@item item
@end enumerate
';


$result_texts{'enumerate_in_style_command'} = '
1. item
';

$result_errors{'enumerate_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'enumerate_in_style_command'} = '';

$result_sections_list{'enumerate_in_style_command'} = '';

$result_sectioning_root{'enumerate_in_style_command'} = '';

$result_headings_list{'enumerate_in_style_command'} = '';

1;
