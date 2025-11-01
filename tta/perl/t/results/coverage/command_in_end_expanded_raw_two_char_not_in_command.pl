use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_in_end_expanded_raw_two_char_not_in_command'} = '*document_root C1
 *before_node_section C1
  *@tex C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *rawpreformatted C2
    {In TeX\\n}
    *@end C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{te}
     *line_arg C2
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {te}
      *@asis C1 l3
       *brace_container C1
        {x}
';


$result_texis{'command_in_end_expanded_raw_two_char_not_in_command'} = '@tex
In TeX
@end te@asis{x}
';


$result_texts{'command_in_end_expanded_raw_two_char_not_in_command'} = 'In TeX
';

$result_errors{'command_in_end_expanded_raw_two_char_not_in_command'} = '* W l3|@asis should not appear in @end
 warning: @asis should not appear in @end

* W l3|unknown @end te
 warning: unknown @end te

* E l3|bad argument to @end: te@asis{x}
 bad argument to @end: te@asis{x}

* E l1|no matching `@end tex\'
 no matching `@end tex\'

';

$result_nodes_list{'command_in_end_expanded_raw_two_char_not_in_command'} = '';

$result_sections_list{'command_in_end_expanded_raw_two_char_not_in_command'} = '';

$result_sectioning_root{'command_in_end_expanded_raw_two_char_not_in_command'} = '';

$result_headings_list{'command_in_end_expanded_raw_two_char_not_in_command'} = '';

1;
