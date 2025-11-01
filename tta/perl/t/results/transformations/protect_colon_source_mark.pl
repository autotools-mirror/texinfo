use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protect_colon_source_mark'} = '*document_root C1
 *before_node_section C3
  *@macro C3 l1
  |EXTRA
  |macro_name:{klm}
  |misc_args:A{arg}
   *arguments_line C1
    {macro_line: klm {arg}\\n}
   {raw:some text : \\arg\\ then more\\n}
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
  *paragraph C3
   {There is some text }
   >SOURCEMARKS
   >macro_expansion<start;1><p:9>
    >*macro_call@klm C1
     >*brace_arg C1
      >{macro_call_arg_text:nop}
   *@asis C1
    *brace_container C1
     {:}
   { nop then more and after.\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:14>
';


$result_texis{'protect_colon_source_mark'} = '@macro klm {arg}
some text : \\arg\\ then more
@end macro

There is some text @asis{:} nop then more and after.
';


$result_texts{'protect_colon_source_mark'} = '
There is some text : nop then more and after.
';

$result_errors{'protect_colon_source_mark'} = '';

$result_nodes_list{'protect_colon_source_mark'} = '';

$result_sections_list{'protect_colon_source_mark'} = '';

$result_sectioning_root{'protect_colon_source_mark'} = '';

$result_headings_list{'protect_colon_source_mark'} = '';

1;
