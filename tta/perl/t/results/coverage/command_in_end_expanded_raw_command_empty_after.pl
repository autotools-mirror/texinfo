use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_in_end_expanded_raw_command_empty_after'} = '*document_root C1
 *before_node_section C1
  *@tex C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C1
    {In TeX\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{tex}
    *line_arg C2
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {tex}
     *@asis C1 l3
      *brace_container
';


$result_texis{'command_in_end_expanded_raw_command_empty_after'} = '@tex
In TeX
@end tex@asis{}
';


$result_texts{'command_in_end_expanded_raw_command_empty_after'} = 'In TeX
';

$result_errors{'command_in_end_expanded_raw_command_empty_after'} = '* W l3|@asis should not appear in @end
 warning: @asis should not appear in @end

* E l3|bad argument to @end: tex@asis{}
 bad argument to @end: tex@asis{}

';

$result_nodes_list{'command_in_end_expanded_raw_command_empty_after'} = '';

$result_sections_list{'command_in_end_expanded_raw_command_empty_after'} = '';

$result_sectioning_root{'command_in_end_expanded_raw_command_empty_after'} = '';

$result_headings_list{'command_in_end_expanded_raw_command_empty_after'} = '';

1;
