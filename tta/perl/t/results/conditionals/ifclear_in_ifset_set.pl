use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ifclear_in_ifset_set'} = '*document_root C1
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@set C1
   |EXTRA
   |misc_args:A{a|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<start;1><p:1>
    >*normal_command@ifset C1 l4
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:a}
       >{spaces_after_argument:\\n}
   >expanded_conditional_command<start;2><p:1>
    >*normal_command@ifclear C1 l5
     >*arguments_line C1
      >*block_line_arg C4
       >{spaces_before_argument: }
       >{normal_text:ok}
       >{spaces_after_argument: }
       >*normal_command@c C1
        >*line_arg C3
         >{spaces_before_argument: }
         >{rawline_text:- ok, ignored}
         >{spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{junky   - ok, ignored}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:junky   - ok, ignored}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:WRONG - missing @end ifset.}
     {spaces_after_argument:\\n}
';


$result_texis{'ifclear_in_ifset_set'} = '
@set a

@end junky   - ok, ignored
@c WRONG - missing @end ifset.
';


$result_texts{'ifclear_in_ifset_set'} = '
';

$result_errors{'ifclear_in_ifset_set'} = '* W l6|unknown @end junky
 warning: unknown @end junky

* E l7|unmatched `@end ifset\'
 unmatched `@end ifset\'

* E l8|expected @end ifclear
 expected @end ifclear

* E l8|expected @end ifset
 expected @end ifset

';

$result_nodes_list{'ifclear_in_ifset_set'} = '';

$result_sections_list{'ifclear_in_ifset_set'} = '';

$result_sectioning_root{'ifclear_in_ifset_set'} = '';

$result_headings_list{'ifclear_in_ifset_set'} = '';

1;
