use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_replaced_by_macro'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@definfoenclose C1 l1
   |misc_args:A{phoo|;|:}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:phoo,;,:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l3
   |formal_args:A{arg}
   |macro_name:{phoo}
    *arguments_line C1
     {macro_line: phoo {arg}\\n}
    {raw:||\\arg\\||\\n}
    *normal_command@end C1 l5
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:||aa||\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@phoo C1
     >*brace_arg C1
      >{macro_call_arg_text:aa}
   >macro_expansion<end;1><p:6>
';


$result_texis{'definfoenclose_replaced_by_macro'} = '@definfoenclose phoo,;,:

@macro phoo {arg}
||\\arg\\||
@end macro

||aa||
';


$result_texts{'definfoenclose_replaced_by_macro'} = '

||aa||
';

$result_errors{'definfoenclose_replaced_by_macro'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'definfoenclose_replaced_by_macro'} = '';

$result_sections_list{'definfoenclose_replaced_by_macro'} = '';

$result_sectioning_root{'definfoenclose_replaced_by_macro'} = '';

$result_headings_list{'definfoenclose_replaced_by_macro'} = '';


$result_converted{'plaintext'}->{'definfoenclose_replaced_by_macro'} = '||aa||
';

1;
