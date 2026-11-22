use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'root_command_in_conditional'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifnottex C1 l1
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
 *normal_command@node C1 l2 {Getting Started}
 |identifier:{Getting-Started}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Getting Started}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Tutorial}
    {spaces_before_argument: }
    {normal_text:Tutorial}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*normal_command@end C1 l3
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
';


$result_texis{'root_command_in_conditional'} = '@node Getting Started, Tutorial, Top, Top
';


$result_texts{'root_command_in_conditional'} = '';

$result_errors{'root_command_in_conditional'} = '* E l2|Next reference to nonexistent `Tutorial\'
 Next reference to nonexistent `Tutorial\'

* E l2|Prev reference to nonexistent `Top\'
 Prev reference to nonexistent `Top\'

* E l2|Up reference to nonexistent `Top\'
 Up reference to nonexistent `Top\'

';

$result_nodes_list{'root_command_in_conditional'} = '1|Getting Started
';

$result_sections_list{'root_command_in_conditional'} = '';

$result_sectioning_root{'root_command_in_conditional'} = '';

$result_headings_list{'root_command_in_conditional'} = '';

1;
