use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_enumerate_arguments'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *normal_command@enumerate C2 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a b}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:!}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l7
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code C1 l7
      *brace_container C1
       {normal_text:a}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l10
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:a}
     *normal_command@@
     {spaces_after_argument:\\n}
   *normal_command@end C1 l11
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l13
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a0}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l14
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
';


$result_texis{'bad_enumerate_arguments'} = '@enumerate a b
@end enumerate

@enumerate !
@end enumerate

@enumerate @code{a}
@end enumerate

@enumerate a@@
@end enumerate

@enumerate a0
@end enumerate
';


$result_texts{'bad_enumerate_arguments'} = '



';

$result_errors{'bad_enumerate_arguments'} = '* E l1|bad argument to @enumerate
 bad argument to @enumerate

* E l4|bad argument to @enumerate
 bad argument to @enumerate

* E l7|bad argument to @enumerate
 bad argument to @enumerate

* E l10|superfluous argument to @enumerate
 superfluous argument to @enumerate

* E l13|bad argument to @enumerate
 bad argument to @enumerate

';

$result_nodes_list{'bad_enumerate_arguments'} = '';

$result_sections_list{'bad_enumerate_arguments'} = '';

$result_sectioning_root{'bad_enumerate_arguments'} = '';

$result_headings_list{'bad_enumerate_arguments'} = '';

1;
