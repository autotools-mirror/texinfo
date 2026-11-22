use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_linemacro_calls'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@linemacro C3 l1
   |formal_args:A{a|b}
   |macro_name:{inside}
    *arguments_line C1
     {macro_line: inside {a, b}\\n}
    {raw:inside {\\a\\ operator \\b\\}\\n}
    *normal_command@end C1 l3
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@linemacro C4 l5
   |formal_args:A{one|two|three}
   |macro_name:{outside}
    *arguments_line C1
     {macro_line: outside {one, two, three}\\n}
    {raw:@defline \\one\\ {\\two\\} \\three\\\\n}
    {raw:@cindex \\two\\\\n}
    *normal_command@end C1 l8
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C4 l10
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
       >{bracketed_linemacro_arg:@inside {X} {Y}}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:( remaining, type typed )}
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l11:@outside
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C16
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:type}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l11:@outside
       {normal_text:inside X operator Y}
       >SOURCEMARKS
       >linemacro_expansion<start;2>
        >*linemacro_call@inside C2
         >*linemacro_arg C2
          >{spaces_before_argument: }
          >{bracketed_linemacro_arg:X}
         >*linemacro_arg C2
          >{spaces_before_argument: }
          >{macro_call_arg_text:{Y}} ( remaining, type typed )}
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
    *index_entry_command@cindex C1 l11:@outside
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      >SOURCEMARKS
      >linemacro_expansion<start;3><p:1>
       >*linemacro_call@inside C2
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{bracketed_linemacro_arg:X}
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{bracketed_linemacro_arg:Y}
         >>SOURCEMARKS
         >>linemacro_expansion<end;1><p:3>
      {normal_text:inside X operator Y}
      >SOURCEMARKS
      >linemacro_expansion<end;3><p:19>
      {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'nested_linemacro_calls'} = '@linemacro inside {a, b}
inside {\\a\\ operator \\b\\}
@end linemacro

@linemacro outside {one, two, three}
@defline \\one\\ {\\two\\} \\three\\
@cindex \\two\\
@end linemacro

@defblock
@defline type {inside X operator Y} ( remaining, type typed )
@cindex inside X operator Y
@end defblock
';


$result_texts{'nested_linemacro_calls'} = '

type: inside X operator Y ( remaining, type typed )
';

$result_errors{'nested_linemacro_calls'} = '* E l11:@inside|misplaced {
 misplaced { (possibly involving @inside)

* E l11:@inside|misplaced {
 misplaced { (possibly involving @inside)

* E l11:@inside|misplaced }
 misplaced } (possibly involving @inside)

* E l11:@inside|misplaced }
 misplaced } (possibly involving @inside)

* E l11:@inside|misplaced {
 misplaced { (possibly involving @inside)

* E l11:@inside|misplaced }
 misplaced } (possibly involving @inside)

* W l11|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'nested_linemacro_calls'} = '';

$result_sections_list{'nested_linemacro_calls'} = '';

$result_sectioning_root{'nested_linemacro_calls'} = '';

$result_headings_list{'nested_linemacro_calls'} = '';

$result_indices_sort_strings{'nested_linemacro_calls'} = 'cp:
 inside X operator Y
';

1;
