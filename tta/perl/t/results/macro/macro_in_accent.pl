use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_accent'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C4
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{aletter}
    *arguments_line C1
     {macro_line: aletter\\n}
    {raw:a\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l5
   |EXTRA
   |formal_args:A{}
   |macro_name:{aspace}
    *arguments_line C1
     {macro_line: aspace\\n}
    {raw:  \\n}
    *@end C1 l7
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C8
   *@ringaccent C2 l9
   >SOURCEMARKS
   >macro_expansion<end;1>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >macro_expansion<start;1><p:1>
     >*macro_call@aletter C1
      >*brace_arg
    *following_arg C1
     {normal_text:a}
   {normal_text:.\\n}
   *@ringaccent C2 l10
   >SOURCEMARKS
   >macro_expansion<end;2>
    {spaces_after_cmd_before_arg:}
    >SOURCEMARKS
    >macro_expansion<start;2>
     >*macro_call@aletter C1
      >*brace_arg
    *following_arg C1
     {normal_text:a}
   {normal_text:.\\n}
   *@~ C2 l11
   >SOURCEMARKS
   >macro_expansion<end;3>
    {spaces_after_cmd_before_arg:}
    >SOURCEMARKS
    >macro_expansion<start;3>
     >*macro_call@aletter C1
      >*brace_arg
    *following_arg C1
     {normal_text:a}
   {normal_text:.\\n}
   *@~ C1 l12
    *brace_container C1
     {normal_text:a}
     >SOURCEMARKS
     >macro_expansion<start;4>
      >*macro_call@aletter C1
       >*brace_arg
     >macro_expansion<end;4><p:1>
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C2 l14
   >SOURCEMARKS
   >macro_expansion<end;6>
    {spaces_after_cmd_before_arg:  }
    >SOURCEMARKS
    >macro_expansion<start;5>
     >*macro_call@aspace C1
      >*brace_arg
    >macro_expansion<end;5><p:2>
    >macro_expansion<start;6><p:2>
     >*macro_call@aletter C1
      >*brace_arg
    *following_arg C1
     {normal_text:a}
   {normal_text:.\\n}
';


$result_texis{'macro_in_accent'} = '@macro aletter
a
@end macro

@macro aspace
  
@end macro

@ringaccent a.
@ringaccenta.
@~a.
@~{a}.

@ringaccent  a.
';


$result_texts{'macro_in_accent'} = '

a*.
a*.
a~.
a~.

a*.
';

$result_errors{'macro_in_accent'} = '';

$result_nodes_list{'macro_in_accent'} = '';

$result_sections_list{'macro_in_accent'} = '';

$result_sectioning_root{'macro_in_accent'} = '';

$result_headings_list{'macro_in_accent'} = '';

1;
