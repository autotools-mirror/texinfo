use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'arobase_brace_in_macro_call'} = '*document_root C1
 *before_node_section C5
  *@macro C4 l1
  |EXTRA
  |macro_name:{simplemac}
  |misc_args:A{arg1|arg2}
   *arguments_line C1
    {macro_line: simplemac { arg1 , arg2 }\\n}
   {raw:first: \\arg1\\|\\n}
   {raw:second: \\arg2\\|\\n}
   *@end C1 l4
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
  *paragraph C6
   {first: }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@simplemac C1
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:@{ , @} }
   *@{
   { , }
   *@}
   { |\\n}
   {second: |\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:9>
  {empty_line:\\n}
  *paragraph C6
   {first: }
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@simplemac C1
     >*brace_arg C1
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >{macro_call_arg_text:@}
   *@|
   {\\n}
   {second: | , }
   >SOURCEMARKS
   >macro_expansion<end;2><p:9>
   *@{
   { \\n}
';


$result_texis{'arobase_brace_in_macro_call'} = '@macro simplemac { arg1 , arg2 }
first: \\arg1\\|
second: \\arg2\\|
@end macro

first: @{ , @} |
second: |

first: @|
second: | , @{ 
';


$result_texts{'arobase_brace_in_macro_call'} = '
first: { , } |
second: |

first: 
second: | , { 
';

$result_errors{'arobase_brace_in_macro_call'} = '* E l8:@simplemac|@| should only appear in heading or footing
 @| should only appear in heading or footing (possibly involving @simplemac)

* E l8|misplaced }
 misplaced }

';

$result_nodes_list{'arobase_brace_in_macro_call'} = '';

$result_sections_list{'arobase_brace_in_macro_call'} = '';

$result_sectioning_root{'arobase_brace_in_macro_call'} = '';

$result_headings_list{'arobase_brace_in_macro_call'} = '';

1;
