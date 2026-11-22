use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_beginning'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@menu C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C6
     {normal_text:*   \\n}
     {normal_text:*\\n}
     {normal_text:*something::\\n}
     {normal_text:*}
     *normal_command@code C1 l5
      *brace_container C1
       {normal_text:in code}
     {normal_text:::\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{menu}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:menu}
';


$result_texis{'bad_beginning'} = '@menu
*   
*
*something::
*@code{in code}::
@end menu';


$result_texts{'bad_beginning'} = '*   
*
*something::
*in code::
';

$result_errors{'bad_beginning'} = '';

$result_nodes_list{'bad_beginning'} = '';

$result_sections_list{'bad_beginning'} = '';

$result_sectioning_root{'bad_beginning'} = '';

$result_headings_list{'bad_beginning'} = '';

1;
