use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple_nested_linemacro_calls'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C7 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@linemacro C3 l3
  |EXTRA
  |formal_args:A{a|b|rest}
  |macro_name:{inside}
   *arguments_line C1
    {macro_line: inside {a, b, rest}\\n}
   {raw:inside {\\a\\ operator \\b\\} \\rest\\\\n}
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:linemacro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@linemacro C4 l7
  |EXTRA
  |formal_args:A{one|two|three}
  |macro_name:{outside}
   *arguments_line C1
    {macro_line: outside {one, two, three}\\n}
   {raw:@defline \\one\\ {\\two\\} \\three\\\\n}
   {raw:@cindex \\two\\\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:linemacro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defblock C4 l12
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@outside C3
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:type}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:a function}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:@inside {X} {Y} ( remaining, type typed )}
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l13:@outside
   |EXTRA
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C20
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:type}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l13:@outside
       {normal_text:a function}
     {spaces: }
     >SOURCEMARKS
     >linemacro_expansion<start;2><p:1>
      >*linemacro_call@inside C3
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{bracketed_linemacro_arg:X}
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{bracketed_linemacro_arg:Y}
       >*linemacro_arg C2
        >{spaces_before_argument: }
        >{macro_call_arg_text:( remaining, type typed )}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inside}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l13:@inside
       {normal_text:X operator Y}
     {spaces: }
     {delimiter:(}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:remaining}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:typed}
     {spaces: }
     {delimiter:)}
     >SOURCEMARKS
     >linemacro_expansion<end;2><p:1>
     {spaces_after_argument:\\n}
   *def_item C1
    *index_entry_command@cindex C1 l13:@outside
    |EXTRA
    |element_node:{Top}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:a function}
      >SOURCEMARKS
      >linemacro_expansion<end;1><p:10>
      {spaces_after_argument:\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'simple_nested_linemacro_calls'} = '@node Top

@linemacro inside {a, b, rest}
inside {\\a\\ operator \\b\\} \\rest\\
@end linemacro

@linemacro outside {one, two, three}
@defline \\one\\ {\\two\\} \\three\\
@cindex \\two\\
@end linemacro

@defblock
@defline type {a function} inside {X operator Y} ( remaining, type typed )
@cindex a function
@end defblock
';


$result_texts{'simple_nested_linemacro_calls'} = '


type: a function inside X operator Y ( remaining, type typed )
';

$result_errors{'simple_nested_linemacro_calls'} = '';

$result_nodes_list{'simple_nested_linemacro_calls'} = '1|Top
';

$result_sections_list{'simple_nested_linemacro_calls'} = '';

$result_sectioning_root{'simple_nested_linemacro_calls'} = '';

$result_headings_list{'simple_nested_linemacro_calls'} = '';

$result_indices_sort_strings{'simple_nested_linemacro_calls'} = 'cp:
 a function
';

1;
