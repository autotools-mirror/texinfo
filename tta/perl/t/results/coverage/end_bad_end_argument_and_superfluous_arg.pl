use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_bad_end_argument_and_superfluous_arg'} = '*document_root C1
 *before_node_section C1
  *@quotation C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C2
    {In quotation\\n}
    *@end C1 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{: }
     *line_arg C2
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {: }
      *@code C1 l3
       *brace_container C1
        {in c}
';


$result_texis{'end_bad_end_argument_and_superfluous_arg'} = '@quotation
In quotation
@end : @code{in c}
';


$result_texts{'end_bad_end_argument_and_superfluous_arg'} = 'In quotation
';

$result_errors{'end_bad_end_argument_and_superfluous_arg'} = '* W l3|@code should not appear in @end
 warning: @code should not appear in @end

* E l3|bad argument to @end: : @code{in c}
 bad argument to @end: : @code{in c}

* E l1|no matching `@end quotation\'
 no matching `@end quotation\'

';

$result_nodes_list{'end_bad_end_argument_and_superfluous_arg'} = '';

$result_sections_list{'end_bad_end_argument_and_superfluous_arg'} = '';

$result_sectioning_root{'end_bad_end_argument_and_superfluous_arg'} = '';

$result_headings_list{'end_bad_end_argument_and_superfluous_arg'} = '';

1;
