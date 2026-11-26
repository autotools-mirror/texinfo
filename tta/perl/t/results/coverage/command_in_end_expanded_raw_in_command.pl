use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_end_expanded_raw_in_command'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@tex C2 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C2
     {normal_text:In TeX\\n}
     *normal_command@end C1 l3
      *line_arg C3
       {spaces_before_argument: }
       *normal_command@code C1 l3
        *brace_container C1
         {normal_text:tex}
       {spaces_after_argument:\\n}
';


$result_texis{'command_in_end_expanded_raw_in_command'} = '@tex
In TeX
@end @code{tex}
';


$result_texts{'command_in_end_expanded_raw_in_command'} = 'In TeX
';

$result_errors{'command_in_end_expanded_raw_in_command'} = '* W l3|@code should not appear in @end
 warning: @code should not appear in @end

* E l3|bad argument to @end: @code{tex}
 bad argument to @end: @code{tex}

* E l1|no matching `@end tex\'
 no matching `@end tex\'

';

$result_nodes_list{'command_in_end_expanded_raw_in_command'} = '';

$result_sections_list{'command_in_end_expanded_raw_in_command'} = '';

$result_sectioning_root{'command_in_end_expanded_raw_in_command'} = '';

$result_headings_list{'command_in_end_expanded_raw_in_command'} = '';

1;
