use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'tab_in_index'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:one nonlettered character}
     {normal_text: }
     *bracketed_arg C1 l1
      {normal_text:normal text}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:one nonlettered character }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:aaa\\n}
       *index_entry_command@vindex C1 l3
       |EXTRA
       |index_entry:I{vr,1}
        *line_arg C5
         {spaces_before_argument: }
         {normal_text:in index entry }
         {ignorable_spaces_after_command: }
         {normal_text:in tab}
         {spaces_after_argument:\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'tab_in_index'} = '@multitable {one nonlettered character} {normal text}
@item one nonlettered character @tab aaa
@vindex in index entry  in tab
@end multitable
';


$result_texts{'tab_in_index'} = 'one nonlettered character aaa
';

$result_errors{'tab_in_index'} = '* W l3|@tab should not appear on @vindex line
 warning: @tab should not appear on @vindex line

* E l3|ignoring @tab outside of multitable
 ignoring @tab outside of multitable

* W l3|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

';

$result_nodes_list{'tab_in_index'} = '';

$result_sections_list{'tab_in_index'} = '';

$result_sectioning_root{'tab_in_index'} = '';

$result_headings_list{'tab_in_index'} = '';

$result_indices_sort_strings{'tab_in_index'} = 'vr:
 in index entry in tab
';

1;
