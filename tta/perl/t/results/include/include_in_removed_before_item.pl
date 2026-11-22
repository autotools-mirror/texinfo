use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'include_in_removed_before_item'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@code l1
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C3
     *@c C1
     >SOURCEMARKS
     >include<start;1>
      >*@include C1 l3
      >|EXTRA
      >|text_arg:{only_comment.texi}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:only_comment.texi}
        >{spaces_after_argument:\\n}
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:source mark holder comment}
       {spaces_after_argument:\\n}
     *@c C1
     >SOURCEMARKS
     >include<end;1>
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:in here}
       {spaces_after_argument:\\n}
     *@item C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:FOO}
       {spaces_after_argument:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'include_in_removed_before_item'} = '@table @code
@c source mark holder comment
@c in here
@item FOO
@end table
';


$result_texts{'include_in_removed_before_item'} = 'FOO
';

$result_errors{'include_in_removed_before_item'} = '';

$result_nodes_list{'include_in_removed_before_item'} = '';

$result_sections_list{'include_in_removed_before_item'} = '';

$result_sectioning_root{'include_in_removed_before_item'} = '';

$result_headings_list{'include_in_removed_before_item'} = '';

1;
