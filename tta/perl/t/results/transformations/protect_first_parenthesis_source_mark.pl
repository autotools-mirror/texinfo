use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'protect_first_parenthesis_source_mark'} = '*document_root C1
 *before_node_section C4
  *@macro C3 l1
  |EXTRA
  |macro_name:{vvv}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: vvv {}\\n}
   {raw:(some text) aa,,\\n}
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
  *@anchor C1 l5
  |EXTRA
  |is_target:{1}
  |normalized:{_0028some-text_0029-aa_002c_002c}
   *brace_arg C2
    *@asis C1
     *brace_container C1
      {(}
      >SOURCEMARKS
      >macro_expansion<start;1>
       >*macro_call@vvv C1
        >*brace_arg
    {some text) aa,,}
    >SOURCEMARKS
    >macro_expansion<end;1><p:15>
  *paragraph C1
   {.\\n}
';


$result_texis{'protect_first_parenthesis_source_mark'} = '@macro vvv {}
(some text) aa,,
@end macro

@anchor{@asis{(}some text) aa,,}.
';


$result_texts{'protect_first_parenthesis_source_mark'} = '
.
';

$result_errors{'protect_first_parenthesis_source_mark'} = '* E l5|syntax for an external node used for `(some text) aa,,\'
 syntax for an external node used for `(some text) aa,,\'

';

$result_nodes_list{'protect_first_parenthesis_source_mark'} = '';

$result_sections_list{'protect_first_parenthesis_source_mark'} = '';

$result_sectioning_root{'protect_first_parenthesis_source_mark'} = '';

$result_headings_list{'protect_first_parenthesis_source_mark'} = '';

1;
