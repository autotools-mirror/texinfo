use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_multitable_in_itemize'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@itemize C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a--n itemize line}
     {spaces_after_argument:\\n}
   *@item C5 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:in macro\\n}
    {empty_line:\\n}
    *@multitable C2 l4
    |EXTRA
    |max_columns:{0}
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *@end C1 l5
     |EXTRA
     |text_arg:{multitable}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:multitable}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_multitable_in_itemize'} = '@itemize a--n itemize line
@item in macro

@multitable
@end multitable

@end itemize
';


$result_texts{'empty_multitable_in_itemize'} = 'in macro


';

$result_errors{'empty_multitable_in_itemize'} = '* W l4|empty multitable
 warning: empty multitable

';

$result_nodes_list{'empty_multitable_in_itemize'} = '';

$result_sections_list{'empty_multitable_in_itemize'} = '';

$result_sectioning_root{'empty_multitable_in_itemize'} = '';

$result_headings_list{'empty_multitable_in_itemize'} = '';


$result_converted{'plaintext'}->{'empty_multitable_in_itemize'} = '   a-n itemize line in macro

';

1;
