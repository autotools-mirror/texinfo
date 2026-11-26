use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_brace_command'} = '*document_root C1
 *before_node_section C2
  *preamble C4
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{foo}
    *arguments_line C1
     {macro_line: foo\\n}
    {raw:foo-expansion\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l5
   |formal_args:A{}
   |macro_name:{abar}
    *arguments_line C1
     {macro_line: abar\\n}
    {raw:bar-expansion\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@itemize C3 l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet l9
     {spaces_after_argument:\\n}
   *normal_command@item C2 l10
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     *normal_command@email C1 l10
      *brace_arg C3
       {normal_text:foo-expansion}
       >SOURCEMARKS
       >macro_expansion<start;1>
        >*macro_call@foo C1
         >*brace_arg
       >macro_expansion<end;1><p:13>
       *normal_command@@
       >SOURCEMARKS
       >macro_expansion<start;2>
        >*macro_call@abar C1
         >*brace_arg
       {normal_text:bar-expansion}
       >SOURCEMARKS
       >macro_expansion<end;2><p:13>
     {normal_text:,\\n}
     {normal_text:  also helped.\\n}
   *normal_command@end C1 l12
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_brace_command'} = '@macro foo
foo-expansion
@end macro

@macro abar
bar-expansion
@end macro

@itemize @bullet
@item @email{foo-expansion@@bar-expansion},
  also helped.
@end itemize
';


$result_texts{'macro_in_brace_command'} = '

foo-expansion@bar-expansion,
  also helped.
';

$result_errors{'macro_in_brace_command'} = '';

$result_nodes_list{'macro_in_brace_command'} = '';

$result_sections_list{'macro_in_brace_command'} = '';

$result_sectioning_root{'macro_in_brace_command'} = '';

$result_headings_list{'macro_in_brace_command'} = '';

1;
