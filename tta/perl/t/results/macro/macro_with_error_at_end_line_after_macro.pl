use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_with_error_at_end_line_after_macro'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{witherror}
  |misc_args:A{string}
   *arguments_line C1
    {macro_line: witherror{string}\\n}
   {raw:@center\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@witherror C1
    >*brace_arg C1
     >{macro_call_arg_text:aaa}
  *@center C1 l5:@witherror
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    |>SOURCEMARKS
    |>macro_expansion<end;1>
';


$result_texis{'macro_with_error_at_end_line_after_macro'} = '@macro witherror{string}
@center
@end macro

@center
';


$result_texts{'macro_with_error_at_end_line_after_macro'} = '

';

$result_errors{'macro_with_error_at_end_line_after_macro'} = '* W l5:@witherror|@center missing argument
 warning: @center missing argument (possibly involving @witherror)

';

$result_nodes_list{'macro_with_error_at_end_line_after_macro'} = '';

$result_sections_list{'macro_with_error_at_end_line_after_macro'} = '';

$result_sectioning_root{'macro_with_error_at_end_line_after_macro'} = '';

$result_headings_list{'macro_with_error_at_end_line_after_macro'} = '';

1;
