use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_main_def_arguments'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@deffn C2 l1
   *def_line C1 l1
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:NNN}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_main_def_arguments'} = '@deffn NNN
@end deffn
';


$result_texts{'empty_main_def_arguments'} = 'NNN: 
';

$result_errors{'empty_main_def_arguments'} = '* W l1|missing name for @deffn
 warning: missing name for @deffn

';

$result_nodes_list{'empty_main_def_arguments'} = '';

$result_sections_list{'empty_main_def_arguments'} = '';

$result_sectioning_root{'empty_main_def_arguments'} = '';

$result_headings_list{'empty_main_def_arguments'} = '';

1;
