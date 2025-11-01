use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'simple_nested_linemacro_calls'} = '*document_root C2
 *before_node_section
 *@node C7 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *@linemacro C3 l3
  |EXTRA
  |macro_name:{inside}
  |misc_args:A{a|b|rest}
   *arguments_line C1
    {macro_line: inside {a, b, rest}\\n}
   {raw:inside {\\a\\ operator \\b\\} \\rest\\\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  *@linemacro C4 l7
  |EXTRA
  |macro_name:{outside}
  |misc_args:A{one|two|three}
   *arguments_line C1
    {macro_line: outside {one, two, three}\\n}
   {raw:@defline \\one\\ {\\two\\} \\three\\\\n}
   {raw:@cindex \\two\\\\n}
   *@end C1 l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  *@defblock C4 l12
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@outside C3
     >|INFO
     >|spaces_before_argument:
      >|{spaces_before_argument: }
      >*linemacro_arg C1
       >{bracketed_linemacro_arg:type}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{bracketed_linemacro_arg:a function}
      >*linemacro_arg C1
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >{macro_call_arg_text:@inside {X} {Y} ( remaining, type typed )}
   *@defline C1 l13:@outside
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |def_command:{defline}
   |def_index_element:
    |* C1
     |*brace_arg C1
      |{a function}
   |original_def_cmdname:{defline}
    *line_arg C18
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l13:@outside
       {a function}
     {spaces: }
     >SOURCEMARKS
     >linemacro_expansion<start;2><p:1>
      >*linemacro_call@inside C3
      >|INFO
      >|spaces_before_argument:
       >|{spaces_before_argument: }
       >*linemacro_arg C1
        >{bracketed_linemacro_arg:X}
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{bracketed_linemacro_arg:Y}
       >*linemacro_arg C1
       >|INFO
       >|spaces_before_argument:
        >|{spaces_before_argument: }
        >{macro_call_arg_text:( remaining, type typed )}
     *def_arg C1
      *def_line_arg C1
       {inside}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l13:@inside
       {X operator Y}
     {spaces: }
     {delimiter:(}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {remaining}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {typed}
     {spaces: }
     {delimiter:)}
     >SOURCEMARKS
     >linemacro_expansion<end;2><p:1>
   *def_item C1
    *index_entry_command@cindex C1 l13:@outside
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |element_node:{Top}
    |index_entry:I{cp,1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {a function}
      >SOURCEMARKS
      >linemacro_expansion<end;1><p:10>
   *@end C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defblock}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defblock}
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
